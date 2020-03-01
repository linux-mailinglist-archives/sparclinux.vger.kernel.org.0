Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D88C5174C30
	for <lists+sparclinux@lfdr.de>; Sun,  1 Mar 2020 09:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgCAIFj (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sun, 1 Mar 2020 03:05:39 -0500
Received: from sonic305-35.consmr.mail.bf2.yahoo.com ([74.6.133.234]:42268
        "EHLO sonic305-35.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725787AbgCAIFj (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 1 Mar 2020 03:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1583049938; bh=eHqoOfWUTPjfrhjF54FSKRE6sB3J0C3h0mIA7yGF41c=; h=Date:From:Reply-To:Subject:References:From:Subject; b=jHqSg5PJ38O+plmy98BhS/JkBBznaVmcAzthE/VfKEPn48RL567msyLzi5akdZ8HB1UBp1u2yybU8sy2cAYjWqu9zNOs8w2Tcy7x2yIN3nWbZYVHPHVUBXYCqgYkRmExH/qTEyxIeSp9AB0GJeo7UkV8Tsltl7+7PQiZVMd4Kp/nRP2I6xv0rBV2+4+dfgjHAz5YZ08ZHAq2V6LOoKGsEFe0ugTVrGVnnyClmxQq1MF7L8lfEHD6QFQ9pRPtzVkWgnLZd97WtHiVUywTKOC5SgCwLUM+yVLi4EfL7cPEWaeZ2RcZq4vPf7U0GXmfZN3D3ZnuCIRdXfkuGaemVuhvpA==
X-YMail-OSG: G7utsHMVM1lSEEISh1vr0hcTmrG8O1slpWssSoRh9AQDe50fTgmLXhMeaYcFgOo
 RyvtithQrJMBLHRqnO2DPMyXhc8WrL0WJd3KlRr3ZMYjYaYTbS60EzfmRg2L8cFHuQ1uwD1SP4_i
 RvSJb.RkHhxL546epjsV3CRXheza7BYd1Hs5XIut83LTvLH9arCxLflA0rFA2gk9Y2XYHfsllPqV
 ALtCXwA7zT.76uv1bTZ22a2U94nFDfXbloCFj8nh2xiXFPwojjfeOIkf1tqP1rkIVn72CHOU4wvj
 gFdyB29qZ8txxQUIrYpmXFdMw2JY2oZdv1A3pGH8Yg_bkQPQ0dWP_HwxTaiLdA63T9VR6fGqI1nP
 R2qS9CAjyfP9OSPr6ZPhLpJAdgqTlD2X2TMAR2bhkQab.G33pPenxDk9uLpKaw9i239pFe_bhw9X
 hpmP5DEzw_9sC4m8ZAImpmOxEcOnsHu4eVRufp6JxU9y.p7q7EDIaazbiMPJs3zSf.JK7f0TKzcw
 l2bpfIk2xU_F64MG4ScFTiQVFxyalCr8YOKiNH7dWwB3VCqeUfbEai1V2hmQjP7DTHKP141KZXlD
 pnDNF7OHyIBpDm1onTONQarGbzd8xQMEzSxF4dmZsd.fhp8UlvbUYSZlEDH.ViZ_6pJMmD4cMv1v
 wlwSAOvJuJnhu8GDjj66kRfrw6qinbI7Iai6pmIuIgICTxPUhnqNuQrujD8bMR4SPehJ.Gu4IesC
 nldUN4an6CeC7ji.navNSl4sgPFmyEuMo9lNSTPBP6xS19tTB9O0E88RchToNNhISgaLdOkShhT2
 Wgir.P5Ae527xIEJpsj5yy7Eil.txM9kv1eEhxJPkWeS.Q19BPtY0u4sNo9y3vLkRYnM.PdOidKU
 ESbAkKmx9tWsI4rQq0UTBi4b9fJhwtAMUmE1OzzstVfMKNQe_w9DvwqVi6uGMo7uNf7.9rotaePz
 WjpZhY.8NSrTADjMpUgaTR6cdpcgi2zBOSo5K9hFAOtBac6I4uEX2XRRylyjdpDuDYg3qRDkyZDp
 lCkZVlaOoPBZ.zW2ta.82U3s_3LeYXKmEk_YAFt3LIleyG9uKAY.ahG5PB4_trqbjTJUL.gCm0hW
 r0etJfob4bjTt.x0vcdfekSClgIEGFF6d7WUWwSbXUt5fg5NIJJUlOMVLtIc8TYlqL2lAmAHf_Qi
 WHDXd.bNhFfKX9CJArenWiGpYRj5R7RtilhSveew6ZMr0A8XSeVGkerjsNN5BbS0pRS3TuqAHZC_
 RaRU7wk6_xKSRjtoKb6.cctHiW.KYv3B4FeEqXbRgXqrwo1cDMER437Ov.DGHNleo9bdeAAxh5xA
 rWVRe1Rlgy.1wTDeDQBlccthud1xWdCE-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Sun, 1 Mar 2020 08:05:38 +0000
Date:   Sun, 1 Mar 2020 08:03:38 +0000 (UTC)
From:   Wang Xiu Ying <dvfdfdffd@gijimaz.com>
Reply-To: wying353@yahoo.com
Message-ID: <1237976085.1779583.1583049818129@mail.yahoo.com>
Subject: My Proposal
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1237976085.1779583.1583049818129.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15302 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org



Good Day,
 I am Wang Xiu Ying, the Director for Credit & Marketing Chong Hing Bank, Hong Kong, Chong Hing Bank Center, 24 Des Voeux Road Central, Hong Kong. I have a business proposal of USD$13,991,674 All confirmable documents to back up the claims will be made availableto you prior to your acceptance and as soon as I receive your return mail.
 Best Regards,
 Wang Xiu Ying
