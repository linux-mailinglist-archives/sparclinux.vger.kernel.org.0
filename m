Return-Path: <sparclinux+bounces-6967-lists+sparclinux=lfdr.de@vger.kernel.org>
Delivered-To: lists+sparclinux@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 16yLDEzHRGph0woAu9opvQ
	(envelope-from <sparclinux+bounces-6967-lists+sparclinux=lfdr.de@vger.kernel.org>)
	for <lists+sparclinux@lfdr.de>; Wed, 01 Jul 2026 09:52:44 +0200
X-Original-To: lists+sparclinux@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742F6EADE3
	for <lists+sparclinux@lfdr.de>; Wed, 01 Jul 2026 09:52:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Cj9hPbcb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ApqBAPP2;
	spf=pass (mail.lfdr.de: domain of "sparclinux+bounces-6967-lists+sparclinux=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="sparclinux+bounces-6967-lists+sparclinux=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58B0E3002FAB
	for <lists+sparclinux@lfdr.de>; Wed,  1 Jul 2026 07:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0BE3B440E;
	Wed,  1 Jul 2026 07:49:42 +0000 (UTC)
X-Original-To: sparclinux@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5CF3B4EBF
	for <sparclinux@vger.kernel.org>; Wed,  1 Jul 2026 07:49:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892182; cv=none; b=NGTepvfcQvsjicaiOIAbq0EVPLCTLgvBmTqxxEEFhQTABW0sJ3Fgul1TDegYwLfOcJZcbYGMTpPoaKlArxu8Ktad3VQ4wir64LbsKOYGaxEn+7VhcXEwXEcimQKMgmg/XCHol3rclqV02zokLwtATA9778LSl8GHlpWDX97S7UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892182; c=relaxed/simple;
	bh=dOh9xmXTaJtuTgus69f1JF7eDwhISXp7TeLbF9tj9mI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsgSp/8Mk5oCXZ4CiKrQ82rwvBnDdRFzz4lxLy3FeTqe797Wn3zLn3q/4WU7WYK72MheAo8ltQwDvPjKBWW9li4AKIxBlaMn5GWnDbDEdDzDBBWC/wj7jVFsew6F9OxewvJzVuGcZ9/TnYFlPz1OwIjuF75ANxYR6BUGqGRYJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cj9hPbcb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApqBAPP2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lPI8102927
	for <sparclinux@vger.kernel.org>; Wed, 1 Jul 2026 07:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=; b=Cj9hPbcbpWbTK+tF
	PIcK3PBPMaXTUuCv/sDEIZo5Y0/0nqsviQe1Sa2GXh1P431Pj3fnTpSPlaXTeDwn
	TejVsKuSbEwrL/m/AnaWDqhBuceZkeHF0ZsVBuk9HfOe8gugsp87HitC4zRCFssi
	k6ElK05VWfaFfa4ppKG4OagIrOqSKu1qzdm2FACtXswaGGtn3D+wovGnFISOY7GX
	OMvVD6rpHgm0xjYIk5hYyHMTHswLl1ybVHT0kDKMfw8cMtPhTll65hQ48rMgVW19
	6WCyma+Z3Xe8amIkZHwcyG4+oRHAwiriPfz76n406OSuMECtU/mf/hi9TS+eXug3
	o6S6LA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwaua0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sparclinux@vger.kernel.org>; Wed, 01 Jul 2026 07:49:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso239693685a.0
        for <sparclinux@vger.kernel.org>; Wed, 01 Jul 2026 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892179; x=1783496979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=;
        b=ApqBAPP2HqmALWuQYkhWtBjPp+2Sf6/0jfw/9bIhn37EGo2dz1ChSm9CM/d2HrEbAE
         bLJ6JOLbHfwszJPqBfuByKPvf5m647KUr1+di7hM54hgENGS82lkmcWVqlQk7y3vIlAl
         rRIDAEgxhneAuqQqD0v6wvJ4jb/5PDXmWTmJWtGpmtHxR2L2I2R9XpR8MpYJZ25Jw0Gg
         ulNYv3SspPsYwbE9MoB9ddldlOnsMJD7i1O/LZKUgfbDa01pABODs4BAPyuuJpuE+e0X
         JLnI3NlYOqcaRBi7issXg3NQYfaXk3dexKDRBiqzbNvXKgC31RVcPnQrY7mY/ii5FcCd
         v+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892179; x=1783496979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=;
        b=SuWZZ4bsKHQBD6jLLVrRu6NZBgd8yVX7wn5wpLngJQOBphjEJK3KoBBoz1qgYiA6a1
         FFAKRPHp7gDJeJXHgyKYGgFh07FhV2Ra6mcNWJgMlNlHSw8B1hbcgc+2h7gRPTd2lV1K
         mjxw0UO19FSeDHdwRHFkdPLd56hZ1ZU3Y/yGzQ5F8a0vzdG9YDbcVwtbwGdpMg+JEy6y
         ZZqz6Yw9Mgad4gHXdvwAN+rAB4I9CSXOrvXxPqaN9y1Dz/Ei23rrYQiXbzTAF/4W+BBs
         Q3nUKjuxr/Bz3MBuqKEdIGnc7rgoYbLKIrefURZ5XwUzERuFhgoXyt7BMkFZy6rEsDpP
         9o8g==
X-Forwarded-Encrypted: i=1; AFNElJ+w8m7j1KaLS1r9Vuj5JgjaoWq3jV49P21nVdgCbckHngT9dqXEwiFlR7T4u3TvJ8FGbHPbK7q6MIQL@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBevXebB3sP+V/h17iJWPbUKGyBQU273KiEd3dSOJuvQz6/Il
	OO/5oR12lmvgQMFmbZgECbjN5tskPlsGF7YAm/PDBeLfgXdRyHP9ur/uncUtmMxsZvjzrF5rrbn
	snoUS/MrI8VZvLwbLllShNQLILpMZGzA0j0HtzrieXsJBqXCmQMBzKb2o85QQ3IqW
X-Gm-Gg: AfdE7cnxQ3p9viRTq+iK4AstNqhDIRO6VMZW1YQcOf6vBh3PQLKkKK/74WoqqYFArnS
	r8WjuIWFiqyGoff5TMVRU0yYbGUoTGz24miEg4qVda3DUEdXNhlqB95SuMLCCq3r0tzsWiSqFx2
	gO/Pwjhc5iEKdZHtxBFTi/r8df3/pn2FqpzUh2S6eh9BH8rV5/hr7VzMCPIBLfH2TwZ6A1+5tFm
	tlOqXIO5Tk3P9zgFGgFbQ4CMc5XMKuj/ndkLYFCbGlDaVVzYFj7IlQgHHKosduHSkAYNTHgeBkd
	FOQi7K8IWE7kNukEQWECdRl/Yju5eQrftVwHuJsGaKaM9a4pgJCht69x4JoJT3W78pnwzy5/YYN
	7U19GqXRASneBrUAMNcUs+etnV8SXxxd+Kh6lGRFpyXdsD0p/XQj+QdCORkrjfw==
X-Received: by 2002:a05:622a:4292:b0:517:146d:2cb5 with SMTP id d75a77b69052e-51c17e8f1ecmr60558851cf.20.1782892179090;
        Wed, 01 Jul 2026 00:49:39 -0700 (PDT)
X-Received: by 2002:a05:622a:4292:b0:517:146d:2cb5 with SMTP id d75a77b69052e-51c17e8f1ecmr60558621cf.20.1782892178662;
        Wed, 01 Jul 2026 00:49:38 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194bbsm13031759f8f.3.2026.07.01.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:49:37 -0700 (PDT)
Message-ID: <4eb126f4-f9c8-471e-94f1-ff40675dbe73@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:49:35 +0200
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] ARM: VDSO: Respect COMPAT_32BIT_TIME
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
 <20260630-vdso-compat_32bit_time-v2-5-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-5-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ei7PDiCbXyE2V0UalBnkasVcZTyLGBde
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX/NKzISFoR+pa
 QoKmRk/EUfXQ3DaWlZ11WLyI7IuJuUB2B7EUVLLLQSoLIVj3Ci+z2rR6zqwKzNFwA0emEqkFTWq
 2EsPs5Jhh/Il5o7Z7JmSSWhXzfeRZMM=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44c693 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Ei7PDiCbXyE2V0UalBnkasVcZTyLGBde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfXzFStfnDQ78Dn
 RWJBM7g82ETkuZdkO3oT/gi3fNnw9uOP/QUc4ITqf4h1j4OPJWarWcrP2QfAInpljXhiW4fCEH7
 TRlwuyZAn727KUSdG/j6ziM+EoJk0HbLKxgBfeX/1F9SbaGmqjEyxSwD8HwvFZSQKRt/lftlLXq
 HXZtq+AEO8A8fG1nn13zCjjnMK7GGWDDgJRNcKcD39/vgN274Lt7viRoJC5YzAvN59FKUneenju
 NmCffeQ5KVIEpk3MoJaS7WNKn6ujz2rzWA48tBn7x6ZucyQPfSSPuHRyOY2arp1D+r72XULMtlb
 Sfsc2+k5oc4ZpjizdDV80n09iDpNkgAoI0sK6nTQTHcIx5TeyOhvS4sEFz24O7nQuKbaVMGnpBE
 3kNhgE+EXfxcCF3pyO4Re49UXr2S8EdM8tujkWHQdnEexa+0dSiMUlPqcVID29jEw7AsthYZeBi
 BkIjxPfyUu3GVsGZbsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
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
	TAGGED_FROM(0.00)[bounces-6967-lists,sparclinux=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:jstultz@google.com,m:sboyd@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:arnd@arndb.de,m:linux-api@vger.kernel.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,linutronix.de:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 7742F6EADE3

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
>   arch/arm/vdso/vdso.lds.S      |  2 ++
>   arch/arm/vdso/vgettimeofday.c | 14 ++++++++------
>   2 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

