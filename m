Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDEC1D802F
	for <lists+sparclinux@lfdr.de>; Mon, 18 May 2020 19:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgERRcN (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 18 May 2020 13:32:13 -0400
Received: from sonic310-24.consmr.mail.ne1.yahoo.com ([66.163.186.205]:41469
        "EHLO sonic310-24.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727942AbgERRcN (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Mon, 18 May 2020 13:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1589823132; bh=5gCyJ+OqEpp5mbAlNtNv58P62XCklDNCTlGARRHXZQA=; h=Date:From:Reply-To:Subject:References:From:Subject; b=gvDjEzoYFnVMUE9kARm+QYdjYPBknpNt9m4WeS2kPuBHVHfWRoWIr0GkJoj4tZKNYIEWZxHpwYaTKX7LNIjHtgKk6ZVNjt3IIyxvmJGRftNyKS3vPz0vbSelxWGdf/P2gEDtg65wXHEOeY+z9TDQZZSpW8BO3UfbT+gyNZbuGycLmNZmx3hqN56rao6eT2znGtU6baAKtT2K+YkT0es7q6UBN7TRa6cbBjxEJCZolXEpfpgruOUkEcKAt1/t666otY7choXf4socIrV1AJrThAO+0/O44x/r1hmn6Nfz1ob2+tHcZ1xEKp9M6mmxBsZfcoHnJ7vqC7NpJTgR3s8UPw==
X-YMail-OSG: QIY8PpgVM1nfcscaORkwY0wfOoQFoqoAaEuhfOb96VxtS4wwDUdQr4IB2XADZeY
 xVfLG6U5Jmi7pLNoYDtlefIYni_R4WjxHvOdmqcM2AeWPIaBrWG9IICkWlbWoNyi64drCtHfIodm
 2iB3dncNSflZ5RezBgg4nCnOdrhIR5BjE6cb92i6pMCdYlfFLtkk.Z53jG_u4Trd1436RcxMmBDI
 jy6MSfPKs0JAORGUc2dN8fjlW.rpA9tTv_3GgUI4.gLEFlbtcoYPdtCe5amWsfkEWAfHqmdPEEh5
 oO3RzvCFHPj2tweHB.mdwEqKMOMG8QkEv_aug2M_JN0L3qKrDQteILajx_brXNfdSOc.hyxfWQ8y
 emR.NrbpAJg2VeYUYBtV6oweXx9FuGC8gLk_OMRM02qgD0ZsA5wyB0.6aggKT6GTu3a6SD8Hwz5W
 tyYFDqE8pnP.utvyNPuyg2Y3azrEEGUNx0uWW7NPSDHlfYUA0b.t8lZm.y8cSdcnpaMg.aAuKz47
 9WNZGBlWcN2Qt5Zj9Xb5zyXahMkgasxkX25gi8Lbg7ndWYZwErj7_9R25IQUBnEqXksUZEG1T33T
 ZaAkfuykVGdGvrT6dw4XsHOec9fquhZqiRQkOQ_vkN4wLIEUJxSdpWiESF_ob2n5ns9UMX3olGFw
 VvPKX1CN8Xiy1zzkTfxF52atYH_vbLW78hJzFAp4EQNqJgQ7gY0aTu1ekp29R3dgmd9NzS8252GA
 sMv3EMn38RDhhmBEPQmoEqQmyv4L1ObnC6NJniHUv6bYZhHaaTT34oEbi.FWNHHetag_RBH2.BLT
 8OBFLykSEOM653K65YqSNUFxn.Gs.RZ8DV5FJ_nktYkwpHrgqA5N06l1goJWE8AJoskIO6ddaTC.
 _gfG04IHJO8kvszfhci78SdcoMLefrhq0dsoh2ukTDljMqZvA5SFGN6W2GymA9hD2gbi7wMj7t8l
 tJNIurWwLe5dCQ45sbu4GN1TABhcxhEOHKE7f0sHJ3hGW8kF6O4.i6UI0HvFYS.XAvraaRPiVVj8
 Ck5t8tSzKAFdFUHYREMoTdeuhVKMFuVFvY962FiuF7QjzCYAPvWmtoOQERqhN9QwJjhlG.oqMAGs
 cSMM8ZUlNJSziIBCi3vt9XgfOwCsmxsoL42hN.xv4IVuf0xPr_gJJJFmHjdAhBtdCnJs0Dif5FJA
 yQcPzzBpCLdTYMoTMhSH.J7Rx_GCSXYK5Rp1K92hCZj.aW3tFJGXM_J.JcBa_UrOzNW4vQSHayw3
 2DCcGf4dKpeZKTaRlrwWUdum77tyJx6fdAzBT7dn8yRpZv2.39QAz1qHrVbTk.Ejz2YibJV1Mol8
 5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Mon, 18 May 2020 17:32:12 +0000
Date:   Mon, 18 May 2020 17:32:09 +0000 (UTC)
From:   Rose Gordon <rosegordonor@gmail.com>
Reply-To: rosegordonor@gmail.com
Message-ID: <1166969588.961336.1589823129709@mail.yahoo.com>
Subject: Hi there
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1166969588.961336.1589823129709.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15960 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Best of the day to you I'm Rose by name 32years old single lady, Can we be friends? born and raised in London in United Kingdom Take care Rose.
