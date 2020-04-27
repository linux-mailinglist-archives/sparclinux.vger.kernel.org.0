Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7ECD1BA46F
	for <lists+sparclinux@lfdr.de>; Mon, 27 Apr 2020 15:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgD0NSB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 27 Apr 2020 09:18:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2063 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726786AbgD0NSA (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Mon, 27 Apr 2020 09:18:00 -0400
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.54])
        by Forcepoint Email with ESMTP id 523D021BA65E58ECFFC7;
        Mon, 27 Apr 2020 21:17:54 +0800 (CST)
Received: from DGGEML532-MBS.china.huawei.com ([169.254.7.137]) by
 DGGEML402-HUB.china.huawei.com ([fe80::fca6:7568:4ee3:c776%31]) with mapi id
 14.03.0487.000; Mon, 27 Apr 2020 21:17:52 +0800
From:   "weiyongjun (A)" <weiyongjun1@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Jiri Slaby <jslaby@suse.com>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: re: [PATCH -next] sparc64: vcc: Fix error return code in vcc_probe()
Thread-Topic: [PATCH -next] sparc64: vcc: Fix error return code in
 vcc_probe()
Thread-Index: AdYclibIjQBIrwehQse7Q+sCeteTTQ==
Date:   Mon, 27 Apr 2020 13:17:51 +0000
Message-ID: <6AADFAC011213A4C87B956458587ADB419A68C11@dggeml532-mbs.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.166.215.142]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

DQo+IE9uIE1vbiwgQXByIDI3LCAyMDIwIGF0IDEyOjI0OjE1UE0gKzAwMDAsIFdlaSBZb25nanVu
IHdyb3RlOg0KPiA+IEZpeCB0byByZXR1cm4gbmVnYXRpdmUgZXJyb3IgY29kZSAtRU5PTUVNIGZy
b20gdGhlIGVycm9yIGhhbmRsaW5nIGNhc2UNCj4gPiBpbnN0ZWFkIG9mIDAsIGFzIGRvbmUgZWxz
ZXdoZXJlIGluIHRoaXMgZnVuY3Rpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgWW9u
Z2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy90dHkv
dmNjLmMgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBX
aHkgaXMgc3BhcmM2NCBpbiB5b3VyIHN1YmplY3QgbGluZT8NCj4gDQo+IGNvbmZ1c2VkLA0KPiAN
Cg0KSSBnb3QgJ3NwYXJjNjSjunZjYzonIGZyb20gZ2l0IGxvZyAsd2lsbCBjaGFuZ2UgdG8gJ3R0
eTogdmNjJywgdGhhbmtzLg0KDQpSZWdhcmRzDQo=
