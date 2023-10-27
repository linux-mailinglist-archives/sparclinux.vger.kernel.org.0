Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870667D8FE0
	for <lists+sparclinux@lfdr.de>; Fri, 27 Oct 2023 09:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjJ0Hbs (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 27 Oct 2023 03:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbjJ0Hbd (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 27 Oct 2023 03:31:33 -0400
Received: from mail.marketnova.pl (mail.marketnova.pl [51.38.127.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB39D43
        for <sparclinux@vger.kernel.org>; Fri, 27 Oct 2023 00:31:23 -0700 (PDT)
Received: by mail.marketnova.pl (Postfix, from userid 1002)
        id 0011AA739E; Fri, 27 Oct 2023 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marketnova.pl;
        s=mail; t=1698391881;
        bh=q6g+ObtCV61LlnEBi7yLnSiOU+IF64224rZgvBJLEss=;
        h=Date:From:To:Subject:From;
        b=b+YuHzKH9n43As7L9+vBIFLi4lhlq2NBYsl0LRd91kjcci468Culzgw+iCdL1XRj1
         bBDlmkKZKuB1FBQcpn/qnJkePOTNCMIrYa6OLh8jdnoxPtONM1zxLh/1qRPGBhpwC3
         5HUobzp7CAVXZlFquSGoqrFJNgFx6oUwzW3c2mGoIYGeWIOTScOktiIfuT4P2g0q9e
         MatFI2+lNca19vk3sVTOaOW5oUTYKYgnHQ4u/hMGtV8yiUVGnRSCrrvILJwkgcssno
         EoMKvH1fba7OplAT/kJg0knvcRvxNaFGsUET6+LOKuec2N1nb83XM0Ujk3d8b3jZ64
         3JPq+riTtQHLg==
Received: by mail.marketnova.pl for <sparclinux@vger.kernel.org>; Fri, 27 Oct 2023 07:31:02 GMT
Message-ID: <20231027064500-0.1.cx.1i9os.0.ryrsoorx81@marketnova.pl>
Date:   Fri, 27 Oct 2023 07:31:02 GMT
From:   "Wiktor Nurek" <wiktor.nurek@marketnova.pl>
To:     <sparclinux@vger.kernel.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.marketnova.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL,URIBL_BLOCKED,
        URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [51.38.127.96 listed in list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [51.38.127.96 listed in zen.spamhaus.org]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: marketnova.pl]
        *  1.2 URIBL_ABUSE_SURBL Contains an URL listed in the ABUSE SURBL
        *      blocklist
        *      [URIs: marketnova.pl]
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: marketnova.pl]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: marketnova.pl]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Dzie=C5=84 dobry,

chcia=C5=82bym poinformowa=C4=87 Pa=C5=84stwa o mo=C5=BCliwo=C5=9Bci pozy=
skania nowych zlece=C5=84 ze strony www.

Widzimy zainteresowanie potencjalnych Klient=C3=B3w Pa=C5=84stwa firm=C4=85=
, dlatego ch=C4=99tnie pomo=C5=BCemy Pa=C5=84stwu dotrze=C4=87 z ofert=C4=
=85 do wi=C4=99kszego grona odbiorc=C3=B3w poprzez efektywne metody pozyc=
jonowania strony w Google.

Czy m=C3=B3g=C5=82bym liczy=C4=87 na kontakt zwrotny?


Pozdrawiam serdecznie
Wiktor Nurek
