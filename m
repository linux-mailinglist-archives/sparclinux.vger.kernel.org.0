Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE7A24D5A9
	for <lists+sparclinux@lfdr.de>; Fri, 21 Aug 2020 15:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgHUNCl (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 21 Aug 2020 09:02:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:51738 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgHUNCk (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 21 Aug 2020 09:02:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07LCv2hj141517;
        Fri, 21 Aug 2020 13:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=PcpCoU0WDTpnv8TEELdohzrZCi3V7j40jTFBfn6YFOg=;
 b=QzDD/u3/CbqVoee9Em+QhjZ884REkciwJueBlGSB4A37t3exrX2pZ/3qcAIAMvCpqYaD
 WdBGjRXYquH3i2b8oTFIZoNVAHoCRUvk6w8FVKi1erWhGse1oaegcGJNBbQRJzG38h4S
 rOYORB0B2wSVhWhnhLkBB+9t51NOiQ49fDX8EqP9lPMmW0P8T1dxO9n7QIpk0s4q1GSU
 OHIu4qevzCbFGz5yrqQntGR8kmR3JJjXcEvE9USz6FCNQ6JbXOixd30/ypnMki9aoMpQ
 ZgYjFyPl6HJHxIZjHq8cIXYM282s0i1zuXkgoGbBjyOxXQbBkPGwrtHIZiEh0C1BJZJ9 Ag== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 3327gc9py5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 Aug 2020 13:02:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07LD2ZeK192497;
        Fri, 21 Aug 2020 13:02:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 331b2epnt4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Aug 2020 13:02:36 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07LD2Sew006191;
        Fri, 21 Aug 2020 13:02:28 GMT
Received: from [10.39.214.136] (/10.39.214.136)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 21 Aug 2020 13:02:28 +0000
Subject: Re: [sparc32] userland unaligned access
To:     David Miller <davem@davemloft.net>, viro@zeniv.linux.org.uk
Cc:     sparclinux@vger.kernel.org
References: <20200820193612.GG1236603@ZenIV.linux.org.uk>
 <20200820.155122.2263405333608231817.davem@davemloft.net>
 <20200820233730.GH1236603@ZenIV.linux.org.uk>
 <20200820.164708.2016059081784711542.davem@davemloft.net>
From:   Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <6e51cc40-9390-e00b-d842-afe991560f2e@oracle.com>
Date:   Fri, 21 Aug 2020 09:02:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820.164708.2016059081784711542.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9719 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008210120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9719 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210119
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 8/20/2020 7:47 PM, David Miller wrote:
> From: Al Viro <viro@zeniv.linux.org.uk>
> Date: Fri, 21 Aug 2020 00:37:30 +0100
> 
>> On Thu, Aug 20, 2020 at 03:51:22PM -0700, David Miller wrote:
>>> From: Al Viro <viro@zeniv.linux.org.uk>
>>> Date: Thu, 20 Aug 2020 20:36:12 +0100
>>>
>>>> 	We have
>>>> asmlinkage void user_unaligned_trap(struct pt_regs *regs, unsigned int insn)
>>>> {
>>>>         enum direction dir;
>>>>
>>>>         if(!(current->thread.flags & SPARC_FLAG_UNALIGNED) ||
>>>>            (((insn >> 30) & 3) != 3))
>>>>                 goto kill_user;
>>>>
>>>> there, followed by some work on emulating the insn.  So while the default
>>>> behaviour is to hit the process with SIGBUS, it can overridden by setting
>>>> SPARC_FLAG_UNALIGNED in current->thread.flags.  Fair enough, but...  Just
>>>> what could possibly set that flag?
>>>>
>>>> That stuff had been introduced back in 2.1.9 and even there (or through
>>>> the 2.2, etc.) I don't see anything that would ever set it.
>>>>
>>>> Am I missing something, or had it really been dead code all along?
>>>
>>> Relic from the SunOS and/or Solaris syscall emulation probably.
>>
>> Thought so, but...  no such thing in either.  And it's not done from assembler -
>> arch/sparc64 used to access ->tss.flags that way (and that was only for
>> SPARC_FLAG_NEWCHILD), but arch/sparc never did...
>>
>> I don't have sunos toolchain to try and build such a binary and test it on
>> a 2.2 kernel, but I would be rather surprised if that had been it.
>>
>> Anyway, it really looks like that's dead code these days...
> 
> %100 it is dead code.

This flag would be enabled by trap ST_FIX_ALIGN, fast trap 6, defined
under Software Trap Types in SCD 2.4.  From the history, ttable_64.S has never
supported it.  Compilers are encouraged to instead support unaligned access
by installing a utrap handler and emulating in userland. Studio on Solaris
generated ST_FIX_ALIGN for 32-bit apps and utrap for 64 bit.

- Steve
