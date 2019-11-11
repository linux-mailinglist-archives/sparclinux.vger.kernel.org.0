Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1499F6FC7
	for <lists+sparclinux@lfdr.de>; Mon, 11 Nov 2019 09:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfKKIlH (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Mon, 11 Nov 2019 03:41:07 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:50865 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbfKKIlH (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Mon, 11 Nov 2019 03:41:07 -0500
Received: by mail-wm1-f42.google.com with SMTP id l17so11521031wmh.0
        for <sparclinux@vger.kernel.org>; Mon, 11 Nov 2019 00:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fHZyE8Y/b8/GHffAqrPVxeIUbjpAPExpWpCVapn1zRs=;
        b=GGcUwzWMI30zR3zzL3Dd51RVCN7QhF9Gywr088MgsZeIMaVjBt+6rFT/fPdKegOdFA
         xnmqWYvAo6PaUKE4zx5x38NJU+YHygWTsvPAL169sJbdpY8iWQJmaxt6wtPn9pEMtraj
         JjLK34uYME6RrMLi6zvFUbIH3GYk7pMSb+qJxrRlIox+GN6vUq98YbUZH9VzKNuBUNep
         w0qLcEvfADIx1995pAKdVIAE3v6Rz6TZ0NlVas/gWYwe/W55hMd/vzJrcftSNSyTCxO8
         9IJtdT/F+7UB3KL2zfuDZb/VSWM7+RN5vWVRfm6ocjdXQW6Cs4jKYUQZi/i1/30GMea5
         phpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fHZyE8Y/b8/GHffAqrPVxeIUbjpAPExpWpCVapn1zRs=;
        b=Nm3w9NxXMLwoBQKAOIKDT+gxI9XSSY1z9D3jI5fjhiqycqWbamchL03+XPxuumW5eE
         CL0OYrvK53vhXTFmCvWx+Nx0EPWAk/2nPT/zuFxL7QLlDSKmifCpp2A+26BncuZQn0iQ
         d6JR/+JQmoUHQgNfJvxePYZOWGPf6Q2JXH+dY9/oTRIDqn8SckSFxpy/PoJAGiiS3ybp
         jN1X0Z77hbapcSdt/yVQDZjouG2nyvXInChnntfXDV70g5BeyMJVu0F9uwaGxhpoOsm/
         PQ/CEJnr3o/9lXh3VcmU94Zr2V8ZrDm9lTu0TGDoXA9bSQctMQNSMTv53bO3KjSg3/IA
         u4fQ==
X-Gm-Message-State: APjAAAU7WimmEFCYjZ8bucnmPVaA0eZbbkB5XTAu9peH57Np3Z5cWmua
        pReJArbamXHfrDh9WvRgtn1rQ7VHDZA=
X-Google-Smtp-Source: APXvYqyYxXpSsfbYQwWrLdnLfBzUFE5L6oQoC05Z3sgSlHmWv96hgSucSAPFAT1/nVg0u6XrrV3kNg==
X-Received: by 2002:a1c:f317:: with SMTP id q23mr18617215wmq.97.1573461664231;
        Mon, 11 Nov 2019 00:41:04 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id l4sm13422936wme.4.2019.11.11.00.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 00:41:03 -0800 (PST)
Date:   Mon, 11 Nov 2019 08:40:56 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Tuowen Zhao <ztuowen@gmail.com>
Cc:     sparclinux@vger.kernel.org,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        acelan.kao@canonical.com, mcgrof@kernel.org
Subject: Re: Fwd: [PATCH v5 1/4] sparc64: implement ioremap_uc
Message-ID: <20191111084056.GH18902@dell>
References: <20191016210629.1005086-2-ztuowen@gmail.com>
 <5c5b9dec7ea401fffa13446af2a528cbaf6e1046.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c5b9dec7ea401fffa13446af2a528cbaf6e1046.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Mon, 28 Oct 2019, Tuowen Zhao wrote:

> Adding sparc list. Sorry, first time missed the list.
> 
> Looking for some reviews.
> 
> Patch set: Fix MTRR bug for intel-lpss-pci
> https://lkml.org/lkml/2019/10/16/1230

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
