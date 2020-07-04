Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED56214883
	for <lists+sparclinux@lfdr.de>; Sat,  4 Jul 2020 22:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgGDUAa (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 4 Jul 2020 16:00:30 -0400
Received: from sonic308-18.consmr.mail.ir2.yahoo.com ([77.238.178.146]:39306
        "EHLO sonic308-18.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726643AbgGDUAa (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 4 Jul 2020 16:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1593892827; bh=ZWeDLwf4cGlLDzTwCuOen1zTINlp5j+f2ywobrqBR9o=; h=Date:From:Reply-To:Subject:References:From:Subject; b=c5fOR7o8fZ7C5rLW+b2zYS2VW7M3090/Idbgz5sEgBW8twkhvftcYSenNdrZDjFjswfSKN01oP/ct4aWm2fxnxIbSFCMnYn/kNC49GOR3m9+pYOWvyrqCYyAycyJ0FWHDmLuHG8A3V7GyFHFylPpMrw3t1K4dJd+5IXkNeWYtt48EK6d9jp6g/ysF7fZ8/WJ5SzopBJK6J98nDc1qNyGprm7zYrEhCqEvjoPF4aWrivPqSNJFY+rrTqpa0TSTLmtQn2ViQGUSCeJIRWAU9PoW4p9cKh+5u95rsbg5OZhUOFzHLSnXxwevBAS7qbF7KbIrPj72xYTnTyB6SSYKim9ig==
X-YMail-OSG: Dam8Q2gVM1nTcqQ.2Dw.fh32jyTft3oPs1voWFmSP09UoW9wvzpSNIMISh7AGGs
 j7nwL6_BF8XNPIe4Jw0XJd5Yrmh_WJ_I8G85S6xJnaV.zqoo9o8uTAaBeXY8RiinR.aoJwM50Vov
 VicZKsnUADE4L_S.RfcYD4gEhLwo9BeYHw3sUF94NbSi_aeNfoE22swGumZGmWDn8AAhn8CdRscT
 h6Zn9tiaDxkLG.Fzx5IFysNifBDlJqugLBPNV1LTEfy4YpXeXJL516FpkwMScF1wmhz2_pm9vwYP
 o3lAGr_PNXqZ0CxbN6c48_oQJ6M4SlH9FgiSB7nAsU09WKVL9Cls62vTJKhhsXxOEvityW4ip1bN
 upM3pInb5zsilc_ZoLb1d3MHwCnsCgjLwmxzDqLgXC6AnNcXv8qMkOLUub3j1lnecvqzFAKNSAse
 A0WAU6Y_enEcnxvV39ddXxj3Pa3ji1F6A.2aJRx5pOYfv9PJv1v8kV0EuyYVPnC00cnTzdw9RggT
 2TiQvyg0pJuWAxXCFW1W6BPQSDYyUV8uktxsAfO9iut4lAaalANecKLw_vADhVFvMir3sMEF8G02
 QwgS_3sOne660V29BvoYp60q3jS4xYJAhfWOAzkgNQzF1j_YvdxqyacrWaew2rwVV0d4O5f0Q.ct
 U2z3Dsq8ciskK.cn5nZOtDyhJxd446536H0EiIxK11njY7S2vTGdXZWmCLNnlGJ_cnnGrnEXO_kJ
 c8TqVemfQGP1549yctSJnVcpUNvNYiHrjkB6mMOcKxNzYxI1ypv70iQ_eTxF2qTF402FP_1YGAyk
 OpOPZON6RshdvCxLwgyl0HViN_4TjNEmChzmBZI_tIwjmHQGEJ.mBV4NBfzpTJGQoFyn430.5l88
 mww2972ra2F25UiLgYTO2Dm3tzdRftuscWzqpRwoy0aKb7IGvb3u12n8iKQFnub8AyzHRlWAWZLt
 f_qh9sxeOJAhShFTxATIcLrQAZ4RDwAz3D.sNp_hHJP5OQJJnmvhAXLMmS5K3xwxBX2zXVjz61WU
 vq.HHHWmkgm8ofPfKJDsxqsMz.ba6uXZOUKWQkRttUD9xba4GaEK72SH3DVaITGHSGk1p4nbehaE
 UH7LdLqLVU8c2LpSKx7bx.VMRq4YYR6kXoOTGy.Q.ZzLszg9QqJuDB_QqWKmpDnYglYx05NHoUgD
 TvbDQ0icgunKGaR3FHGz0kpq7_8b8WnJEq.YFCwfcpz5HTGUVOjHJthgZNcouG_ltt994kmNWzTy
 8YmFJvGGkcG_Fdyot8kNuXXfVS86dRu4iIj51FdGzGrlrb7Wu7gZs.xPM2Fh_riXn9aUK
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Sat, 4 Jul 2020 20:00:27 +0000
Date:   Sat, 4 Jul 2020 20:00:23 +0000 (UTC)
From:   Theresa Han <serena@lantermo.it>
Reply-To: han.theresa2017@gmail.com
Message-ID: <1913154107.4498185.1593892823724@mail.yahoo.com>
Subject: =?UTF-8?Q?Ich_gr=C3=BC=C3=9Fe_dich_im_Namen_des_Herrn?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1913154107.4498185.1593892823724.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16197 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0
To:     unlisted-recipients:; (no To-header on input)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Ich gr=C3=BC=C3=9Fe dich im Namen des Herrn

Ich kann mir nicht vorstellen wie du dich f=C3=BChlen wirst Sie einen pl=C3=
=B6tzlichen Brief aus einem abgelegenen Land in der fernen Elfenbeink=C3=BC=
ste erhalten werden und wahrscheinlich von jemandem, mit dem Sie nicht gut =
verwandt sind. Ich appelliere an Sie, etwas Geduld zu =C3=BCben und meinen =
Brief zu lesen Umgang mit Ihnen in dieser wichtigen Transaktion
=20
Ich bin Frau Theresa Han, 65 Jahre alt, in der Elfenbeink=C3=BCste, an Kreb=
sleiden leidend. Ich war mit Herrn Johnson Han verheiratet, der bei der Reg=
ierung von Elfenbeink=C3=BCste als Auftragnehmer t=C3=A4tig war, bevor er n=
ach einigen Tagen im Krankenhaus starb
=20
Mein verstorbener Ehemann hat die Summe von US$2,5 Millionen (zwei Millione=
n f=C3=BCnfhunderttausend USD) bei einer Bank in der Elfenbeink=C3=BCste hi=
nterlegt. Ich habe an Krebs gelitten. K=C3=BCrzlich sagte mir mein Arzt, da=
ss ich aufgrund der Krebserkrankungen, an denen ich leide, nur noch begrenz=
te Lebenstage habe. Ich m=C3=B6chte wissen, ob ich Ihnen vertrauen kann, di=
ese Mittel f=C3=BCr Wohlt=C3=A4tigkeit / Waisenhaus zu verwenden, und 20 Pr=
ozent werden f=C3=BCr Sie als Entsch=C3=A4digung sein
=20
Ich habe diese Entscheidung getroffen, weil ich kein Kind habe, das dieses =
Geld erben w=C3=BCrde, und mein Ehemann Verwandte sind b=C3=BCrgerliche und=
 sehr wohlhabende Personen und ich m=C3=B6chte nicht, dass mein Ehemann har=
t verdientes Geld missbraucht wird
=20
Bitte nehmen Sie Kontakt mit mir auf, damit ich Ihnen weitere Einzelheiten =
mitteilen kann und jede Verz=C3=B6gerung Ihrer Antwort mir Raum geben wird,=
 eine weitere gute Person f=C3=BCr diesen Zweck zu gewinnen
=20
Warten auf Ihre dringende Antwort Mit Gott sind alle Dinge m=C3=B6glich
=20
Deine Schwester in Christus
=20
Frau Theresa Han
