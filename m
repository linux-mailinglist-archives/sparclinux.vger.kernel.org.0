Return-Path: <sparclinux+bounces-3201-lists+sparclinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B199BA4281D
	for <lists+sparclinux@lfdr.de>; Mon, 24 Feb 2025 17:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E89743B1DCF
	for <lists+sparclinux@lfdr.de>; Mon, 24 Feb 2025 16:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A19263884;
	Mon, 24 Feb 2025 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fagKxyNG"
X-Original-To: sparclinux@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22F0157465
	for <sparclinux@vger.kernel.org>; Mon, 24 Feb 2025 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740415119; cv=none; b=nTPu6YsNhO9Nfx1MulbN5cHoDWcN5MMURi1G69TDXIQQ8dzPP8Lrgv2JW8pOj0g0DYaB70bg709tiYTm+mCZKmA56q/bXWtuWoZlhG0CYrIKe7DSJFQog325RTwPO84zs+G3sWM4jmU5vSag7FGjNea66rykI4JHIwrH+rvqDvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740415119; c=relaxed/simple;
	bh=MMSWJuJU5qsromQVdUd6ChbKWags0ip1ne8PGz+pULU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCsPK8bQ0gvKL6mla6QmJU/44ycfWB1bFdTOYu1qsEKq0gfaes9zDD6s+pdvKKXKEsZONN63dFXiBr18LioaRgn4Jsi7akgHxe2g9rUBd49DHY5/0f5jCOTt532LUMpe0skhKwz5mkASe33vsHrjwcBL/8q2oUT6zGUt1Nptcik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fagKxyNG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740415116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HQ3dWVPqC2Dw8ff2CbnjKgP3N74oCRMEtHC7r2pq7E=;
	b=fagKxyNGBY5QzijzfN3aXKkXkLEkW37/Y565Z6ESKi+9I+U5VEOGGU0AGlgLOb56UME7u/
	tcvA73jmWLKXQvm66JAQkZn6ERrhizBhIzvzWJs9p5naQt9nXNLuz94Cg55nL7GUvjrmk+
	P2Gh4TxiLQoAB/Ezmp8BFhqB51xcSOk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-Pu_wNaClNcGCp59AVZOV1w-1; Mon, 24 Feb 2025 11:38:34 -0500
X-MC-Unique: Pu_wNaClNcGCp59AVZOV1w-1
X-Mimecast-MFC-AGG-ID: Pu_wNaClNcGCp59AVZOV1w_1740415113
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5da15447991so4182878a12.3
        for <sparclinux@vger.kernel.org>; Mon, 24 Feb 2025 08:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740415113; x=1741019913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HQ3dWVPqC2Dw8ff2CbnjKgP3N74oCRMEtHC7r2pq7E=;
        b=almwMSNCl2Houmm142VrXBsb1QbIVIpvrRyeK+3pICmtL50ILLHGGKnzx+4oVRS37Y
         7k3pHIPZXrjy9tSZIvagBakWGGFjGPpT/WB3Qc3axEV/ncCtBa022ssZhlbrcdavJ/pB
         0tf7fJsNwDcPUKhsDxb52g6U2KKAmiqN8tjLOWh5AjWIisSsxuSxz0QKUmSJHy9QcUNw
         Dh4M4N9Wj5xoH+2pPOvssMFo3k2LoxEI5jNuz8SqdCgcjknnfrclFM0OWASyH7mRwfsi
         +nNnvenygS4FI2hslCRfYuAxIGC023ufyLil1lK7ewfKUd7LQ+aeq11AUdN1/aRCxfM6
         yk9A==
X-Forwarded-Encrypted: i=1; AJvYcCUCMPqrJAdaBqazr2rxZsOSkiCwkh+qiKsSygcKHk3msLbjtLid2D6cw7rQiCGRsWY2KWi3mZTeqwCP@vger.kernel.org
X-Gm-Message-State: AOJu0YzIihzPoSqN2F62sKnqhwcyULA10fP2cniRmCizgdL4fXyVCzph
	Odwx0+cVaA7QNXrskZsD5ALdHAAacmxsmUnAZYGriX3QbzGFyN4RkOtHggQm4BHyr27itgHgTMZ
	ygq2rFzMHbe/ubcXii3uSx7bBXs4aCPAvKogDw+ssETW49C102DDSYDoR0w==
X-Gm-Gg: ASbGncvLm/9+UrTDyFye7rz15D1cIMltqbEeXFekHSJ5X3jFG/Yn6NOKijeJR/bZcUa
	0DekcDkKq/npOcMUfNRMbAObtQ0rJN0+kaZdBvJ9YyUfli89veIJIeWJToDfMdkMFsnPGpinqVA
	r8FejDANQ17Ynfv5ENL7uesTtUqrMpiBDWORrhTgjITmAfdFDCbBqr6lCaTLyUiov9MQHRitsRj
	B+gSagt0v9MjMCUcWEWUwUm2vSds4qtENLsBQARncD6Jdvwk2Mgn2/b+MXBAsyEMQVUs5qjAcHz
	XC5qBVaTKLC9Ms7p7utNmaTP0LlfRtvDVxc=
X-Received: by 2002:a05:6402:2808:b0:5e0:2d53:b2a with SMTP id 4fb4d7f45d1cf-5e0b70c0d82mr36931004a12.3.1740415112442;
        Mon, 24 Feb 2025 08:38:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz+s0ONL8ejkTU1UmPgTYUJUij0Y+jBU/pmIRhrfprGz1EGlR/3qJKoYKtVNj3n95rvN+FPg==
X-Received: by 2002:a05:6402:2808:b0:5e0:2d53:b2a with SMTP id 4fb4d7f45d1cf-5e0b70c0d82mr36930832a12.3.1740415111286;
        Mon, 24 Feb 2025 08:38:31 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb4d3ef3c0sm1913191666b.41.2025.02.24.08.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:38:30 -0800 (PST)
Date: Mon, 24 Feb 2025 17:38:29 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Jan Kara <jack@suse.cz>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <pze5ejdkh5hr6qz75xbn65vmjyaw2iauseqdi52sjt3tzc6sk4@wi7vy4af5vof>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <fyp7gcbeo3xlrh7zi7k6m5aa6h5otbufxq3kh5zvgr3sjdbxl3@4nkuwx46yajk>
Precedence: bulk
X-Mailing-List: sparclinux@vger.kernel.org
List-Id: <sparclinux.vger.kernel.org>
List-Subscribe: <mailto:sparclinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:sparclinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fyp7gcbeo3xlrh7zi7k6m5aa6h5otbufxq3kh5zvgr3sjdbxl3@4nkuwx46yajk>

On 2025-02-24 11:54:34, Jan Kara wrote:
> On Tue 11-02-25 18:22:47, Andrey Albershteyn wrote:
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > extended attributes/flags. The syscalls take parent directory fd and
> > path to the child together with struct fsxattr.
> > 
> > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > that file don't need to be open as we can reference it with a path
> > instead of fd. By having this we can manipulated inode extended
> > attributes not only on regular files but also on special ones. This
> > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > we can not call ioctl() directly on the filesystem inode using fd.
> > 
> > This patch adds two new syscalls which allows userspace to get/set
> > extended inode attributes on special files by using parent directory
> > and a path - *at() like syscall.
> > 
> > Also, as vfs_fileattr_set() is now will be called on special files
> > too, let's forbid any other attributes except projid and nextents
> > (symlink can have an extent).
> > 
> > CC: linux-api@vger.kernel.org
> > CC: linux-fsdevel@vger.kernel.org
> > CC: linux-xfs@vger.kernel.org
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> 
> Some comments below:
> 
> > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> > +		struct fsxattr __user *, fsx, unsigned int, at_flags)
> > +{
> > +	CLASS(fd, dir)(dfd);
> > +	struct fileattr fa;
> > +	struct path filepath;
> > +	int error;
> > +	unsigned int lookup_flags = 0;
> > +
> > +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> > +		return -EINVAL;
> > +
> > +	if (at_flags & AT_SYMLINK_FOLLOW)
> 	    ^^ This should be !(at_flags & AT_SYMLINK_NOFOLLOW)?
> 
> In the check above you verify for AT_SYMLINK_NOFOLLOW and that also matches
> what setxattrat() does...

Right, didn't notice that this is actually opposite to setxattrat(),
will change that.

> 
> 
> > +		lookup_flags |= LOOKUP_FOLLOW;
> > +
> > +	if (at_flags & AT_EMPTY_PATH)
> > +		lookup_flags |= LOOKUP_EMPTY;
> > +
> > +	if (fd_empty(dir))
> > +		return -EBADF;
> 
> This check is wrong and in fact the whole dfd handling looks buggy.
> openat(2) manpage describes the expected behavior:
> 
>        The dirfd argument is used in conjunction with the pathname argument as
>        follows:
> 
>        •  If the pathname given in pathname is absolute,  then  dirfd  is  ig-
>           nored.
> 	  ^^^^ This is what you break. If the pathname is absolute, you're
> not expected to touch dirfd.
> 
>        •  If  the pathname given in pathname is relative and dirfd is the spe-
>           cial value AT_FDCWD, then pathname is interpreted  relative  to  the
>           current working directory of the calling process (like open()).
>           ^^^ Also AT_FDCWD handling would be broken by the above check.
> 
>        •  If  the  pathname  given  in pathname is relative, then it is inter-
>           preted relative to the directory referred to by the file  descriptor
>           dirfd  (rather than relative to the current working directory of the
>           calling process, as is done by open() for a relative pathname).   In
>           this  case,  dirfd  must  be a directory that was opened for reading
>           (O_RDONLY) or using the O_PATH flag.
> 
>        If the pathname given in pathname is relative, and dirfd is not a valid
>        file descriptor, an error (EBADF) results.  (Specifying an invalid file
>        descriptor number in dirfd can be used as a means to ensure that  path-
>        name is absolute.)
> 
> > +
> > +	error = user_path_at(dfd, filename, lookup_flags, &filepath);
> 		^^^ And user_path_at() isn't quite what you need either
> because with AT_EMPTY_PATH we also want to allow for filename to be NULL
> (not just empty string) and user_path_at() does not support that. That's
> why I in my previous replies suggested you should follow what setxattrat()
> does and that sadly it is more painful than it should be. You need
> something like:
> 
> 	name = getname_maybe_null(filename, at_flags);
> 	if (!name) {
> 		CLASS(fd, f)(dfd);
> 
> 		if (fd_empty(f))
> 			return -EBADF;
> 		error = vfs_fileattr_get(file_dentry(fd_file(f)), &fa);
> 	} else {
> 		error = filename_lookup(dfd, filename, lookup_flags, &filepath,
> 					NULL);
> 		if (error)
> 			goto out;
> 		error = vfs_fileattr_get(filepath.dentry, &fa);
> 		path_put(&filepath);
> 	}
> 	if (!error)
> 		error = copy_fsxattr_to_user(&fa, fsx);
> out:
> 	putname(name);
> 	return error;
> 
> Longer term, we need to provide user_path_maybe_null_at() for this but I
> don't want to drag you into this cleanup :)

Oh, I missed that, thanks for pointing this out, I will change it as
suggested.

-- 
- Andrey


