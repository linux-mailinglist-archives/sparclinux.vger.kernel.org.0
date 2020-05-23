Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4611F1DFAFC
	for <lists+sparclinux@lfdr.de>; Sat, 23 May 2020 22:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387951AbgEWU0z (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 23 May 2020 16:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387843AbgEWU0z (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 23 May 2020 16:26:55 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08658C061A0E
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:26:55 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x11so4816450plv.9
        for <sparclinux@vger.kernel.org>; Sat, 23 May 2020 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IliU09Qtm0R4K8KAf5PsB+jfqpWzq6HAuO4UVf2ial8=;
        b=IoyclKw8eGNjqO24astV/ZzMTeUAvVdww7ZzZENtS7GQr98/83jgUpza002pj83jie
         PhA2/YYNfta9QcPoLCv+dZiOMXU4wrL6XQ05jMZMezmp34HduthoN14euXgTT0saJ8NR
         Ee4V/9H3KrVWK5kdWeGL4QABKbYprmaX0xw2dpcFsCb12jAuElXCDl9KBBjqrCs6K1ZF
         znjbJn7h5jcTh3vkmpb/XWHLr9/pjMu6nN/erc8m7LZ0dAK4LLgk62B29eUvFS4XoC4n
         5A2mM0h3UAdr7/oWZt+D8A5jrWfE+LUIH9dGQJG3wokLgT0g4tBhUcB/X1VLPkS7hJkN
         QOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IliU09Qtm0R4K8KAf5PsB+jfqpWzq6HAuO4UVf2ial8=;
        b=jjqhkB9k2v4U06Y025eyjNfYXJDcCsrD1+R7J7TSdSXEk4DUgCGqR2zWNIIBuRzhAv
         XA/XZCHN6whBLsWbBeo2/Fif6O+ntWlaLEibyU+sBuxG0DHOblD6xrwGDNZr7gSEPLx3
         e0oIqqbJFlTYnjTXtCbR3msYqddvcO6kPz0NxbvFPzLB85o/QJNmfVGzYhOS+tlSg0/j
         RDMPBgn+CTijwqalbbfWLrMIYLmnwxpkvcKY3I1cUThRXEI887uDOI7E87eGNv71yPgl
         AxaIzc9pQQXSGtzzeepemtQgZQ3KwajmVZwQ9F5FPF/szYaSwUrjR5g9iR38+UH3fYIb
         uk/g==
X-Gm-Message-State: AOAM532sjUTJbGlcadBGbk2VV/LKvoEolbow2q++u+oc+/uQDYljLZUJ
        mCNuPE9OUhZad7k232UpCQEOZuU2
X-Google-Smtp-Source: ABdhPJxIOvKytoG1xpoibzzJNfG83TX9N9AhILlJOcwLUSBsxW4zu6+xB2Ja/bm1E6futKHK3NZmqw==
X-Received: by 2002:a17:90a:6904:: with SMTP id r4mr12152369pjj.119.1590265614243;
        Sat, 23 May 2020 13:26:54 -0700 (PDT)
Received: from localhost ([108.161.26.224])
        by smtp.gmail.com with ESMTPSA id i128sm9626444pfc.149.2020.05.23.13.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 13:26:53 -0700 (PDT)
From:   Matt Turner <mattst88@gmail.com>
To:     sparclinux@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Matt Turner <mattst88@gmail.com>
Subject: [PATCHv2 4/5] second: Fix typo'd operator
Date:   Sat, 23 May 2020 13:26:50 -0700
Message-Id: <20200523202650.3063421-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200523202233.3063074-4-mattst88@gmail.com>
References: <20200523202233.3063074-4-mattst88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Note that this does change the behavior of the code. After the patch
only < 2.6 PROMs will fail (which is probably correct), instead of every
2.* like now.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 second/disk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/second/disk.c b/second/disk.c
index 40234b3..b81a465 100644
--- a/second/disk.c
+++ b/second/disk.c
@@ -293,7 +293,7 @@ int silo_disk_read(char *buff, int size, unsigned long long offset)
 	if (!net) {
 	    if (prom_vers != PROM_P1275) {
 		    if (((romvec->pv_printrev >> 16) < 2 || 
-		         ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev && 0xffff) < 6)) 
+		         ((romvec->pv_printrev >> 16) == 2 && (romvec->pv_printrev & 0xffff) < 6))
 		        && offset >= 0x40000000) {
 		    	printf ("Buggy old PROMs don't allow reading past 1GB from start of the disk. Send complaints to SMCC\n");
 	    		return -1;
-- 
2.26.2

