Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5F71DEF29
	for <lists+sparclinux@lfdr.de>; Fri, 22 May 2020 20:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730806AbgEVS3Z (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 22 May 2020 14:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbgEVS3Z (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 22 May 2020 14:29:25 -0400
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982DCC061A0E
        for <sparclinux@vger.kernel.org>; Fri, 22 May 2020 11:29:24 -0700 (PDT)
Received: from host109-156-104-24.range109-156.btcentralplus.com ([109.156.104.24] helo=[192.168.1.65])
        by mail.default.ilande.uk0.bigv.io with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <mark.cave-ayland@ilande.co.uk>)
        id 1jcCPv-0005Gv-T9; Fri, 22 May 2020 19:29:12 +0100
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        David Miller <davem@davemloft.net>, arnd@arndb.de,
        sparclinux@vger.kernel.org
References: <20200517150123.sl36ug27gwnyz6gf@wittgenstein>
 <cfc07b63-29e6-cda9-c611-235e37970763@ilande.co.uk>
 <20200517221346.GL23230@ZenIV.linux.org.uk>
 <20200518181825.GM23230@ZenIV.linux.org.uk>
 <cf84ad0e-11a8-1066-5b7b-edb7cf482f76@ilande.co.uk>
 <20200518230840.GN23230@ZenIV.linux.org.uk>
 <20200519002438.GA2726018@ZenIV.linux.org.uk>
 <3301bd45-d3b0-512a-c00b-53b3d9f76ff9@ilande.co.uk>
 <2ec71021-df8e-f267-faa7-c5f57fcf3f77@ilande.co.uk>
 <20200521202350.GI23230@ZenIV.linux.org.uk>
 <20200522000556.GA3149788@ZenIV.linux.org.uk>
From:   Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <03a9c1ef-ad74-a1d8-3238-1335c74e141a@ilande.co.uk>
Date:   Fri, 22 May 2020 19:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522000556.GA3149788@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.156.104.24
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 0/3] sparc: port to copy_thread_tls() and struct
 kernel_clone_args
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 22/05/2020 01:05, Al Viro wrote:

> On Thu, May 21, 2020 at 09:23:50PM +0100, Al Viro wrote:
>> On Thu, May 21, 2020 at 08:42:34PM +0100, Mark Cave-Ayland wrote:
>>
>>>> Can you tell me a bit more about the host in terms of CPU and disk to help figure out
>>>> what's going on?
>>
>> phenom II X6 1100T (6-way 3.3GHz), 8Gb RAM (4Gb given to guest), WDC WD10EACS-00D
>> disk (hdparm -tT gives
>>  Timing cached reads:   6988 MB in  2.00 seconds = 3494.96 MB/sec
>>  Timing buffered disk reads: 280 MB in  3.02 seconds =  92.75 MB/sec
>> )
>>
>>> One other thought I had is that somehow the IVEC IRQs are managing to be overwritten
>>> on a faster host before being read by the guest. Does the following patch display the
>>> FATAL message at the point where things hang?
>>
>>> diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
>>> index fae20ee97c..618ebd1300 100644
>>> --- a/hw/pci-host/sabre.c
>>> +++ b/hw/pci-host/sabre.c
>>> @@ -63,6 +63,9 @@
>>>  static inline void sabre_set_request(SabreState *s, unsigned int irq_num)
>>>  {
>>>      trace_sabre_set_request(irq_num);
>>> +    if (s->irq_request != 0 && s->irq_request != NO_IRQ_REQUEST) {
>>> +        fprintf(stderr, "FATAL: still waiting for IRQ %x, now %x\n", s->irq_request,
>>> irq_num);
>>> +    }
>>>      s->irq_request = irq_num;
>>>      qemu_set_irq(s->ivec_irqs[irq_num], 1);
>>>  }
>>
>> I have to go AFK right now, will test when I get back (should be about an
>> hour or two)
> 
> Hang, nothing on stderr until killed, at which point it gave the expected
> qemu-system-sparc64: terminating on signal 15 from pid 15917 (-bash)
> IOW, stderr got flushed after hang - that fprintf simply has not triggered.

Okay thanks for giving that a go. I have one other possibility that I want to
eliminate: I see that you are using a very up-to-date 5.6.0-1-sparc64, whereas I was
testing with the stock CD image (and indeed, an older revision than the one that is
currently available in Debian ports).

When you have a moment, can you grab the latest qemu from git master since it has
some fixes for -kernel/-initrd, and then try booting your same sparc64 disk image but
 passing in explicit -kernel and -initrd parameters pointing to the same ones that I
am using. I'll send you a download link off-list.


ATB,

Mark.
