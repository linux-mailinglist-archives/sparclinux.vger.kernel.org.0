Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0570D7F32
	for <lists+sparclinux@lfdr.de>; Tue, 15 Oct 2019 20:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389206AbfJOSmG (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 15 Oct 2019 14:42:06 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34282 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389204AbfJOSmF (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 15 Oct 2019 14:42:05 -0400
Received: by mail-qt1-f196.google.com with SMTP id 3so32130762qta.1
        for <sparclinux@vger.kernel.org>; Tue, 15 Oct 2019 11:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YXiUOqo8ETclVClbFsr4YOWOeJ7XlxA5Qh2JOUOHtn0=;
        b=ih4zeCbnEW9LSQmgDID0erLrP4wKSRd4quPFdjB7jDfMBRahOCBa+C67Dy1NqHkrCv
         VJSNTqSrY43O2EJhupvXVshQ0BC82dIhxESVHTwLHkCEPN42OBS3yBTYdKusIr1FPyqX
         wpUPZ/cGTRy5YK2T6ObGKxHp1+6vi2CjoWlyTCo/dPXrhBn0tNseTwJyJuKrduDqfttY
         fd4SW/I4j0BpnaIdz6zO9hqQf6+agjiuheLCXQaQrYEDCeHJq0DF3gEtcT6Uvp1RF+B9
         gDgx+ctEQBhsj7GuizlLnNWuM5pbIfjPRVvTdcRA7Ese4V0mQHl7lb1qg7KFEBXx5acS
         G4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YXiUOqo8ETclVClbFsr4YOWOeJ7XlxA5Qh2JOUOHtn0=;
        b=TT+F7sB8hN9eildyqL1zJzjUN/F9nxose/zryTYJkzaBYbvezFtZxZQ84n+EB83ULu
         el9oBfGyVAQ+0cOaE6itT0P2p1AWRk0+5EPw+Ax7+8kkheqdvGk0AoH0cjAi527McVi+
         7ne/gAHU1CrU/C4pMg9cRiGAhiZJ7zPEDw1ASFVWzK5/bZYoDH/WIUHQhzmrfZALkJBZ
         gjxN5uzeMOpGWmA3R7J4GQ2wTxvk4hDExY+pNez1XsE/Z1lZxrt+oX1w5+1A1hEiruG7
         fe2bq5kqAONLjvS0QEfbmxkciiq9KPmduvfMmpAQckj0kTCRlGBNtcMwF6J+tKaDbUHq
         rojw==
X-Gm-Message-State: APjAAAV5ciNFAiA/cgs4rUNNR2BIzwOZm+jcW0/dDaoHDlTf26fDqwRA
        hPwNRXr3fexUxPKCzUuzlWvgnA==
X-Google-Smtp-Source: APXvYqwar5I/V60pS57/UcDUw1cogFuq6+7hHVlNRpscniqz5EATufxt8kONpUilAAyTNCHiUcXZ9w==
X-Received: by 2002:ac8:1c49:: with SMTP id j9mr41218038qtk.364.1571164924491;
        Tue, 15 Oct 2019 11:42:04 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o28sm9204198qkk.106.2019.10.15.11.42.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 11:42:03 -0700 (PDT)
Message-ID: <1571164920.5937.45.camel@lca.pw>
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
From:   Qian Cai <cai@lca.pw>
To:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 15 Oct 2019 14:42:00 -0400
In-Reply-To: <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
         <1571150502.5937.39.camel@lca.pw>
         <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, 2019-10-15 at 20:51 +0530, Anshuman Khandual wrote:
> 
> On 10/15/2019 08:11 PM, Qian Cai wrote:
> > The x86 will crash with linux-next during boot due to this series (v5) with the
> > config below plus CONFIG_DEBUG_VM_PGTABLE=y. I am not sure if v6 would address
> > it.
> > 
> > https://raw.githubusercontent.com/cailca/linux-mm/master/x86.config
> > 
> > [   33.862600][    T1] page:ffffea0009000000 is uninitialized and poisoned
> > [   33.862608][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
> > ffffff871140][    T1]  ? _raw_spin_unlock_irq+0x27/0x40
> > [   33.871140][    T1]  ? rest_init+0x307/0x307
> > [   33.871140][    T1]  kernel_init+0x11/0x139
> > [   33.871140][    T1]  ? rest_init+0x307/0x307
> > [   33.871140][    T1]  ret_from_fork+0x27/0x50
> > [   33.871140][    T1] Modules linked in:
> > [   33.871140][    T1] ---[ end trace e99d392b0f7befbd ]---
> > [   33.871140][    T1] RIP: 0010:alloc_gigantic_page_order+0x3fe/0x490
> 
> Hmm, with defconfig (DEBUG_VM=y and DEBUG_VM_PGTABLE=y) it does not crash but
> with the config above, it does. Just wondering if it is possible that these
> pages might not been initialized yet because DEFERRED_STRUCT_PAGE_INIT=y ?

Yes, this patch works fine.

diff --git a/init/main.c b/init/main.c
index 676d8020dd29..591be8f9e8e0 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1177,7 +1177,6 @@ static noinline void __init kernel_init_freeable(void)
        workqueue_init();
 
        init_mm_internals();
-       debug_vm_pgtable();
 
        do_pre_smp_initcalls();
        lockup_detector_init();
@@ -1186,6 +1185,8 @@ static noinline void __init kernel_init_freeable(void)
        sched_init_smp();
 
        page_alloc_init_late();
+       debug_vm_pgtable();
+
        /* Initialize page ext after all struct pages are initialized. */
        page_ext_init();

> 
> [   13.898549][    T1] page:ffffea0005000000 is uninitialized and poisoned
> [   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
> [   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
> [   13.898549][    T1] page dumped because: VM_BUG_ON_PAGE(PagePoisoned(p))
> [   13.898549][    T1] ------------[ cut here ]------------
> [   13.898549][    T1] kernel BUG at ./include/linux/mm.h:1107!
> [   13.898549][    T1] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
> [   13.898549][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc3-next-20191015+ #
