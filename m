Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A1B2A269C
	for <lists+sparclinux@lfdr.de>; Mon,  2 Nov 2020 10:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgKBJID convert rfc822-to-8bit (ORCPT
        <rfc822;lists+sparclinux@lfdr.de>); Mon, 2 Nov 2020 04:08:03 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:58951 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728290AbgKBJID (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 2 Nov 2020 04:08:03 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-2-3gt7SuvxPWOqa-ZpIA1B2g-1;
 Mon, 02 Nov 2020 09:06:39 +0000
X-MC-Unique: 3gt7SuvxPWOqa-ZpIA1B2g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 2 Nov 2020 09:06:38 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 2 Nov 2020 09:06:38 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Greg KH' <gregkh@linuxfoundation.org>
CC:     'David Hildenbrand' <david@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Christoph Hellwig <hch@lst.de>,
        "kernel-team@android.com" <kernel-team@android.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-aio@kvack.org" <linux-aio@kvack.org>,
        "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>
Subject: RE: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Thread-Topic: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Thread-Index: AQHWqE5GNDfnH4y9nkGWtfqJueR1KKmjTCJQgAAN4UiAAAD2IIAASOeCgAF+12CAAB+UKYAAAQNg///yIQCAD2i/YA==
Date:   Mon, 2 Nov 2020 09:06:38 +0000
Message-ID: <0ab5ac71f28d459db2f350c2e07b88ca@AcuMS.aculab.com>
References: <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022104805.GA1503673@kroah.com> <20201022121849.GA1664412@kroah.com>
 <98d9df88-b7ef-fdfb-7d90-2fa7a9d7bab5@redhat.com>
 <20201022125759.GA1685526@kroah.com> <20201022135036.GA1787470@kroah.com>
 <134f162d711d466ebbd88906fae35b33@AcuMS.aculab.com>
 <935f7168-c2f5-dd14-7124-412b284693a2@redhat.com>
 <999e2926-9a75-72fd-007a-1de0af341292@redhat.com>
 <35d0ec90ef4f4a35a75b9df7d791f719@AcuMS.aculab.com>
 <20201023144718.GA2525489@kroah.com>
In-Reply-To: <20201023144718.GA2525489@kroah.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: 'Greg KH'
> Sent: 23 October 2020 15:47
> 
> On Fri, Oct 23, 2020 at 02:39:24PM +0000, David Laight wrote:
> > From: David Hildenbrand
> > > Sent: 23 October 2020 15:33
> > ...
> > > I just checked against upstream code generated by clang 10 and it
> > > properly discards the upper 32bit via a mov w23 w2.
> > >
> > > So at least clang 10 indeed properly assumes we could have garbage and
> > > masks it off.
> > >
> > > Maybe the issue is somewhere else, unrelated to nr_pages ... or clang 11
> > > behaves differently.
> >
> > We'll need the disassembly from a failing kernel image.
> > It isn't that big to hand annotate.
> 
> I've worked around the merge at the moment in the android tree, but it
> is still quite reproducable, and will try to get a .o file to
> disassemble on Monday or so...

Did this get properly resolved?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

