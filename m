Return-Path: <sparclinux+bounces-6214-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C/1J/SFfmn0aAIAu9opvQ
	(envelope-from <sparclinux+bounces-6214-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Sat, 31 Jan 2026 23:45:08 +0100
X-Original-To: lists+sparclinux@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D985C4407
	for <lists+sparclinux@lfdr.de>; Sat, 31 Jan 2026 23:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D804430054E2
	for <lists+sparclinux@lfdr.de>; Sat, 31 Jan 2026 22:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79102376479;
	Sat, 31 Jan 2026 22:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NALdNRVY"
X-Original-To: sparclinux@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF99836AB79
	for <sparclinux@vger.kernel.org>; Sat, 31 Jan 2026 22:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769899506; cv=none; b=SONrZoJ0dZXXovvF2czWrh8ufnkGXCQxdEdChhiIH0YIwEk4oB/d28eM9uoqKN4hBJCTQN6RvQAqCE9rrjSTYihjO3iEt32OyAUHESqgZX/Du1fV+YHL7FwCIaJ2wE/FSIHHDZ0XhH0GgPICZAHXmILg2PrTEExHdZr998Az1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769899506; c=relaxed/simple;
	bh=vj9KzDQ8pbEmM59VbkkSTwe/l9ZYsPVdEfuACv7077U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fARaRXVoCfPq+8PJlNgRC3vK3M697uX1uWXmtZOP7NgUfN8pMAhm2TEj/ltdJoDd1T/H084xBtw/h8+rscOOoX7V0kRq1nqM+YHIsGdGwWdvZpwuh/3Bh9gbvQL/SJ7ZKLnECRxL+0jR79D4xeQSY7RAWzrn/9MJSj5mYFyZHvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NALdNRVY; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769899492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SM87LpUC+3IR2vTANL07qz7fL7oEl904Az/N3IIT/eY=;
	b=NALdNRVYBvVli+daj7X6NNDMtk6QIuifFk43V7wboDdJvz4S6O+0Fxrovy6Uvg3ZIvgpSf
	7wWnFt3EY+Prlq8t6x2TiDkKB6l2crmjD+ZEz4zqfirO7paPmqxeQVdEd8YjJWJtEMg4f+
	Kg8nRt9qHwnchc/pLtmQGpOM7G0kUuY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sparc: vio: Replace snprintf with strscpy in vio_create_one
Date: Sat, 31 Jan 2026 23:44:11 +0100
Message-ID: <20260131224413.559324-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6214-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,sparclinux@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[sparclinux];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8D985C4407
X-Rspamd-Action: no action

Replace snprintf("%s", ...) with the faster and more direct strscpy().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/sparc/kernel/vio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/vio.c b/arch/sparc/kernel/vio.c
index 1a1a9d6b8f2e..8c7dd72ef334 100644
--- a/arch/sparc/kernel/vio.c
+++ b/arch/sparc/kernel/vio.c
@@ -12,6 +12,7 @@
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/irq.h>
 #include <linux/export.h>
 #include <linux/init.h>
@@ -378,8 +379,7 @@ static struct vio_dev *vio_create_one(struct mdesc_handle *hp, u64 mp,
 	 * the parent doesn't require the MD node info.
 	 */
 	if (node_name != NULL) {
-		(void) snprintf(vdev->node_name, VIO_MAX_NAME_LEN, "%s",
-				node_name);
+		strscpy(vdev->node_name, node_name);
 
 		err = mdesc_get_node_info(hp, mp, node_name,
 					  &vdev->md_node_info);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


