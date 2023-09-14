Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436677A0D60
	for <lists+sparclinux@lfdr.de>; Thu, 14 Sep 2023 20:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242151AbjINSnq (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 14 Sep 2023 14:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242154AbjINSlo (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 14 Sep 2023 14:41:44 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA022D7E;
        Thu, 14 Sep 2023 11:39:09 -0700 (PDT)
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1694716748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2MuEzqV2MApXOIyUF4YBrB1B536nPDREowgJZ2d68qA=;
        b=xvmfPcPk/suTlgqjD+BtIaBilvzFLWj48bXIcjeOhIpaSNN1H51BfFuMizAILbEUldtvsc
        YaDKtOC+rApZKGI8x1tmVp1KAfLX01Ln/iNU4eFwmRs3PX/njFbvcr3pCSWZ96T+bQ+pLd
        muy+wsrO8q/xD8cB96W0qsqVxT4ekius3oPRBIpAmtZJhdRESWxv7o2v5+1J/Y3RDEiyal
        T+QO7GHlT/3XjKbEd+sFLgpx4SU0ddET0VFeVaiUvgMGt7QbETrlJynegjawUD9v9R1oL7
        QRrQKtwgIjIVdhlILqLy5m14I2aIa9fxjX9DvpCu4t5q8GGEZ/1Bj9DeA3fJ9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1694716748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2MuEzqV2MApXOIyUF4YBrB1B536nPDREowgJZ2d68qA=;
        b=zpHOCNIL8h8OfyKvzvhHyDV0VPI+SPQvDTgYSCYX1wQ696ErtKnfs5fE9Kq+yyxSN2uQJa
        OaErNNxOxq2VSeBg==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [PATCH tty v1 68/74] serial: sunsu: Use port lock wrappers
Date:   Thu, 14 Sep 2023 20:44:25 +0206
Message-Id: <20230914183831.587273-69-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

When a serial port is used for kernel console output, then all
modifications to the UART registers which are done from other contexts,
e.g. getty, termios, are interference points for the kernel console.

So far this has been ignored and the printk output is based on the
principle of hope. The rework of the console infrastructure which aims to
support threaded and atomic consoles, requires to mark sections which
modify the UART registers as unsafe. This allows the atomic write function
to make informed decisions and eventually to restore operational state. It
also allows to prevent the regular UART code from modifying UART registers
while printk output is in progress.

All modifications of UART registers are guarded by the UART port lock,
which provides an obvious synchronization point with the console
infrastructure.

To avoid adding this functionality to all UART drivers, wrap the
spin_[un]lock*() invocations for uart_port::lock into helper functions
which just contain the spin_[un]lock*() invocations for now. In a
subsequent step these helpers will gain the console synchronization
mechanisms.

Converted with coccinelle. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/tty/serial/sunsu.c | 46 +++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/sunsu.c b/drivers/tty/serial/sunsu.c
index 58a4342ad0f9..1e051cc2591c 100644
--- a/drivers/tty/serial/sunsu.c
+++ b/drivers/tty/serial/sunsu.c
@@ -212,9 +212,9 @@ static void enable_rsa(struct uart_sunsu_port *up)
 {
 	if (up->port.type == PORT_RSA) {
 		if (up->port.uartclk != SERIAL_RSA_BAUD_BASE * 16) {
-			spin_lock_irq(&up->port.lock);
+			uart_port_lock_irq(&up->port);
 			__enable_rsa(up);
-			spin_unlock_irq(&up->port.lock);
+			uart_port_unlock_irq(&up->port);
 		}
 		if (up->port.uartclk == SERIAL_RSA_BAUD_BASE * 16)
 			serial_outp(up, UART_RSA_FRR, 0);
@@ -234,7 +234,7 @@ static void disable_rsa(struct uart_sunsu_port *up)
 
 	if (up->port.type == PORT_RSA &&
 	    up->port.uartclk == SERIAL_RSA_BAUD_BASE * 16) {
-		spin_lock_irq(&up->port.lock);
+		uart_port_lock_irq(&up->port);
 
 		mode = serial_inp(up, UART_RSA_MSR);
 		result = !(mode & UART_RSA_MSR_FIFO);
@@ -247,7 +247,7 @@ static void disable_rsa(struct uart_sunsu_port *up)
 
 		if (result)
 			up->port.uartclk = SERIAL_RSA_BAUD_BASE_LO * 16;
-		spin_unlock_irq(&up->port.lock);
+		uart_port_unlock_irq(&up->port);
 	}
 }
 #endif /* CONFIG_SERIAL_8250_RSA */
@@ -311,10 +311,10 @@ static void sunsu_enable_ms(struct uart_port *port)
 		container_of(port, struct uart_sunsu_port, port);
 	unsigned long flags;
 
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 	up->ier |= UART_IER_MSI;
 	serial_out(up, UART_IER, up->ier);
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 }
 
 static void
@@ -456,7 +456,7 @@ static irqreturn_t sunsu_serial_interrupt(int irq, void *dev_id)
 	unsigned long flags;
 	unsigned char status;
 
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 
 	do {
 		status = serial_inp(up, UART_LSR);
@@ -470,7 +470,7 @@ static irqreturn_t sunsu_serial_interrupt(int irq, void *dev_id)
 
 	} while (!(serial_in(up, UART_IIR) & UART_IIR_NO_INT));
 
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 
 	return IRQ_HANDLED;
 }
@@ -545,9 +545,9 @@ static unsigned int sunsu_tx_empty(struct uart_port *port)
 	unsigned long flags;
 	unsigned int ret;
 
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 	ret = serial_in(up, UART_LSR) & UART_LSR_TEMT ? TIOCSER_TEMT : 0;
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 
 	return ret;
 }
@@ -599,13 +599,13 @@ static void sunsu_break_ctl(struct uart_port *port, int break_state)
 		container_of(port, struct uart_sunsu_port, port);
 	unsigned long flags;
 
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 	if (break_state == -1)
 		up->lcr |= UART_LCR_SBC;
 	else
 		up->lcr &= ~UART_LCR_SBC;
 	serial_out(up, UART_LCR, up->lcr);
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 }
 
 static int sunsu_startup(struct uart_port *port)
@@ -683,12 +683,12 @@ static int sunsu_startup(struct uart_port *port)
 	 */
 	serial_outp(up, UART_LCR, UART_LCR_WLEN8);
 
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 
 	up->port.mctrl |= TIOCM_OUT2;
 
 	sunsu_set_mctrl(&up->port, up->port.mctrl);
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 
 	/*
 	 * Finally, enable interrupts.  Note: Modem status interrupts
@@ -731,7 +731,7 @@ static void sunsu_shutdown(struct uart_port *port)
 	up->ier = 0;
 	serial_outp(up, UART_IER, 0);
 
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 	if (up->port.flags & UPF_FOURPORT) {
 		/* reset interrupts on the AST Fourport board */
 		inb((up->port.iobase & 0xfe0) | 0x1f);
@@ -740,7 +740,7 @@ static void sunsu_shutdown(struct uart_port *port)
 		up->port.mctrl &= ~TIOCM_OUT2;
 
 	sunsu_set_mctrl(&up->port, up->port.mctrl);
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 
 	/*
 	 * Disable break condition and FIFOs
@@ -826,7 +826,7 @@ sunsu_change_speed(struct uart_port *port, unsigned int cflag,
 	 * Ok, we're now changing the port state.  Do it with
 	 * interrupts disabled.
 	 */
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 
 	/*
 	 * Update the per-port timeout.
@@ -891,7 +891,7 @@ sunsu_change_speed(struct uart_port *port, unsigned int cflag,
 
 	up->cflag = cflag;
 
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 }
 
 static void
@@ -1038,7 +1038,7 @@ static void sunsu_autoconfig(struct uart_sunsu_port *up)
 	up->type_probed = PORT_UNKNOWN;
 	up->port.iotype = UPIO_MEM;
 
-	spin_lock_irqsave(&up->port.lock, flags);
+	uart_port_lock_irqsave(&up->port, &flags);
 
 	if (!(up->port.flags & UPF_BUGGY_UART)) {
 		/*
@@ -1173,7 +1173,7 @@ static void sunsu_autoconfig(struct uart_sunsu_port *up)
 	serial_outp(up, UART_IER, 0);
 
 out:
-	spin_unlock_irqrestore(&up->port.lock, flags);
+	uart_port_unlock_irqrestore(&up->port, flags);
 }
 
 static struct uart_driver sunsu_reg = {
@@ -1298,9 +1298,9 @@ static void sunsu_console_write(struct console *co, const char *s,
 	int locked = 1;
 
 	if (up->port.sysrq || oops_in_progress)
-		locked = spin_trylock_irqsave(&up->port.lock, flags);
+		locked = uart_port_trylock_irqsave(&up->port, &flags);
 	else
-		spin_lock_irqsave(&up->port.lock, flags);
+		uart_port_lock_irqsave(&up->port, &flags);
 
 	/*
 	 *	First save the UER then disable the interrupts
@@ -1318,7 +1318,7 @@ static void sunsu_console_write(struct console *co, const char *s,
 	serial_out(up, UART_IER, ier);
 
 	if (locked)
-		spin_unlock_irqrestore(&up->port.lock, flags);
+		uart_port_unlock_irqrestore(&up->port, flags);
 }
 
 /*
-- 
2.39.2

