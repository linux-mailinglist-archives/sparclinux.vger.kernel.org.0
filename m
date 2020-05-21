Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A011DD6A4
	for <lists+sparclinux@lfdr.de>; Thu, 21 May 2020 21:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbgEUTI0 (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 21 May 2020 15:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgEUTI0 (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 21 May 2020 15:08:26 -0400
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5589AC061A0E
        for <sparclinux@vger.kernel.org>; Thu, 21 May 2020 12:08:26 -0700 (PDT)
Received: from host109-156-104-24.range109-156.btcentralplus.com ([109.156.104.24] helo=[192.168.1.65])
        by mail.default.ilande.uk0.bigv.io with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <mark.cave-ayland@ilande.co.uk>)
        id 1jbqYG-0002mm-IY; Thu, 21 May 2020 20:08:26 +0100
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        David Miller <davem@davemloft.net>, arnd@arndb.de,
        sparclinux@vger.kernel.org
References: <20200512171527.570109-1-christian.brauner@ubuntu.com>
 <20200512.130633.293867428547074800.davem@davemloft.net>
 <20200517150123.sl36ug27gwnyz6gf@wittgenstein>
 <cfc07b63-29e6-cda9-c611-235e37970763@ilande.co.uk>
 <20200517221346.GL23230@ZenIV.linux.org.uk>
 <20200518181825.GM23230@ZenIV.linux.org.uk>
 <cf84ad0e-11a8-1066-5b7b-edb7cf482f76@ilande.co.uk>
 <20200518230840.GN23230@ZenIV.linux.org.uk>
 <20200519002438.GA2726018@ZenIV.linux.org.uk>
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
Message-ID: <3301bd45-d3b0-512a-c00b-53b3d9f76ff9@ilande.co.uk>
Date:   Thu, 21 May 2020 20:08:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519002438.GA2726018@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.156.104.24
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 0/3] sparc: port to copy_thread_tls() and struct
 kernel_clone_args
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On 19/05/2020 01:24, Al Viro wrote:

>>> If you able to reproduce the issue consistently and can help figure out what's going
>>> on then that would be a great help. Perhaps it might make sense to split this into a
>>> separate thread and drop the non-sparc lists?
>>
>> Sure, no problem.As for "able to reproduce"
>   -generally takes under half an hour.
>> Less in this case, as you can see from printk timestamps...
> 
> FWIW, right after boot
> root@sparc64:/tmp# wget http://ftp.us.debian.org/debian/pool/main/l/linux/linux_5.7~rc5.orig.tar.xz
> --2020-05-18 19:23:31--  http://ftp.us.debian.org/debian/pool/main/l/linux/linux_5.7~rc5.orig.tar.xz
> Resolving ftp.us.debian.org (ftp.us.debian.org)... 208.80.154.15, 64.50.233.100, 64.50.236.52, ...
> Connecting to ftp.us.debian.org (ftp.us.debian.org)|208.80.154.15|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 117279780 (112M) [application/octet-stream]
> Saving to: ‘linux_5.7~rc5.orig.tar.xz’
> 
>           linux_5.7   0%[                    ]       0  --.-KB/s               [  216.454929] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> .tar.xz              63%[===========>        ]  71.36M  5.32MB/s    eta 9s     [  261.490162] ata1: lost interrupt (Status 0x50)
> [  261.491467] ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
> [  261.492164] ata1.00: failed command: FLUSH CACHE
> [  261.492773] ata1.00: cmd e7/00:00:00:00:00/00:00:00:00:00/a0 tag 0
> [  261.492773]          res 40/00:01:00:00:00/00:00:00:00:00/a0 Emask 0x4 (timeout)
> [  261.493920] ata1.00: status: { DRDY }
> [  261.494587] ata1: soft resetting link
> [  261.495030] ata2: lost interrupt (Status 0x58)
> [  261.658539] ata1.00: configured for UDMA/33
> [  261.658987] ata1.00: retrying FLUSH 0xe7 Emask 0x4
> [  266.854943] ata2.00: qc timeout (cmd 0xa0)
> [  266.855567] ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
> [  272.229617] ata2.00: qc timeout (cmd 0xa0)
> [  272.230028] ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
> [  272.230851] ata2.00: limiting speed to UDMA/33:PIO3
> <similar to earlier, this time with fs errors - different ATA command failing>
> 
> When writing *not* to disk:
> root@sparc64:~# mount -t ramfs none /tmp
> root@sparc64:~# cd /tmp/
> root@sparc64:/tmp# wget http://ftp.us.debian.org/debian/pool/main/l/linux/linux_5.7~rc5.orig.tar.xz
> --2020-05-18 19:39:58--  http://ftp.us.debian.org/debian/pool/main/l/linux/linux_5.7~rc5.orig.tar.xz
> Resolving ftp.us.debian.org (ftp.us.debian.org)... 208.80.154.15, 64.50.236.52, 64.50.233.100, ...
> Connecting to ftp.us.debian.org (ftp.us.debian.org)|208.80.154.15|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 117279780 (112M) [application/octet-stream]
> Saving to: ‘linux_5.7~rc5.orig.tar.xz’
> 
>          linux_5.7~   0%[                    ] 918.40K  4.38MB/s               [   82.810156] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> [   82.830163] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> [   82.832862] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> [   82.853928] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> inux_5.7~rc5.orig.t   3%[                    ]   3.72M  1.63MB/s               [   84.860985] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> [   84.878113] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> [   84.886409] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> 7~rc5.orig.tar.xz     6%[>                   ]   7.09M  1.54MB/s    eta 46s    [  118.099900] ata2: lost interrupt (Status 0x58)
> [  122.195865] ata1: lost interrupt (Status 0x50)
> [  122.197426] ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
> [  122.199156] ata1.00: failed command: WRITE DMA
> [  122.200488] ata1.00: cmd ca/00:08:ac:fb:46/00:00:00:00:00/e0 tag 0 dma 4096 out
> [  122.200488]          res 40/00:01:00:00:00/00:00:00:00:00/a0 Emask 0x4 (timeout)
> [  122.203720] ata1.00: status: { DRDY }
> [  122.204870] ata1: soft resetting link
> [  122.365836] ata1.00: configured for UDMA/33
> [  122.367282] ata1: EH complete
> [  123.463696] ata2.00: qc timeout (cmd 0xa0)
> [  123.464129] ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
> [  128.839650] ata2.00: qc timeout (cmd 0xa0)
> [  128.840747] ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
> [  128.842261] ata2.00: limiting speed to UDMA/33:PIO3
> [  134.215584] ata2.00: qc timeout (cmd 0xa0)
> [  134.215995] ata2.00: TEST_UNIT_READY failed (err_mask=0x5)
> [  134.216499] ata2.00: disabled
> <usual series of bus resets, with complaints about jbd2 locked for too long, etc.; IO on
> /var/log/exim4/mainlog, of all things>
> 
> Very interesting...  The same with exim4 and sshd stopped passes with
> lots of "out of receive descriptors", but without a hang.  The same with
> ssh started: ditto.  Start exim4, repeat - still no hang.  Try to do
> the same wget with md5sum /usr/bin/* at the same time from ssh session -
> lost interrupt and a hang.  Actually, it wasn't even md5sum - tab
> completion in bash has done it.
> 
> Next experiment: boot, then
> root@sparc64:~# service exim4 stop
> Stopping MTA: exim4_listener.
> root@sparc64:~# service ssh stop
> Stopping OpenBSD Secure Shell server: sshd.
> root@sparc64:~# mount -t ramfs none /tmp
> root@sparc64:~# cd /tmp/
> root@sparc64:/tmp# (sleep 2; md5sum /usr/bin/* >/dev/null) &
> [1] 1126
> root@sparc64:/tmp# wget http://ftp.us.debian.org/debian/pool/main/l/linux/linux_5.7~rc5.orig.tar.xz
> --2020-05-18 20:17:18--  http://ftp.us.debian.org/debian/pool/main/l/linux/linux_5.7~rc5.orig.tar.xz
> Resolving ftp.us.debian.org (ftp.us.debian.org)... 64.50.236.52, 64.50.233.100, 208.80.154.15, ...
> Connecting to ftp.us.debian.org (ftp.us.debian.org)|64.50.236.52|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 117279780 (112M) [application/x-xz]
> Saving to: ‘linux_5.7~rc5.orig.tar.xz’
> 
>          linux_5.7~   0%[                    ] 535.49K  2.58MB/s               [  142.491757] enp2s1: Happy Meal out of receive descriptors, packet dropped.
>        linux_5.7~rc   2%[                    ]   2.92M  4.85MB/s               [  142.815354] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> [  142.843435] enp2s1: Happy Meal out of receive descriptors, packet dropped.
> ux_5.7~rc5.orig.tar   6%[>                   ]   7.18M  2.72MB/s               [  175.465117] ata1: lost interrupt (Status 0x50)
> <hang>
> 
> So it does look like hme alone is not enough, but it makes cmd64x lost interrupt happen
> much faster.  Note that this time no tab completion, etc. had been involved - straight
> reads (well, and atime touches) done by md5sum in background.
> 
> No repeats of that iommu.c BUG_ON() so far...  Ideas?

Thanks for the reproducer, however I'm still scratching my head trying to reproduce
the error here:

$ ./qemu-system-sparc64 -hda /home/build/src/qemu/image/sparc64/deb90.qcow2 -snapshot
-m 1024 -nographic

root@debian90:~# uname -a
Linux debian90 4.9.0-3-sparc64 #1 Debian 4.9.30-2 (2017-06-12) sparc64 GNU/Linux
root@debian90:~# mount -t ramfs none /tmp
root@debian90:~# cd /tmp/
root@debian90:/tmp# (sleep 2; md5sum /usr/bin/* >/dev/null) &
[1] 358
_5.7~rc5.orig.tar.xzwget http://ftp.us.debian.org/debian/pool/main/l/linux/linux_
--2020-05-21 20:02:49--
http://ftp.us.debian.org/debian/pool/main/l/linux/linux_5.7~rc5.orig.tar.xz
Resolving ftp.us.debian.org (ftp.us.debian.org)... 64.50.236.52, 64.50.233.100,
208.80.154.15, ...
Connecting to ftp.us.debian.org (ftp.us.debian.org)|64.50.236.52|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 117279780 (112M) [application/x-xz]
Saving to: ‘linux_5.7~rc5.orig.tar.xz’

linux_5.7~rc5.orig. 100%[===================>] 111.85M  2.32MB/s    in 49s

2020-05-21 20:03:38 (2.26 MB/s) - ‘linux_5.7~rc5.orig.tar.xz’ saved [117279780/117279780]

[1]+  Done                    ( sleep 2; md5sum /usr/bin/* > /dev/null )
root@debian90:/tmp#


Can you tell me a bit more about the host in terms of CPU and disk to help figure out
what's going on?


ATB,

Mark.
