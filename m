Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64C7A12F798
	for <lists+sparclinux@lfdr.de>; Fri,  3 Jan 2020 12:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbgACLl7 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 3 Jan 2020 06:41:59 -0500
Received: from sonic301-30.consmr.mail.bf2.yahoo.com ([74.6.129.229]:45431
        "EHLO sonic301-30.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727560AbgACLl7 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 3 Jan 2020 06:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1578051718; bh=MJdpASvZnpj3gXKZxrNskiGAl+hYYwdjGUMDZ9fMpsI=; h=Date:From:Reply-To:Subject:References:From:Subject; b=tKwJY7NGkFGmVKaRNsAHvUpDRq6YrpCWNdyu+lxKUE3JNbf22EbOx/7IDxXM9ve1PQDSlT6YhikdaxRv5aPJgtDxZ/UCAazzYqpJfK3cbcTR8R0Q55AUd34kdZy+of1GSYbYvJX863YHGZRHqVzpU61v+a974BmjfQVNYXzik9aN73HE+t7Ss711s4/S9OIVizhQJ4dpfL9QlpqHda4bkbyF84HhqT+1DBgxpdEHYC32F+qwN85UAgbNSMLkqPy5mUxMmVfM+mZ9Ul6udI25X5RqpSQquv9iqYANi6kZZCud3qi/GwTH4Qjzt0sJzPu2pHggsSTYNZ4gpanLDUtBfA==
X-YMail-OSG: PIJJKLkVM1mx.QqL1Z2QJedCGJ4c8eypvNfxM.TsoI1SsFp0pRsqOBxz9DXfb11
 YQedZUqqgFPHbhrNbcy4eQPCPrEKYZ1SLRt52Qono9u858regMj2k6.1i0oeAHBxwS8GoqQhlqL4
 rR2he5aQUUChUAXbgebQ4VTjsrydUG1HkdDjvUHUmeCIBsXuv7aiwjWdnKtttJxjKOqhmIiiAemr
 ykqq5VCV6rgESM1pM1UUZSfftMavMvaFWFUQL.Jk.VNHuuzRvW2XlSbmcCv2NAE7L1qWxKsSZyIP
 rdqMGEqb6qe2BBhoGxEqxRvHsFV3jmxt08ivkL7DUHL1YmGUy7Z_AZqqzRnjlnnaMfH.3zH_uaMY
 VFhl_bdFDyLeGfuEk1DRQyvzEUapBHc7i8cNllhhwk2Td2V.XvczFE7wI3rYfTNy1j5pDbzrsFd3
 hqpEWAy3Ub7kiWsbzbVFh_XYw3OWAX40VerWOQN6z9Nr1ckXbdGPR8sQNTu4jzTS_8GjbHgLWNtB
 mZdjA7lmDHZ8Sc9WhjRALCrdFwdzbNOYyePkMlgBQxAeWSUCapftY..tznS6XZednYF.CwSqQzzL
 CSibbE4idWoaOrdEOSgaL7uxbITuC.JeLaamDlApbhIM3GB2wsdUFZoSZupjvmFzcFJgF9xbulkX
 EXo92MIoiT3qaf2TZNk6qP3MTY89sWHBLk507zRB8I9kE3KbaOpQfBJfMH4p1mlNGp0V4IA8d9pH
 n1hSfWPdK7ueG0WQw6sokvmlTSaKIP58ZE07mbEK4IYsJGDFD7hSRD2yxAGayKmLXeue8lG8JJrE
 d60HbiK1X7LjpFNWlFOO9aE.Jgpsu5yY29Wulg6chLvbOd6l1gw1ucpZJ_twILWVNzL3uUOn9wQP
 jeSCti5IRgbvjZcKw._31b_pgMGGfJulkCL5q5CI53WxVBn4ti0uAghkD43yZr9omySgTgOf8Rj9
 7ab8QDNknxZ7goqjgP6zfbxVXf6lOeJGtONEOmXOhMwFwvLYe7JOdT6DhGrvYvd78YwUwCqkGG41
 aZm9cdUcaA23MlkWX8NUtqQbWhVfHrpCFhWDL3Ow3j40wQ8UydEhVOGgmM2LhZbbaxaUwtfbPDGU
 3qTZuHzfgCiHYvw7Pw3BWTLgvEYfVf0VSklivk7ZYqU_YWV_t.4wZGDMo_y2JSTDCPn6.yuBCEHt
 ColeBsO1tKuYu4u9N9tLEGgyFmhxGu3hLSioWeD8dM14H5Duhqy1TYQ8Cwrh0n.ok42w_l5j5Tf7
 D7ujESRdEBQsvE_xD6vgXpiK5IGLQFsKcaS1sUpjOhk9qA4edhgJ4ZcDVm7aiws2sHAYsEL7PBYT
 dWR6sVLmdvns4IMVCAsmDrgRUR5gwqwsDEG0mDhk-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.bf2.yahoo.com with HTTP; Fri, 3 Jan 2020 11:41:58 +0000
Date:   Fri, 3 Jan 2020 11:39:57 +0000 (UTC)
From:   Brian Gilvary <1brian.gilvary@gmail.com>
Reply-To: gilvarybrian@aol.com
Message-ID: <156407729.4076756.1578051597568@mail.yahoo.com>
Subject: Happy New Year For Our Mutual Benefits
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <156407729.4076756.1578051597568.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14873 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0
To:     unlisted-recipients:; (no To-header on input)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi

As the Chief Financial Officer, British Petroleum Company plc (BP), I am in=
 a position to facilitate immediate transfer of =C2=A3 48,000,000.00 (Forty=
 Eight Million British Pounds Sterling), to any of your nominated Bank Acco=
unt.

Source of Funds: An over-invoiced payment from a past project executed in m=
y department. I cannot successfully achieve this transaction without presen=
ting you as foreign contractor who will provide the bank account to receive=
 the funds. Every documentation for the claim of the funds will be legally =
processed and documented, so I will need your full co-operation for our mut=
ual benefits.

We will discuss details if you are interested to work with me to secure thi=
s funds, as I said for our mutual benefits. I will be looking forward to yo=
ur prompt response.

Best regards
Brian Gilvary
Chief financial officer
BP, Plc.
