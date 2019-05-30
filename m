Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFC7A2F804
	for <lists+sparclinux@lfdr.de>; Thu, 30 May 2019 09:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfE3HnP (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 30 May 2019 03:43:15 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:37098 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbfE3HnO (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 30 May 2019 03:43:14 -0400
Subject: Re: [bisected] DEBUG_PAGEALLOC hangs on sparc64
To:     James Clarke <jrtc27@jrtc27.com>,
        David Miller <davem@davemloft.net>
Cc:     rick.p.edgecombe@intel.com,
        Sparc kernel list <sparclinux@vger.kernel.org>
References: <86e9d84e-cffa-0bae-f575-7cf6789f5fb8@linux.ee>
 <20190529.132340.1951054150778994386.davem@davemloft.net>
 <896BE8F9-F2AF-4138-B44D-512C615B9910@jrtc27.com>
 <57385AAB-C9A1-46AD-B743-445D4ECCA902@jrtc27.com>
From:   Meelis Roos <mroos@linux.ee>
Message-ID: <b33747ea-e92d-8615-d0fe-174d3f62a214@linux.ee>
Date:   Thu, 30 May 2019 10:43:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <57385AAB-C9A1-46AD-B743-445D4ECCA902@jrtc27.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: et-EE
Content-Transfer-Encoding: 7bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

> Meelis, could you please try the attached patch to see if it fixes the issue?

It also fixes latest git with DEBUG_PAGEALLOC on V445.

-- 
Meelis Roos <mroos@linux.ee>
