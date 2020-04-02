Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E46A219C38A
	for <lists+sparclinux@lfdr.de>; Thu,  2 Apr 2020 16:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732602AbgDBODB (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 2 Apr 2020 10:03:01 -0400
Received: from mga05.intel.com ([192.55.52.43]:1582 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732484AbgDBODB (ORCPT <rfc822;sparclinux@vger.kernel.org>);
        Thu, 2 Apr 2020 10:03:01 -0400
IronPort-SDR: 7KkUGaK7RNHXXOA0G0r365dWH0dZg10XNKkoNU5+GBRXlBbhTX/gH0UQuetwomTIwKVyJfwEF5
 ImYG3DgEj6SA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 07:03:01 -0700
IronPort-SDR: a/hmMDJJd313YtXliiB9E3CpdcNVoQe4EqQEbxfIx2p6A77j/b+lVJqx7MiALkHjMuKiUTp9pN
 Y9YoNlm9ZCPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="268034575"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 02 Apr 2020 07:02:59 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jK0Qw-00FBHD-33; Thu, 02 Apr 2020 17:03:02 +0300
Date:   Thu, 2 Apr 2020 17:03:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Anatoly Pugachev <matorola@gmail.com>
Cc:     Sparc kernel list <sparclinux@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [sparc64] OOPS after 'serial: core: Allow detach and attach
 serial device for console'
Message-ID: <20200402140302.GB1922688@smile.fi.intel.com>
References: <CADxRZqwHdRd=3fzr=-9hdR7_cW2VXXHwoySzbSpWx+aZ1S=ysA@mail.gmail.com>
 <20200402112459.GY1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402112459.GY1922688@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: sparclinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Thu, Apr 02, 2020 at 02:24:59PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 02, 2020 at 02:00:51PM +0300, Anatoly Pugachev wrote:
> > Hello!
> > 
> > Bisected the following call trace on kernel boot with linux sparc64
> > debian sid LDOM:
> > 
> 
> Thank you, I'm on it.
> 
> Briefly looking it among these lines
> 
> static inline void uart_port_spin_lock_init(struct uart_port *port)
> {
> 	- if (uart_console_enabled(port))
> 	+ if (uart_console(port))
> 
> which reveals an issue in the sparc code.
> 
> I'm going to look further into it...

Meanwhile, can you replace above and test if it fixes your case?

-- 
With Best Regards,
Andy Shevchenko


