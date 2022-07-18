Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB410578B45
	for <lists+sparclinux@lfdr.de>; Mon, 18 Jul 2022 21:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbiGRTyY (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 18 Jul 2022 15:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiGRTyQ (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 18 Jul 2022 15:54:16 -0400
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com [IPv6:2607:f8b0:4864:20::1142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC9D6319
        for <sparclinux@vger.kernel.org>; Mon, 18 Jul 2022 12:54:15 -0700 (PDT)
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-31e0d4ad6caso58504537b3.10
        for <sparclinux@vger.kernel.org>; Mon, 18 Jul 2022 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=ci7wONf9pbkTyztfvrJbnIxicssRcOKokyL+cpSfhlw517IdNzBLbJfaAqQ+6v9O0H
         KvA0P5alEU0N51eg24Cjw1JQDkQg24m6UKgZLEfEFdztEmdBnf6Jionr4MYAfYKHt3qd
         NO7uFz7C5eIwd+qabJcvXvZU7GPOo2K8KRd5JHPgif0Hj1z2jIeRd9hiTYRKbWQ6CSj6
         /kWNW+VB3IclVcjl7daAt5z4Go2+pVx2i96xE200B+83iZhDjfr1CFG0tGzFSu2fuRvA
         Jd/ZzyFv1AMmp/rIjrSTuUTdYiRv7NJeAeGYJmRhyAA+xFIgAvzC/Nd0HyWCZbNr7SqN
         SmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=iNm6oezw1LeFQyz1Y5UIh9chgb2YQJ1792OWB9hO8V43GTnFUzx24+1T7G51k66V1W
         KwpddrRx4V3joeou8EJhv2koGnxpxlc3i0vzPXfLHFjfBvPMykVNcumW54+0VGyoMqJh
         HoOcDP2GMjxLrRZbQh6IVYFdTAMLc+1B8BZFI33E+dNJBGVvLzxZRSOp151ZBi032aLY
         uoHK92qdoPjWf2gInx1cFIBLsE2NGB983J7ubsgbl35LRVo0V4apPD5+QCqZ7VHGpY3G
         BJisRZLvOHZZb4WPYXcloNUNX4SyQboiZFcT1lHdDOWsXMVeSsJUFGfvNo/6kuzsMPw1
         bS9A==
X-Gm-Message-State: AJIora+Z+yy9JeB9EDMQLEk06wvNYxsxiC7hG+zG1TzO3DYlROY6LvRV
        cikaYWt+SVN7kHW1xLr3d5oRqlyhx9NX9II+CA0=
X-Google-Smtp-Source: AGRyM1uUNv3fqicYqPdXvUZ5lZYgf+Yk0Fzo4C0C6mlJLsNDiK3eWT49DYGSOGf1gkkuLo7LC1b1vRlkWy1tocYIv40=
X-Received: by 2002:a81:548a:0:b0:31c:b7d6:b3ca with SMTP id
 i132-20020a81548a000000b0031cb7d6b3camr32204749ywb.500.1658174054764; Mon, 18
 Jul 2022 12:54:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:34dd:0:0:0:0 with HTTP; Mon, 18 Jul 2022 12:54:14
 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <rayimemogn@gmail.com>
Date:   Mon, 18 Jul 2022 11:54:14 -0800
Message-ID: <CAMefwTOESE_6e01NcDxppEtFUZxEpc65+gUOnJrat31YND0mdA@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
