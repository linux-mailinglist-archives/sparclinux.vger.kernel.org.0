Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 806A055B22
	for <lists+sparclinux@lfdr.de>; Wed, 26 Jun 2019 00:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfFYWaf (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 25 Jun 2019 18:30:35 -0400
Received: from mail-eopbgr720121.outbound.protection.outlook.com ([40.107.72.121]:59505
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726649AbfFYWae (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Tue, 25 Jun 2019 18:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector2-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt+HabkNi3oBlcwR9P0Dy5I9Fh4hEa8N26FlS1Wo8xA=;
 b=tl5kLG+F/ZxeUncNApafR3A3hnieZCjtVi/r2CtMDWWD6Intf7mN7xpK1IbFnNVtPJKWLeD4x/s2qX1judL+pAK12YEoaZhKjyK5LvIs7ykvDRNNYWDHAzE3LcE+b82OaA2mameLRqNPDkPcPSGyexhDrpGK9x5b6ER51el9iDk=
Received: from DM6PR01MB4090.prod.exchangelabs.com (20.176.104.151) by
 DM6PR01MB5308.prod.exchangelabs.com (20.177.220.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 22:30:32 +0000
Received: from DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::f0f2:16e1:1db7:ccb3]) by DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::f0f2:16e1:1db7:ccb3%7]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 22:30:32 +0000
From:   Hoan Tran OS <hoan@os.amperecomputing.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
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
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "David S . Miller" <davem@davemloft.net>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
CC:     "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Open Source Submission <patches@amperecomputing.com>,
        Hoan Tran OS <hoan@os.amperecomputing.com>
Subject: [PATCH 4/5] sparc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Topic: [PATCH 4/5] sparc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Index: AQHVK6WZI7UguJlWOkuVRwnfzmC1hg==
Date:   Tue, 25 Jun 2019 22:30:31 +0000
Message-ID: <1561501810-25163-5-git-send-email-Hoan@os.amperecomputing.com>
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
In-Reply-To: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR22CA0052.namprd22.prod.outlook.com
 (2603:10b6:903:ae::14) To DM6PR01MB4090.prod.exchangelabs.com
 (2603:10b6:5:2a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [4.28.12.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaa15bc7-af34-4434-1e22-08d6f9bcbb9a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM6PR01MB5308;
x-ms-traffictypediagnostic: DM6PR01MB5308:
x-microsoft-antispam-prvs: <DM6PR01MB53087B96404675BB68A3EAC6F1E30@DM6PR01MB5308.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(376002)(366004)(136003)(39840400004)(346002)(396003)(199004)(189003)(256004)(4326008)(53936002)(14454004)(4744005)(7736002)(52116002)(107886003)(50226002)(6486002)(81156014)(81166006)(64756008)(8936002)(66446008)(8676002)(6436002)(110136005)(26005)(5660300002)(99286004)(66946007)(73956011)(6506007)(76176011)(186003)(386003)(102836004)(66066001)(2906002)(446003)(305945005)(54906003)(2616005)(66556008)(66476007)(11346002)(316002)(476003)(6512007)(1511001)(478600001)(71190400001)(3846002)(71200400001)(7416002)(6116002)(86362001)(25786009)(68736007)(486006)(921003)(1121003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR01MB5308;H:DM6PR01MB4090.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xVN5X6GfoXI1AkvvztOtBh7q6qU8oXqwX6wXsFD1IQbj8Xwy1xEjVA4M3plf5iY3DguDYrwKS4Xcq79OZqyY9jJgMYAYDHziu82KSrPfw3Ey9B6F/Fghb8h8JPug+UTQyA+w+OnQj2SywtieJemv/ysVNDXTV6nggE/hZjCB8SWlInzpPjcwOQwTUbYnNmf6+bBUxZW5/fpvJzMDrE4przHy+UoJKKynh47q+imiV3KtL8YSm7ejcQgcTW4aIS7yOtZYEO/T97VLVi6Yy8LWBD9OiuEzpA7EM8SPy5unRNy+ARI0SuvxExAHJxjHiLhYMjZ7VDaOokWPgcqBc2UBceqNlx1Nc1xJRFlCtdyXQTuELtoRV4h0bpiRqN2J/6K9+tsoDLPlRIWpHQiuqByrZFV7DwHUMddAvXB7PMcw8y4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa15bc7-af34-4434-1e22-08d6f9bcbb9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 22:30:31.9689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hoan@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5308
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

VGhpcyBwYXRjaCByZW1vdmVzIENPTkZJR19OT0RFU19TUEFOX09USEVSX05PREVTIGFzIGl0J3MN
CmVuYWJsZWQgYnkgZGVmYXVsdCB3aXRoIE5VTUEuDQoNClNpZ25lZC1vZmYtYnk6IEhvYW4gVHJh
biA8SG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KLS0tDQogYXJjaC9zcGFyYy9LY29uZmln
IHwgOSAtLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2FyY2gvc3BhcmMvS2NvbmZpZyBiL2FyY2gvc3BhcmMvS2NvbmZpZw0KaW5kZXggMjZh
YjZmNS4uMTM0NDllYSAxMDA2NDQNCi0tLSBhL2FyY2gvc3BhcmMvS2NvbmZpZw0KKysrIGIvYXJj
aC9zcGFyYy9LY29uZmlnDQpAQCAtMjkxLDE1ICsyOTEsNiBAQCBjb25maWcgTk9ERVNfU0hJRlQN
CiAJICBTcGVjaWZ5IHRoZSBtYXhpbXVtIG51bWJlciBvZiBOVU1BIE5vZGVzIGF2YWlsYWJsZSBv
biB0aGUgdGFyZ2V0DQogCSAgc3lzdGVtLiAgSW5jcmVhc2VzIG1lbW9yeSByZXNlcnZlZCB0byBh
Y2NvbW1vZGF0ZSB2YXJpb3VzIHRhYmxlcy4NCiANCi0jIFNvbWUgTlVNQSBub2RlcyBoYXZlIG1l
bW9yeSByYW5nZXMgdGhhdCBzcGFuDQotIyBvdGhlciBub2Rlcy4gIEV2ZW4gdGhvdWdoIGEgcGZu
IGlzIHZhbGlkIGFuZA0KLSMgYmV0d2VlbiBhIG5vZGUncyBzdGFydCBhbmQgZW5kIHBmbnMsIGl0
IG1heSBub3QNCi0jIHJlc2lkZSBvbiB0aGF0IG5vZGUuICBTZWUgbWVtbWFwX2luaXRfem9uZSgp
DQotIyBmb3IgZGV0YWlscy4NCi1jb25maWcgTk9ERVNfU1BBTl9PVEhFUl9OT0RFUw0KLQlkZWZf
Ym9vbCB5DQotCWRlcGVuZHMgb24gTkVFRF9NVUxUSVBMRV9OT0RFUw0KLQ0KIGNvbmZpZyBBUkNI
X1NFTEVDVF9NRU1PUllfTU9ERUwNCiAJZGVmX2Jvb2wgeSBpZiBTUEFSQzY0DQogDQotLSANCjIu
Ny40DQoNCg==
