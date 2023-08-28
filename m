Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F8D78A82F
	for <lists+sparclinux@lfdr.de>; Mon, 28 Aug 2023 10:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjH1Ivt (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 28 Aug 2023 04:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjH1IvZ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 28 Aug 2023 04:51:25 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62802BF;
        Mon, 28 Aug 2023 01:51:22 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1AD3821B1B;
        Mon, 28 Aug 2023 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693212680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YS8e1L8fy8R+sqnpecFZuJkMlDaGs4krtp7hLbupfhU=;
        b=NGdBZbIVbLoDS1hdYNZ4txHl5sQMhDEj/CIY7pV9LRNv6BJTAER97LTge1U7QpkmXtRq4V
        UsOvu/ZLoAXfLmFiXREoy5pdZlyzQlccCQcDwurzUPp/z1+4Oubxd/CeWbgxyEfdLuRMee
        80JpQbRYFuRhpw1ZtuUnGtHeq0cfoFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693212680;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YS8e1L8fy8R+sqnpecFZuJkMlDaGs4krtp7hLbupfhU=;
        b=yCmaCWLpzpXD1boOA3nxaat3edYySBThLzegU2aJgd5ZcPzQ5lU1+mnAwM+yk18J+Nhj9A
        xQ2GRIyoC2DphqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E855F13A11;
        Mon, 28 Aug 2023 08:51:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id no2tNwdg7GT7fAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 08:51:19 +0000
Message-ID: <b439219a-037a-5641-de9d-adf5eca363ff@suse.de>
Date:   Mon, 28 Aug 2023 10:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 00/11] fbdev/sbus: Initializers for struct fb_ops
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
        dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org,
        davem@davemloft.net
References: <20230806120926.5368-1-tzimmermann@suse.de>
 <20230807171101.GB281773@ravnborg.org>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230807171101.GB281773@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0NZ0NHtVPQWE2ThqtYmgtPGF"
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0NZ0NHtVPQWE2ThqtYmgtPGF
Content-Type: multipart/mixed; boundary="------------UIgAg7MKP0T1ayQXZWd9iPlo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org,
 davem@davemloft.net
Message-ID: <b439219a-037a-5641-de9d-adf5eca363ff@suse.de>
Subject: Re: [PATCH 00/11] fbdev/sbus: Initializers for struct fb_ops
References: <20230806120926.5368-1-tzimmermann@suse.de>
 <20230807171101.GB281773@ravnborg.org>
In-Reply-To: <20230807171101.GB281773@ravnborg.org>

--------------UIgAg7MKP0T1ayQXZWd9iPlo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDA3LjA4LjIzIHVtIDE5OjExIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
Li4uDQo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQoN
CkkgY29tcGxldGVseSBtaXNzZWQgeW91ciByZXZpZXcuIFRoYW5rcyBhIGxvdC4gSSd2ZSBu
b3cgcHVzaGVkIHRoZSANCnBhdGNoZXMgdG8gZHJtLW1pc2MtbmV4dC4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gCVNhbQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55
DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGll
biBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------UIgAg7MKP0T1ayQXZWd9iPlo--

--------------0NZ0NHtVPQWE2ThqtYmgtPGF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTsYAcFAwAAAAAACgkQlh/E3EQov+Bu
Ig//Y4T+G5nfOjVSa9mGMYv222Anwt0XOZxngCo/HW9T9OdO0Xua/RfzsoTK8zmKaSaCDMPfEeGy
IhGA+FZ0SOZ00JQkWRpWFRiwDVKeAGERwEx5fedthnkk7xG81eGiAzupVumZTjA/s6CAmnZ4yrzJ
+8muTcRM4c/BsxhCqz+/+NzYP5BcGEL9Pv9N+UvipP1V9MSKO75qSTCbR22wA3dT2N1c65mkT86w
tkJDtKl/MErB8d3iqTQnoP+xH9yBM/zvFNWtoDBYflyjiekZt6qiFuTb4Mw0/OdxcxMrZpsKGSkV
DOJn+NjbgEGDCn9dRPiigU6ZMWyV9j2qMz2wSoN4jG3EWw2i/kCN8s1xQLeDYJR8u89o4ms8Si2p
GO/mLERAF5eqiEk+ixVHjANbDdw+063iaHRO2Lh3DUL1AUx59F6oi08FNXxoo6VnVRBNXEpEKydU
75+Qvwad4RaJn27Cwl+UHY06bBiTDPYZJCfGsQkI4BWUhXNM7kt7+le9F519pJPdpot9hEPAUVfh
pv73GUupfgKU03PRUXmtDnuHHLgoMtd6xI8t4ML3Q/fEt5cp9ENLhEfOq7sqsByxo7lNokeREfCC
6pDYWqXlSzVbl0mTTb95BsOGz6AV1oDz85mUE6UBn7M21xFtS4D+uu98nfYfbtJvvNZBlqbDZ6a8
Qgs=
=xy4u
-----END PGP SIGNATURE-----

--------------0NZ0NHtVPQWE2ThqtYmgtPGF--
