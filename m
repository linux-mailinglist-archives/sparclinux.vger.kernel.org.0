Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3D8A939A
	for <lists+sparclinux@lfdr.de>; Wed,  4 Sep 2019 22:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730757AbfIDUXv (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Wed, 4 Sep 2019 16:23:51 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:14142 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730289AbfIDUXu (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Wed, 4 Sep 2019 16:23:50 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id EEC83A1723;
        Wed,  4 Sep 2019 22:23:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id 0PzTeifTYORA; Wed,  4 Sep 2019 22:23:38 +0200 (CEST)
From:   Aleksa Sarai <cyphar@cyphar.com>
To:     Al Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>
Cc:     Aleksa Sarai <cyphar@cyphar.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        containers@lists.linux-foundation.org, linux-alpha@vger.kernel.org,
        linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Subject: [PATCH v12 12/12] selftests: add openat2(2) selftests
Date:   Thu,  5 Sep 2019 06:19:33 +1000
Message-Id: <20190904201933.10736-13-cyphar@cyphar.com>
In-Reply-To: <20190904201933.10736-1-cyphar@cyphar.com>
References: <20190904201933.10736-1-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Test all of the various openat2(2) flags, as well as how file
descriptor re-opening works. A small stress-test of a symlink-rename
attack is included to show that the protections against ".."-based
attacks are sufficient.

In addition, the memfd selftest is fixed to no longer depend on the
now-disallowed functionality of upgrading an O_RDONLY descriptor to
O_RDWR.

Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/memfd/memfd_test.c    |   7 +-
 tools/testing/selftests/openat2/.gitignore    |   1 +
 tools/testing/selftests/openat2/Makefile      |   8 +
 tools/testing/selftests/openat2/helpers.c     | 167 ++++++++
 tools/testing/selftests/openat2/helpers.h     | 118 +++++
 .../testing/selftests/openat2/linkmode_test.c | 333 +++++++++++++++
 .../testing/selftests/openat2/openat2_test.c  | 106 +++++
 .../selftests/openat2/rename_attack_test.c    | 127 ++++++
 .../testing/selftests/openat2/resolve_test.c  | 402 ++++++++++++++++++
 10 files changed, 1268 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/openat2/.gitignore
 create mode 100644 tools/testing/selftests/openat2/Makefile
 create mode 100644 tools/testing/selftests/openat2/helpers.c
 create mode 100644 tools/testing/selftests/openat2/helpers.h
 create mode 100644 tools/testing/selftests/openat2/linkmode_test.c
 create mode 100644 tools/testing/selftests/openat2/openat2_test.c
 create mode 100644 tools/testing/selftests/openat2/rename_attack_test.c
 create mode 100644 tools/testing/selftests/openat2/resolve_test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 25b43a8c2b15..13c02e0d0efc 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -37,6 +37,7 @@ TARGETS += powerpc
 TARGETS += proc
 TARGETS += pstore
 TARGETS += ptrace
+TARGETS += openat2
 TARGETS += rseq
 TARGETS += rtc
 TARGETS += seccomp
diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index c67d32eeb668..e71df3d3e55d 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -925,7 +925,7 @@ static void test_share_mmap(char *banner, char *b_suffix)
  */
 static void test_share_open(char *banner, char *b_suffix)
 {
-	int fd, fd2;
+	int procfd, fd, fd2;
 
 	printf("%s %s %s\n", memfd_str, banner, b_suffix);
 
@@ -950,13 +950,16 @@ static void test_share_open(char *banner, char *b_suffix)
 	mfd_assert_has_seals(fd, F_SEAL_WRITE | F_SEAL_SHRINK);
 	mfd_assert_has_seals(fd2, F_SEAL_WRITE | F_SEAL_SHRINK);
 
+	/* We cannot do a MAY_WRITE re-open of an O_RDONLY fd. */
+	procfd = mfd_assert_open(fd2, O_PATH, 0);
 	close(fd2);
-	fd2 = mfd_assert_open(fd, O_RDWR, 0);
+	fd2 = mfd_assert_open(procfd, O_WRONLY, 0);
 
 	mfd_assert_add_seals(fd2, F_SEAL_SEAL);
 	mfd_assert_has_seals(fd, F_SEAL_WRITE | F_SEAL_SHRINK | F_SEAL_SEAL);
 	mfd_assert_has_seals(fd2, F_SEAL_WRITE | F_SEAL_SHRINK | F_SEAL_SEAL);
 
+	close(procfd);
 	close(fd2);
 	close(fd);
 }
diff --git a/tools/testing/selftests/openat2/.gitignore b/tools/testing/selftests/openat2/.gitignore
new file mode 100644
index 000000000000..bd68f6c3fd07
--- /dev/null
+++ b/tools/testing/selftests/openat2/.gitignore
@@ -0,0 +1 @@
+/*_test
diff --git a/tools/testing/selftests/openat2/Makefile b/tools/testing/selftests/openat2/Makefile
new file mode 100644
index 000000000000..0b8d42ec4052
--- /dev/null
+++ b/tools/testing/selftests/openat2/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS += -Wall -O2 -g
+TEST_GEN_PROGS := linkmode_test openat2_test resolve_test rename_attack_test
+
+include ../lib.mk
+
+$(TEST_GEN_PROGS): helpers.c
diff --git a/tools/testing/selftests/openat2/helpers.c b/tools/testing/selftests/openat2/helpers.c
new file mode 100644
index 000000000000..def6f7720086
--- /dev/null
+++ b/tools/testing/selftests/openat2/helpers.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Aleksa Sarai <cyphar@cyphar.com>
+ * Copyright (C) 2018-2019 SUSE LLC.
+ */
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <string.h>
+#include <syscall.h>
+#include <limits.h>
+
+#include "helpers.h"
+
+int raw_openat2(int dfd, const char *path, const void *how, size_t size)
+{
+	int ret = syscall(__NR_openat2, dfd, path, how, size);
+	return ret >= 0 ? ret : -errno;
+}
+
+int sys_openat2(int dfd, const char *path, const struct open_how *how)
+{
+	return raw_openat2(dfd, path, how, sizeof(*how));
+}
+
+int sys_openat(int dfd, const char *path, const struct open_how *how)
+{
+	int ret = openat(dfd, path, how->flags, how->mode);
+	return ret >= 0 ? ret : -errno;
+}
+
+int sys_renameat2(int olddirfd, const char *oldpath,
+		  int newdirfd, const char *newpath, unsigned int flags)
+{
+	int ret = syscall(__NR_renameat2, olddirfd, oldpath,
+					  newdirfd, newpath, flags);
+	return ret >= 0 ? ret : -errno;
+}
+
+char *openat_flags(unsigned int flags)
+{
+	char *flagset, *accmode = "(none)";
+
+	switch (flags & 0x03) {
+	case O_RDWR:
+		accmode = "O_RDWR";
+		break;
+	case O_RDONLY:
+		accmode = "O_RDONLY";
+		break;
+	case O_WRONLY:
+		accmode = "O_WRONLY";
+		break;
+	}
+
+	E_asprintf(&flagset, "%s%s%s",
+		   (flags & O_PATH) ? "O_PATH|" : "",
+		   (flags & O_CREAT) ? "O_CREAT|" : "",
+		   accmode);
+
+	return flagset;
+}
+
+char *openat2_flags(const struct open_how *how)
+{
+	char *p;
+	char *flags_set, *resolve_set, *acc_set, *set;
+
+	flags_set = openat_flags(how->flags);
+
+	E_asprintf(&resolve_set, "%s%s%s%s%s0",
+		   (how->resolve & RESOLVE_NO_XDEV) ? "RESOLVE_NO_XDEV|" : "",
+		   (how->resolve & RESOLVE_NO_MAGICLINKS) ? "RESOLVE_NO_MAGICLINKS|" : "",
+		   (how->resolve & RESOLVE_NO_SYMLINKS) ? "RESOLVE_NO_SYMLINKS|" : "",
+		   (how->resolve & RESOLVE_BENEATH) ? "RESOLVE_BENEATH|" : "",
+		   (how->resolve & RESOLVE_IN_ROOT) ? "RESOLVE_IN_ROOT|" : "");
+
+	/* Remove trailing "|0". */
+	p = strstr(resolve_set, "|0");
+	if (p)
+		*p = '\0';
+
+	if (how->flags & O_PATH)
+		E_asprintf(&acc_set, ", upgrade_mask=%s%s0",
+			   (how->upgrade_mask & UPGRADE_NOREAD) ? "UPGRADE_NOREAD|" : "",
+			   (how->upgrade_mask & UPGRADE_NOWRITE) ? "UPGRADE_NOWRITE|" : "");
+	else if (how->flags & O_CREAT)
+		E_asprintf(&acc_set, ", mode=0%o", how->mode);
+	else
+		acc_set = strdup("");
+
+	/* Remove trailing "|0". */
+	p = strstr(acc_set, "|0");
+	if (p)
+		*p = '\0';
+
+	/* And now generate our flagset. */
+	E_asprintf(&set, "[flags=%s, resolve=%s%s]",
+		   flags_set, resolve_set, acc_set);
+
+	free(flags_set);
+	free(resolve_set);
+	free(acc_set);
+	return set;
+}
+
+int touchat(int dfd, const char *path)
+{
+	int fd = openat(dfd, path, O_CREAT);
+	if (fd >= 0)
+		close(fd);
+	return fd;
+}
+
+char *fdreadlink(int fd)
+{
+	char *target, *tmp;
+
+	E_asprintf(&tmp, "/proc/self/fd/%d", fd);
+
+	target = malloc(PATH_MAX);
+	if (!target)
+		ksft_exit_fail_msg("fdreadlink: malloc failed\n");
+	memset(target, 0, PATH_MAX);
+
+	E_readlink(tmp, target, PATH_MAX);
+	free(tmp);
+	return target;
+}
+
+bool fdequal(int fd, int dfd, const char *path)
+{
+	char *fdpath, *dfdpath, *other;
+	bool cmp;
+
+	fdpath = fdreadlink(fd);
+	dfdpath = fdreadlink(dfd);
+
+	if (!path)
+		E_asprintf(&other, "%s", dfdpath);
+	else if (*path == '/')
+		E_asprintf(&other, "%s", path);
+	else
+		E_asprintf(&other, "%s/%s", dfdpath, path);
+
+	cmp = !strcmp(fdpath, other);
+	if (!cmp)
+		ksft_print_msg("fdequal: expected '%s' but got '%s'\n", other, fdpath);
+
+	free(fdpath);
+	free(dfdpath);
+	free(other);
+	return cmp;
+}
+
+void test_openat2_supported(void)
+{
+	struct open_how how = {};
+	int fd = sys_openat2(AT_FDCWD, ".", &how);
+	if (fd == -ENOSYS)
+		ksft_exit_skip("openat2(2) unsupported on this kernel\n");
+	if (fd < 0)
+		ksft_exit_fail_msg("openat2(2) supported check failed: %s\n", strerror(-fd));
+	close(fd);
+}
diff --git a/tools/testing/selftests/openat2/helpers.h b/tools/testing/selftests/openat2/helpers.h
new file mode 100644
index 000000000000..eb40030664f9
--- /dev/null
+++ b/tools/testing/selftests/openat2/helpers.h
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Aleksa Sarai <cyphar@cyphar.com>
+ * Copyright (C) 2018-2019 SUSE LLC.
+ */
+
+#ifndef __RESOLVEAT_H__
+#define __RESOLVEAT_H__
+
+#define _GNU_SOURCE
+#include <stdint.h>
+#include <errno.h>
+#include "../kselftest.h"
+
+#define ARRAY_LEN(X) (sizeof (X) / sizeof (*(X)))
+#define BUILD_BUG_ON(e) ((void)(sizeof(struct { int:(-!!(e)); })))
+
+#ifndef SYS_openat2
+#ifndef __NR_openat2
+#define __NR_openat2 437
+#endif /* __NR_openat2 */
+#define SYS_openat2 __NR_openat2
+#endif /* SYS_openat2 */
+
+/**
+ * Arguments for how openat2(2) should open the target path. If @extra is zero,
+ * then openat2 is identical to openat(2). Only one of @mode or @upgrade_mask
+ * may be set at any given time.
+ *
+ * @flags: O_* flags (unknown flags ignored).
+ * @mode: O_CREAT file mode (ignored otherwise).
+ * @upgrade_mask: restrict how the O_PATH may be re-opened (ignored otherwise).
+ * @resolve: RESOLVE_* flags (-EINVAL on unknown flags).
+ * @reserved: reserved for future extensions, must be zeroed.
+ */
+struct open_how {
+	uint32_t flags;
+	union {
+		uint16_t mode;
+		uint16_t upgrade_mask;
+	};
+	uint16_t resolve;
+};
+
+#define	OPEN_HOW_SIZE_VER0	8 /* sizeof first published struct */
+
+#ifndef RESOLVE_INROOT
+/* how->resolve flags for openat2(2). */
+#define RESOLVE_NO_XDEV		0x01 /* Block mount-point crossings
+					(includes bind-mounts). */
+#define RESOLVE_NO_MAGICLINKS	0x02 /* Block traversal through procfs-style
+					"magic-links". */
+#define RESOLVE_NO_SYMLINKS	0x04 /* Block traversal through all symlinks
+					(implies OEXT_NO_MAGICLINKS) */
+#define RESOLVE_BENEATH		0x08 /* Block "lexical" trickery like
+					"..", symlinks, and absolute
+					paths which escape the dirfd. */
+#define RESOLVE_IN_ROOT		0x10 /* Make all jumps to "/" and ".."
+					be scoped inside the dirfd
+					(similar to chroot(2)). */
+#endif /* RESOLVE_IN_ROOT */
+
+#ifndef UPGRADE_NOREAD
+/* how->upgrade flags for openat2(2). */
+/* First bit is reserved for a future UPGRADE_NOEXEC flag. */
+#define UPGRADE_NOREAD		0x02 /* Block re-opening with MAY_READ. */
+#define UPGRADE_NOWRITE		0x04 /* Block re-opening with MAY_WRITE. */
+#endif /* UPGRADE_NOREAD */
+
+#ifndef O_EMPTYPATH
+#define	O_EMPTYPATH 040000000
+#endif /* O_EMPTYPATH */
+
+#define E_func(func, ...)						\
+	do {								\
+		if (func(__VA_ARGS__) < 0)				\
+			ksft_exit_fail_msg("%s:%d %s failed\n", \
+					   __FILE__, __LINE__, #func);\
+	} while (0)
+
+#define E_mkdirat(...)   E_func(mkdirat,   __VA_ARGS__)
+#define E_symlinkat(...) E_func(symlinkat, __VA_ARGS__)
+#define E_touchat(...)   E_func(touchat,   __VA_ARGS__)
+#define E_readlink(...)  E_func(readlink,  __VA_ARGS__)
+#define E_fstatat(...)   E_func(fstatat,   __VA_ARGS__)
+#define E_asprintf(...)  E_func(asprintf,  __VA_ARGS__)
+#define E_fchdir(...)    E_func(fchdir,    __VA_ARGS__)
+#define E_mount(...)     E_func(mount,     __VA_ARGS__)
+#define E_unshare(...)   E_func(unshare,   __VA_ARGS__)
+#define E_setresuid(...) E_func(setresuid, __VA_ARGS__)
+#define E_chmod(...)     E_func(chmod,     __VA_ARGS__)
+
+#define E_assert(expr, msg, ...)					\
+	do {								\
+		if (!(expr))						\
+			ksft_exit_fail_msg("ASSERT(%s:%d) failed (%s): " msg "\n", \
+					   __FILE__, __LINE__, #expr, ##__VA_ARGS__); \
+	} while (0)
+
+typedef int (*openfunc_t)(int dfd, const char *path, const struct open_how *how);
+
+int raw_openat2(int dfd, const char *path, const void *how, size_t size);
+int sys_openat2(int dfd, const char *path, const struct open_how *how);
+char *openat2_flags(const struct open_how *how);
+
+int sys_openat(int dfd, const char *path, const struct open_how *how);
+char *openat_flags(unsigned int flags);
+
+int sys_renameat2(int olddirfd, const char *oldpath,
+		  int newdirfd, const char *newpath, unsigned int flags);
+
+int touchat(int dfd, const char *path);
+char *fdreadlink(int fd);
+bool fdequal(int fd, int dfd, const char *path);
+
+void test_openat2_supported(void);
+
+#endif /* __RESOLVEAT_H__ */
diff --git a/tools/testing/selftests/openat2/linkmode_test.c b/tools/testing/selftests/openat2/linkmode_test.c
new file mode 100644
index 000000000000..44fcba738686
--- /dev/null
+++ b/tools/testing/selftests/openat2/linkmode_test.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Aleksa Sarai <cyphar@cyphar.com>
+ * Copyright (C) 2018-2019 SUSE LLC.
+ */
+
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <stdbool.h>
+#include <string.h>
+
+#include "../kselftest.h"
+#include "helpers.h"
+
+static mode_t fdmode(int fd)
+{
+	char *fdpath;
+	struct stat statbuf;
+	mode_t mode;
+
+	E_asprintf(&fdpath, "/proc/self/fd/%d", fd);
+	E_fstatat(AT_FDCWD, fdpath, &statbuf, AT_SYMLINK_NOFOLLOW);
+	mode = (statbuf.st_mode & ~S_IFMT);
+	free(fdpath);
+
+	return mode;
+}
+
+static int reopen_proc(int fd, unsigned int flags)
+{
+	int ret, saved_errno;
+	char *fdpath;
+
+	E_asprintf(&fdpath, "/proc/self/fd/%d", fd);
+	ret = open(fdpath, flags);
+	saved_errno = errno;
+	free(fdpath);
+
+	return ret >= 0 ? ret : -saved_errno;
+}
+
+static int reopen_oemptypath(int fd, unsigned int flags)
+{
+	int ret = openat(fd, "", O_EMPTYPATH | flags);
+	return ret >= 0 ? ret : -errno;
+}
+
+struct reopen_test {
+	openfunc_t open;
+	mode_t chmod_mode;
+	struct {
+		struct open_how how;
+		mode_t mode;
+		int err;
+	} orig, new;
+};
+
+static bool reopen(int fd, struct reopen_test *test)
+{
+	int newfd;
+	mode_t proc_mode;
+	bool failed = false;
+
+	/* Check that the proc mode is correct. */
+	proc_mode = fdmode(fd);
+	if (proc_mode != test->orig.mode) {
+		ksft_print_msg("incorrect fdmode (got[%o] != want[%o])\n",
+			       proc_mode, test->orig.mode);
+		failed = true;
+	}
+
+	/* Re-open through /proc. */
+	newfd = reopen_proc(fd, test->new.how.flags);
+	if (newfd != test->new.err && (newfd < 0 || test->new.err < 0)) {
+		ksft_print_msg("/proc failure (%d != %d [%s])\n",
+			       newfd, test->new.err, strerror(-test->new.err));
+		failed = true;
+	}
+	if (newfd >= 0) {
+		proc_mode = fdmode(newfd);
+		if (proc_mode != test->new.mode) {
+			ksft_print_msg("/proc wrong fdmode (got[%o] != want[%o])\n",
+				       proc_mode, test->new.mode);
+			failed = true;
+		}
+		close(newfd);
+	}
+
+	/* Re-open with O_EMPTYPATH. */
+	newfd = reopen_oemptypath(fd, test->new.how.flags);
+	if (newfd != test->new.err && (newfd < 0 || test->new.err < 0)) {
+		ksft_print_msg("O_EMPTYPATH failure (%d != %d [%s])\n",
+			       newfd, test->new.err, strerror(-test->new.err));
+		failed = true;
+	}
+	if (newfd >= 0) {
+		proc_mode = fdmode(newfd);
+		if (proc_mode != test->new.mode) {
+			ksft_print_msg("O_EMPTYPATH wrong fdmode (got[%o] != want[%o])\n",
+				       proc_mode, test->new.mode);
+			failed = true;
+		}
+		close(newfd);
+	}
+
+	return failed;
+}
+
+#define NUM_REOPEN_TESTS 28
+
+void test_reopen_ordinary(bool privileged)
+{
+	int fd;
+	int err_access = privileged ? 0 : -EACCES;
+	char tmpfile[] = "/tmp/ksft-openat2-reopen-testfile.XXXXXX";
+
+	fd = mkstemp(tmpfile);
+	E_assert(fd >= 0, "mkstemp failed: %m\n");
+	close(fd);
+
+	struct reopen_test tests[] = {
+		/* Re-opening with the same mode should succeed. */
+		{ .open = sys_openat,	  .chmod_mode = 0400,
+		  .orig.how.flags = O_RDONLY, .orig.mode  = 0500,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500 },
+		{ .open = sys_openat,	  .chmod_mode = 0200,
+		  .orig.how.flags = O_WRONLY, .orig.mode  = 0300,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300 },
+		{ .open = sys_openat,	  .chmod_mode = 0600,
+		  .orig.how.flags =   O_RDWR, .orig.mode  = 0700,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700 },
+		{ .open = sys_openat,	  .chmod_mode = 0600,
+		  .orig.how.flags =   O_RDWR, .orig.mode  = 0700,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500 },
+		{ .open = sys_openat,	  .chmod_mode = 0600,
+		  .orig.how.flags =   O_RDWR, .orig.mode  = 0700,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300 },
+
+		/*
+		 * Re-opening with a different mode will always fail (with an obvious
+		 * carve-out for privileged users).
+		 */
+		{ .open = sys_openat,	  .chmod_mode = 0600,
+		  .orig.how.flags = O_RDONLY, .orig.mode  = 0500,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300, .new.err = err_access },
+		{ .open = sys_openat,	  .chmod_mode = 0600,
+		  .orig.how.flags = O_WRONLY, .orig.mode  = 0300,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500, .new.err = err_access },
+		{ .open = sys_openat,	  .chmod_mode = 0600,
+		  .orig.how.flags = O_RDONLY, .orig.mode  = 0500,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700, .new.err = err_access },
+		{ .open = sys_openat,	  .chmod_mode = 0600,
+		  .orig.how.flags = O_WRONLY, .orig.mode  = 0300,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700, .new.err = err_access },
+
+		/* Doubly so if they didn't even have permissions at open-time. */
+		{ .open = sys_openat,	  .chmod_mode = 0400,
+		  .orig.how.flags = O_RDONLY, .orig.mode  = 0500,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300, .new.err = err_access },
+		{ .open = sys_openat,	  .chmod_mode = 0200,
+		  .orig.how.flags = O_WRONLY, .orig.mode  = 0300,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500, .new.err = err_access },
+		{ .open = sys_openat,	  .chmod_mode = 0400,
+		  .orig.how.flags = O_RDONLY, .orig.mode  = 0500,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700, .new.err = err_access },
+		{ .open = sys_openat,	  .chmod_mode = 0200,
+		  .orig.how.flags = O_WRONLY, .orig.mode  = 0300,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700, .new.err = err_access },
+
+		/* O_PATH re-opens (of ordinary files) will always work. */
+		{ .open = sys_openat,	  .chmod_mode = 0000,
+		  .orig.how.flags =   O_PATH, .orig.mode  = 0070,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300 },
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags =   O_PATH, .orig.mode  = 0070,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300 },
+
+		{ .open = sys_openat,	  .chmod_mode = 0000,
+		  .orig.how.flags =   O_PATH, .orig.mode  = 0070,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500 },
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags =   O_PATH, .orig.mode  = 0070,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500 },
+
+		{ .open = sys_openat,	  .chmod_mode = 0000,
+		  .orig.how.flags =   O_PATH, .orig.mode  = 0070,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700 },
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags =   O_PATH, .orig.mode  = 0070,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700 },
+
+		/*
+		 * openat2(2) UPGRADE_NO* flags. In the privileged case, the re-open
+		 * will work but the mode will still be scoped to the mode (or'd with
+		 * the open acc_mode).
+		 */
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0010,
+		  .orig.how.upgrade_mask = UPGRADE_NOREAD | UPGRADE_NOWRITE,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500, .new.err = err_access },
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0010,
+		  .orig.how.upgrade_mask = UPGRADE_NOREAD | UPGRADE_NOWRITE,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300, .new.err = err_access },
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0010,
+		  .orig.how.upgrade_mask = UPGRADE_NOREAD | UPGRADE_NOWRITE,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700, .new.err = err_access },
+
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0050,
+		  .orig.how.upgrade_mask = UPGRADE_NOWRITE,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500 },
+
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0030,
+		  .orig.how.upgrade_mask = UPGRADE_NOREAD,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300 },
+
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0030,
+		  .orig.how.upgrade_mask = UPGRADE_NOREAD,
+		  .new.how.flags  = O_RDONLY, .new.mode   = 0500, .new.err = err_access },
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0050,
+		  .orig.how.upgrade_mask = UPGRADE_NOWRITE,
+		  .new.how.flags  = O_WRONLY, .new.mode   = 0300, .new.err = err_access },
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0030,
+		  .orig.how.upgrade_mask = UPGRADE_NOREAD,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700, .new.err = err_access },
+		{ .open = sys_openat2,  .chmod_mode = 0000,
+		  .orig.how.flags = O_PATH, .orig.mode = 0050,
+		  .orig.how.upgrade_mask = UPGRADE_NOWRITE,
+		  .new.how.flags  =   O_RDWR, .new.mode   = 0700, .new.err = err_access },
+	};
+
+	BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_REOPEN_TESTS);
+
+	for (int i = 0; i < ARRAY_LEN(tests); i++) {
+		int fd;
+		char *orig_flagset, *new_flagset;
+		struct reopen_test *test = &tests[i];
+		void (*resultfn)(const char *msg, ...) = ksft_test_result_pass;
+
+		E_chmod(tmpfile, test->chmod_mode);
+
+		fd = test->open(AT_FDCWD, tmpfile, &test->orig.how);
+		E_assert(fd >= 0, "open '%s' failed: %m\n", tmpfile);
+
+		/* Make sure that any EACCES we see is not from inode permissions. */
+		E_chmod(tmpfile, 0777);
+
+		if (reopen(fd, test))
+			resultfn = ksft_test_result_fail;
+
+		close(fd);
+
+		new_flagset = openat_flags(test->new.how.flags);
+		if (test->open == sys_openat)
+			orig_flagset = openat_flags(test->orig.how.flags);
+		else if (test->open == sys_openat2)
+			orig_flagset = openat2_flags(&test->orig.how);
+		else
+			ksft_exit_fail_msg("unknown test->open\n");
+
+		resultfn("%sordinary reopen of (orig[%s]=%s, new=%s) chmod=%.3o %s\n",
+			 privileged ? "privileged " : "",
+			 test->open == sys_openat ? "openat" : "openat2",
+			 orig_flagset, new_flagset, test->chmod_mode,
+			 test->new.err < 0 ? strerror(-test->new.err) : "works");
+		fflush(stdout);
+
+		free(new_flagset);
+		free(orig_flagset);
+	}
+
+	unlink(tmpfile);
+}
+
+#define NUM_CLOEXEC_TESTS 1
+
+void test_openat2_cloexec_test(void)
+{
+	void (*resultfn)(const char *msg, ...) = ksft_test_result_pass;
+	struct open_how how = {
+		.flags = O_CLOEXEC | O_PATH | O_DIRECTORY,
+	};
+
+	int fd = sys_openat2(AT_FDCWD, ".", &how);
+	E_assert(fd >= 0, "open '.' failed: %m\n");
+
+	int flags = fcntl(fd, F_GETFD);
+	E_assert(flags >= 0, "F_GETFD failed: %m\n");
+
+	if (!(flags & FD_CLOEXEC))
+		resultfn = ksft_test_result_fail;
+
+	resultfn("openat2(O_CLOEXEC) works as expected\n");
+}
+
+int main(int argc, char **argv)
+{
+	bool privileged;
+
+	ksft_print_header();
+	ksft_set_plan(2 * NUM_REOPEN_TESTS + NUM_CLOEXEC_TESTS);
+	test_openat2_supported();
+
+	/*
+	 * Technically we should be checking CAP_DAC_OVERRIDE, but it's easier to
+	 * just assume that euid=0 has the full capability set.
+	 */
+	privileged = (geteuid() == 0);
+	if (!privileged)
+		ksft_test_result_skip("privileged tests require euid == 0\n");
+	else {
+		test_reopen_ordinary(privileged);
+
+		E_setresuid(65534, 65534, 65534);
+		privileged = (geteuid() == 0);
+	}
+
+	test_reopen_ordinary(privileged);
+	test_openat2_cloexec_test();
+
+	if (ksft_get_fail_cnt() + ksft_get_error_cnt() > 0)
+		ksft_exit_fail();
+	else
+		ksft_exit_pass();
+}
diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
new file mode 100644
index 000000000000..a6950d91e014
--- /dev/null
+++ b/tools/testing/selftests/openat2/openat2_test.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Aleksa Sarai <cyphar@cyphar.com>
+ * Copyright (C) 2018-2019 SUSE LLC.
+ */
+
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <sched.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/mount.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <string.h>
+
+#include "../kselftest.h"
+#include "helpers.h"
+
+#define NUM_OPENAT2_TESTS 7
+
+struct open_how_ext {
+	struct open_how inner;
+	uint32_t extra1;
+	char pad1[128];
+	uint32_t extra2;
+	char pad2[128];
+	uint32_t extra3;
+};
+
+struct struct_test {
+	struct open_how_ext arg;
+	size_t size;
+	int err;
+};
+
+void test_openat2_struct(void)
+{
+	struct struct_test tests[] = {
+		/* Normal struct. */
+		{ .arg.inner.flags = O_RDONLY,
+		  .size = sizeof(struct open_how) },
+		/* Bigger struct, with zero padding. */
+		{ .arg.inner.flags = O_RDONLY,
+		  .size = sizeof(struct open_how_ext) },
+
+		/* TODO: Once expanded, check zero-padding. */
+
+		/* Smaller than version-0 struct. */
+		{ .arg.inner.flags = O_RDONLY, .size = 0, .err = -EINVAL },
+		{ .arg.inner.flags = O_RDONLY,
+		  .size = OPEN_HOW_SIZE_VER0 - 1, .err = -EINVAL },
+		/* Bigger struct, with non-zero trailing bytes. */
+		{ .arg.inner.flags = O_RDONLY, .arg.extra1 = 0xdeadbeef,
+		  .size = sizeof(struct open_how_ext), .err = -E2BIG },
+		{ .arg.inner.flags = O_RDONLY, .arg.extra2 = 0xfeedcafe,
+		  .size = sizeof(struct open_how_ext), .err = -E2BIG },
+		{ .arg.inner.flags = O_RDONLY, .arg.extra3 = 0xabad1dea,
+		  .size = sizeof(struct open_how_ext), .err = -E2BIG },
+	};
+
+	BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_TESTS);
+
+	for (int i = 0; i < ARRAY_LEN(tests); i++) {
+		int fd;
+		bool failed;
+		void (*resultfn)(const char *msg, ...) = ksft_test_result_pass;
+		struct struct_test *test = &tests[i];
+
+		fd = raw_openat2(AT_FDCWD, ".", &test->arg, test->size);
+		if (test->err >= 0)
+			failed = (fd < 0);
+		else
+			failed = (fd != test->err);
+		if (fd >= 0)
+			close(fd);
+
+		if (failed)
+			resultfn = ksft_test_result_fail;
+
+		if (test->err >= 0)
+			resultfn("openat2([.], [struct], %ld [kernel:%ld]) ==> [.] [got:%s]\n",
+				 test->size, sizeof(struct open_how),
+				 (fd >= 0) ? "." : strerror(-fd));
+		else
+			resultfn("openat2([.], [struct], %ld [kernel:%ld]) ==> %s [got:%s]\n",
+				 test->size, sizeof(struct open_how),
+				 strerror(-test->err),
+				 (fd >= 0) ? "." : strerror(-fd));
+		fflush(stdout);
+	}
+}
+
+int main(int argc, char **argv)
+{
+	ksft_print_header();
+	ksft_set_plan(NUM_OPENAT2_TESTS);
+
+	test_openat2_supported();
+	test_openat2_struct();
+
+	if (ksft_get_fail_cnt() + ksft_get_error_cnt() > 0)
+		ksft_exit_fail();
+	else
+		ksft_exit_pass();
+}
diff --git a/tools/testing/selftests/openat2/rename_attack_test.c b/tools/testing/selftests/openat2/rename_attack_test.c
new file mode 100644
index 000000000000..39b20ea185d5
--- /dev/null
+++ b/tools/testing/selftests/openat2/rename_attack_test.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Aleksa Sarai <cyphar@cyphar.com>
+ * Copyright (C) 2018-2019 SUSE LLC.
+ */
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/mount.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <string.h>
+#include <syscall.h>
+#include <limits.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+#include "helpers.h"
+
+/* Construct a test directory with the following structure:
+ *
+ * root/
+ * |-- a/
+ * |   `-- c/
+ * `-- b/
+ */
+int setup_testdir(void)
+{
+	int dfd;
+	char dirname[] = "/tmp/ksft-openat2-rename-attack.XXXXXX";
+
+	/* Make the top-level directory. */
+	if (!mkdtemp(dirname))
+		ksft_exit_fail_msg("setup_testdir: failed to create tmpdir\n");
+	dfd = open(dirname, O_PATH | O_DIRECTORY);
+	if (dfd < 0)
+		ksft_exit_fail_msg("setup_testdir: failed to open tmpdir\n");
+
+	E_mkdirat(dfd, "a", 0755);
+	E_mkdirat(dfd, "b", 0755);
+	E_mkdirat(dfd, "a/c", 0755);
+
+	return dfd;
+}
+
+/* Swap @dirfd/@a and @dirfd/@b constantly. Parent must kill this process. */
+pid_t spawn_attack(int dirfd, char *a, char *b)
+{
+	pid_t child = fork();
+	if (child != 0)
+		return child;
+
+	/* If the parent (the test process) dies, kill ourselves too. */
+	prctl(PR_SET_PDEATHSIG, SIGKILL);
+
+	/* Swap @a and @b. */
+	for (;;)
+		renameat2(dirfd, a, dirfd, b, RENAME_EXCHANGE);
+	exit(1);
+}
+
+#define NUM_RENAME_TESTS 1
+#define ROUNDS 400000
+
+void test_rename_attack(void)
+{
+	int dfd, afd, escaped_count = 0;
+	void (*resultfn)(const char *msg, ...) = ksft_test_result_pass;
+	pid_t child;
+
+	dfd = setup_testdir();
+	afd = openat(dfd, "a", O_PATH);
+	if (afd < 0)
+		ksft_exit_fail_msg("test_rename_attack: failed to open 'a'\n");
+
+	child = spawn_attack(dfd, "a/c", "b");
+
+	for (int i = 0; i < ROUNDS; i++) {
+		int fd;
+		bool failed;
+		struct open_how how = {
+			.flags = O_PATH,
+			.resolve = RESOLVE_IN_ROOT,
+		};
+		char *victim_path = "c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../../c/../..";
+
+		fd = sys_openat2(afd, victim_path, &how);
+		if (fd < 0)
+			failed = (fd != -EXDEV);
+		else
+			failed = !fdequal(fd, afd, NULL);
+
+		escaped_count += failed;
+		close(fd);
+	}
+
+	if (escaped_count > 0)
+		resultfn = ksft_test_result_fail;
+
+	resultfn("rename attack fails (expected 0 breakouts in %d runs, got %d)\n",
+		 ROUNDS, escaped_count);
+
+	/* Should be killed anyway, but might as well make sure. */
+	kill(child, SIGKILL);
+}
+
+int main(int argc, char **argv)
+{
+	ksft_print_header();
+	ksft_set_plan(NUM_RENAME_TESTS);
+	test_openat2_supported();
+
+	test_rename_attack();
+
+	if (ksft_get_fail_cnt() + ksft_get_error_cnt() > 0)
+		ksft_exit_fail();
+	else
+		ksft_exit_pass();
+}
diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testing/selftests/openat2/resolve_test.c
new file mode 100644
index 000000000000..8ef3dbb7edbe
--- /dev/null
+++ b/tools/testing/selftests/openat2/resolve_test.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Aleksa Sarai <cyphar@cyphar.com>
+ * Copyright (C) 2018-2019 SUSE LLC.
+ */
+
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <sched.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/mount.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <string.h>
+
+#include "../kselftest.h"
+#include "helpers.h"
+
+/*
+ * Construct a test directory with the following structure:
+ *
+ * root/
+ * |-- procexe -> /proc/self/exe
+ * |-- procroot -> /proc/self/root
+ * |-- root/
+ * |-- mnt/ [mountpoint]
+ * |   |-- self -> ../mnt/
+ * |   `-- absself -> /mnt/
+ * |-- etc/
+ * |   `-- passwd
+ * |-- creatlink -> /newfile3
+ * |-- relsym -> etc/passwd
+ * |-- abssym -> /etc/passwd
+ * |-- abscheeky -> /cheeky
+ * |-- abscheeky -> /cheeky
+ * `-- cheeky/
+ *     |-- absself -> /
+ *     |-- self -> ../../root/
+ *     |-- garbageself -> /../../root/
+ *     |-- passwd -> ../cheeky/../cheeky/../etc/../etc/passwd
+ *     |-- abspasswd -> /../cheeky/../cheeky/../etc/../etc/passwd
+ *     |-- dotdotlink -> ../../../../../../../../../../../../../../etc/passwd
+ *     `-- garbagelink -> /../../../../../../../../../../../../../../etc/passwd
+ */
+int setup_testdir(void)
+{
+	int dfd, tmpfd;
+	char dirname[] = "/tmp/ksft-openat2-testdir.XXXXXX";
+
+	/* Unshare and make /tmp a new directory. */
+	E_unshare(CLONE_NEWNS);
+	E_mount("", "/tmp", "", MS_PRIVATE, "");
+
+	/* Make the top-level directory. */
+	if (!mkdtemp(dirname))
+		ksft_exit_fail_msg("setup_testdir: failed to create tmpdir\n");
+	dfd = open(dirname, O_PATH | O_DIRECTORY);
+	if (dfd < 0)
+		ksft_exit_fail_msg("setup_testdir: failed to open tmpdir\n");
+
+	/* A sub-directory which is actually used for tests. */
+	E_mkdirat(dfd, "root", 0755);
+	tmpfd = openat(dfd, "root", O_PATH | O_DIRECTORY);
+	if (tmpfd < 0)
+		ksft_exit_fail_msg("setup_testdir: failed to open tmpdir\n");
+	close(dfd);
+	dfd = tmpfd;
+
+	E_symlinkat("/proc/self/exe", dfd, "procexe");
+	E_symlinkat("/proc/self/root", dfd, "procroot");
+	E_mkdirat(dfd, "root", 0755);
+
+	/* There is no mountat(2), so use chdir. */
+	E_mkdirat(dfd, "mnt", 0755);
+	E_fchdir(dfd);
+	E_mount("tmpfs", "./mnt", "tmpfs", MS_NOSUID | MS_NODEV, "");
+	E_symlinkat("../mnt/", dfd, "mnt/self");
+	E_symlinkat("/mnt/", dfd, "mnt/absself");
+
+	E_mkdirat(dfd, "etc", 0755);
+	E_touchat(dfd, "etc/passwd");
+
+	E_symlinkat("/newfile3", dfd, "creatlink");
+	E_symlinkat("etc/passwd", dfd, "relsym");
+	E_symlinkat("/etc/passwd", dfd, "abssym");
+	E_symlinkat("/cheeky", dfd, "abscheeky");
+
+	E_mkdirat(dfd, "cheeky", 0755);
+
+	E_symlinkat("/", dfd, "cheeky/absself");
+	E_symlinkat("../../root/", dfd, "cheeky/self");
+	E_symlinkat("/../../root/", dfd, "cheeky/garbageself");
+
+	E_symlinkat("../cheeky/../etc/../etc/passwd", dfd, "cheeky/passwd");
+	E_symlinkat("/../cheeky/../etc/../etc/passwd", dfd, "cheeky/abspasswd");
+
+	E_symlinkat("../../../../../../../../../../../../../../etc/passwd",
+		    dfd, "cheeky/dotdotlink");
+	E_symlinkat("/../../../../../../../../../../../../../../etc/passwd",
+		    dfd, "cheeky/garbagelink");
+
+	return dfd;
+}
+
+struct basic_test {
+	const char *dir;
+	const char *path;
+	struct open_how how;
+	bool pass;
+	union {
+		int err;
+		const char *path;
+	} out;
+};
+
+#define NUM_OPENAT2_OPATH_TESTS 84
+
+void test_openat2_opath_tests(void)
+{
+	int rootfd;
+	char *procselfexe;
+
+	E_asprintf(&procselfexe, "/proc/%d/exe", getpid());
+	rootfd = setup_testdir();
+
+	struct basic_test tests[] = {
+		/** RESOLVE_BENEATH **/
+		/* Attempts to cross dirfd should be blocked. */
+		{ .path = "/",			.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "cheeky/absself",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "abscheeky/absself",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "..",			.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "../root/",		.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "cheeky/self",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "abscheeky/self",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "cheeky/garbageself",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "abscheeky/garbageself", .how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		/* Only relative paths that stay inside dirfd should work. */
+		{ .path = "root",		.how.resolve = RESOLVE_BENEATH,
+		  .out.path = "root",		.pass = true },
+		{ .path = "etc",		.how.resolve = RESOLVE_BENEATH,
+		  .out.path = "etc",		.pass = true },
+		{ .path = "etc/passwd",		.how.resolve = RESOLVE_BENEATH,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "relsym",		.how.resolve = RESOLVE_BENEATH,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "cheeky/passwd",	.how.resolve = RESOLVE_BENEATH,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "abscheeky/passwd",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "abssym",		.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "/etc/passwd",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "cheeky/abspasswd",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "abscheeky/abspasswd", .how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		/* Tricky paths should fail. */
+		{ .path = "cheeky/dotdotlink",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "abscheeky/dotdotlink", .how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "cheeky/garbagelink",	.how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "abscheeky/garbagelink", .how.resolve = RESOLVE_BENEATH,
+		  .out.err = -EXDEV,		.pass = false },
+
+		/** RESOLVE_IN_ROOT **/
+		/* All attempts to cross the dirfd will be scoped-to-root. */
+		{ .path = "/",			.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = NULL,		.pass = true },
+		{ .path = "cheeky/absself",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = NULL,		.pass = true },
+		{ .path = "abscheeky/absself",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = NULL,		.pass = true },
+		{ .path = "..",			.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = NULL,		.pass = true },
+		{ .path = "../root/",		.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "root",		.pass = true },
+		{ .path = "../root/",		.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "root",		.pass = true },
+		{ .path = "cheeky/self",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "root",		.pass = true },
+		{ .path = "cheeky/garbageself",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "root",		.pass = true },
+		{ .path = "abscheeky/garbageself", .how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "root",		.pass = true },
+		{ .path = "root",		.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "root",		.pass = true },
+		{ .path = "etc",		.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc",		.pass = true },
+		{ .path = "etc/passwd",		.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "relsym",		.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "cheeky/passwd",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "abscheeky/passwd",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "abssym",		.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "/etc/passwd",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "cheeky/abspasswd",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "abscheeky/abspasswd", .how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "cheeky/dotdotlink",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "abscheeky/dotdotlink", .how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "/../../../../abscheeky/dotdotlink", .how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "cheeky/garbagelink",	.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "abscheeky/garbagelink", .how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		{ .path = "/../../../../abscheeky/garbagelink", .how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "etc/passwd",	.pass = true },
+		/* O_CREAT should handle trailing symlinks correctly. */
+		{ .path = "newfile1",		.how.flags = O_CREAT,
+						.how.mode = 0700,
+						.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "newfile1",	.pass = true },
+		{ .path = "/newfile2",		.how.flags = O_CREAT,
+						.how.mode = 0700,
+						.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "newfile2",	.pass = true },
+		{ .path = "/creatlink",		.how.flags = O_CREAT,
+						.how.mode = 0700,
+						.how.resolve = RESOLVE_IN_ROOT,
+		  .out.path = "newfile3",	.pass = true },
+
+		/** RESOLVE_NO_XDEV **/
+		/* Crossing *down* into a mountpoint is disallowed. */
+		{ .path = "mnt",		.how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "mnt/",		.how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "mnt/.",		.how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+		/* Crossing *up* out of a mountpoint is disallowed. */
+		{ .dir = "mnt", .path = ".",	.how.resolve = RESOLVE_NO_XDEV,
+		  .out.path = "mnt",		.pass = true },
+		{ .dir = "mnt", .path = "..",	.how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .dir = "mnt", .path = "../mnt", .how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .dir = "mnt", .path = "self",	.how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .dir = "mnt", .path = "absself", .how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+		/* Jumping to "/" is ok, but later components cannot cross. */
+		{ .dir = "mnt", .path = "/",	.how.resolve = RESOLVE_NO_XDEV,
+		  .out.path = "/",		.pass = true },
+		{ .dir = "/", .path = "/",	.how.resolve = RESOLVE_NO_XDEV,
+		  .out.path = "/",		.pass = true },
+		{ .path = "/proc/1",		.how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+		{ .path = "/tmp",		.how.resolve = RESOLVE_NO_XDEV,
+		  .out.err = -EXDEV,		.pass = false },
+
+		/** RESOLVE_NO_MAGICLINKS **/
+		/* Regular symlinks should work. */
+		{ .path = "relsym",		.how.resolve = RESOLVE_NO_MAGICLINKS,
+		  .out.path = "etc/passwd",	.pass = true },
+		/* Magic-links should not work. */
+		{ .path = "procexe",		.how.resolve = RESOLVE_NO_MAGICLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "/proc/self/exe",	.how.resolve = RESOLVE_NO_MAGICLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "procroot/etc",	.how.resolve = RESOLVE_NO_MAGICLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "/proc/self/root/etc", .how.resolve = RESOLVE_NO_MAGICLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "/proc/self/root/etc", .how.flags = O_NOFOLLOW,
+						 .how.resolve = RESOLVE_NO_MAGICLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "/proc/self/exe",	.how.flags = O_NOFOLLOW,
+						.how.resolve = RESOLVE_NO_MAGICLINKS,
+		  .out.path = procselfexe,	.pass = true },
+
+		/** RESOLVE_NO_SYMLINKS **/
+		/* Normal paths should work. */
+		{ .path = ".",			.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.path = NULL,		.pass = true },
+		{ .path = "root",		.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.path = "root",		.pass = true },
+		{ .path = "etc",		.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.path = "etc",		.pass = true },
+		{ .path = "etc/passwd",		.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.path = "etc/passwd",	.pass = true },
+		/* Regular symlinks are blocked. */
+		{ .path = "relsym",		.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "abssym",		.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "cheeky/garbagelink",	.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "abscheeky/garbagelink", .how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "abscheeky/absself",	.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		/* Trailing symlinks with NO_FOLLOW. */
+		{ .path = "relsym",		.how.flags = O_NOFOLLOW,
+						.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.path = "relsym",		.pass = true },
+		{ .path = "abssym",		.how.flags = O_NOFOLLOW,
+						.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.path = "abssym",		.pass = true },
+		{ .path = "cheeky/garbagelink",	.how.flags = O_NOFOLLOW,
+						.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.path = "cheeky/garbagelink", .pass = true },
+		{ .path = "abscheeky/garbagelink", .how.flags = O_NOFOLLOW,
+						   .how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+		{ .path = "abscheeky/absself",	.how.flags = O_NOFOLLOW,
+						.how.resolve = RESOLVE_NO_SYMLINKS,
+		  .out.err = -ELOOP,		.pass = false },
+	};
+
+	BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_OPATH_TESTS);
+
+	for (int i = 0; i < ARRAY_LEN(tests); i++) {
+		int dfd, fd;
+		bool failed;
+		void (*resultfn)(const char *msg, ...) = ksft_test_result_pass;
+		struct basic_test *test = &tests[i];
+		char *flagstr;
+
+		/* Auto-set O_PATH. */
+		if (!(test->how.flags & O_CREAT))
+			test->how.flags |= O_PATH;
+		flagstr = openat2_flags(&test->how);
+
+		if (test->dir)
+			dfd = openat(rootfd, test->dir, O_PATH | O_DIRECTORY);
+		else
+			dfd = dup(rootfd);
+		if (dfd < 0) {
+			resultfn = ksft_test_result_error;
+			goto next;
+		}
+
+		fd = sys_openat2(dfd, test->path, &test->how);
+		if (test->pass)
+			failed = (fd < 0 || !fdequal(fd, rootfd, test->out.path));
+		else
+			failed = (fd != test->out.err);
+		if (fd >= 0)
+			close(fd);
+		close(dfd);
+
+		if (failed)
+			resultfn = ksft_test_result_fail;
+
+next:
+		if (test->pass)
+			resultfn("openat2(root[%s], %s, %s) ==> %s\n",
+				 test->dir ?: ".", test->path, flagstr,
+				 test->out.path ?: ".");
+		else
+			resultfn("openat2(root[%s], %s, %s) ==> %d (%s)\n",
+				 test->dir ?: ".", test->path, flagstr,
+				 test->out.err, strerror(-test->out.err));
+		fflush(stdout);
+
+		free(flagstr);
+	}
+
+	free(procselfexe);
+	close(rootfd);
+}
+
+int main(int argc, char **argv)
+{
+	ksft_print_header();
+	ksft_set_plan(NUM_OPENAT2_OPATH_TESTS);
+	test_openat2_supported();
+
+	/* NOTE: We should be checking for CAP_SYS_ADMIN here... */
+	if (geteuid() != 0)
+		ksft_exit_skip("openat2(2) tests require euid == 0\n");
+
+	test_openat2_opath_tests();
+
+	if (ksft_get_fail_cnt() + ksft_get_error_cnt() > 0)
+		ksft_exit_fail();
+	else
+		ksft_exit_pass();
+}
-- 
2.23.0


