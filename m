Return-Path: <sparclinux+bounces-276-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7178F84A57B
	for <lists+sparclinux@lfdr.de>; Mon,  5 Feb 2024 21:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C5BCB2785C
	for <lists+sparclinux@lfdr.de>; Mon,  5 Feb 2024 20:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4AD1791E3;
	Mon,  5 Feb 2024 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e7OeJ7SJ"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019E11791CB;
	Mon,  5 Feb 2024 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159854; cv=none; b=nfQMeUMwajC+RMRc70ai2573YOroD5Pf4YlIcuiIca0sJmDs4xNNBriIudmryrIIXRLNuDmp9ylQmv+WXhbfdkXDQJsb9UBPms2Isw1gcSpZp36jaXUDfbE+Ew6lpmcxoq3Xo9PIlcWh3/hGhNVzXUqz+glKbAQPkqTF398WcgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159854; c=relaxed/simple;
	bh=nIlg0Ojr7ROSJ4zCSJfQ+EY2JGPU+IPkd+GLvdpsS1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYtj4IjjSaCL7iftzi1wRR8APecpE7YhwR5sS8+EMlpnoiI6k1ZBvco05xgsRdLn2c02vLTDQh+bFywgPjTrKOSIKjCcpz3i1MmyvJYHVfXYBvsEKaDrRK8RXv2BMefypVc73q70/jtUO/t3PLD2b+FFB02xN5PIG8d6u+eZe/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e7OeJ7SJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F52C433B2;
	Mon,  5 Feb 2024 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159853;
	bh=nIlg0Ojr7ROSJ4zCSJfQ+EY2JGPU+IPkd+GLvdpsS1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7OeJ7SJapvGVvMsDEF4oRzGXUs3Fbuf2JDioOytEkzTfDjjxv5yIbwfQCwtT+bip
	 R/suqKZDT+5qCsXR7EvYFLOG8lPvCsqOWP3W1o1syN8Zu14PyZExN5GjHnTSMKKj50
	 Pzm5vfWXXaUG/u/NAKYP/ASvHvJwAVeJJMtOAMYk=
Date: Mon, 5 Feb 2024 04:51:34 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sparc: vio: make vio_bus_type const
Message-ID: <2024020530-arrange-hertz-9e41@gregkh>
References: <20240204-bus_cleanup-sparc-v1-1-4ca7fe8de5f7@marliere.net>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-bus_cleanup-sparc-v1-1-4ca7fe8de5f7@marliere.net>

On Sun, Feb 04, 2024 at 12:19:50PM -0300, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the vio_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

