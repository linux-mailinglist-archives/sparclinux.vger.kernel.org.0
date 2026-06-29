Return-Path: <sparclinux+bounces-6942-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7nBFLFZ5QmpF8AkAu9opvQ
	(envelope-from <sparclinux+bounces-6942-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 15:55:34 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C306DB97A
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 15:55:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Vf2MYgmn;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6942-lists+sparclinux=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="sparclinux+bounces-6942-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CD933048FD4
	for <lists+sparclinux@lfdr.de>; Mon, 29 Jun 2026 13:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A09A2F1FE4;
	Mon, 29 Jun 2026 13:50:09 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4332EEE69;
	Mon, 29 Jun 2026 13:50:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741009; cv=none; b=Rgm0x62titS27+MWGMts38e8mEFpTndXse4Cw7ai+QbrtvpTC7bJ/OazsPWcnMcuP5e9H7pHvgLgVoj/4Utp/1yRArUNgCgeg8f7rwTDNm1FgiwkmahMlmnRGzSFCcwG/AmUzwsVsyUPPsAudMY+16F+KaFraULWUVQZkRVZ1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741009; c=relaxed/simple;
	bh=yfdqNm6agvPBFNG363qrfW4/gRci3Wo6sGtKk5p+Jzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SF7mFfhlh5Au4+r91qEquZPipN6vOm8hTMd/JQkOBCjRjqmvlZzxRIytCgZ03iaBmMc+YU+wvgeG1sBtxthY7cPdMzzDbGxcL3NvY/d7AfFSGp533YNDIglhaPZRTZDEXrk+xtYRXEuR9G/A609hgplN7wj2Rs9g9Mrvg/CmNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf2MYgmn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A73E1F000E9;
	Mon, 29 Jun 2026 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782741007;
	bh=gjjJMx54/5mRHa6or1HyeyjorZNM+BytGl3Gs8yQG0w=;
	h=From:Subject:Date:To:Cc;
	b=Vf2MYgmnHnJJVCrzdE3LiX6xkrtsRgLA0cvEj/rK36pg/35cqiSMga/VEXNuykp3t
	 Z6NMsHvGD97MyaJfbJvH7NhPCEPIEK74VybXaAPjHA14RiEstBhgFnE4ooLTW7jdaA
	 NUwVZNW7BFA47VOviNcSOA84Qg/LziTLQuokvpmOXX9U+ya12o1/wjE3xg2a+PYzve
	 hPjYZk2pA/IkQyAK8JhAM1iKe9YLTRzNpvqb5mGiKnqAdPLI6+gEZWtJBz5hCIkj5s
	 h3EyYyuT0Sw5hUi/xzdquujJ5X2mMvXJik0T479QtIqLo4VXqAbKPMpCV+NrFE0IjE
	 /yPMyLxDTyxDg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH v2 0/3] mm: cleanup clear_not_present_full_ptes()
Date: Mon, 29 Jun 2026 15:49:46 +0200
Message-Id: <20260629-clear_not_present_full_ptes-v2-0-96089871a1e7@kernel.org>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPp3QmoC/33NQQ6CMBCF4auQWVvTVqnAynsY0iBMobFpybQSD
 eHuVhK3Lv+XyTcrRCSLEZpiBcLFRht8DnkooJ86PyKzQ26QXCquBGe9w460D0nPhBF90ubpnJ4
 TRjaYkyyre2cuOEAW8oWxr12/tbknG1Og9/5sEd/154q/7iIYZ+e6UqXpK6lkfX0geXTHQCO02
 7Z9APlxcpnHAAAA
X-Change-ID: 20260610-clear_not_present_full_ptes-df3258baf7ed
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Oscar Salvador (SUSE)" <osalvador@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:andreas@gaisler.com,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:peterz@infradead.org,m:osalvador@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:david@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[david@kernel.org,sparclinux@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-6942-lists,sparclinux=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80C306DB97A

While doing some review, I stumbled over clear_not_present_full_ptes()
and concluded that it needs some love.

Let's remove pte_clear_not_present_full() and cleanup
clear_not_present_full_ptes(), renaming it to clear_non_present_ptes().

Heavily build-tested, runtime tested only on x86-64.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
Changes in v2:
- Silence warning in patch #2 with architectures that don't use addr in
  their pte_clear() macro by using "(void)addr"
- Refine patch descriptions.
- Link to v1: https://lore.kernel.org/r/20260611-clear_not_present_full_ptes-v1-0-49865fc82629@kernel.org

---

David Hildenbrand (Arm) (3):
      sparc/mm: drop custom pte_clear_not_present_full()
      mm: drop pte_clear_not_present_full()
      mm: cleanup clear_not_present_full_ptes() and rename to clear_non_present_ptes()

 arch/sparc/include/asm/pgtable_64.h |  4 ----
 include/linux/pgtable.h             | 33 +++++++--------------------------
 mm/madvise.c                        |  6 +++---
 mm/memory.c                         |  2 +-
 4 files changed, 11 insertions(+), 34 deletions(-)

---

base-commit: fe61612214b618072b4ea3f5065a81296df6dd75

change-id: 20260610-clear_not_present_full_ptes-df3258baf7ed

--

Cheers,

David


