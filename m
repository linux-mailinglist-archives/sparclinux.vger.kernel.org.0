Return-Path: <sparclinux+bounces-6722-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNj9IAgM4mkg1AAAu9opvQ
	(envelope-from <sparclinux+bounces-6722-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Fri, 17 Apr 2026 12:31:36 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE1D41A221
	for <lists+sparclinux@lfdr.de>; Fri, 17 Apr 2026 12:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 720F33068D45
	for <lists+sparclinux@lfdr.de>; Fri, 17 Apr 2026 10:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BC53B7746;
	Fri, 17 Apr 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sVYorXF1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Oeidtc+T"
X-Original-To: sparclinux@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C035B3B38A9;
	Fri, 17 Apr 2026 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421475; cv=none; b=E87BF043t9vWBuOGATN8k6liI3/9M6Ag2+zxF5sMTbcCRt7ikrrV4eMyKTGeLrY3mkxQ9+/vrbWjq3Jo9XnTL0qK7JLuu44DJ5BG7oWx8eJ9XXDLNdcFQVIZR9a/ZMxgcDWTViTzUpLTxGjPmv/2RwMA0q2Gl3Pq5uPyY6VaAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421475; c=relaxed/simple;
	bh=cS/dBbKgaKquRLzpJW+/HwzHoZ4Mlfaq9lnf1WZJqdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJI1ICzfbeT9P2S8YHbMzHP2X0CQg+EspHEcinegLfpVZOURDJeNGrUU48+uRIAdBuFLhHYCaCUlepuQoCVBMxNKlzrle3g8Lze0tNt5/U/s5PE69ir52/nwO4+ATy95m9mj201fvHCYaPfvdEyoMw6Nn3x6tW9J9La2ZtYUx78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sVYorXF1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Oeidtc+T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776421464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sT89vdNi1tSkKoKmWLBjgb2FXe2g6tBONEq1VPMnDwU=;
	b=sVYorXF1yw9POGgD1GvSzasC9FsBfzUA53utmab5zqdwZK09rO+r3uPwzEpQyEYAeLf3yR
	eXDLqT33zCItMiS7JxvQMSHMUET4Wkx6Pewb1RLEVX2rKls19HyK/3ogBxzsN74VdYmftR
	NU6p4B9WLYGVCqqWZTb0epZ+mq839WiX9ptIUN4hO6NxdBMyxxo5lOmaE8Jy3JdbFg+l33
	/IVaLuMEG8/+iBh517EXEgMO0FOIwt4yJsjeHhtbRAycsMG2pBGbNGd5zRIurDQleytEX8
	Xt+HuK1GwBj+5Ob1HSUJyNzbk6cjt7ukNgndGos3sRiPv6fBGzCq0L8Az9hiBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776421464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sT89vdNi1tSkKoKmWLBjgb2FXe2g6tBONEq1VPMnDwU=;
	b=Oeidtc+T3Qo4Nmp1Qb9eB2oio0COfltJZ2ZdzoWqP+QM7mOtmHpofaaeXCHCAWtMukIEmu
	XA3ALkr512woVkBQ==
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Xin Zhao <jackzxcui1989@163.com>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Gerhard Engleder <eg@keba.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Joseph Tilahun <jtilahun@astranis.com>
Subject: [PATCH tty v3 0/6] 8250: Add console flow control
Date: Fri, 17 Apr 2026 12:30:13 +0206
Message-ID: <20260417102423.40984-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,samsung.com,davemloft.net,linux.intel.com,gmail.com,lists.infradead.org,bp.renesas.com,glider.be,sang-engineering.com,163.com,oss.qualcomm.com,keba.com,wunner.de,treblig.org,astranis.com];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-6722-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,sparclinux@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[sparclinux,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cons_flow.cocci:url,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: DAE1D41A221
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This is v3 of a series to implement console flow control for the
8250 serial driver. v2 is here [0].

The 8250 driver already has code in place to support console flow
control. However, there is no way to activate it and it is
incomplete. This series provides the necessary missing pieces while
attempting to be as conservative as possible, so as not to introduce
any side effects into the many 8250 variants or other non-8250 serial
drivers.

Note that as of v3 I am now deprecating UPF_CONS_FLOW in favor of a
separate boolean field. In the commit message (patch 1) I explain my
reasoning for this decision.

For patch 2 I used the following Coccinelle script to perform the
modifications...

===== BEGIN cons_flow.cocci =====
// SPDX-License-Identifier: GPL-2.0-only
// Options: --all-includes

virtual patch

@r1@
type T1;
identifier U;
@@

T1 {
   ...
   struct uart_port U;
   ...
};

@r2@
r1.T1 *E;
@@

- (E->port.flags & UPF_CONS_FLOW)
+ uart_get_cons_flow(&E->port)

@r3@
struct uart_port *U;
@@

- (U->flags & UPF_CONS_FLOW)
+ uart_get_cons_flow(U)

@r4@
struct uart_port *U;
@@

- U->flags |= UPF_CONS_FLOW
+ uart_set_cons_flow(U, true)
===== END cons_flow.cocci =====

Changes since v2:

- Deprecate UPF_CONS_FLOW. Provide separate boolean with wrappers as
  alternative.

- Update all UPF_CONS_FLOW users to new cons_flow wrappers.

- Use irqsave variant of spin lock for status update.

- When 8250 console flow control is not specified, clear the policy.

Changes since v1:

- Prepend a patch to perform an extra LSR wait after CTS assertion if
  the initial LSR wait timed out.

- Close a window in serial8250_register_8250_port() where console
  flow control was briefly disabled.

- Add port lock synchronization to the port->status RMW update in
  uart_set_options().

John Ogness

[0] https://lore.kernel.org/lkml/20260410144949.16581-1-john.ogness@linutronix.de

John Ogness (6):
  serial: core: Add dedicated uart_port field for console flow
  serial: Replace driver usage of UPF_CONS_FLOW
  serial: sh-sci: Avoid deprecated UPF_CONS_FLOW
  serial: 8250: Set cons_flow on port registration
  serial: 8250: Check LSR timeout on console flow control
  serial: 8250: Add support for console flow control

 drivers/tty/serial/8250/8250_core.c |  6 ++++++
 drivers/tty/serial/8250/8250_port.c | 21 +++++++++++++++++----
 drivers/tty/serial/bcm63xx_uart.c   |  2 +-
 drivers/tty/serial/omap-serial.c    |  2 +-
 drivers/tty/serial/pch_uart.c       |  2 +-
 drivers/tty/serial/pxa.c            |  2 +-
 drivers/tty/serial/samsung_tty.c    |  8 ++++----
 drivers/tty/serial/serial_core.c    | 21 ++++++++++++++++++++-
 drivers/tty/serial/serial_txx9.c    |  4 ++--
 drivers/tty/serial/sh-sci.c         |  5 ++++-
 drivers/tty/serial/sunsu.c          |  2 +-
 include/linux/serial_core.h         | 20 ++++++++++++++++++++
 12 files changed, 78 insertions(+), 17 deletions(-)


base-commit: a1a81aef99e853dec84241d701fbf587d713eb5b
-- 
2.47.3


