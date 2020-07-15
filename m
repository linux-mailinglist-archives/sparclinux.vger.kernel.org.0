Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B88220FA5
	for <lists+sparclinux@lfdr.de>; Wed, 15 Jul 2020 16:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbgGOOig (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 15 Jul 2020 10:38:36 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:33067 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729332AbgGOOie (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Wed, 15 Jul 2020 10:38:34 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-77-9crfze-iNZqlCsLzYG0IKA-1; Wed, 15 Jul 2020 15:38:30 +0100
X-MC-Unique: 9crfze-iNZqlCsLzYG0IKA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 15 Jul 2020 15:38:29 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Wed, 15 Jul 2020 15:38:29 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Oliver O'Halloran' <oohall@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
CC:     Bjorn Helgaas <helgaas@kernel.org>,
        Keith Busch <kbusch@kernel.org>,
        "Paul Mackerras" <paulus@samba.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "Toan Le" <toan@os.amperecomputing.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        "Marek Vasut" <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh@kernel.org>,
        "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Russell King <linux@armlinux.org.uk>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ray Jui <rjui@broadcom.com>, Jens Axboe <axboe@fb.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "bjorn@helgaas.com" <bjorn@helgaas.com>,
        "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
        Richard Henderson <rth@twiddle.net>,
        Juergen Gross <jgross@suse.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        Scott Branden <sbranden@broadcom.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: RE: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Topic: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Index: AQHWWl8Tn5bD1WsSsUK40p+tBVrtaakIsp9A
Date:   Wed, 15 Jul 2020 14:38:29 +0000
Message-ID: <1e2ae69a55f542faa18988a49e9b9491@AcuMS.aculab.com>
References: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
 <20200714184550.GA397277@bjorn-Precision-5520>
 <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
 <CAOSf1CEviMYySQhyQGks8hHjST-85wGpxEBasuxwSX_homBJ2A@mail.gmail.com>
In-Reply-To: <CAOSf1CEviMYySQhyQGks8hHjST-85wGpxEBasuxwSX_homBJ2A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

RnJvbTogT2xpdmVyIE8nSGFsbG9yYW4NCj4gU2VudDogMTUgSnVseSAyMDIwIDA1OjE5DQo+IA0K
PiBPbiBXZWQsIEp1bCAxNSwgMjAyMCBhdCA4OjAzIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOg0KLi4uDQo+ID4gLSBjb25maWcgc3BhY2UgYWNjZXNzZXMgYXJlIHZlcnkg
cmFyZSBjb21wYXJlZCB0byBtZW1vcnkNCj4gPiAgIHNwYWNlIGFjY2VzcyBhbmQgb24gdGhlIGhh
cmR3YXJlIHNpZGUgdGhlIGVycm9yIGhhbmRsaW5nDQo+ID4gICB3b3VsZCBiZSBzaW1pbGFyLCBi
dXQgcmVhZGwvd3JpdGVsIGRvbid0IHJldHVybiBlcnJvcnMsIHRoZXkganVzdA0KPiA+ICAgYWNj
ZXNzIHdyb25nIHJlZ2lzdGVycyBvciByZXR1cm4gMHhmZmZmZmZmZi4NCj4gPiAgIGFyY2gvcG93
ZXJwYy9rZXJuZWwvZWVoLmMgaGFzIGEgdG9uIGV4dHJhIGNvZGUgd3JpdHRlbiB0bw0KPiA+ICAg
ZGVhbCB3aXRoIGl0LCBidXQgbm8gb3RoZXIgYXJjaGl0ZWN0dXJlcyBkby4NCj4gDQo+IFRCSCB0
aGUgRUVIIE1NSU8gaG9va3Mgd2VyZSBwcm9iYWJseSBhIG1pc3Rha2UgdG8gYmVnaW4gd2l0aC4g
RXJyb3JzDQo+IGRldGVjdGVkIHZpYSBNTUlPIGFyZSBhbG1vc3QgYWx3YXlzIGFzeW5jaHJvbm91
cyB0byB0aGUgZXJyb3IgaXRzZWxmDQo+IHNvIHlvdSB1c3VhbGx5IGp1c3Qgd2luZCB1cCB3aXRo
IGEgbWlzbGVhZGluZyBzdGFjayB0cmFjZSByYXRoZXIgdGhhbg0KPiBhbnkga2luZCBvZiB1c2Vm
dWwgc3luY2hyb25vdXMgZXJyb3IgcmVwb3J0aW5nLiBJdCBzZWVtcyBsaWtlIG1vc3QNCj4gZHJp
dmVycyBkb24ndCBib3RoZXIgY2hlY2tpbmcgZm9yIDB4RkZzIGVpdGhlciBhbmQgcmVseSBvbiB0
aGUNCj4gYXN5bmNocm9ub3VzIHJlcG9ydGluZyB2aWEgLmVycm9yX2RldGVjdGVkKCkgaW5zdGVh
ZCwgc28gSSBoYXZlIHRvDQo+IHdvbmRlciB3aGF0IHRoZSBwb2ludCBpcy4gSSd2ZSBiZWVuIHRo
aW5raW5nIG9mIHJlbW92aW5nIHRoZSBNTUlPDQo+IGhvb2tzIGFuZCB1c2luZyBhIGJhY2tncm91
bmQgcG9sbGVyIHRvIGNoZWNrIGZvciBlcnJvcnMgb24gZWFjaCBQSEINCj4gcGVyaW9kaWNhbGx5
IChhc3N1bWluZyB3ZSBkb24ndCBoYXZlIGFuIEVFSCBpbnRlcnJ1cHQpIGluc3RlYWQuIFRoYXQN
Cj4gd291bGQgcmVtb3ZlIHRoZSByZXF1aXJlbWVudCBmb3IgZWVoX2Rldl9jaGVja19mYWlsdXJl
KCkgdG8gYmUNCj4gaW50ZXJydXB0IHNhZmUgdG9vLCBzbyBpdCBtaWdodCBldmVuIGxldCB1cyBm
aXggYWxsIHRoZSBnb2Rhd2Z1bCByYWNlcw0KPiBpbiBFRUguDQoNCkkndmUgJ3BsYXllZCcgd2l0
aCBQQ0llIGVycm9yIGhhbmRsaW5nIC0gd2l0aG91dCBtdWNoIHN1Y2Nlc3MuDQpXaGF0IG1pZ2h0
IGJlIHVzZWZ1bCBpcyBmb3IgYSBkcml2ZXIgdGhhdCBoYXMganVzdCByZWFkIH4wdSB0bw0KYmUg
YWJsZSB0byBhc2sgJ2hhcyB0aGVyZSBiZWVuIGFuIGVycm9yIHNpZ25hbGxlZCBmb3IgdGhpcyBk
ZXZpY2U/Jy4NCg0KSSBnb3QgYW4gZXJyb3IgZ2VuZXJhdGVkIGJ5IGRvaW5nIGFuIE1NSU8gYWNj
ZXNzIHRoYXQgd2FzIGluc2lkZQ0KdGhlIGFkZHJlc3MgcmFuZ2UgZm9yd2FyZGVkIHRvIHRoZSBz
bGF2ZSwgYnV0IG91dHNpZGUgYW55IG9mIGl0cyBCQVJzLg0KKFR3byBCQVJzIG9mIGRpZmZlcmVu
dCBzaXplcyBsZWF2ZXMgYSBuaWNlIGdhcC4pDQpUaGlzIGdvdCByZXBvcnRlZCB1cCB0byB0aGUg
YnJpZGdlIG5lYXJlc3QgdGhlIHNsYXZlICh3aGljaCBzdXBwb3J0ZWQNCmVycm9yIGhhbmRsaW5n
KSwgYnV0IG5vdCB0byB0aGUgcm9vdCBicmlkZ2UgKHdoaWNoIEkgZG9uJ3QgdGhpbmsgZG9lcyku
DQpJU1RSIGEgbWVzc2FnZSBhYm91dCBFRUggYmVpbmcgaGFuZGxlZCBieSB0aGUgaGFyZHdhcmUg
KHRoZSBtYWNoaW5lDQppcyB1cCBidXQgZG1lc2cgaXMgZnVsbCBvZiBtZXNzYWdlcyBmcm9tIGEg
Ym91bmNpbmcgVVNCIG1vdXNlKS4NCg0KV2l0aCBzdWNoIHBhcnRpYWwgZXJyb3IgcmVwb3J0aW5n
IHVzZWZ1bCBpbmZvIGNhbiBzdGlsbCBiZSBleHRyYWN0ZWQuDQoNCk9mIGNvdXJzZSwgd2hhdCBh
Y3R1YWxseSBoYXBwZW5zIG9uIGEgUENJZSBlcnJvciBpcyB0aGF0IHRoZSBzaWduYWwNCmdldHMg
cm91dGVkIHRvIHNvbWUgJ2JvYXJkIHN1cHBvcnQgbG9naWMnIGFuZCB0aGVuIHBhc3NlZCBiYWNr
IGludG8NCnRoZSBrZXJuZWwgYXMgYW4gTk1JIC0gd2hpY2ggdGhlbiBjcmFzaGVzIHRoZSBrZXJu
ZWwhDQpUaGlzIGV2ZW4gaGFwcGVucyB3aGVuIHRoZSBQQ0llIGxpbmsgZ29lcyBkb3duIGFmdGVy
IHdlJ3ZlIGRvbmUgYQ0Kc29mdC1yZW1vdmUgb2YgdGhlIGRldmljZSBpdHNlbGYhDQpSYXRoZXIg
bWFrZXMgdXBkYXRpbmcgdGhlIGJvYXJkJ3MgRlBHQSB3aXRob3V0IGEgcmVib290IHRyaWNreS4N
Cg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2Fk
LCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5v
OiAxMzk3Mzg2IChXYWxlcykNCg==

