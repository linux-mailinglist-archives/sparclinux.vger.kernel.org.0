Return-Path: <sparclinux+bounces-265-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DF84A55A
	for <lists+sparclinux@lfdr.de>; Mon,  5 Feb 2024 21:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBF2A1F27A59
	for <lists+sparclinux@lfdr.de>; Mon,  5 Feb 2024 20:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37538178238;
	Mon,  5 Feb 2024 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0V1jmYS4"
X-Original-To: sparclinux@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA8C1741FA;
	Mon,  5 Feb 2024 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159853; cv=none; b=VZtGcKMCk5qf+g605HckV0Mf/WMJv2dSilR1U6SjIv6eUdLNaLYtMriayBo3Mg4GFtXb4KJrKXosdmhRSLiwXVrCDJa0OIyDXvMYyDCVkT9YI4xU9u/yWxLIRJ+jUjeE3vrpq1rRvkGx4Zy6ScpEbxAkpo0KM+pjwSh82yvqT4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159853; c=relaxed/simple;
	bh=nIlg0Ojr7ROSJ4zCSJfQ+EY2JGPU+IPkd+GLvdpsS1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CD1i2Hdtn2geg6rt6f6wpcqGniQlaXUgjEPtIsq/HwtIop9yBCNERsVJ8Q1reMeWFKQGk142Qut5bGm4Rqo9Nwa2BrDsya3Lb3u0AuNCaxeJt64OqQNpRkunLbqQlsO+emAi2CffTEtCn4FZKscHjTUjWudSgmsKMJJJR/pPupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0V1jmYS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80001C3278A;
	Mon,  5 Feb 2024 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159852;
	bh=nIlg0Ojr7ROSJ4zCSJfQ+EY2JGPU+IPkd+GLvdpsS1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0V1jmYS4HmaK6xg/wSeX0H9MPCaohVnlEgK4AazxwYD9Q6IKxktyVLF2mMliyxGed
	 u9m+wbajdTvLoeq0Fx0Jl5nWcDyRteIMgB2ezLh6ihWB94aojuXinaOIlxhX67Klo0
	 zdgbYvdTBwn8OtTivE87+y46tI0P6n7CKzfv9T04=
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

