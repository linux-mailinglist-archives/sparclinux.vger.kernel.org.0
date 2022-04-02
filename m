Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D76FB4F0283
	for <lists+sparclinux@lfdr.de>; Sat,  2 Apr 2022 15:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355767AbiDBNjt (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Sat, 2 Apr 2022 09:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355771AbiDBNjh (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sat, 2 Apr 2022 09:39:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA94214A6D0;
        Sat,  2 Apr 2022 06:37:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 465B1614FD;
        Sat,  2 Apr 2022 13:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E512DC340EC;
        Sat,  2 Apr 2022 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648906657;
        bh=eCC4+U4U/ci3tY5teY5dpBY9tw/1fY0xwkgGYQqbXuQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OfdE9d9il/hrQ5y4S3E7VhA3bEh6nhiW6Wgd8NQi7apDiA61pvjLvsbb6V0xZ5l6/
         X+qhUAzorSjvdE6RAEcWKj/rqSDrv7atz/QYnHV5z8H4wd3R5PPx3qKuq42WE/HmgP
         CK/78OPu6KeqG3RELX71VgYMd0fyAFEfwuBZgHQ4PjtU9otTylYpIVco75K0hkg9St
         azxn44DRwCJmxw7rRauPHNAOynrszVX2+sPb+FviLPRe41UEEUbaHdfeB3VyXAa9KJ
         f5c1NBhOOUOBd/xMwIF/3zJECWkYI9V/p65m6MAsM2VO0S9UwBMKjHKTt0T3Q7rixC
         suRGG03Dc/qnw==
From:   guoren@kernel.org
To:     guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, hch@lst.de
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org, heiko@sntech.de,
        Guo Ren <guoren@linux.alibaba.com>,
        Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH V10 17/20] riscv: compat: vdso: Add setup additional pages implementation
Date:   Sat,  2 Apr 2022 21:35:41 +0800
Message-Id: <20220402133544.2690231-18-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402133544.2690231-1-guoren@kernel.org>
References: <20220402133544.2690231-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

From: Guo Ren <guoren@linux.alibaba.com>

Reconstruct __setup_additional_pages() by appending vdso info
pointer argument to meet compat_vdso_info requirement. And change
vm_special_mapping *dm, *cm initialization into static.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/elf.h |   5 ++
 arch/riscv/include/asm/mmu.h |   1 +
 arch/riscv/kernel/vdso.c     | 105 +++++++++++++++++++++++------------
 3 files changed, 76 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 754fdb8cee96..14fc7342490b 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -130,5 +130,10 @@ do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)		\
 typedef compat_ulong_t			compat_elf_greg_t;
 typedef compat_elf_greg_t		compat_elf_gregset_t[ELF_NGREG];
 
+extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
+					      int uses_interp);
+#define compat_arch_setup_additional_pages \
+				compat_arch_setup_additional_pages
+
 #endif /* CONFIG_COMPAT */
 #endif /* _ASM_RISCV_ELF_H */
diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 0099dc116168..cedcf8ea3c76 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -16,6 +16,7 @@ typedef struct {
 	atomic_long_t id;
 #endif
 	void *vdso;
+	void *vdso_info;
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
 	cpumask_t icache_stale_mask;
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index a9436a65161a..50fe4c877603 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -23,6 +23,9 @@ struct vdso_data {
 #endif
 
 extern char vdso_start[], vdso_end[];
+#ifdef CONFIG_COMPAT
+extern char compat_vdso_start[], compat_vdso_end[];
+#endif
 
 enum vvar_pages {
 	VVAR_DATA_PAGE_OFFSET,
@@ -30,6 +33,11 @@ enum vvar_pages {
 	VVAR_NR_PAGES,
 };
 
+enum rv_vdso_map {
+	RV_VDSO_MAP_VVAR,
+	RV_VDSO_MAP_VDSO,
+};
+
 #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
 
 /*
@@ -52,12 +60,6 @@ struct __vdso_info {
 	struct vm_special_mapping *cm;
 };
 
-static struct __vdso_info vdso_info __ro_after_init = {
-	.name = "vdso",
-	.vdso_code_start = vdso_start,
-	.vdso_code_end = vdso_end,
-};
-
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		       struct vm_area_struct *new_vma)
 {
@@ -66,37 +68,33 @@ static int vdso_mremap(const struct vm_special_mapping *sm,
 	return 0;
 }
 
-static int __init __vdso_init(void)
+static void __init __vdso_init(struct __vdso_info *vdso_info)
 {
 	unsigned int i;
 	struct page **vdso_pagelist;
 	unsigned long pfn;
 
-	if (memcmp(vdso_info.vdso_code_start, "\177ELF", 4)) {
-		pr_err("vDSO is not a valid ELF object!\n");
-		return -EINVAL;
-	}
+	if (memcmp(vdso_info->vdso_code_start, "\177ELF", 4))
+		panic("vDSO is not a valid ELF object!\n");
 
-	vdso_info.vdso_pages = (
-		vdso_info.vdso_code_end -
-		vdso_info.vdso_code_start) >>
+	vdso_info->vdso_pages = (
+		vdso_info->vdso_code_end -
+		vdso_info->vdso_code_start) >>
 		PAGE_SHIFT;
 
-	vdso_pagelist = kcalloc(vdso_info.vdso_pages,
+	vdso_pagelist = kcalloc(vdso_info->vdso_pages,
 				sizeof(struct page *),
 				GFP_KERNEL);
 	if (vdso_pagelist == NULL)
-		return -ENOMEM;
+		panic("vDSO kcalloc failed!\n");
 
 	/* Grab the vDSO code pages. */
-	pfn = sym_to_pfn(vdso_info.vdso_code_start);
+	pfn = sym_to_pfn(vdso_info->vdso_code_start);
 
-	for (i = 0; i < vdso_info.vdso_pages; i++)
+	for (i = 0; i < vdso_info->vdso_pages; i++)
 		vdso_pagelist[i] = pfn_to_page(pfn + i);
 
-	vdso_info.cm->pages = vdso_pagelist;
-
-	return 0;
+	vdso_info->cm->pages = vdso_pagelist;
 }
 
 #ifdef CONFIG_TIME_NS
@@ -116,13 +114,14 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 {
 	struct mm_struct *mm = task->mm;
 	struct vm_area_struct *vma;
+	struct __vdso_info *vdso_info = mm->context.vdso_info;
 
 	mmap_read_lock(mm);
 
 	for (vma = mm->mmap; vma; vma = vma->vm_next) {
 		unsigned long size = vma->vm_end - vma->vm_start;
 
-		if (vma_is_special_mapping(vma, vdso_info.dm))
+		if (vma_is_special_mapping(vma, vdso_info->dm))
 			zap_page_range(vma, vma->vm_start, size);
 	}
 
@@ -187,11 +186,6 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
-enum rv_vdso_map {
-	RV_VDSO_MAP_VVAR,
-	RV_VDSO_MAP_VDSO,
-};
-
 static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
 	[RV_VDSO_MAP_VVAR] = {
 		.name   = "[vvar]",
@@ -203,25 +197,46 @@ static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
 	},
 };
 
+static struct __vdso_info vdso_info __ro_after_init = {
+	.name = "vdso",
+	.vdso_code_start = vdso_start,
+	.vdso_code_end = vdso_end,
+	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
+	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
+};
+
+#ifdef CONFIG_COMPAT
+static struct __vdso_info compat_vdso_info __ro_after_init = {
+	.name = "compat_vdso",
+	.vdso_code_start = compat_vdso_start,
+	.vdso_code_end = compat_vdso_end,
+	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
+	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
+};
+#endif
+
 static int __init vdso_init(void)
 {
-	vdso_info.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR];
-	vdso_info.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO];
+	__vdso_init(&vdso_info);
+#ifdef CONFIG_COMPAT
+	__vdso_init(&compat_vdso_info);
+#endif
 
-	return __vdso_init();
+	return 0;
 }
 arch_initcall(vdso_init);
 
 static int __setup_additional_pages(struct mm_struct *mm,
 				    struct linux_binprm *bprm,
-				    int uses_interp)
+				    int uses_interp,
+				    struct __vdso_info *vdso_info)
 {
 	unsigned long vdso_base, vdso_text_len, vdso_mapping_len;
 	void *ret;
 
 	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
 
-	vdso_text_len = vdso_info.vdso_pages << PAGE_SHIFT;
+	vdso_text_len = vdso_info->vdso_pages << PAGE_SHIFT;
 	/* Be sure to map the data page */
 	vdso_mapping_len = vdso_text_len + VVAR_SIZE;
 
@@ -232,16 +247,18 @@ static int __setup_additional_pages(struct mm_struct *mm,
 	}
 
 	ret = _install_special_mapping(mm, vdso_base, VVAR_SIZE,
-		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info.dm);
+		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info->dm);
 	if (IS_ERR(ret))
 		goto up_fail;
 
 	vdso_base += VVAR_SIZE;
 	mm->context.vdso = (void *)vdso_base;
+	mm->context.vdso_info = (void *)vdso_info;
+
 	ret =
 	   _install_special_mapping(mm, vdso_base, vdso_text_len,
 		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
-		vdso_info.cm);
+		vdso_info->cm);
 
 	if (IS_ERR(ret))
 		goto up_fail;
@@ -253,6 +270,24 @@ static int __setup_additional_pages(struct mm_struct *mm,
 	return PTR_ERR(ret);
 }
 
+#ifdef CONFIG_COMPAT
+int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
+				       int uses_interp)
+{
+	struct mm_struct *mm = current->mm;
+	int ret;
+
+	if (mmap_write_lock_killable(mm))
+		return -EINTR;
+
+	ret = __setup_additional_pages(mm, bprm, uses_interp,
+							&compat_vdso_info);
+	mmap_write_unlock(mm);
+
+	return ret;
+}
+#endif
+
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mm_struct *mm = current->mm;
@@ -261,7 +296,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
 
-	ret = __setup_additional_pages(mm, bprm, uses_interp);
+	ret = __setup_additional_pages(mm, bprm, uses_interp, &vdso_info);
 	mmap_write_unlock(mm);
 
 	return ret;
-- 
2.25.1

