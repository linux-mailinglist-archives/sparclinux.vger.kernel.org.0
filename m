Return-Path: <sparclinux+bounces-3166-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B8FA39969
	for <lists+sparclinux@lfdr.de>; Tue, 18 Feb 2025 11:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0113BA7A0
	for <lists+sparclinux@lfdr.de>; Tue, 18 Feb 2025 10:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B204523717F;
	Tue, 18 Feb 2025 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ha+WLSHf"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9CB236A74
	for <sparclinux@vger.kernel.org>; Tue, 18 Feb 2025 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874772; cv=none; b=Yieb8S9zeGyd3YvZDeDVUMausmLflV8F6WBdqmjsydr06YCTcgoNiFr1yvCK3kKQFTnD1NM/mQGNFCwK3XdCu2QUwGRo7vN920ntgwKmK8TyfXRewQrTgjMoKXLP3zBcc1EzFF421LcEB9lB6XTJkMod61+zqNpsqi2BWEyiOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874772; c=relaxed/simple;
	bh=+uJBJa3r0XtKsYWPNH5y8q3bsTHuktgUgmTyXtel/ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f71AiiJd8N/lEWlZb4/IgWn9mebKBh1cQMvvulKkI1U88UvcW1bta2OSqGC/BzaCiPLcHPISMa/j/xx3iaQ7spyW4z0tDHWPxmIwLSSmRmlBt1rLVxjhFWasBRzuKns7LT0k9RgLCverlti8kZCo7rkbaCqUhe27qV7cwhkeBhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ha+WLSHf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739874768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zl+t4KaKTs9+cWw6JHoz3j9vod1OhAsIgp3kjHQDp0E=;
	b=Ha+WLSHf2eQqouT3KBJjcgr2YoG7foL/f/jnHRr/h2FHd2a6y3zmqRucTFSr7QlrIlIjL/
	3J98COoFyQnju3PVO13EOelIe27Y/nM+uh0P6BRcS+Jcgp3SgAlHy3ECDhJpU0z8/aKkMA
	3dEbrPAuChIHkAT85KIHX1QWT7oDErE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-D-0HYtXUN4Sg3MKkuUmf6A-1; Tue, 18 Feb 2025 05:32:46 -0500
X-MC-Unique: D-0HYtXUN4Sg3MKkuUmf6A-1
X-Mimecast-MFC-AGG-ID: D-0HYtXUN4Sg3MKkuUmf6A_1739874765
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f27bddeeeso4192460f8f.3
        for <sparclinux@vger.kernel.org>; Tue, 18 Feb 2025 02:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739874765; x=1740479565;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zl+t4KaKTs9+cWw6JHoz3j9vod1OhAsIgp3kjHQDp0E=;
        b=c2v7dFr+XM+8IzjfRXOaQRprXegE7boRT8qJwhMnU62NvcktayBbGaLgx0cCVhk1yo
         1Ib9Nur0bzVN82xuhotzrB7Jep4asmRWC5H1sL/XrGQ/+i1N8/w0Aqxojj81LW7aKA5h
         Zzm+E3j34Gck660VwpDWHvaPA2ut2t4OjBKtvOXEX4aB7ZeHzZNIkjwjeg6nAgpos++V
         dd+dsnPwv4K2GDmh19ITZ6sisHMw9pbuesKFNxHFz2YaY/vMCeRapJ+ujBr3Sy1c2eMM
         /AWmDqk1OLVUAa1WuG02O17zH4Wj2AqjI1BXZMgwlebNURxpp6WszmKO3AXK25n5+6FK
         Ln8A==
X-Forwarded-Encrypted: i=1; AJvYcCX4IXdMA2lAJGTb77owDjF53NQkSE6j4ug+SwjWnTa2KtFyywfWBjyK0lVLRi+qpemkKHOKi1p8xIrb@vger.kernel.org
X-Gm-Message-State: AOJu0YznVV5hac2rmbYSy9KOdqZwIPjdGbyNtKXB5jbP/K+BTKuTlcvH
	O05L47UifZb7ei6AqVV+nN07H7cjALpgxH7zgO+x+kVFElcFZmbisxDrWRcQNt4MMhZipMrQ55N
	yNe8qADcRbyuT0q0CuahMonMCOfMYb24ZqXu4zKzkykCJtuQD3HmpYMZx384=
X-Gm-Gg: ASbGncvR5UrYTU2XZfxWWengg1aPg3L0M+jN97zOZQ6f9HxbwEDsPd1MWVm9muYavRn
	M/hzKH7F6x06MbTDoreV7j9wxORaOIjr9U2lwlC4SRZHYFo/PgrWLPrB1lcQzK819ziGSVzjaDU
	GYDf0NeJSwDl/SK7w4KBtAtXL2RH4ojlRT/nwI1VwT15lj2XbNsSaKz0dHvGTsuhG0NCgBEEkTq
	4yl+d/QWXUDuA99gCIMI1VBek8NhXwx2aje26oRzbuAXuzo0yzn+SranlzzC3Gx8gbwaqwRt/Lm
	1xaeW2AsQFLQc+z/vDECQIPcMihOTvet3U+jKfSCX2AQ4XOTwyh3X/9vzTMbbcTcuRluL+Kt3Er
	zUq/1PMM79TD4NLLMChA5XDO/Db4xsO6C
X-Received: by 2002:a5d:444e:0:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-38f33f50c03mr11146142f8f.36.1739874765508;
        Tue, 18 Feb 2025 02:32:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFoZP2GHZ6yD/enVlIVfGFoZuVzgKIlrmVpkt2wTKjnhpYW41AK3ZcwVNJXA3ZnS3Vw67J9A==
X-Received: by 2002:a5d:444e:0:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-38f33f50c03mr11146116f8f.36.1739874765191;
        Tue, 18 Feb 2025 02:32:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c70d:fb00:d3ed:5f44:1b2d:12af? (p200300cbc70dfb00d3ed5f441b2d12af.dip0.t-ipconnect.de. [2003:cb:c70d:fb00:d3ed:5f44:1b2d:12af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7df2sm14623376f8f.84.2025.02.18.02.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 02:32:44 -0800 (PST)
Message-ID: <4d38ad6a-a7ee-486b-a189-aca575eaa654@redhat.com>
Date: Tue, 18 Feb 2025 11:32:40 +0100
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] mm: Make mk_pte() definition unconditional
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org
References: <20250217190836.435039-1-willy@infradead.org>
 <20250217190836.435039-7-willy@infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250217190836.435039-7-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.02.25 20:08, Matthew Wilcox (Oracle) wrote:
> All architectures now use the common mk_pte() definition, so we
> can remove the condition.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   include/linux/mm.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 3ef11ff3922f..62dccde9c561 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1916,14 +1916,12 @@ static inline struct folio *pfn_folio(unsigned long pfn)
>   	return page_folio(pfn_to_page(pfn));
>   }
>   
> -#ifndef mk_pte
>   #ifdef CONFIG_MMU
>   static inline pte_t mk_pte(struct page *page, pgprot_t pgprot)
>   {
>   	return pfn_pte(page_to_pfn(page), pgprot);
>   }
>   #endif
> -#endif
>   
>   /**
>    * folio_maybe_dma_pinned - Report if a folio may be pinned for DMA.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


