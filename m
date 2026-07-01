Return-Path: <sparclinux+bounces-6972-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2D6UDAFORWp4+QoAu9opvQ
	(envelope-from <sparclinux+bounces-6972-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Wed, 01 Jul 2026 19:27:29 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 837766F059B
	for <lists+sparclinux@lfdr.de>; Wed, 01 Jul 2026 19:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EdG0kIlk;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6972-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="sparclinux+bounces-6972-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BBE300B9D1
	for <lists+sparclinux@lfdr.de>; Wed,  1 Jul 2026 17:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198C138D40C;
	Wed,  1 Jul 2026 17:19:07 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2FF37C92D
	for <sparclinux@vger.kernel.org>; Wed,  1 Jul 2026 17:19:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926347; cv=none; b=fAeIr43oYGEqlwB3PxjI6eLeuSh2hhl8gAGNSuj3fmnu+79Je1yQlgrBpvqIhMQunpFEoIrgAOBfm72SWcxQa4btuxVhFxlU29ndGEWQx7queC/ED1dIIiuYHLfjbV6LEspJEyPlT6FkzMr1gADfFHsB1jnFYSZSSX8PAiVulr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926347; c=relaxed/simple;
	bh=MaidzqW4SYY2w5nPLJFXk4d1eOTnnMSprzH6YDrQ5RI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pm161j3kujgM6cf1jBdDQ8pyTv8gS7p52jWQzYdDGuyF1nkASGZomwXFmzIolwXZAKoO/MvwUV5GZ0tzaBwImOAqpyhp+rJ28pwWOkZSi6GG3fd4y96tAyTvYUTrIFtGZNrc4UzGhOs/3KQip3J3XCRqcucmgGyv8Yy5kVCFlZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdG0kIlk; arc=none smtp.client-ip=209.85.210.171
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so582027b3a.1
        for <sparclinux@vger.kernel.org>; Wed, 01 Jul 2026 10:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782926345; x=1783531145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVZjtpTrxXxAVguXYAz4E7mi5sWPqKxrHjlHEoMDU8Q=;
        b=EdG0kIlkhGC8EnTihdJY2Nj93DPMO66F0YuNlRDNppazDleeOZnyE0SLqeby21Dt/i
         Z88JImxGPI4JLM0h5XGQkcc9SitodWpyPwF1+cs6OAhFvWcF84qYs/Iiqi8m41CxDH5f
         biUljY2YWie0PtsXucfRTBpv/3na4DP4bqWrttTUgf7E+S9midmaHc+DJTaOTUDA7nGw
         9gqzMM3Gt6gXma7OuoepFsL9xrMuZZEDSr+GvQwX+GBzojRU0+yJ+VBBX9lP2JXUnlHd
         x/qQseJwLUH7D89BaFBxsqon5aF01NndG7Cy/Srp7wmu+CeV4IkjELHcABS+NbdZEfox
         FHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782926345; x=1783531145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVZjtpTrxXxAVguXYAz4E7mi5sWPqKxrHjlHEoMDU8Q=;
        b=JNm27uqUi/Wf82+DK6tT1OzrldNsD09N3ArzCWDaQUXChEikQAJSnSvK2PuiT7ilaA
         yDkppfJhheG1z7BRdi19hj66VtqIYrtZXwohuEPTUJtsEDJDJgqbZpDZ6Kf0lWptXS+4
         +7+ItbRYmYNLNkgfNKGAnymuWn0pZXtBS+LXM6b87kVrrC/Hty2S1BVD/hOGIDfT7Qr+
         nTEHVrE6jOMZC+NpxzVzQJFs8roGWJfnFwsm+IygvrebgEDyq+Gg1krEfC3IK72Kdbt+
         /qp2SB5tAi/QMfvwyD+ubDNHHGh9EoW0UJnrZMut8liPwMQ0VrZ16hrYaMOWIPzzANJx
         FGmg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6CAdrQ/IISgIk4xuE1kqrom/FO3bbkLIm5FYVb3Vhy/Hskie6cI5BGIc13IX+JDvsFk5GLsypLUoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLcyyDOTqcuu1UsZtSV5VWiVdUWtlwHTpUimsZP3nJ4VSiPwZ
	5/4mScRgYGLxLoiQlfJtA4aPA5JVUJ7Qgh3vqS1e5uPfBRVkgwLmJnRk
X-Gm-Gg: AfdE7cnWsURLQg7g5ZjzCkxOU3ZMr51F5xt4flNvw5LidUfTWAh9GwP97wJXLVDqwY4
	nBJsu+1pFiCWSSL/ZXox1j2BO1FwGoFe4/enJCcbvmFvcfnbaMQ45m1DkruG5Bl/6rA7NNQxXRu
	uJfutd9BtuG/yg0tihNDwC+YZphhdXB8szQfap2VhQ74Hu9A2hNTkFEwffgX4iZG7kHRDnuA4Mm
	8NyLuYGwrOpZWI9WDXW+6MbZCVtQYEBZI/V2H/cTJddIiGQFAk8g5KGcaAiyr/LAUgxh38m+kDs
	wuhrS1XRiTC6OIgt5my+sjjjnNmczZ2YruLXy2A3RZm4MJQ9M/o9L/HaRv5/WkfFPmZ8D1+SCoE
	kwhyUHjNFaPU/3VbEzBIfa8iW1xQjGe9BCOuuZDb8A0218/LiXHyPbGlsOgPwhY3SOk+4e/ejlH
	oLwTmM0rA=
X-Received: by 2002:a05:6a00:948e:b0:846:a04:acdc with SMTP id d2e1a72fcca58-847a831fb33mr4758788b3a.26.1782926345049;
        Wed, 01 Jul 2026 10:19:05 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94ab79sm105719b3a.31.2026.07.01.10.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:19:04 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: akpm@linux-foundation.org,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rich Felker <dalias@libc.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Yury Norov <yury.norov@gmail.com>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Brendan Jackman <jackmanb@google.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	Michal Hocko <mhocko@suse.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	sparclinux@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH 0/4] treewide, mm: initialize node_possible_map like the other node maps
Date: Thu,  2 Jul 2026 02:18:47 +0900
Message-ID: <20260701171851.2447626-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6972-lists,sparclinux=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:davem@davemloft.net,m:glaubitz@physik.fu-berlin.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:dalias@libc.org,m:vbabka@kernel.org,m:ysato@users.sourceforge.jp,m:yury.norov@gmail.com,m:linux-mm@kvack.org,m:ekffu200098@gmail.com,m:jackmanb@google.com,m:chleroy@kernel.org,m:hannes@cmpxchg.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:mhocko@suse.com,m:npiggin@gmail.com,m:linux@rasmusvillemoes.dk,m:sparclinux@vger.kernel.org,m:surenb@google.com,m:ziy@nvidia.com,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gaisler.com,davemloft.net,physik.fu-berlin.de,linux.ibm.com,ellerman.id.au,libc.org,kernel.org,users.sourceforge.jp,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ekffu200098@gmail.com,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekffu200098@gmail.com,sparclinux@vger.kernel.org];
	FREEMAIL_CC(0.00)[kvack.org,gmail.com,google.com,kernel.org,cmpxchg.org,vger.kernel.org,lists.ozlabs.org,suse.com,rasmusvillemoes.dk,nvidia.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 837766F059B

While reviewing an earlier series [1], Andrew asked why we carefully
initialize node_possible_map at compile time, then zero it within __init
code anyway.

node_possible_map, aliased by node_states[N_POSSIBLE], is initialized to
NODE_MASK_ALL at compile time, unlike the other entries, which are
initialized with only node 0 set.

Architectures that use numa_memblks set node_possible_map from
numa_nodes_parsed, so the compile-time value is meaningless for them.

However, a few architectures that do not use numa_memblks do not set
node_possible_map on their own. Once these architectures set
node_possible_map to match their own topology, the NODE_MASK_ALL
initialization can be removed.

Patches 1-2 handle sparc64 and sh, which do not set node_possible_map
themselves. Both set node_online_map from their topology, so set
node_possible_map from node_online_map.

Patch 3 handles powerpc, which sets node_possible_map by intersecting it
with node_online_map. Nothing sets node_possible_map before this, so it is
still NODE_MASK_ALL and the intersection is just node_online_map. Once
patch 4 changes that initial value, the intersection would no longer be
node_online_map, so assign node_online_map directly.

Patch 4 initializes node_possible_map with only node 0 set, like the other
node_states[] entries. NODE_MASK_ALL is then no longer used, so remove it
and its only helper NODE_MASK_LAST_WORD.

[1] https://lore.kernel.org/all/20260624204030.3c8baa67713b6ca1d537baba@linux-foundation.org/

Sang-Heon Jeon (4):
  sparc64: set node_possible_map in bootmem_init_numa()
  sh: set node_possible_map in do_init_bootmem()
  powerpc/numa: set node_possible_map from node_online_map
  mm/page_alloc: initialize node_possible_map like the other node maps

 arch/powerpc/mm/numa.c   |  2 +-
 arch/sh/mm/init.c        |  2 ++
 arch/sparc/mm/init_64.c  |  2 ++
 include/linux/nodemask.h | 20 --------------------
 mm/page_alloc.c          |  2 +-
 5 files changed, 6 insertions(+), 22 deletions(-)

-- 
2.43.0


