Return-Path: <sparclinux+bounces-493-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03567871317
	for <lists+sparclinux@lfdr.de>; Tue,  5 Mar 2024 03:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E3EDB256A9
	for <lists+sparclinux@lfdr.de>; Tue,  5 Mar 2024 02:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2507F7D9;
	Tue,  5 Mar 2024 02:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WLoWZiZp"
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A834E43AD0
	for <sparclinux@vger.kernel.org>; Tue,  5 Mar 2024 02:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709604147; cv=none; b=AWmIXW+08Ex3dXhs7cLpcmGm8d0Q6d8NsTUo96nHL8oCcqDhhQvhd9od0Rj01rsXTF/wIKPw/Y2qPB/P9sa95d/Fufld73I5DsiT9sAevZjLEA4ZqCbM9cM7xEDxXz7t4YsRlYIT80Du4YVSZeW+AuOTBT7ml22pQepjOUQX4as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709604147; c=relaxed/simple;
	bh=ZkKDRjbXOJaCgdsUUhVdqCPuQ0SfWJoIIrbbmmGQ/FE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mgE/cr0FKwAbZjO+KIrp1a0q0Hb3wyMdretAOeqc5E9/3QADoz1jzs/UZIDULkEouJ9P8YEwB2J2NolqF2cvUpi9Jksdb8/tqIGLg2THbkZMP0BJpjefYemmTEQt/ZRq4GQv8rIv6UCc4mydqu0OokIpE4GTisc6Wj2EJFWvF3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WLoWZiZp; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5f38d676cecso80456787b3.0
        for <sparclinux@vger.kernel.org>; Mon, 04 Mar 2024 18:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709604139; x=1710208939; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFOLH8z6Kc1/DHNjJCRtctXlk4wkt0G4E5LxaUbD2lM=;
        b=WLoWZiZpUGPt4dSD7lzG4aIwzfZFDrSu2b9dCRJI0s0vPx1F/4kssBhpB/fm7J5vM4
         YGrzYu5FikmZpB/QM6HH8/roiaA3J/zaE9kbJwyib2Esv/gG7G2EtE0pvOSIMvYeuDZn
         cE1g0GZkmVTpkpY4ktpZPtuiBap6M6ChGB/G6zxyhq70o1sNFr7v8o/Xl7J2tkFosklJ
         rKP2Nx/+5+Wnc9JCAiPP09YRZa8EqY1HSxlr8Zjs9ut3WndncFAvAlNd38BuRBcZLcS7
         KQ0OXjzG1WV6nuXHeVo62EjW9ffcoue8rRspAYYPDJJyqltH3qGHhZwD7pRWVqn4GHfm
         bP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604139; x=1710208939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFOLH8z6Kc1/DHNjJCRtctXlk4wkt0G4E5LxaUbD2lM=;
        b=OPW5IpCw9FOpzX+O9KL0GuLfD4n3VEhZy2uef/bOe6W5k7meogex1XG8hOJd3BV4ge
         23OulHBabFqZyAf6PQ9UibOBgfjO3isaWPZr153JE/xgZplR/SoqXf8QQUtsgaYIE4de
         woQ/E6k2CTpdavcoqPYgHQDW6HC3XZc8ySTwYEPhU4aHwi3nnG6k19t2yPmMQSHwIfLO
         2W8TNA2U7351q4pRKunzn9IGdTahhtRjeO+6qR5O9jlR5HkpZfEkG4Ww3xvEI3Vop7Z1
         ZhwMcf18ON77g5R+DKNLv3m9IkbcCsLSNzpMm5uh5t9bo89GAhVrzP1+bL08LTDbsysK
         /HSg==
X-Forwarded-Encrypted: i=1; AJvYcCXMIj3+rvQb8/hGtrTwIUzfegJhrtO6KCaGV5HrGe7E8vgC3bHFkjZ2c3OrJtgMIjEJ+mJqLcmGu2N5WP3uMokC5AGtW/y/LZd8Ow==
X-Gm-Message-State: AOJu0Yy9gq3xZwJiniAAT2V60xKw0C6Jcs0HeLTl9yDJUInpVP40YJ3V
	wGM+0H41/+qgubXUOv3VVXV+Rk9IeZBASCVIhZchNYMU5MDw7/nGS9kgsCDcmTi7nr4UE7u7fAN
	6Q63T11LT/Z297bYkNp6glg==
X-Google-Smtp-Source: AGHT+IERAxLDH9CLsybVTiG1Kl+Ij4FHQxio+Skkp7XFr1VDsZ/QGA1eBFcDme38Y+MfcJE7+b6HhIBoi+3CQvIBng==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:b614:914c:63cd:3830])
 (user=almasrymina job=sendgmr) by 2002:a05:6902:1504:b0:dbd:b4e8:1565 with
 SMTP id q4-20020a056902150400b00dbdb4e81565mr342247ybu.4.1709604139120; Mon,
 04 Mar 2024 18:02:19 -0800 (PST)
Date: Mon,  4 Mar 2024 18:01:45 -0800
In-Reply-To: <20240305020153.2787423-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240305020153.2787423-11-almasrymina@google.com>
Subject: [RFC PATCH net-next v6 10/15] net: support non paged skb frags
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

Make skb_frag_page() fail in the case where the frag is not backed
by a page, and fix its relevant callers to handle this case.

Signed-off-by: Mina Almasry <almasrymina@google.com>


---

v6:
- Rebased on top of the merged netmem changes.

Changes in v1:
- Fix illegal_highdma() (Yunsheng).
- Rework napi_pp_put_page() slightly to reduce code churn (Willem).

---
 include/linux/skbuff.h | 47 +++++++++++++++++++++++++++++++++++++-----
 net/core/dev.c         |  3 ++-
 net/core/gro.c         |  2 +-
 net/core/skbuff.c      | 11 ++++++++++
 net/ipv4/tcp.c         |  3 +++
 5 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index ca29d1fd4561..d68d430dc596 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3466,17 +3466,53 @@ static inline void skb_frag_off_copy(skb_frag_t *fragto,
 	fragto->offset = fragfrom->offset;
 }
 
+/* Returns true if the skb_frag contains a net_iov. */
+static inline bool skb_frag_is_net_iov(const skb_frag_t *frag)
+{
+	return netmem_is_net_iov(frag->netmem);
+}
+
+/**
+ * skb_frag_net_iov - retrieve the net_iov referred to by fragment
+ * @frag: the fragment
+ *
+ * Returns the &struct net_iov associated with @frag. Returns NULL if this
+ * frag has no associated net_iov.
+ */
+static inline struct net_iov *skb_frag_net_iov(const skb_frag_t *frag)
+{
+	if (!skb_frag_is_net_iov(frag))
+		return NULL;
+
+	return netmem_to_net_iov(frag->netmem);
+}
+
 /**
  * skb_frag_page - retrieve the page referred to by a paged fragment
  * @frag: the paged fragment
  *
- * Returns the &struct page associated with @frag.
+ * Returns the &struct page associated with @frag. Returns NULL if this frag
+ * has no associated page.
  */
 static inline struct page *skb_frag_page(const skb_frag_t *frag)
 {
+	if (skb_frag_is_net_iov(frag))
+		return NULL;
+
 	return netmem_to_page(frag->netmem);
 }
 
+/**
+ * skb_frag_netmem - retrieve the netmem referred to by a fragment
+ * @frag: the fragment
+ *
+ * Returns the &netmem_ref associated with @frag.
+ */
+static inline netmem_ref skb_frag_netmem(const skb_frag_t *frag)
+{
+	return frag->netmem;
+}
+
 /**
  * __skb_frag_ref - take an addition reference on a paged fragment.
  * @frag: the paged fragment
@@ -3509,13 +3545,11 @@ bool napi_pp_put_page(netmem_ref netmem, bool napi_safe);
 static inline void
 napi_frag_unref(skb_frag_t *frag, bool recycle, bool napi_safe)
 {
-	struct page *page = skb_frag_page(frag);
-
 #ifdef CONFIG_PAGE_POOL
-	if (recycle && napi_pp_put_page(page_to_netmem(page), napi_safe))
+	if (recycle && napi_pp_put_page(skb_frag_netmem(frag), napi_safe))
 		return;
 #endif
-	put_page(page);
+	put_page(skb_frag_page(frag));
 }
 
 /**
@@ -3555,6 +3589,9 @@ static inline void skb_frag_unref(struct sk_buff *skb, int f)
  */
 static inline void *skb_frag_address(const skb_frag_t *frag)
 {
+	if (!skb_frag_page(frag))
+		return NULL;
+
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
diff --git a/net/core/dev.c b/net/core/dev.c
index bbea1b252529..765f4a995693 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3385,8 +3385,9 @@ static int illegal_highdma(struct net_device *dev, struct sk_buff *skb)
 	if (!(dev->features & NETIF_F_HIGHDMA)) {
 		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+			struct page *page = skb_frag_page(frag);
 
-			if (PageHighMem(skb_frag_page(frag)))
+			if (page && PageHighMem(page))
 				return 1;
 		}
 	}
diff --git a/net/core/gro.c b/net/core/gro.c
index 0759277dc14e..42d7f6755f32 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -376,7 +376,7 @@ static inline void skb_gro_reset_offset(struct sk_buff *skb, u32 nhoff)
 	NAPI_GRO_CB(skb)->frag0 = NULL;
 	NAPI_GRO_CB(skb)->frag0_len = 0;
 
-	if (!skb_headlen(skb) && pinfo->nr_frags &&
+	if (!skb_headlen(skb) && pinfo->nr_frags && skb_frag_page(frag0) &&
 	    !PageHighMem(skb_frag_page(frag0)) &&
 	    (!NET_IP_ALIGN || !((skb_frag_off(frag0) + nhoff) & 3))) {
 		NAPI_GRO_CB(skb)->frag0 = skb_frag_address(frag0);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index cf23392e97f5..907fff2894d3 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1378,6 +1378,14 @@ void skb_dump(const char *level, const struct sk_buff *skb, bool full_pkt)
 		struct page *p;
 		u8 *vaddr;
 
+		if (skb_frag_is_net_iov(frag)) {
+			printk("%sskb frag %d: not readable\n", level, i);
+			len -= frag->bv_len;
+			if (!len)
+				break;
+			continue;
+		}
+
 		skb_frag_foreach_page(frag, skb_frag_off(frag),
 				      skb_frag_size(frag), p, p_off, p_len,
 				      copied) {
@@ -3145,6 +3153,9 @@ static bool __skb_splice_bits(struct sk_buff *skb, struct pipe_inode_info *pipe,
 	for (seg = 0; seg < skb_shinfo(skb)->nr_frags; seg++) {
 		const skb_frag_t *f = &skb_shinfo(skb)->frags[seg];
 
+		if (WARN_ON_ONCE(!skb_frag_page(f)))
+			return false;
+
 		if (__splice_segment(skb_frag_page(f),
 				     skb_frag_off(f), skb_frag_size(f),
 				     offset, len, spd, false, sk, pipe))
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index c82dc42f57c6..51a5d263e8b4 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2166,6 +2166,9 @@ static int tcp_zerocopy_receive(struct sock *sk,
 			break;
 		}
 		page = skb_frag_page(frags);
+		if (WARN_ON_ONCE(!page))
+			break;
+
 		prefetchw(page);
 		pages[pages_to_map++] = page;
 		length += PAGE_SIZE;
-- 
2.44.0.rc1.240.g4c46232300-goog


