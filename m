Return-Path: <sparclinux+bounces-306-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5467985062B
	for <lists+sparclinux@lfdr.de>; Sat, 10 Feb 2024 20:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6778282F7F
	for <lists+sparclinux@lfdr.de>; Sat, 10 Feb 2024 19:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABE85F564;
	Sat, 10 Feb 2024 19:56:40 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D760364BA
	for <sparclinux@vger.kernel.org>; Sat, 10 Feb 2024 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707595000; cv=none; b=XvppV/gY8TYOqJsBbL8yZ6IxXwosDs91rWaJ0UDK9u1RDNnrgRemYFaELhsAr9a5Oli9ErbQXZJC4xjTebKNOschef/kVuV58tqMXyKaWfDVvH+pXEejtwyzFkMiU6qMyt0UJW1TS9gXmIDcLv0y0enxcR0Kn+Rdj3K1/NIV0rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707595000; c=relaxed/simple;
	bh=dFVzg9ssNDhGRIKi+18ADbVxlvwgvFDe934WXO22+ok=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=rKApwn+mHON1NuyzTElSwBw1i4xxnqSiLXcGChdQz8C422+N0smC5c0TMX/+uhfOEpHvvg2CpiP2rP7ikp1C0IspkFmTxaFbdbIBWhMx4N3VTiohLAhYuG096GV6o3j2WStnAevZHxg9quVeUcDemqRObdhqy058+jEfT1dMgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1rYtSd-00000001dnw-1Faf; Sat, 10 Feb 2024 20:56:27 +0100
Received: from dynamic-089-014-076-031.89.14.pool.telefonica.de ([89.14.76.31] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1rYtSd-00000003DPL-0Ga2; Sat, 10 Feb 2024 20:56:27 +0100
Message-ID: <fe5cc47167430007560501aabb28ba154985b661.camel@physik.fu-berlin.de>
Subject: Reproducer for the posix_spawn() bug on sparc64
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: sparclinux <sparclinux@vger.kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>, Geert Uytterhoeven
	 <geert@linux-m68k.org>, "David S. Miller" <davem@davemloft.net>, Sam James
	 <sam@gentoo.org>, Adhemerval Zanella Netto <zatrazz@gmail.com>, jrtc27
	 <jrtc27@debian.org>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Date: Sat, 10 Feb 2024 20:56:26 +0100
Autocrypt: addr=glaubitz@physik.fu-berlin.de; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/mixed; boundary="=-yv9Jiuz19uUbEMtZ6IDP"
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PAO

--=-yv9Jiuz19uUbEMtZ6IDP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

due to a recent change in libiberty which enabled the use of posix_spawn() =
[1],
we've seen gcc build failures on sparc64 due to a potential bug in kernel s=
uch
as [2].

After a lot of debugging, Michael Karcher (CC'ed) has managed to write a re=
producer
which I am attaching to this mail. The reproducer contains a top comment wh=
ich explains
the bug and which should hopefully help kernel developers to fix the proble=
m.

Thanks,
Adrian

> [1] https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D879cf9ff45d94065d=
89e24b71c6b27c7076ac518
> [2] https://builder.sourceware.org/buildbot/#/builders/238/builds/1161

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

--=-yv9Jiuz19uUbEMtZ6IDP
Content-Disposition: attachment; filename="attack_on_the_clone.c"
Content-Type: text/x-csrc; name="attack_on_the_clone.c"; charset="UTF-8"
Content-Transfer-Encoding: base64

Ly8gU1BBUkM2NCBjbG9uZSBwcm9ibGVtIGRlbW9uc3RyYXRpb24KLy8KLy8gdGhlIHNwYXJjNjQg
TGludXgga2VybmVsIGZhaWxzIHRvIGV4ZWN1dGUgY2xvbmUgaWYgJXNwIHBvaW50cyBpbnRvIHVu
Y29tbWl0dGVkIG1lbW9yeSAoZS5nLiBkdWUgdG8gbGF6eQovLyBzdGFjayBjb21taXR0aW5nKS4g
VGhpcyBwcm9ncmFtIHVzZXMgYSB2YXJpYWJsZSBsZW5ndGggYXJyYXkgb24gdGhlIHN0YWNrIHRv
IHBvc2l0aW9uIHRoZSBzdGFjayBwb2ludGVyIHdoZW4KLy8gaW52b2tpbmcgdGhlIGxpYnJhcnkg
ZnVuY3Rpb24gY2xvbmUganVzdCBhdCBhIHBhZ2UgYm91bmRhcnkuIFRoZSBsaWJyYXJ5IGZ1bmN0
aW9uIGNsb25lIGFsbG9jYXRlcyBhIHN0YWNrIGZyYW1lCi8vIHRoYXQgaXMgY29tcGxldGVseSBp
biB1bmNvbW1pdHRlZCBtZW1vcnkgYmVmb3JlIGVudGVyaW5nIHRoZSBrZXJuZWwgY2FsbCBjbG9u
ZS4KCi8vIHRvIHByb2JlIGZvciB0aGUgY29ycmVjdCBzaXplIG9mIHRoZSBWTEEsIGEgdGVzdCBm
dW5jdGlvbiBpcyBjYWxsZWQgZmlyc3QuIFRoaXMgZnVuY3Rpb24gcmVjb3JkcyB0aGUgJWZwIHZh
bHVlIGl0Ci8vIHJlY2VpdmVzICh3aGljaCB3aWxsIGJlIHRoZSAlZnAgdmFsdWUgaW4gdGhlIGxp
YnJhcnkgZnVuY3Rpb24gY2xvbmUsIHRvbywgaWYgdGhlIFZMQSBzaXplIGlzIGVxdWFsKQoKLy8g
KGMpIE1pY2hhZWwgS2FyY2hlciAoa2VybmVsQG1rYXJjaGVyLmRpYWx1cC5mdS1iZXJsaW4uZGUp
ICwgMjAyNCwgR1BMdjIgb3IgbGF0ZXIKCiNkZWZpbmUgX0dOVV9TT1VSQ0UKCiNpbmNsdWRlIDxz
eXMvbW1hbi5oPgojaW5jbHVkZSA8c3lzL3dhaXQuaD4KI2luY2x1ZGUgPHNjaGVkLmg+CiNpbmNs
dWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdGRpbnQuaD4KCiNk
ZWZpbmUgU1BBUkM2NF9TVEFDS19CSUFTIDB4N0ZGCgp0eXBlZGVmIGludCBmbl90KHZvaWQqKTsK
dHlwZWRlZiBwaWRfdCBjbG9uZV90KGZuX3QqIGVudHJ5LCB2b2lkKiBzdGFjaywgaW50IGZsYWdz
LCB2b2lkKiBhcmcsIC4uLik7CgoKLy8gdmVyeSBzaW1wbGUgZnVuY3Rpb24gaW52b2tlZCB1c2lu
ZyBjbG9uZQppbnQgbm9wKHZvaWQqKQp7CglyZXR1cm4gMDsKfQoKCi8vIGNsb25lIHN1YnN0aXR1
dGUgdGhhdCByZWNvcmRzICVmcAp1aW50NjRfdCBjYWxsX2Nsb25lX3NwOwoKcGlkX3QgZHVtbXlf
Y2xvbmUoZm5fdCogZW50cnksIHZvaWQqIHN0YWNrLCBpbnQgZmxhZ3MsIHZvaWQqIGFyZywgLi4u
KQp7CglyZWdpc3RlciB1aW50NjRfdCBmcmFtZXB0ciBhc20oImZwIik7CgljYWxsX2Nsb25lX3Nw
ID0gZnJhbWVwdHIgKyBTUEFSQzY0X1NUQUNLX0JJQVM7ICAvLyBzcCBpbiBjYWxsX2Nsb25lIGlz
IGZwIGluIGR1bW15X2Nsb25lIC8gY2xvbmUKCXJldHVybiAtMTsKfQoKCi8vIGZ1bmN0aW9uIHRv
IGludm9rZSBjbG9uZSB3aXRoIChpbSlwcm9wZXJseSBhbGlnbmVkIHN0YWNrCnZvaWQqIGNoaWxk
X3N0YWNrOwoKaW50IGNhbGxfY2xvbmUoaW50IHdhc3RlX3F3b3JkcywgY2xvbmVfdCogY2xvbmVm
bikKewoJdm9pZCogdm9sYXRpbGUgd2FzdGVbd2FzdGVfcXdvcmRzKzJdOyAgLy8gdm9sYXRpbGUg
dG8gbm90IG9wdGltaXplIHRoZSBhcnJheSBhd2F5Cgl3YXN0ZVt3YXN0ZV9xd29yZHMrMV0gPSBO
VUxMOwoKCXBpZF90IGNoaWxkX3BpZCA9IGNsb25lZm4obm9wLAoJCSAgICAgICBjaGlsZF9zdGFj
aywKCQkgICAgICAgQ0xPTkVfVk0gfCBTSUdDSExELAoJCSAgICAgICAwKTsKCWlmIChjaGlsZF9w
aWQgPiAwKQoJewoJCXBpZF90IHdhaXRyZXN1bHQgPSB3YWl0cGlkKGNoaWxkX3BpZCwgTlVMTCwg
MCk7CgkJLy8gYmVmb3JlIGZvcmstYm9tYmluZyBhbnl0aGluZyBpZiB0aGlzIGRvZXNuJ3QgZ28g
dG8gcGxhbiwgZXhpdAoJCWlmICh3YWl0cmVzdWx0ICE9IGNoaWxkX3BpZCkgYWJvcnQoKTsKCQly
ZXR1cm4gMDsKCX0KCWVsc2UKCXsKCQlyZXR1cm4gLTE7Cgl9Cn0KCmludCBtYWluKHZvaWQpCnsK
CWludCB3YXN0ZWFtb3VudDsKCWNoaWxkX3N0YWNrID0gbW1hcChOVUxMLCAxNjM4NCwgUFJPVF9S
RUFEIHwgUFJPVF9XUklURSwgTUFQX0FOT04gfCBNQVBfUFJJVkFURSwgLTEsIDApOwoJY2FsbF9j
bG9uZSgwLCBkdW1teV9jbG9uZSk7CglwcmludGYoImVmZmVjdGl2ZSBGUCBpbiBjbG9uZSgpIHdp
dGggd2FzdGUgMCA9ICVsbHhcbiIsIGNhbGxfY2xvbmVfc3ApOwoJd2FzdGVhbW91bnQgPSAxMDI0
ICsgKGNhbGxfY2xvbmVfc3AgJiAweEZGRikgLyA4OwoJcHJpbnRmKCJ0aGlzIGlzICVkIDY0LWJp
dCB3b3JkcyBhYm92ZSB0aGUgcGFnZSBib3VuZGFyeSBhdCBsZWFzdCA4SyBhd2F5XG4iLCB3YXN0
ZWFtb3VudCk7CgljaGlsZF9zdGFjayA9ICh2b2lkKikoKGNoYXIqKWNoaWxkX3N0YWNrICsgMTYw
MDApOwoJY2xvbmUoTlVMTCwgTlVMTCwgMCwgMCk7IC8vIGZhaWxzLCBidXQgcmVzb2x2ZXMgImNs
b25lIgoJLy8gZmFpbGVzIGZvciB3YXN0ZWFtb3VudC0yMiB0byB3YXN0ZWFtb3VudCsyMiAob25s
eSBldmVuIHZhbHVlcyB0ZXN0ZWQpCglpZiAoY2FsbF9jbG9uZSh3YXN0ZWFtb3VudCwgY2xvbmUp
IDwgMCkKCXsKCQlwZXJyb3IoImNsb25lIik7Cgl9CgllbHNlCgl7CgkJcHV0cygiQ29uZ3JhdHVs
YXRpb25zLCBjbG9uZSBzdWNjZWVkZWRcbiIpOwoJfQp9Cgo=


--=-yv9Jiuz19uUbEMtZ6IDP--

