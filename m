Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D72629A05
	for <lists+sparclinux@lfdr.de>; Fri, 24 May 2019 16:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391172AbfEXO0S (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 24 May 2019 10:26:18 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:43943 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390885AbfEXO0S (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 24 May 2019 10:26:18 -0400
Received: by mail-ua1-f41.google.com with SMTP id u4so3586821uau.10
        for <sparclinux@vger.kernel.org>; Fri, 24 May 2019 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuHjEUYPKPaYzIPbWyzdv1bFPXU0IU+t67z527JXFX4=;
        b=aRUwNOzSVT+0FHLO2dlsNbYXRX2dm74gVJdfhC+8sTAUbsQYIz+xBbu4g6l/yluB/o
         xWjw6Medv/ZFwLcbg9wLuwtZX/i2qDS7m8FTRJztWKSITtK7v3O1lTFVj8xEfbZAztXO
         0RS+2crfqzgFmg2YDhbvXjqPwQPXoMCAyMV4WDjm5iPuk3Y8bDRG3tFdy2moZa3bNzZz
         bcaPtsokA+6nyoQqIdJVDovKxX9SbrP5klIhWxIzxVhM/tpFVcM8ML5srNY0+s+hJ4fb
         7bSPN/mP3p4fTDGvPPJkCdCbFrf8mTalpPwTC8YmJMBHm25CqrFHFGZGBgNGPSrzi4ru
         +g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuHjEUYPKPaYzIPbWyzdv1bFPXU0IU+t67z527JXFX4=;
        b=pVgpr+iGHtYTbqLMcn5HfW2qpxRy4FHys08qfDi0/iCCUqxY7p1SZ79xZnznAluQIZ
         9eH3XSkVdYLhFkjbekPCePHEvqyGPUNZBApdKBrpFu6yNfklhwp1dt1kht+aclYtnC55
         JOnDzwaWlMMQA3S9AfaLaFicOteGwia75cURh34HP2JXkcqp7pNeADtU//DlbQFv4jVN
         40lmLhceJQI6frcrM7kyrdDDxZChlHMbLCez1ZmDs4eBZVQOeV6yG65bad0f5ygmVVnw
         ANohl0ldH3hQp3qnDvCY+efLga6y7pOqsHMnwYavMTawQtdtY1B1+TwG58Uor4m3XCxN
         wffA==
X-Gm-Message-State: APjAAAWJy0aP6hk//bPLXhLJrGZr9XvAD9oHKZjIAQO9A/BQIu1RzKII
        qyc4vOkibTPWNptfAex4zP3COnwzmrwz4iyk1BE=
X-Google-Smtp-Source: APXvYqwZLf2yyy0uOoIknFDqUr+RKSCDzOBkZn4eeWLw2jhVyIZQt4HGa1A9i/TJBXAnOKM3bsKaXdMEVazkuRz4Pww=
X-Received: by 2002:ab0:852:: with SMTP id b18mr49792832uaf.63.1558707977402;
 Fri, 24 May 2019 07:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAF44hAHU7ZBBOrHZL=w0nBSwQBzCvMz_QXVoZ6LxFOmLRqYOtQ@mail.gmail.com>
 <d12889db-140d-494b-f3f6-911e51c1cb21@linux.ee> <CAF44hAFkvDHKB_SkWrvjzK68-TL48q2SuQYRyFb2rcih0ZPr=A@mail.gmail.com>
 <CAF44hAFMSK6Fco=bMmu0qwwCZubyP+UxP9a8e=WSPD8hXesQvw@mail.gmail.com>
 <982f4ce2-5605-0278-4556-65afefb53f41@linux.ee> <CAF44hAG9aptt7kdRnG7z3ob178pH5v5jP+ttf-Ja4OpF0Hh82w@mail.gmail.com>
 <CAF44hAGHKmMAyruMDY5v30kL2dDZqatT0tXo6cF8sGYk2UGBHg@mail.gmail.com> <23e053dc-47ff-d113-22f0-5497c7fa8227@linux.ee>
In-Reply-To: <23e053dc-47ff-d113-22f0-5497c7fa8227@linux.ee>
From:   Rick Edgecombe <redgecombe.lkml@gmail.com>
Date:   Fri, 24 May 2019 07:26:06 -0700
Message-ID: <CAF44hAHFy6EVbb_1Pd6whb0eLUL6YhqOJ1_nRUVShuaAkTa56A@mail.gmail.com>
Subject: Re: More logging (was: vmalloc: Fix issues with flush flag)
To:     Meelis Roos <mroos@linux.ee>
Cc:     sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, May 24, 2019 at 1:20 AM Meelis Roos <mroos@linux.ee> wrote:
> I do not remember trying DEBUG_PAGEALLOC before on any sparcs (though I have had a
> problem with thet on some strange old machine that might or might not have been a sparc).
>
> To actually bisect it requires a known good kernel DEBUG_PAGEALLOC it worked.
> Will try to find one - hopefully it is not in too distant past.
>
> So the conclusion is that your patch just triggers a bug that is there even before
> and DEBUG_PAGEALLOC hits the same bug? Myabe just DEBUG_PAGEALLOC is broken before, so
> thet would make two independent bugs - how do we know it's the same bug?
>
That's a good point, I suppose it doesn't conclusively rule out it's
not two different bugs. I think think they very likely have the same
root cause because so much lines up though. A previous log you sent
showed that where this hangs was at the point of the first vfree,
which with DEBUG_PAGEALLOC on, would call flush_tlb_kernel_range() on
the address range of the vmalloc allocation. Doing the a flush for
only certain vfrees() is essentially what my patch does and in
addition we tested a version that mirrored the DEBUG_PAGEALLOC flush
address range and it still hung. So same actions, same results.
Although if you want to send me the logs from the logging patch I had
sent Monday I can see if anything weird is in there.
