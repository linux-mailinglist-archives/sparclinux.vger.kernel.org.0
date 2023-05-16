Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF361704925
	for <lists+sparclinux@lfdr.de>; Tue, 16 May 2023 11:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbjEPJ0S (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 16 May 2023 05:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbjEPJZn (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Tue, 16 May 2023 05:25:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37D46199
        for <sparclinux@vger.kernel.org>; Tue, 16 May 2023 02:25:20 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f27b65bbf9so5205711e87.0
        for <sparclinux@vger.kernel.org>; Tue, 16 May 2023 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684229119; x=1686821119;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WWJbStyIsHB+j5oTR+02CgsauyEmKbYmKesWqjFNg6k=;
        b=iACWhWRwV8qa/KQJ1Du9+xeKl+TMC8uBbIs2PXa/8GWrP0AkbZqiDlwNYoLGc8W7JU
         vW8pjMucI9W8u814xS4muqSQzDiHCOG6bKybwZ95Yd4inO4WKTP3TY2dZXbJ58JvE+3C
         x5CRv+KKiMv3dppfobtOvNinPvJH0sLHDq2ue/Nh62VSq+Yt5a0tPm68q0RAOzc6ol3y
         BCvmEOTSbR+8SQbTNBr2zLS3Zefg1bvIIKhgpCF5Vj1+1a5ntstMxTqWe5fd4dZF5wni
         VtVfOHjZxL26+VjQxt7cj9HVYQ+oQJYl6lYQ7kmO8GHT/AG4FdgXHmmkHfl1ulx/9lLO
         7DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684229119; x=1686821119;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWJbStyIsHB+j5oTR+02CgsauyEmKbYmKesWqjFNg6k=;
        b=C5/Xb/aRLd/SwAahGBkDQy5U6mr09dEAmHM9H8M193PdXLvITwFFkvDcXAkFj5m4qU
         lPkRwQQYw0pKBdAuTxHuKKP+Y1TfALLN25C8UPBv8fFJjLswbJiYDXXjb3E+VoYPQeqW
         0LjZYt0INmkPNHBBHHPDxl057M5+6AdEtr3ORbfo7KOZnHxOXkVMwmEWVyfb3V8ivZC+
         mxzO3KZKkG/I1JxUy33C/LHN+8PukfsNjZB4SuoKB9WYkzmmOHkPKK/8wzhuJJY49/e3
         lVBE0vTCENEFs3ylhCW6ae6bB2G9jXLwzeL3RCsErt495pQpNyqZ7x2nXTDdO55MPrGX
         2wbw==
X-Gm-Message-State: AC+VfDw8QgpQRFSepGXeFxLbDqx8IByd3oGpD+AQZb5bFfdvJTOAeoMf
        zixSiy32qS+Y/SLYa5jGVT9uEMQKyXO9gRQQ7Ns=
X-Google-Smtp-Source: ACHHUZ6XTXPVg97GxIny2yMFRDGZAU+tR8HKa3D7LON762qgpIwAx/4pQac7trJ1UaRSB4xOPfLbJ2IrWaBq5m6NR+8=
X-Received: by 2002:a05:6512:21a6:b0:4e9:cfd2:e2d with SMTP id
 c6-20020a05651221a600b004e9cfd20e2dmr6861412lft.65.1684229118565; Tue, 16 May
 2023 02:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:73c9:0:b0:22d:d5a9:69be with HTTP; Tue, 16 May 2023
 02:25:18 -0700 (PDT)
Reply-To: didieracouetey2@gmail.com
From:   "Mrs. Cristalina Georgieva" 
        <kevineduardkevineduard36985254@gmail.com>
Date:   Tue, 16 May 2023 09:25:18 +0000
Message-ID: <CAEbT42Nu-uC8qZAHaOOyWpuoGfsRDsejYHohN_onRA_LsT_NcA@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

5rOo5oSPOiDopqrmhJvjgarjgovln7rph5Hlj5fnm4rogIXjga7nmobmp5gNCg0KICAg5oWO6YeN
44Gr6Kqt44KA77yB77yB77yBDQoNCiAgIOOBk+OBrumbu+WtkOODoeODg+OCu+ODvOOCuOOBr+ap
n+WvhuOBp+OBguOCiuOAgeWOs+WvhuOBq+OBguOBquOBn+Wum+OBruOCguOBruOBp+OBmeOAgg0K
DQrjgYLjgarjgZ/jgYwxNeWEhOODieODq+imj+aooeOBruizh+mHkeOCkuWPl+OBkeWPluOBo+OB
puOBhOOBquOBhOOBruOBr+aYjuOCieOBi+OBp+OBmeOAguOBk+OCjOOBr+OAgemBjuWOu+OBruiF
kOaVl+OBl+OBn+aUv+W6nOW9ueS6uuOBjOWIqeW3seeahOOBqueQhueUseOBp+izh+mHkeOCkuOB
u+OBqOOCk+OBqeiHquWIhuOBn+OBoeOBoOOBkeOBruOCguOBruOBq+OBl+OAgeOBguOBquOBn+OB
ruizh+mHkeOCkuOBmeOBueOBpuipkOasuuOBl+OCiOOBhuOBqOOBl+OBpuWIqeeUqOOBl+OBn+OB
n+OCgeOBp+OBmeOAgg0K5Z+66YeR44CCIOOBk+OCjOOBq+OCiOOCiuOAgeOBiuWuouanmOWBtOOB
q+WkmuWkp+OBquaQjeWkseOBjOeZuueUn+OBl+OAgeizh+mHkeOBruWPl+OBkeWPluOCiuOBq+S4
jeW/heimgeOBqumBheOCjOOBjOeUn+OBmOOBvuOBl+OBn+OAgg0KDQrjgqTjg7Pjgr/jg7zjg53j
g7zjg6vjga7lm73lrrbkuK3lpK7lsYDjga/jgIHlm73pgKPjgajpgKPpgqbmjZzmn7vlsYDvvIhG
SULvvInjga7mlK/mj7TjgpLlj5fjgZHjgabjgIHnj77lm73pmpvpgJrosqjln7rph5Hnt4/oo4Hj
gavlr77jgZfjgIHjgYLjgarjgZ/jgoTku5bjga7kurrjgZ/jgaHjgavlr77jgZnjgovjgZnjgbnj
gabjga7lr77lpJblgrXli5njga7muIXnrpfjgpLmjqjpgLLjgZnjgovjgojjgYblp5Tku7vjgZnj
govjgZPjgajjgavmiJDlip/jgZfjgb7jgZfjgZ/jgIINCuWlkee0hOmHkeOAgeWuneOBj+OBmC/j
gq7jg6Pjg7Pjg5bjg6vjgIHnm7jntprjgarjganjgpLlj5fjgZHlj5bjgonjgarjgYTlgIvkurrj
gIIgQVRN44Kr44O844OJ44Gn5pSv5omV44GE44KS5Y+X44GR5Y+W44KK44G+44GZ44CCDQoNCk9S
QSDjg5Djg7Pjgq8g44Kr44O844OJOiDlkI3liY3jgYzmmpflj7fljJbjgZXjgozjgZ/jg5Hjg7zj
gr3jg4rjg6njgqTjgrrjgZXjgozjgZ8gT1JBIOODkOODs+OCryBBVE0NCuOCq+ODvOODieOCkueZ
uuihjOOBl+OBvuOBmeOAguOBk+OBruOCq+ODvOODieOCkuS9v+eUqOOBmeOCi+OBqOOAgVZpc2Eg
44Kr44O844OJ44Gu44Ot44K044GM5LuY44GE44Gm44GE44KLIEFUTSDjgYvjgokgMSDml6XjgYLj
gZ/jgormnIDlpKcgMjAsMDAwDQrjg4njg6vjgpLlvJXjgY3lh7rjgZnjgZPjgajjgYzjgafjgY3j
gb7jgZnjgIIg44G+44Gf44CBT1JBIOODkOODs+OCryDjgqvjg7zjg4njgpLkvb/nlKjjgZnjgovj
gajjgIHos4fph5HjgpLpioDooYzlj6PluqfjgavpgIHph5HjgafjgY3jgb7jgZnjgIIgQVRNDQrj
gqvjg7zjg4njgavjga/jgIHjgYLjgarjgZ/jga7lm73jgYrjgojjgbPkuJbnlYzkuK3jga7jganj
ga4gQVRNIOapn+OBp+OCguS9v+eUqOOBp+OBjeOCi+OBk+OBqOOCkuaYjueiuuOBq+OBmeOCi+OD
nuODi+ODpeOCouODq+OBjOS7mOWxnuOBl+OBpuOBhOOBvuOBmeOAgg0KDQros4fph5Hjga8gQVRN
IFZpc2Eg44Kr44O844OJ57WM55Sx44Gn6YCB44KJ44KM44CBRmVkRXggRXhwcmVzcyDntYznlLHj
gafphY3pgZTjgZXjgozjgb7jgZnjgIIg56eB44Gf44Gh44GvIEZlZEV4IEV4cHJlc3MNCuOBqOWl
kee0hOOCkue1kOOCk+OBp+OBhOOBvuOBmeOAgumAo+e1oeOBmeOCi+W/heimgeOBjOOBguOCi+OB
ruOBr+OAgU9SQSDpioDooYzjga7jg4fjgqPjg6zjgq/jgr/jg7zjgafjgYLjgosgTVIg44Gg44GR
44Gn44GZ44CCIERJRElFUiBBQ09VRVRFWQ0K44GT44Gu44Oh44O844Or44Ki44OJ44Os44K544GL
44KJOiAsIChkaWRpZXJhY291ZXRleTJAZ21haWwuY29tKQ0KDQoNCumAmuW4uOOBruODrOODvOOD
iOOCkui2heOBiOOCi+mHkemhjeOCkuimgeaxguOBmeOCi+S6uuOBr+mWk+mBleOBhOOBquOBj+ip
kOasuuW4q+OBp+OBguOCiuOAgeS7luOBruS6uuOBq+mAo+e1oeOCkuWPluOBo+OBn+WgtOWQiOOB
r+OBneOBruS6uuOBqOOBrumAo+e1oeOCkuS4reatouOBmeOCi+W/heimgeOBjOOBguOCi+OBk+OB
qOOBq+azqOaEj+OBl+OBpuOBj+OBoOOBleOBhOOAgg0KDQrjgb7jgZ/jgIHjgZTosqDmi4XjgYTj
gZ/jgaDjgY/jga7jga/phY3pgIHmlpnjga7jgb/jgafjgZnjga7jgafjgZTlronlv4PjgY/jgaDj
gZXjgYTjgIIg44Gd44KM5Lul5LiK44Gu44KC44Gu44Gv44GC44KK44G+44Gb44KT77yBIOW/heim
geOBquaDheWgseOBqOmFjemAgeaWmeOCkuWPl+OBkeWPluOBo+OBpuOBi+OCiSAyDQrllrbmpa3m
l6Xku6XlhoXjgavos4fph5HjgpLlj5fjgZHlj5bjgovjgZPjgajjgpLkv53oqLzjgZfjgb7jgZnj
gIINCg0K5rOoOiDnqI7ph5HmiYvmlbDmlpnjgpLlkKvjgoHjgIHjgZnjgbnjgabjga8gSU1GIOOB
qOS4lueVjOmKgOihjOOBq+OCiOOBo+OBpuWHpueQhuOBleOCjOOCi+OBn+OCgeOAgeaUr+aJleOB
huW/heimgeOBjOOBguOCi+OBruOBryBGZWRFeCDjga7phY3pgIHmlpnjgaDjgZHjgafjgZnjgIIN
CuOBk+OCjOOBr+OAgUZlZEV4IEV4cHJlc3Mg44GuIENPRCAo5Luj6YeR5byV5o+bKSDjgrXjg7zj
g5PjgrnjgYzopo/ntITjgavjgojjgorlm73pmpvphY3pgIHjgavjga/pgannlKjjgZXjgozjgarj
gYTjgZ/jgoHjgafjgZnjgIINCg0KMTUg5YSE44OJ44Or55u45b2T44Gu44OV44Kh44Oz44OJ44KS
44Oq44Oq44O844K544GZ44KL44Gr44Gv44CB6Kqk6YWN6YCB44KS6YG/44GR44KL44Gf44KB44Gr
6YWN6YCB5oOF5aCx44KS5o+Q5L6b44GZ44KL5b+F6KaB44GM44GC44KK44G+44GZ44CCDQoNCiAg
IDEuIOOBguOBquOBn+OBruODleODq+ODjeODvOODoCAuLi4uLi4uLi4uLi4uLi4uLi4uDQoyLiDj
gYLjgarjgZ/jga7lm70uLi4uLg0KMy4g44GC44Gq44Gf44Gu6KGXLi4uLi4NCjQuIOOBguOBquOB
n+OBruWujOWFqOOBquS9j+aJgCAuLi4uLi4NCjUuIOWbveexjSAuLi4uLi4NCjYuIOeUn+W5tOac
iOaXpS/mgKfliKXigKbigKYNCjcuIOiBt+alreKApuKApg0KOC4g6Zu76Kmx55Wq5Y+34oCm4oCm
DQo5LiDosrTnpL7jga7jg6Hjg7zjg6vjgqLjg4njg6zjgrkg4oCm4oCmDQoxMC4g5YCL5Lq644Oh
44O844Or44Ki44OJ44Os44K5IC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLg0KMTEu
IOWbvemam+ODkeOCueODneODvOODiOOBvuOBn+OBr+acieWKueOBqui6q+WIhuiovOaYjuabuOOB
ruOCs+ODlOODvDoNCg0K5b+F6KaB5LqL6aCF44KSTVLjgb7jgafjgYrpgIHjgorjgY/jgaDjgZXj
gYTjgIIgRElESUVSIEFDT1VFVEVZIE9yYUJhbmsg44OH44Kj44Os44Kv44K/44O844CB44Oh44O8
44Or44Ki44OJ44Os44K5ID0NCihkaWRpZXJhY291ZXRleTJAZ21haWwuY29tKSDjgb7jgafku4rj
gZnjgZDjgZTpgKPntaHjgY/jgaDjgZXjgYTjgIINCg0K44GK44KB44Gn44Go44GG44GU44GW44GE
44G+44GZDQo=
