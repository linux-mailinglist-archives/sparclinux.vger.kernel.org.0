Return-Path: <sparclinux+bounces-280-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A44AD84A571
	for <lists+sparclinux@lfdr.de>; Mon,  5 Feb 2024 21:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8591F25CC6
	for <lists+sparclinux@lfdr.de>; Mon,  5 Feb 2024 20:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFFC179A2A;
	Mon,  5 Feb 2024 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y0MuN3we"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9E179A0F;
	Mon,  5 Feb 2024 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159854; cv=none; b=sEXibqK+tws2LrlXLwv+2GCEdn/gspexxsWgjeG6qk7MkipcoHUCChcF48SRklNR0V1LBlZsFIcS2rXg/IgmV6ccWBVORzrJIT+ViFrM5UPWRpb8gi2Wgr/Sp2pXnZljGfReZMLzb/EIR4i71xBszqHBQwY/z3JaXzHxLoF1aBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159854; c=relaxed/simple;
	bh=nIlg0Ojr7ROSJ4zCSJfQ+EY2JGPU+IPkd+GLvdpsS1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYtj4IjjSaCL7iftzi1wRR8APecpE7YhwR5sS8+EMlpnoiI6k1ZBvco05xgsRdLn2c02vLTDQh+bFywgPjTrKOSIKjCcpz3i1MmyvJYHVfXYBvsEKaDrRK8RXv2BMefypVc73q70/jtUO/t3PLD2b+FFB02xN5PIG8d6u+eZe/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y0MuN3we; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12687C433C7;
	Mon,  5 Feb 2024 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159854;
	bh=nIlg0Ojr7ROSJ4zCSJfQ+EY2JGPU+IPkd+GLvdpsS1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y0MuN3wegIbNRlHOi3a51LhZ5LtCyKzKNQieAk5+C9ioXdSvnaCsIBUBbNvWIMMau
	 DolX8d2NyzZ3CvF4mEv87CU67LzQXf42F0cRvkQ+TQIIwGBnC5jwTc/PTJiTySHPNx
	 A5OaZGgywavxcUvobF2EZA7w9rfA4DxgY7PqKQyQ=
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

