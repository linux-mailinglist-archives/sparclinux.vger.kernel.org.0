Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F5642AEB5
	for <lists+sparclinux@lfdr.de>; Tue, 12 Oct 2021 23:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbhJLVUn (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Tue, 12 Oct 2021 17:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60411 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234030AbhJLVUl (ORCPT
        <rfc822;sparclinux@vger.kernel.org>);
        Tue, 12 Oct 2021 17:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634073519;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9gTeGrsi2W3a53jAeuwmK0vZqpG0/BE4xVwWIpQUl1c=;
        b=VFvYUD6X4jylMsPj90lcrGlObpw8PiNAXuUiCuaf/VuF9buckFYNipcHk1Otbx9DNdBxWX
        09MafsM8+pZ6eCoPVxwFSIkj94yNDD0h3K6z6iaM41lmwINCVX6gkHE0Avn8G2FR6kZhNP
        iEUSFPEMzweYUQzGGLK5BOfQXVkLiGE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-LuOrfu_DO9yawvHky88VNA-1; Tue, 12 Oct 2021 17:18:38 -0400
X-MC-Unique: LuOrfu_DO9yawvHky88VNA-1
Received: by mail-wr1-f71.google.com with SMTP id r25-20020adfab59000000b001609ddd5579so295236wrc.21
        for <sparclinux@vger.kernel.org>; Tue, 12 Oct 2021 14:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9gTeGrsi2W3a53jAeuwmK0vZqpG0/BE4xVwWIpQUl1c=;
        b=Rex2/o40cY1dBQXgoWhvHNQwMirPDO//Op7nZXCcLwG1y4W/ex1T6ac1Fs8wSQj79d
         5onAeA82WcT6RY8WWJHdG0WPm4N+rMF/7VwX9oJJ/lGt+ZI5Utntwyc+x067YvV4KcMr
         C2drJ5poRNEV06BP+JCHl98xIhzrqhxFesR8yo0WyeqR9kRMi0pegDP4IUqTenvwAapZ
         po5sAowGVxth6xrdMUpx0+vSE7rSdc+eRGWpK0fRgNg4uElWuGaddS/eTr39x0pLVM2j
         7eKG5/FLBT1oTxeF31H1dOTX447E1oQShIAf+bC0sMlXlNXuEi8Ox5odBNaHudxfJnmf
         3irg==
X-Gm-Message-State: AOAM533fnuDiGoFk5sl5QqmK8cRFeQ3ANvfzAF+LrzcYDm0hyCQI3qO/
        v78U76OOneXHhQUolb/SYUVaEG4GcWATp30eG+8hQrjQYTFVqFZanXA+/eeYASHmKITN0aYiBVm
        yxC8bDWykJNx4ZppxEjhXyw==
X-Received: by 2002:adf:a502:: with SMTP id i2mr33893008wrb.311.1634073516958;
        Tue, 12 Oct 2021 14:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjGgSxkLoHx5w6cOxEFC0Oz/08nxpy9u+bE29gjEXJrmWnhBhSxvdOuRrJNEuQ5aFXEiU9tQ==
X-Received: by 2002:adf:a502:: with SMTP id i2mr33892998wrb.311.1634073516828;
        Tue, 12 Oct 2021 14:18:36 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
        by smtp.gmail.com with ESMTPSA id p18sm11430249wrn.41.2021.10.12.14.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:18:36 -0700 (PDT)
Date:   Tue, 12 Oct 2021 17:18:28 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "Reshetova, Elena" <elena.reshetova@intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Message-ID: <20211012171628-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <CAPcyv4g0v0YHZ-okxf4wwVCYxHotxdKwsJpZGkoT+fhvvAJEFg@mail.gmail.com>
 <9302f1c2-b3f8-2c9e-52c5-d5a4a2987409@linux.intel.com>
 <CAPcyv4hG0HcbUO8Mb=ccDp5Bz3RJNkAJwKwNzRkQ1gCMpp_OMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hG0HcbUO8Mb=ccDp5Bz3RJNkAJwKwNzRkQ1gCMpp_OMQ@mail.gmail.com>
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Tue, Oct 12, 2021 at 02:14:44PM -0700, Dan Williams wrote:
> Especially in this case where the virtio use case being
> opted-in is *already* in a path that has been authorized by the
> device-filter policy engine.

That's a good point. Andi, how about setting a per-device flag
if its ID has been allowed and then making pci_iomap create
a shared mapping transparently?

-- 
MST

