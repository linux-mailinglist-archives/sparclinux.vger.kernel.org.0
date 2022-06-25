Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864F555AB5E
	for <lists+sparclinux@lfdr.de>; Sat, 25 Jun 2022 17:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbiFYPpf (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 25 Jun 2022 11:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbiFYPpd (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 25 Jun 2022 11:45:33 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0085F1F6
        for <sparclinux@vger.kernel.org>; Sat, 25 Jun 2022 08:45:32 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id i7so9432489ybe.11
        for <sparclinux@vger.kernel.org>; Sat, 25 Jun 2022 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=ph19z67WWj8MKbdbfJ/X9NXE3OtaIRjlRTh0jWTZhVY=;
        b=SxjY8vf6BNWlgV2AdjLZmK5JZuceZqSaiyNt1BMnXpPKlgEhIIg8OpHO2MdgpotvKA
         dfYK4devWTRxNOS6dbSbIBJa0gndtfvhWtdluBKIC2y1r+z3T6Q3HBz+50NZ0JXg5zBv
         FB/c7k7cBYtDjIG5LdBrxoOdOJNLtU/aE3g6NUHd2mKNTUVp1bZ9s2utADFL+VdDer9k
         7FPyDyilkKRLFwpujCJbJ9/WaNc/rBYTbFPd0exPg892y+bkeiy7L4C7oA81GRKf5zBF
         gRF0NRGlgaU4v/rnAcuahmxWEzSIz+TUVdV6oRCdSestG4R1/JPARClXcQXS6ENmSlCt
         F3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=ph19z67WWj8MKbdbfJ/X9NXE3OtaIRjlRTh0jWTZhVY=;
        b=N6Cim2lZn1TLG4YaXbxwJAoa6Sxfkz4DeOqDc0CY+KTkbXdizyXVXijQiapz0oigIq
         89xmDiFbgBFTjRqmqyNMKTEBggTlg9khj7vSlKjRF0z03sM4BE8cCP9g9+JAAloQaG5u
         6I0LZzBEz1Y28qJowzEnH1rzmwCfoJBfeKZ8eHtIpE8UADlDYnknb3KMUnaoPum1Ko6v
         P0Z08lu07uguIDD1Y3JHaoUWlrY8P603emzIQU3LYJNFykhPQXlmHg6QHi7vjytgDd/m
         SaMWaoZJQc8M+xj5+FBI7HPRNAVu4GcmmkxH+q9p8zFsUrscLtyy6X+vz8ajQnkGR9Bn
         Kwbw==
X-Gm-Message-State: AJIora+aQXdCfQH0/LBtFvBLaQNb5PZcVwkSd7nTpZhhzO7QhmBt22XJ
        YLN2BZSjYT3+TpgG2rqnjHRxRdfjJ4IYTEfauYc=
X-Google-Smtp-Source: AGRyM1tmeTF36nU//qBeZo0lsMQVpnUHbd6nMef1kirbr+5LtugZicHKaQ/5/4jxfDN0XeCd29nDRi6IGzRUSxPwO28=
X-Received: by 2002:a25:d003:0:b0:66c:8c04:c7b4 with SMTP id
 h3-20020a25d003000000b0066c8c04c7b4mr3356978ybg.276.1656171932287; Sat, 25
 Jun 2022 08:45:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:4987:b0:186:e8b2:f22f with HTTP; Sat, 25 Jun 2022
 08:45:31 -0700 (PDT)
Reply-To: josephkavin0111@gmail.com
From:   Joseph Kavin <komiagbo42@gmail.com>
Date:   Sat, 25 Jun 2022 09:45:31 -0600
Message-ID: <CABjZHPtqKgEUudo_YiytAdvC4Ow-K7BmreuPQ8JZfEV_at0Fog@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,BODY_SINGLE_WORD,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Hi   are you available to speak now

Thanks
