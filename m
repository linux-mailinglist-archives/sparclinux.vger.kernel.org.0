Return-Path: <sparclinux+bounces-7043-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rSgVN36HT2p4iwIAu9opvQ
	(envelope-from <sparclinux+bounces-7043-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Thu, 09 Jul 2026 13:35:26 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B7073069D
	for <lists+sparclinux@lfdr.de>; Thu, 09 Jul 2026 13:35:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QY+QAjG7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ClypiPMB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-7043-lists+sparclinux=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="sparclinux+bounces-7043-lists+sparclinux=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59F4A31AEA1E
	for <lists+sparclinux@lfdr.de>; Thu,  9 Jul 2026 11:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3316741167F;
	Thu,  9 Jul 2026 11:15:20 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39AC409631
	for <sparclinux@vger.kernel.org>; Thu,  9 Jul 2026 11:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595720; cv=none; b=fEfJS90lx4JYQsrZ98c3fgUso8tCb0QNp9Fs/nM2IKCS3FUEEOS/Gs4AZhyvh1v051PRMQezU3v/qYxi1o9EwWYo/mQCKzNrDUAlaL3voEzSvqp7Zdy62UmO9g8Vr5ayuaP61qLJ3eELm6H4PIBTkbX7INLSISUSdscXIQAQBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595720; c=relaxed/simple;
	bh=hMQxGqDMYjVKngpsQDGYdUmnvhAEUJmuhgzHeTWQMzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGkRzoYH/XN55y24mkmQU+I4dOCk8GlUgTSyAYMg+60GTh/tXu/PveGnY+Xl+1nVi1hbV94+uluoBikB5BKZctPbO/cn+dNMv2dxKWFsqi4XFJMhJsySCtvRu3sSyY/z2EDZzOWgTZcS2nNIkyjkknaVTBCmsy4Diw7o3EBZh+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QY+QAjG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClypiPMB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax5VZ1434441
	for <sparclinux@vger.kernel.org>; Thu, 9 Jul 2026 11:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+HMbGg4SL+5U70oYYJ2l7pisY/QrLqdUOSZy/EbODI=; b=QY+QAjG7JhI01DOL
	wrAWMBSfa2EsIJlZOBwNOpqR74GzzqMsWGKTL1nRLElce+kxLmPXGSEYyErRT9bs
	jrNUZ5qVhOMFlBS0g8+r8Lj5pkWx0HY2wr4Y4a6rA/soxkxGEv/GhwH6BfRMk7jC
	wxIkHw7CzIPD4C4hy06RY+nKd1hJsp9iQzkVAWdtTEM+7XcTYBvK6npbb6yBBaJ1
	CW4Qj8HEgGXE+RZq1+7fNu0Wd4ijs3A5FZcUaa9zPvqhQLDRRhC6VCASBWFqdB7d
	2iZ0nRAY5gwJd6YOiD4NmrqJffwjsCb4nFAr/D46CSDxbk0OC7RRzM/ZY22CoVf3
	XPhT6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwftuwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sparclinux@vger.kernel.org>; Thu, 09 Jul 2026 11:15:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so15138171cf.3
        for <sparclinux@vger.kernel.org>; Thu, 09 Jul 2026 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595716; x=1784200516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+HMbGg4SL+5U70oYYJ2l7pisY/QrLqdUOSZy/EbODI=;
        b=ClypiPMB6jKo7P5sHj1+Fv/mXETxyK3+/EjkqAnWwmoljqJN7QXJfOu8CAfraZuH3g
         GuHZWt2bIkP4U44wALzkgkjYxWaBQ3fW+Yq5AbO0jjc+qEBexV7WJs8/CmDA7BeTm53A
         rxfFuO9zHrKoCIY4iI+9GnJQGaMoeWyiwzOu6GNJMrqZ8bA7V2QfivjkLOmFR/SVoHy2
         6qZUS0aKJjZDlw8GsTVqQtLrEL3ML4LFs70Oeu1OV7Bkv5tcqv8T/kxWXEsdum2EALmV
         hAiM2NdhGskiXJxHuFYFjT/ROa1oISdR5APSgrrMBfRwTK94dnkpoY525IwBv+86H2Kv
         +ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595716; x=1784200516;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+HMbGg4SL+5U70oYYJ2l7pisY/QrLqdUOSZy/EbODI=;
        b=QC44qS6Oe46/OBy13AuEtUiHhOM3rMlcit8BUAnP45GuV9JlCgLTwc23QKaFm+YNQF
         gv0+3Xe7ENxxbevP4gEPEByvG9fYMfY4uJ4Jr9cB+V8+DzrtwXvCNgaibreSU1nO1RcJ
         jhhF2RuPv7mgqNys+juqeWSJACQoHpCZk5kknWlgT6OU7hVJ6oyIEfnfzdta89UPK6+3
         5XW1iNOfO9H9AHIksNfwKEjY7pKwv/eY88aN8dFI21KeLoByXDBYCGRaLTURLGMbc8lO
         Bm/qCSafO1lZMKaMNCW8Vq5smrS6QKp+LV/F9bhd9smGZZiJsdG9LqHtZTrxj0JU8zw0
         vw2A==
X-Forwarded-Encrypted: i=1; AHgh+RoUh01mxekmPZvgcerR/cFjvs/Bu5tZu3WCNo/JvTciz7d/7bWFyebd/VLpp4TDVEtPqQXs7ww3zkws@vger.kernel.org
X-Gm-Message-State: AOJu0YwKGEiuNL3tm7H5LvZPb7sk5oezT2aDLP8lEN41ibtfYhmsaSok
	RaMHOMRn4mOWIDn66LcIEdcg+T7dtKybFKpYf+4+ws7g5BPxEJ7Ypzh0R9WYvU9LeIDm71hPL++
	oIlLK4bkKguF/dqGrez1Sh+B6QSG/wH1gng9bW6PKE0DUxA1lQuCrIJeaJS3YjwVA
X-Gm-Gg: AfdE7cltjgql8b/gmJrRhqSXqHOgUKEhzeORssRWhuw8QbhlhgcnKMrdWcyohqXkKGx
	BPnFAjhYJlNRiKqNPj7EuW6zYrKSzKg7k8wM6z2XWXtymbsMQ9vKUDY5d3iiJqyJBBvAjLE/93P
	clvARVOtdb3Hd/i8J8B7AagWwKppswUoG7D7yiZGNe3WiuiLUD79YXOkrpoj3I2paVt/tb1WP2D
	nSfF3dxTa6mT/2RdQlalNfh3zog3NfhIMiC4vdTRig5xdUP7CKttuTRalLEujRJ+6FGuLypg1lU
	yqqpkPgeMUdryDI15YTSYzQHsyIBn/vfQz/7i+pUttBNwXjcCsXo1SFxkQO1GHE4tH2nMFhpo3G
	EkF+VNE1nlgKSTG1evjvKjflLrVgDaC/SzDpaf1YefNNS9mzJ0cumh4GRUP5TdA==
X-Received: by 2002:a05:622a:58cd:b0:51a:89db:95a4 with SMTP id d75a77b69052e-51c8b2bdfecmr69627421cf.6.1783595716221;
        Thu, 09 Jul 2026 04:15:16 -0700 (PDT)
X-Received: by 2002:a05:622a:58cd:b0:51a:89db:95a4 with SMTP id d75a77b69052e-51c8b2bdfecmr69626741cf.6.1783595715754;
        Thu, 09 Jul 2026 04:15:15 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm49838232f8f.14.2026.07.09.04.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:15:14 -0700 (PDT)
Message-ID: <954fe87d-9d43-4819-9f5a-eb0e5e5affea@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:15:11 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 03/18] entry: Provide
 [syscall_]enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190253.816918647@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.816918647@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX7Mgy5tdkhZHl
 83TsdXvUZmxO3EFpRqolMDwp8zKTtpNmpcn3VXpU7IfXZp3se6n3Y3t5xyZFP49uzY2vHb2fTvp
 1eLKZUw6LExLWQeG23Pq1aqQ+LyIhjJl3N8VS9nwzzHYDVK+iIqCJ4O/P81CjhrCbjIjwIsyM/m
 8O4TFwTHD1yxFxhnPesYvL5/E/QYOyzr/6cGeMsYW+G1fbn7G2Zez5uxBNb4oekEUA3bTqrLJ1q
 KtcUxPCsJn1hrRkeYfr4ojtk3+3cqZjlfPf/Iy/iJ1WFL8t1uC6U8zf572vuUncaZOTB3vfhTn7
 jjwEVcJim9mvlw2YIlyQ8BX3B4ZwXApK7qg1ul5JBcEnIwIRb00B5qGaGUXUN/UHZYCLe0N19aG
 rYvw4Xx7VFVRm2SGQf0QehMXgyEMtujInLDqRwLHVh31eaViMZ91uHV4q6VGYxj5avdnhfn4wvS
 Sy3B6W/hEUCQEXKz58Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX6MGNMRRKhB0U
 GJd1GqM2U10zx5AzRM7pfD3Y+fcX1OQg85V8byb3Y7Zh65UhfxBsEVwUUK/kAgkc19axfn94xI3
 +6ziwT9tTU0NhAYtsQ/gGLi89hZcRA0=
X-Proofpoint-ORIG-GUID: k5ls1jNbShW4490mLKIaYZWOIgTRWW0j
X-Proofpoint-GUID: k5ls1jNbShW4490mLKIaYZWOIgTRWW0j
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f82c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vLKI4MkW7k7maJ7H7gsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,sparclinux@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,vger.kernel.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	TAGGED_FROM(0.00)[bounces-7043-lists,sparclinux=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
 l.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,sparclinux@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[53];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36B7073069D

On 7/7/26 21:06, Thomas Gleixner wrote:
> Randomizing the syscall stack can only happen after state is established
> via enter_from_user_mode() or syscall_enter_from_user_mode(). The earlier
> it happens the better.
> 
> Provide two new macros to consolidate that:
> 
>    - enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode();
> 	add_random_kstack_offset_irqsoff();
> 
>    - syscall_enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode_randomize_stack();
> 	syscall_enter_from_user_mode_work();
>      
> to reduce boiler plate code.
> 
> Those are macros and not inline functions as the latter would limit the
> stack randomization scope to the inline function itself.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>   include/linux/entry-common.h |   56 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

