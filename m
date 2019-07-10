Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34FDA63EA4
	for <lists+sparclinux@lfdr.de>; Wed, 10 Jul 2019 02:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfGJAfD (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 9 Jul 2019 20:35:03 -0400
Received: from mail-eopbgr680115.outbound.protection.outlook.com ([40.107.68.115]:42119
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726444AbfGJAfD (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 9 Jul 2019 20:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DXeYGwDAu8XiBRuIFYeU35G8ERKcDs4TKxSlAcuhhQ=;
 b=XjQCg58DJh5OWvBF27jHXcjJdIs9et5RPAEB96GUpfBPzRiOvqRix5m2vwihDnxYPRuHYwHpSTSgym0Gi69ZOB1lZQf8TekQ7pemn07PYtvKlW87mISqtx/adYE+YrVW0oIo7oqtHdU2emat+85KTeXBzVtefhwY0aGA/TFXvfU=
Received: from SN6PR01MB4094.prod.exchangelabs.com (52.135.119.23) by
 SN6PR01MB3790.prod.exchangelabs.com (52.132.123.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 00:34:19 +0000
Received: from SN6PR01MB4094.prod.exchangelabs.com
 ([fe80::b958:7797:c21b:5725]) by SN6PR01MB4094.prod.exchangelabs.com
 ([fe80::b958:7797:c21b:5725%5]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 00:34:19 +0000
From:   Hoan Tran OS <hoan@os.amperecomputing.com>
To:     Thomas Gleixner <tglx@linutronix.de>
CC:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Oscar Salvador <osalvador@suse.de>,
        Pavel Tatashin <pavel.tatashin@microsoft.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "David S . Miller" <davem@davemloft.net>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Open Source Submission <patches@amperecomputing.com>
Subject: Re: [PATCH 3/5] x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Topic: [PATCH 3/5] x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Index: AQHVK6WX71HRsQts10W3HaW79T6UP6as+COAgBYe74A=
Date:   Wed, 10 Jul 2019 00:34:19 +0000
Message-ID: <1c5bc3a8-0c6f-dce3-95a2-8aec765408a2@os.amperecomputing.com>
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
 <1561501810-25163-4-git-send-email-Hoan@os.amperecomputing.com>
 <alpine.DEB.2.21.1906260032250.32342@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1906260032250.32342@nanos.tec.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:903:77::34) To SN6PR01MB4094.prod.exchangelabs.com
 (2603:10b6:805:a4::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [27.68.67.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb0fe928-c6f4-4bc5-9d58-08d704ce5894
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SN6PR01MB3790;
x-ms-traffictypediagnostic: SN6PR01MB3790:
x-microsoft-antispam-prvs: <SN6PR01MB37900B4D5DBABBA819D47E45F1F00@SN6PR01MB3790.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(189003)(199004)(54534003)(68736007)(66066001)(486006)(2616005)(186003)(6116002)(76176011)(54906003)(31696002)(11346002)(446003)(6246003)(3846002)(316002)(8676002)(107886003)(6916009)(25786009)(478600001)(14454004)(86362001)(6512007)(52116002)(476003)(81156014)(81166006)(66476007)(7736002)(64756008)(66946007)(66556008)(229853002)(256004)(6486002)(386003)(6506007)(26005)(7416002)(66446008)(5660300002)(305945005)(99286004)(53546011)(71200400001)(31686004)(4326008)(53936002)(71190400001)(102836004)(6436002)(2906002)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR01MB3790;H:SN6PR01MB4094.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S5KyvRHNyHX690M0L8U8FPmcFEGo8JmEPvSX3mb2MAyMU4SIUy55UM7YxwWRYqXNW9DlK1BZeqtX15DF7S83MUVw8KM7/Yh5EwxXNAMZIm2aMteWKVBaiAblNLmqY1P+Hkp1/VBaD1dpfJQBUSIKQ9tNVy++Z/b/Eti+XW4HJiYpXWeynUnxFYbihmOwnJB6jMc+yn2lU3Ym5/qoXasQl2FoQqO7bpv7Cu16BR4XTsBO+m7zpf2IPIQYqM8UpuX3YtsLENYIZzML7TZck88G/vihyLzH7dtDC23Gyinj0Rg0I3m+KhkcOI+/UxigbgpXaMK6QgWdr+d0npL58N7rbE975vRD4m8DUElXDHHO2QwdAxt4oceP9lvtViM78BBUKdTsy/SoeH283AO3R8CevORbimUO56jsuo+6fLlJY6k=
Content-Type: text/plain; charset="utf-8"
Content-ID: <856DBE6A98D2C64F9203DA2E92E3CCD6@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0fe928-c6f4-4bc5-9d58-08d704ce5894
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 00:34:19.5061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hoan@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3790
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

SGkgVGhvbWFzLA0KDQpUaGFua3MgZm9yIHlvdSBjb21tZW50cw0KDQpPbiA2LzI1LzE5IDM6NDUg
UE0sIFRob21hcyBHbGVpeG5lciB3cm90ZToNCj4gSG9hbiwNCj4gDQo+IE9uIFR1ZSwgMjUgSnVu
IDIwMTksIEhvYW4gVHJhbiBPUyB3cm90ZToNCj4gDQo+IFBsZWFzZSB1c2UgJ3g4Ni9LY29uZmln
OiAnIGFzIHByZWZpeC4NCj4gDQo+PiBUaGlzIHBhdGNoIHJlbW92ZXMgQ09ORklHX05PREVTX1NQ
QU5fT1RIRVJfTk9ERVMgYXMgaXQncw0KPj4gZW5hYmxlZCBieSBkZWZhdWx0IHdpdGggTlVNQS4N
Cj4gDQo+IFBsZWFzZSBkbyBub3QgdXNlICdUaGlzIHBhdGNoJyBpbiBjaGFuZ2Vsb2dzLiBJdCdz
IHBvaW50bGVzcyBiZWNhdXNlIHdlDQo+IGFscmVhZHkga25vdyB0aGF0IHRoaXMgaXMgYSBwYXRj
aC4NCj4gDQo+IFNlZSBhbHNvIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNo
ZXMucnN0IGFuZCBzZWFyY2ggZm9yICdUaGlzDQo+IHBhdGNoJw0KPiANCj4gU2ltcGx5IHNheToN
Cj4gDQo+ICAgIFJlbW92ZSBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RFUyBhcyBpdCdzIGVu
YWJsZWQgYnkgZGVmYXVsdCB3aXRoDQo+ICAgIE5VTUEuDQo+IA0KDQpHb3QgaXQsIHdpbGwgZml4
DQoNCj4gQnV0IC4uLi4uDQo+IA0KPj4gQEAgLTE1NjcsMTUgKzE1NjcsNiBAQCBjb25maWcgWDg2
XzY0X0FDUElfTlVNQQ0KPj4gICAJLS0taGVscC0tLQ0KPj4gICAJICBFbmFibGUgQUNQSSBTUkFU
IGJhc2VkIG5vZGUgdG9wb2xvZ3kgZGV0ZWN0aW9uLg0KPj4gICANCj4+IC0jIFNvbWUgTlVNQSBu
b2RlcyBoYXZlIG1lbW9yeSByYW5nZXMgdGhhdCBzcGFuDQo+PiAtIyBvdGhlciBub2Rlcy4gIEV2
ZW4gdGhvdWdoIGEgcGZuIGlzIHZhbGlkIGFuZA0KPj4gLSMgYmV0d2VlbiBhIG5vZGUncyBzdGFy
dCBhbmQgZW5kIHBmbnMsIGl0IG1heSBub3QNCj4+IC0jIHJlc2lkZSBvbiB0aGF0IG5vZGUuICBT
ZWUgbWVtbWFwX2luaXRfem9uZSgpDQo+PiAtIyBmb3IgZGV0YWlscy4NCj4+IC1jb25maWcgTk9E
RVNfU1BBTl9PVEhFUl9OT0RFUw0KPj4gLQlkZWZfYm9vbCB5DQo+PiAtCWRlcGVuZHMgb24gWDg2
XzY0X0FDUElfTlVNQQ0KPiANCj4gdGhlIGNoYW5nZWxvZyBkb2VzIG5vdCBtZW50aW9uIHRoYXQg
dGhpcyBsaWZ0cyB0aGUgZGVwZW5kZW5jeSBvbg0KPiBYODZfNjRfQUNQSV9OVU1BIGFuZCB0aGVy
ZWZvcmUgZW5hYmxlcyB0aGF0IGZ1bmN0aW9uYWxpdHkgZm9yIGFueXRoaW5nDQo+IHdoaWNoIGhh
cyBOVU1BIGVuYWJsZWQgaW5jbHVkaW5nIDMyYml0Lg0KPiANCg0KSSB0aGluayB0aGlzIGNvbmZp
ZyBpcyB1c2VkIGZvciBhIE5VTUEgbGF5b3V0IHdoaWNoIE5VTUEgbm9kZXMgYWRkcmVzc2VzIA0K
YXJlIHNwYW5uZWQgdG8gb3RoZXIgbm9kZXMuIEkgdGhpbmsgMzJiaXQgTlVNQSBhbHNvIGhhdmUg
dGhlIHNhbWUgaXNzdWUgDQp3aXRoIHRoYXQgbGF5b3V0LiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJ
J20gd3JvbmcuDQoNCj4gVGhlIGNvcmUgbW0gY2hhbmdlIGdpdmVzIG5vIGhlbHBmdWwgaW5mb3Jt
YXRpb24gZWl0aGVyLiBZb3UganVzdCBjb3BpZWQgdGhlDQo+IGFib3ZlIGNvbW1lbnQgdGV4dCBm
cm9tIHNvbWUgcmFuZG9tIEtjb25maWcuDQoNClllcywgYXMgaXQncyBhIGNvcnJlY3QgY29tbWVu
dCBhbmQgaXMgdXNlZCBhdCBtdWx0aXBsZSBwbGFjZXMuDQoNClRoYW5rcw0KSG9hbg0KDQo+IA0K
PiBUaGlzIG5lZWRzIGEgYml0IG1vcmUgZGF0YSBpbiB0aGUgY2hhbmdlbG9ncyBhbmQgdGhlIGNv
dmVyIGxldHRlcjoNCj4gDQo+ICAgICAgIC0gV2h5IGlzIGl0IHVzZWZ1bCB0byBlbmFibGUgaXQg
dW5jb25kaXRpb25hbGx5DQo+IA0KPiAgICAgICAtIFdoeSBpcyBpdCBzYWZlIHRvIGRvIHNvLCBl
dmVuIGlmIHRoZSBhcmNoaXRlY3R1cmUgaGFkIGNvbnN0cmFpbnRzIG9uDQo+ICAgICAgICAgaXQN
Cj4gDQo+ICAgICAgIC0gV2hhdCdzIHRoZSBwb3RlbnRpYWwgaW1wYWN0DQo+IA0KPiBUaGFua3Ms
DQo+IA0KPiAJdGdseA0KPiANCg==
