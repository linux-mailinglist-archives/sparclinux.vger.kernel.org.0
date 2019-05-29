Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821902E6DE
	for <lists+sparclinux@lfdr.de>; Wed, 29 May 2019 23:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfE2VAO (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 29 May 2019 17:00:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40518 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfE2VAO (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Wed, 29 May 2019 17:00:14 -0400
Received: by mail-wm1-f65.google.com with SMTP id 15so2462236wmg.5
        for <sparclinux@vger.kernel.org>; Wed, 29 May 2019 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=fnv26jopaIxPNu8WU6UUBVJx1a3A+Fjmfq0hUOKEvX0=;
        b=Wt25bdUM1yv3U98+dHbjSQHXsWqhEmhr0O3gSWiN+Frz/puy+wSPKRKwt8kWsx5DoH
         voudk7Zm4YJ72grY1wwOC3cQzS/4zV0TZ2vqQKvoQ05RJWXOoU8Gl2eMC+fLnAj5FqvO
         pvzO4Hds4BIN2oJV3txMRshHe+pKeGfE1QEWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=fnv26jopaIxPNu8WU6UUBVJx1a3A+Fjmfq0hUOKEvX0=;
        b=VEV3oj7z8VEi6TDOAlKQ/CVObQO2H5ooLqRi4AV4sSa+93xuKAQF3cvAom3F7uGiWg
         lxdtXYjsGEnn6b5er4SZ9rWAxVcST+L8BS3Jp/S1ArRorN725dnWFSAgSC1bmbFBtBGF
         EhX9gnqGJbCJwBSRbR/jjCzIzx27vhFUeTGW5/OatnvyKQOX9dcK1UMtaiBrOjcFakUP
         oWIIZ+uRlM1zLr1smTj7zYMmM9U5slN1/85Prs+eNmdLzP0Q6lvujfX5rWPqqbPX8+A5
         LHfwcnBmYOP4rcqFR96xBqwDViiy/JaBa+Om6RiEgWQllQZrV76yycpM+XhmgqIhH57H
         aLbQ==
X-Gm-Message-State: APjAAAU1FUXZn6Icsvz9jEbSafvVg3BlL7iaNOR6YEGkyGaNw3CCJ7v1
        n4JSY28RPk7/xtfVVMbjQ5Ib+L3XZmUPdw==
X-Google-Smtp-Source: APXvYqwYrdWzzbLlFDxCIhO3QmdOZPgH+CWBeiZMNp+wmsYJMKkB8U7l/A0C1EwQoJ8oh1gyws9gKg==
X-Received: by 2002:a1c:6c1a:: with SMTP id h26mr34272wmc.89.1559163612001;
        Wed, 29 May 2019 14:00:12 -0700 (PDT)
Received: from jrtc4a.trin.private.cam.ac.uk (global-184-8.nat-1.net.cam.ac.uk. [131.111.184.8])
        by smtp.gmail.com with ESMTPSA id z13sm443171wrw.42.2019.05.29.14.00.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 14:00:11 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [bisected] DEBUG_PAGEALLOC hangs on sparc64
From:   James Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20190529.132340.1951054150778994386.davem@davemloft.net>
Date:   Wed, 29 May 2019 22:00:10 +0100
Cc:     mroos@linux.ee, rick.p.edgecombe@intel.com,
        sparclinux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <896BE8F9-F2AF-4138-B44D-512C615B9910@jrtc27.com>
References: <86e9d84e-cffa-0bae-f575-7cf6789f5fb8@linux.ee>
 <20190529.132340.1951054150778994386.davem@davemloft.net>
To:     David Miller <davem@davemloft.net>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 29 May 2019, at 21:23, David Miller <davem@davemloft.net> wrote:
>=20
> From: Meelis Roos <mroos@linux.ee>
> Date: Wed, 29 May 2019 22:08:26 +0300
>=20
>> Bisecting led me to 4.9 merge window and this patch that broke it:
>>=20
>> a74ad5e660a9ee1d071665e7e8ad822784a2dc7f is the first bad commit
>> commit a74ad5e660a9ee1d071665e7e8ad822784a2dc7f
>> Author: David S. Miller <davem@davemloft.net>
>> Date:   Thu Oct 27 09:04:54 2016 -0700
>>=20
>>    sparc64: Handle extremely large kernel TLB range flushes more
>>    gracefully.
>=20
> Thank you, I will take a close look at this ASAP.

Perhaps I'm being stupid, but the first hunk in =
xcall_flush_tlb_kernel_range
looks wrong to me. %g2 previously contained PAGE_SIZE-1, but is now =
clobbered
by the new srlx, setting %g2 to (aligned_end-aligned_start)>>18. If the
brnz %g2 is taken, %g2 gets overwritten, so it's not a problem, but if =
the
branch *isn't* taken, then %g2 is zero, so the add %g2, 1, %g2 in the =
delay
slot of the branch sets %g2 to 1. However, prior to this commit, %g2 =
would then
have had the value PAGE_SIZE, and the following code to do a =
page-by-page flush
assumes this, using it as the amount to step through. Rather than =
stepping
through page-by-page (with offset 0x20 to indicate nucleus), we will =
step
through the loop byte-by-byte, so some iterations will have low bit
combinations for things other than a nucleus page demap operation. This =
same
bug is replicated in the new __cheetah_xcall_flush_tlb_kernel_range.

Regards,
James

