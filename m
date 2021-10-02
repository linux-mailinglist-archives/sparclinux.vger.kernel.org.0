Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BB441FD99
	for <lists+sparclinux@lfdr.de>; Sat,  2 Oct 2021 20:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbhJBSNp (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 2 Oct 2021 14:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbhJBSNp (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 2 Oct 2021 14:13:45 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15553C0613EC
        for <sparclinux@vger.kernel.org>; Sat,  2 Oct 2021 11:11:59 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id q6so14019045ilm.3
        for <sparclinux@vger.kernel.org>; Sat, 02 Oct 2021 11:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=JZHs0KH6lll4oBX6dW2XRwDAMF/tzdKCEdfc4BlccL8=;
        b=cwdk+XiMLIsJs/xrrNu1v3c1EvRDIiTXLigiK3FiWsXUA/Deo4m7XP8d83uiQgsWkr
         rsiJbtslnNYUM8chQUcudOoUFM/0W4SaxRIqdHoIRSbPghhhDBx1R67MuBhiojYJbRa2
         ZcKdXXY5vbG9Cmh3weOKQYcL9Vpk/d0jpnEb4NgdC9hFDTN55Efd5pY6kF7KBvXFMrav
         3lAJCbaEJbO4ge7VnQ5oFMXe13ScaQKrXrxVBcA7qc8tPr+Rn2035uEI2xaI6ha+ZjpA
         fZpH1KsmVQsZikRu9g1K6mfL/pKvHxJP6HQodA5ShXQQ/UlW/GBDISyut9mo61Fna0tc
         PNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=JZHs0KH6lll4oBX6dW2XRwDAMF/tzdKCEdfc4BlccL8=;
        b=2OkGADHNdSEn0WIie/mMQeU4CQILBl9g7pT9uRs6Rtv+QSKqEv2JkA6C84eT0nBab/
         OU3E7/oLuWwrzNKLbc5CxbM5ZrJusHcJfBYBBNtW8h4HivuYTl9TTDJsu0fl4OeC3cTx
         I3DK80LDvETlXwPOzxGfFtYvdlANPqc0xk5bF6yOWcRY/F6oW+qoj0sJoa1UHR95oTmg
         WjdzLimqi5DiQxw0wOC2EeDYSxkPov4gyF/RRybFD6DaeJWKitCYG3tOC12M4JxoAwFw
         KEwsIqpCNctMlzjx+J9SGt37i1IvA5zomsIYNvf9rjp+lsQOuCBO2L15pNZWWtDPv/s4
         Sijg==
X-Gm-Message-State: AOAM530W4Jej7ggXtWAkvwFKmpn81uPjhck4BVHrrQTS3+tA2yfhwf06
        znsbUOsta/b2bdls+3u0vAx3wxxZB8hAb9gqW2Y=
X-Google-Smtp-Source: ABdhPJxI+CNNbRdKcXdExG2gZuhMT4NPcjCOu1iuFyL/T8EWuQ2XJvr/hnM1GXrWeEBNDZbfPlAeqfIN5xnXe+Kolwk=
X-Received: by 2002:a05:6e02:1be9:: with SMTP id y9mr3447426ilv.24.1633198318533;
 Sat, 02 Oct 2021 11:11:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6602:1681:0:0:0:0 with HTTP; Sat, 2 Oct 2021 11:11:58
 -0700 (PDT)
Reply-To: bazaatchao@gmail.com
From:   Tchao Ago Bazaa <renechristoph10@gmail.com>
Date:   Sat, 2 Oct 2021 11:11:58 -0700
Message-ID: <CA+=X2ERH01rTnEdG_-sGFA=pOFR7s8WAQYZJsXxy9eD3MZfhJA@mail.gmail.com>
Subject: Proposal
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hallo

Ich entschuldige mich, dass ich dieses Medium benutzt habe, um Sie zu
kontaktieren. Mein Name ist Tchao Ago Bazaa und ich bin von Beruf
Rechtsanwalt. Ich kontaktiere Sie in Bezug auf meinen verstorbenen
Mandanten, der denselben Nachnamen tr=C3=A4gt wie Sie und ein B=C3=BCrger I=
hres
Landes. Mein verstorbener Mandant ist vor einigen Jahren zusammen mit
seiner Familie bei einem Autounfall ums Leben gekommen und hat keine
Angeh=C3=B6rigen hinterlassen. Mein verstorbener Mandant war ein
Gesch=C3=A4ftsmann, der hier in meinem Land im =C3=96l- und Goldgesch=C3=A4=
ft t=C3=A4tig
war.

Er hinterlie=C3=9F einen Einzahlungswert von (Five Million Nine Hundred
Tausend US-Dollar) die Bank, bei der dieses Geld hinterlegt wurde,
versucht es zu beschlagnahmen, da ich lange Zeit nach seinem Tod kein
Familienmitglied ausfindig machen kann, suche ich daher Ihre seither
Partnerschaft, da Sie mit meinem den gleichen Familiennamen teilen
versp=C3=A4teter Kunde und wahrscheinlich aus demselben Land. Z=C3=B6gern S=
ie
nicht, mir die folgenden Informationen zu senden, um die Kommunikation
zu erleichtern, und bem=C3=BChen Sie sich, =C3=BCber meine private
E-Mail-Adresse zu antworten, um weitere Informationen zu erhalten:

Ihre vollst=C3=A4ndigen Namen
Ihre private Telefonnummer

Vielen Dank

Rechtsanwalt Tchao Ago Bazaa
