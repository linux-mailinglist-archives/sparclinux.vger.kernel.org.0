Return-Path: <sparclinux+bounces-1-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27787F5694
	for <lists+sparclinux@lfdr.de>; Thu, 23 Nov 2023 03:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 433BEB20BCA
	for <lists+sparclinux@lfdr.de>; Thu, 23 Nov 2023 02:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0E44412;
	Thu, 23 Nov 2023 02:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d65zgn+K"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A1C440B
	for <sparclinux@vger.kernel.org>; Thu, 23 Nov 2023 02:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B75C433C9;
	Thu, 23 Nov 2023 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700707907;
	bh=rRbIXqjq8DKBA6vW+7glleky65j8TQodsqrm6IeWtY0=;
	h=Date:From:To:Subject:From;
	b=d65zgn+KYrSo86pdYXTdWNX7bcTwAtusqSZG8/EOH9MDb1d76qSk8kDkvUD8uYKGe
	 Yan2h1Cwyo/oJVneyLaDXt/aF/5D5tjlZe8KwEN56SmISFK3QsUUpWo6h40zlqn0/t
	 KOo8i4Iybw140BcpjzjNGtpUlceBml9LdamQBaSk=
Date: Wed, 22 Nov 2023 21:51:46 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: sparclinux@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231122-enlightened-flashy-python-311f6b@nitro>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to the new vger infrastructure. No action is
required on your part and there should be no change in how you interact with
this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

