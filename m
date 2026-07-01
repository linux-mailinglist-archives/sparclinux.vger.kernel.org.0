Return-Path: <sparclinux+bounces-6968-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jAfWGavHRGp40woAu9opvQ
	(envelope-from <sparclinux+bounces-6968-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Wed, 01 Jul 2026 09:54:19 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B43B76EAE2D
	for <lists+sparclinux@lfdr.de>; Wed, 01 Jul 2026 09:54:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HMfEvFRx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UQU2B+oo;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6968-lists+sparclinux=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="sparclinux+bounces-6968-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E430A3097718
	for <lists+sparclinux@lfdr.de>; Wed,  1 Jul 2026 07:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6143C060F;
	Wed,  1 Jul 2026 07:50:45 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E323C061C
	for <sparclinux@vger.kernel.org>; Wed,  1 Jul 2026 07:50:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892245; cv=none; b=MlVtl1UXuVJtCBiLvvD1kDrkuNnwuvzf2HFkuI7BaVAmp0bjXYyEdHyodiuXEjvM9+HUrnRc0dCYVZ0mL49j4dR0Y9jszuNfimIzv7+I6BIl/JNfMWBDQX3/SJMQW+cAsR08gXh4rl/gh4b9z3PMBdHBmk9ssExiGndJaB8Fiho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892245; c=relaxed/simple;
	bh=93sm2BTMOedB4laJKM79zV17PWAvrYmlViJMtNY7qBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maE2XT0jMmOJvs94aIwTcKBaRIMucAhljy47KQmq9nXsNKtyae+VF5C1pcsoMbK8Op1hbsG00qhndA/cl5DsaNXbHn8eerVkPHaO+dWhvd+obMlyuQy9DinisLHMaVJQwf8DPBSjVzAITe93suJWDvoXwqMKVFE1HXc9A6Wac5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMfEvFRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQU2B+oo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lYaN025812
	for <sparclinux@vger.kernel.org>; Wed, 1 Jul 2026 07:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=; b=HMfEvFRx6nTIAtVE
	sL68tzthEIkQnLnX9Rc76Z+NLktj5+RvYSmZqPoXUEE+E5o+LkIIfuBJhwlpfY+J
	RMsiwlNHkpZV8rVnPyoGGxfPrNXNI5lgDH8tqDgvkEi0b2grHF8dSFgpODSc72rh
	0EjqgCOhK8TjyWAMMdGQRQAKFqqBtvWcjIDdgCvtjeMJc+b1syAik1phPUjpeiHT
	+mHBBG2Zs+XrFMXA0iCK41ffFLvfiku70zwRFhoOXlj4J9G7qR2SE7MvpJEhyGW6
	6kHzfxIseJu5NpodNx6tFH/VgtdgKXREk5GcvUEPZwLchVew9XyUnsRofUu/umcl
	K3tSsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd3j6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sparclinux@vger.kernel.org>; Wed, 01 Jul 2026 07:50:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so48251085a.2
        for <sparclinux@vger.kernel.org>; Wed, 01 Jul 2026 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892242; x=1783497042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=;
        b=UQU2B+ooJr/twS4oahz3htXdnnF3e6i10vSkp7Hp6khwUwMlT6iNMZ41HMC8HC7hEi
         9tL3dsjoavlnFu6jxslBE9BKGMYyV5633hg63uZvuuyKCO60lNyYW7u36mmuWtfl/Sxe
         nIYRxA+Aa2G3QCkDwtOvEejxN/GEeSfkRltRiStvs6iiGMFaz5TsVgLCmFEkBojQ1alh
         8lz9ETZkVhf6MaZ3HrxkgZQL0aNsyXa1ZzA1fsJ+i0PvaiRLe3/ptpQ6G4id87toVYgw
         /nWnCSD5sBW88HXXqGbWJa4NRqOq/vpwkOm+H/o2Jgj6nwx/UBrpf2/itoqCTuM66Hps
         60EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892242; x=1783497042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=;
        b=CmnR6dDE75URQJFgosyJb8Pf02NHJfSDLFJC4rAyUGZQfjeqIuEzc8TPJoQ73/Ku0f
         qE3bzo+L6IIlkFT3A9S79mnRYqu/ruY976l5Dxr61OeLUTgzchdnCITYfG0k2p5ZuVIi
         c/6XuMOfc0vS7UHXFbQe/4AGUz3o1l20JcUCg/cAbX4pP0oqhmFhb02mo00ebdHxueWQ
         ZWJhzHbruFDKIgRvz41PZBZ/CFvqBtgkToWkmRKIp/QHLd/gE4dghVu4k06aGKcE0bX+
         9s/bOiroVde0RNRFFPoxZzbYVm4MxCgAszgivqtjW56RRw5j3zC4uWfUBLaxLC/X2uVW
         Yo+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ueqVIx/RNQmqeH0ldRsVbHHZDL8KWCoCpDabFLi6d7nsQV1aSLlaO8EStnaiwHwem5s0t81YQ7dyk@vger.kernel.org
X-Gm-Message-State: AOJu0YxLvV+vob0kNCoSXPyHsFNncHuOYAfqXSA9x0KtvspEu8JOCttD
	qY6yyLzSnLF4Vz8l7TZ1UZc73Hpptf/s80V+5VtaPHSGWaR/zxfwdIYFGtp5jShTQbT0NlJ+YQn
	gRL8maUu1cxd/CqGsdRSmW+aufb67MU6uoCfQvaR9E6+R8M9KVC9r17A6FOnODnbR
X-Gm-Gg: AfdE7clh9GZsiBx6hiGqS4eggMJUVt3a5FKRUKuyBnnCxaqkmYcxGH5A1gMyNlrri2A
	zSOdq3HZB6hKl1d57rHaOV4FPog9upXg5H4nSIPOGfC4Fp9iUJw3L7ChOBuFWIag2LQV8AK7Rdr
	dIneYKMqU46AVJsgDOoQqT9oL4ZkkAF1oE3DucvELGWpDPcP5ePAIh4hlR1vB98HuceK63qVzjH
	tRjU79uf6mEb6VSgcHeXzgHLY5Htp6gSYFK4FgZjw28AKFG4QyV+WEhP9v0zmv9ACrPtOe/zsoi
	kwvK9KJjby/k+99aDZrlitI+EuRv8QBEElUt55MQS7CMQu893wGCCu8pRPMZk/J2Hf/dUT9aCXT
	Q8aGjt00CA/giF/rXn3hOPyTyyuYxKBjJ1wW9671rt/H45SCIsyQQWYJ1uFTbGg==
X-Received: by 2002:a05:620a:4504:b0:915:8502:f7fe with SMTP id af79cd13be357-92e781f1943mr80047485a.15.1782892242431;
        Wed, 01 Jul 2026 00:50:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:915:8502:f7fe with SMTP id af79cd13be357-92e781f1943mr80042985a.15.1782892242042;
        Wed, 01 Jul 2026 00:50:42 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be82fd71sm77836705e9.15.2026.07.01.00.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:50:40 -0700 (PDT)
Message-ID: <b7922ba1-60f0-4135-8b86-e414c058a135@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:50:37 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] sparc: vdso: Respect COMPAT_32BIT_TIME
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org,
        sparclinux@vger.kernel.org
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
 <20260630-vdso-compat_32bit_time-v2-8-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-8-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfXwjK5dBDFET/r
 h3lk0A0AZq+4p9PtQEyzfqGkPRJmkbZYUMxvayew/9DPh3PDwrZ08wkgMq9hyvSzpGU/UpriiOd
 ZTUQmffu3jBiopsYXcyaMffYst+1aLI=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44c6d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nY0lnxdtI4NLho-n6UZefOz1G4i_58Td
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX5n7znlUhWP19
 HEBWRUs+AUk2Gi5mMNXIm3INHdjvLJ692SHGuLn2sJyM8EIShi2pegxJGTW2Sm6YWNwHA9SlT3e
 uMAkNsEbcS+ncsLRb8QwDYwwfQLbJr4UdYxxVltdVfm75Yu5/KmxTCiwEzoI66IgjkFYxuSosai
 deIaM1AT6FS6QCDGuLnZLAdt9Lk8iOvExYPxU58GtNyMRfQT27t9eL9QFwb5ymaKsr/YOVwU+GT
 uAv+O1vnwG1ou0HskMMNh0ghqe0VaBaVy/9txsPP4PvVydB3EuvWsrqIL+QqavWXLQwlXUSI+1E
 t+HeQx31o0c25Ppa9lAAECmlrUMqqyL3CXSViDLHG/YctUb5BfHpd7wBRjRKAhq6VgSaOM1jOK9
 6ym5hpWKNtsEfjCU0UwnxKNv2xTWXuR/qaWZKH6g8QvTKdDX0ZWhtCS0wwMFQ4teUO3sCAG54jz
 NPmomjBZYsTm7ZtR5Rw==
X-Proofpoint-GUID: nY0lnxdtI4NLho-n6UZefOz1G4i_58Td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6968-lists,sparclinux=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:jstultz@google.com,m:sboyd@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:arnd@arndb.de,m:linux-api@vger.kernel.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,sparclinux@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,google.com,davemloft.net,gaisler.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,sparclinux@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[sparclinux];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B43B76EAE2D

On 30/6/26 09:38, Thomas WeiÃschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality. This is the intended
> effect of the kconfig option and also the fallback system calls would
> also not be implemented.
> 
> Currently the kconfig option does not affect the gettimeofday() syscall,
> so also keep that in the vDSO.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/sparc/vdso/vclock_gettime.c    | 4 ++++
>   arch/sparc/vdso/vdso32/vdso32.lds.S | 6 ++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

