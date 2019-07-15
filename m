Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662B369AFC
	for <lists+sparclinux@lfdr.de>; Mon, 15 Jul 2019 20:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbfGOSpK (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 15 Jul 2019 14:45:10 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:48538 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729568AbfGOSpK (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 15 Jul 2019 14:45:10 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hn5wy-00041l-3l; Mon, 15 Jul 2019 20:43:48 +0200
Date:   Mon, 15 Jul 2019 20:43:46 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Hoan Tran OS <hoan@os.amperecomputing.com>
cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Oscar Salvador <osalvador@suse.de>,
        Pavel Tatashin <pavel.tatashin@microsoft.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "David S . Miller" <davem@davemloft.net>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Open Source Submission <patches@amperecomputing.com>
Subject: Re: [PATCH v2 3/5] x86: Kconfig: Remove
 CONFIG_NODES_SPAN_OTHER_NODES
In-Reply-To: <1562887528-5896-4-git-send-email-Hoan@os.amperecomputing.com>
Message-ID: <alpine.DEB.2.21.1907152042110.1767@nanos.tec.linutronix.de>
References: <1562887528-5896-1-git-send-email-Hoan@os.amperecomputing.com> <1562887528-5896-4-git-send-email-Hoan@os.amperecomputing.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, 11 Jul 2019, Hoan Tran OS wrote:

> Remove CONFIG_NODES_SPAN_OTHER_NODES as it's enabled
> by default with NUMA.

As I told you before this does not mention that the option is now enabled
even for x86(32bit) configurations which did not enable it before and does
not longer depend on X86_64_ACPI_NUMA.

And there is still no rationale why this makes sense.

Thanks,

	tglx
