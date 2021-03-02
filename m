Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E72E32B218
	for <lists+sparclinux@lfdr.de>; Wed,  3 Mar 2021 04:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244301AbhCCCgi (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 2 Mar 2021 21:36:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:44192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1448846AbhCBPnB (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 2 Mar 2021 10:43:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAB5564F0E;
        Tue,  2 Mar 2021 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614696398;
        bh=JARIJr0xdblvFPGMjFX3uAy50MNMGySx+9rKjhfrmWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uvxy26opNpzyc/3GEpUmJpMa3XBJTR4zPEeZvNPGf8BHUbx+IQAw6hpGioNrfFkzR
         PXSzW/3fX7izx6GnB+x86bk0j9fnRQVwjshfIa2Qi/yS05bfH4xvtYUQbhIR+4+r0G
         MsKpGdpV9zeKjmNLqa4bRn64/OsAr+KYvPWG3Af0=
Date:   Tue, 2 Mar 2021 15:46:36 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Rob Gardner <rob.gardner@oracle.com>,
        Anatoly Pugachev <matorola@gmail.com>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Subject: Re: [PATCH] sparc64: Fix opcode filtering in handling of no fault
 loads
Message-ID: <YD5PzDbp5YHxuILm@kroah.com>
References: <1614577696-27586-1-git-send-email-rob.gardner@oracle.com>
 <CADxRZqxScpzebDEh+LjyKmsgoQErqB=Lie=JUX2WWN2NOzqPcQ@mail.gmail.com>
 <4b2456f6-f080-9104-e5a0-22e009164979@oracle.com>
 <cacdc021-75cd-7325-0273-cc007a4767ff@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cacdc021-75cd-7325-0273-cc007a4767ff@physik.fu-berlin.de>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Mar 02, 2021 at 03:44:54PM +0100, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> On 3/1/21 4:05 PM, Rob Gardner wrote:
> > On 3/1/21 5:56 AM, Anatoly Pugachev wrote:
> >> On Mon, Mar 1, 2021 at 9:09 AM Rob Gardner <rob.gardner@oracle.com> wrote:
> >>> is_no_fault_exception() has two bugs which were discovered via random
> >>> opcode testing with stress-ng. Both are caused by improper filtering
> >>> of opcodes.
> >> Rob, tested on my ldom, works perfectly now...
> >>
> >> $ uname -a
> >> Linux ttip 5.12.0-rc1-dirty #195 SMP Mon Mar 1 15:46:15 MSK 2021
> >> sparc64 GNU/Linux
> >>
> >> $ stress-ng --opcode 1 --timeout 60 --metrics-brief
> >> stress-ng: info:  [945] dispatching hogs: 1 opcode
> >> stress-ng: info:  [945] successful run completed in 60.00s (1 min, 0.00 secs)
> >> stress-ng: info:  [945] stressor       bogo ops real time  usr time
> >> sys time   bogo ops/s   bogo ops/s
> >> stress-ng: info:  [945]                           (secs)    (secs)
> >> (secs)   (real time) (usr+sys time)
> >> stress-ng: info:  [945] opcode            17847     60.00     27.45
> >>   34.03       297.45       290.29
> >>
> >> Thank you for a quick fix.
> > 
> > 
> > You're welcome. Please add your "tested-by" if you like.
> 
> Any chance we could get this patch into 5.12 and the stable kernels? (CC Greg)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
