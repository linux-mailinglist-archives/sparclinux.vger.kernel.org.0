Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A7B288BA6
	for <lists+sparclinux@lfdr.de>; Fri,  9 Oct 2020 16:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388811AbgJIOkY (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 9 Oct 2020 10:40:24 -0400
Received: from mout.gmx.net ([212.227.15.18]:35741 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388736AbgJIOkY (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Fri, 9 Oct 2020 10:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1602254421;
        bh=zvhM57VnUZ2oXHcGYeCY4AR4LWpkmlNpvLPxkR47n3g=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=k++jWVEChroRLKlJj91wPlmu1lanNY5cbmv1dLQl6wdbu22AbrkJO3j6dLhCGlcQr
         n8EA8tRJOMfbV0SGS99G5AO9tlA8iMcKu83cUj+zt6wkfW/4sKGRp8pRCp2co3kTB6
         3oK8KKQo1UkzUC1lCw2oeYP5gxiNF0byYmXtWEIE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from dpc-001.office.wrs-network.de ([92.116.56.173]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M7Jza-1kYa8P1Udw-007lTf; Fri, 09 Oct 2020 16:40:21 +0200
Date:   Fri, 9 Oct 2020 16:40:26 +0200
From:   Wolf Ruediger Spielmann <RSpielmann@gmx.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     sparclinux@vger.kernel.org
Subject: Re: SMP is broken on sparc64 with kernel 4.x/5.x
Message-Id: <20201009164026.1c811fa50ae5f71551717fef@gmx.de>
In-Reply-To: <37f4b03a-c108-2c76-ea31-e8a31a0fad34@physik.fu-berlin.de>
References: <20201009161924.c8f031c079dd852941307870@gmx.de>
        <37f4b03a-c108-2c76-ea31-e8a31a0fad34@physik.fu-berlin.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8YUFYhmYfqGyhGxMQ+cbizeMhq0NauwRXdGqHoJjWqha+Zleon0
 o5cwIE7r9wuKzn3YgckRsfK/APx5/yxKOYOmn/i/ndzHiE3E9qgUi2FoGK4UqlmgQHdcsiE
 5zKrcIL55zhJFvcDCgRszxXQSGX9/VxCYYbOdQUKVwzQyYxOCzI1AELnPIHq/sI3+BxwfgK
 99YiJGhF2NhOzSlBUYL9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dgmNrw5CIXU=:w71D0tmVIuR6wksiMuhZdH
 mOhWgpXR3sGaNCr/yUsS1AMxy3s47F2Txkvqvw4rqoCdvY0UoGMWWdPRmEdaqsI0ZrhDGyaoD
 y/vgH4j3r8/cyGb/LU4Jg+z74iKTFEG8Mwnnp8zuy0+uJYRV3NbgyIBDvuAUsqBPMvpehOm/w
 nO8H0eCjpTiIl3InvYBk/MlhICZjXPl/GnNalFftM4R1Ah/GD5LyC+og5bWvD5ym1bpO/gRLW
 bE7Ml9HLYpuTIS4UE1/J7Umq5MOyP8x8Vyc4qNAIDcHoEdcNJ29i1+c9VCn2asW8lhlCqiqYT
 oYNLi7rm5MB2UNM7LHADvE+qLf8vR95lVqWeEULaeRSYVyIg+xFXoi+aSViPEDtPzWHVvIJJH
 jGH67UOYjcOdL/e3DBL4qGT7XY7E4OyDyCTAxy5Ao3HU02R5KQXGl3Z3BMQ27dQXJSNOatTFy
 2WeqT+rSkH9LUhbgztj6LbC7dPURFmpgIbsA3RTEEoCzAMcZxSu9YeLwRaXVMJYPHtZY3D+CN
 CPl7ie3pZSnDUn8YL3xiNaGn081VS22QzbOcdlOiNcVns/MBQSKJtmSQEWfseDzmih2M67qrx
 oXJK745BgSg76GPL57f8WqAzUryAKE8dSMQAjG8FMWgexudxmZua5xd4WQn/V2/iFqYh7kmC0
 LQxIY/jK+iICNXpUGtJ++N+GJ7dRGl+v2sOBtuGJ883OAm+Jyya8Z2va5cqR5H9MNkqlFisqC
 Xod2Z4OleXf/GINXvXID1MVUJrj+Hs3vX74PIQN8m8m/zpOLtwegTucClCaOhrrVbVcTHk3E/
 TZSTu5/baD10iR/KsNHIQzOQnvK348t5p6NZsnTrA8bovgiqYzK5nxo1RDCokGQWjkGM40pOs
 tFVo3L+DKY2BN8lOGAx6e8MLf9wPOpLMSaSya/VvrzwTycCWYDznHlc0U3WLthnrYn8UBeG4o
 O4YPTQ/j4xBcRaMc/UF+6GZ2DK+rrfAbnmfZPQ37qdX4dom7njvhpltretD//Z1WxG6tJKabe
 1n+nPSmn468OxACzNG/QW/iBFudDQnvIJu4nekvsIHCv13FkifCOi6g4JQ3Dlcz3IhYTOQu+y
 p8HeWMhtON4pOoianCq7/sZDGLw6/fmbZM7QEd19DdJq+7ggV+Ixe7ZmuGYxk/D5DK9hZDCPp
 0ELZjF3UpkG69LuEEdmXix4akUQlYg3QBJj+vn3X4qnAEsee1R6dSE4SfvNU4dZNGcge6D2QH
 PNFSlHEt/jYpWn8p1aAUZCmTekMprsjZnXt2Mjg==
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi John

On Fri, 9 Oct 2020 16:30:35 +0200
John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:

> It mostly affects older machines, the newer machines such as T5220, T5240=
 and T5 that
> we have in Debian have no issues with the latest kernel versions.
>=20
> We do have an UltraSPARC IIIi machine that we need to keep at 4.19 as the=
 machine otherwise
> becomes unstable.

I have absolute no stability issues.
It's (in my opinion) pcpu-alloc:
kernel 4.x/5.x: pcpu-alloc: [0] 0 1=20
kernel 3.x: pcpu-alloc: [0] 0 2=20

Is it fixable? Or will it stay in state "broken" ?

R=FCdiger
