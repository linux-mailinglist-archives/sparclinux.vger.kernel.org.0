Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E39F78A6B8
	for <lists+sparclinux@lfdr.de>; Mon, 28 Aug 2023 09:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjH1HpQ (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 28 Aug 2023 03:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjH1HpP (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 28 Aug 2023 03:45:15 -0400
X-Greylist: delayed 523 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Aug 2023 00:45:08 PDT
Received: from mail.modernconcept.pl (mail.modernconcept.pl [217.61.97.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198A2116
        for <sparclinux@vger.kernel.org>; Mon, 28 Aug 2023 00:45:08 -0700 (PDT)
Received: by mail.modernconcept.pl (Postfix, from userid 1001)
        id 2C76682D85; Mon, 28 Aug 2023 08:36:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=modernconcept.pl;
        s=mail; t=1693208183;
        bh=Q5fV1w6NnWl58WkRdDH2DK4/1rRr2T27V2HfYy4X7Do=;
        h=Date:From:To:Subject:From;
        b=fXZzI7Hapsn5VGFrsQFlam+WFCMsIJGtR44V209UG0A4mrxUCcYeKmzwUJ6EYr6q1
         RUbGYPc6RBJvIcPXn9Y4qzzsdqvWUmYvrih+VnXthxc/hRtxKRMhB/rcRokaPcB3Oo
         EfOhnb7IyM9LnzVIt31Pw3ioEdu9RVNvHI9qQt+OqA5XMjzclLaPLj+ot0U1GTM/3l
         TQVCENsg9r0/9kI6pxxeB0U0JZ/MsfzsN++p2R8a+qDXkfE3Hcw99PiTOp5MLYe7oj
         BXgNnzX0sjZ7RE+2CgtMYAj7d4wHIhzdeY02SKsQg4I3rZi7EP58yQFgJt5GL/phqW
         RBmr5jCADeQjQ==
Received: by mail.modernconcept.pl for <sparclinux@vger.kernel.org>; Mon, 28 Aug 2023 07:36:09 GMT
Message-ID: <20230828074504-0.1.7o.xdwh.0.lk5f6fific@modernconcept.pl>
Date:   Mon, 28 Aug 2023 07:36:09 GMT
From:   "Tomasz Chmiel" <tomasz.chmiel@modernconcept.pl>
To:     <sparclinux@vger.kernel.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.modernconcept.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_CSS_A,URIBL_DBL_SPAM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: modernconcept.pl]
        *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [217.61.97.58 listed in list.dnswl.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [217.61.97.58 listed in zen.spamhaus.org]
        * -0.5 BAYES_05 BODY: Bayes spam probability is 1 to 5%
        *      [score: 0.0338]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: modernconcept.pl]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
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


Pozdrawiam serdecznie,
Tomasz Chmiel
