Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA1B43B27D
	for <lists+sparclinux@lfdr.de>; Tue, 26 Oct 2021 14:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236006AbhJZMeh (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 26 Oct 2021 08:34:37 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:53496 "EHLO
        mail.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhJZMeh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 26 Oct 2021 08:34:37 -0400
Received: from localhost (unknown [149.11.102.75])
        by mail.monkeyblade.net (Postfix) with ESMTPSA id B07194F61C55A;
        Tue, 26 Oct 2021 05:32:11 -0700 (PDT)
Date:   Tue, 26 Oct 2021 13:32:04 +0100 (BST)
Message-Id: <20211026.133204.846263172227760543.davem@davemloft.net>
To:     geert@linux-m68k.org
Cc:     gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@arndb.de,
        sparclinux@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: sunzilog: Mark sunzilog_putchar()
 __maybe_unused
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20211026080426.2444756-1-geert@linux-m68k.org>
References: <20211026080426.2444756-1-geert@linux-m68k.org>
X-Mailer: Mew version 6.8 on Emacs 27.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Tue, 26 Oct 2021 05:32:13 -0700 (PDT)
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCkRhdGU6IFR1
ZSwgMjYgT2N0IDIwMjEgMTA6MDQ6MjYgKzAyMDANCg0KPiBJZiBDT05TT0xFX1BPTEw9biwgQ09O
RklHX1NFUklBTF9TVU5aSUxPR19DT05TT0xFPW4sIGFuZCBDT05GSUdfU0VSSU89bToNCj4gDQo+
ICAgICBkcml2ZXJzL3R0eS9zZXJpYWwvc3Vuemlsb2cuYzoxMTI4OjEzOiBlcnJvcjogoXN1bnpp
bG9nX3B1dGNoYXKiIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1mdW5jdGlv
bl0NCj4gICAgICAxMTI4IHwgc3RhdGljIHZvaWQgc3Vuemlsb2dfcHV0Y2hhcihzdHJ1Y3QgdWFy
dF9wb3J0ICpwb3J0LCBpbnQgY2gpDQo+IAkgIHwgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fg0KPiANCj4gRml4IHRoaXMgYnkgbWFya2luZyBzdW56aWxvZ19wdXRjaGFyKCkgX19tYXliZV91
bnVzZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPg0KDQpBY2tlZC1ieTogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxv
ZnQubmV0Pg0K
