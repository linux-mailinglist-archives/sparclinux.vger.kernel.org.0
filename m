Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D0B562833
	for <lists+sparclinux@lfdr.de>; Fri,  1 Jul 2022 03:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiGAB1V (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Thu, 30 Jun 2022 21:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbiGAB1R (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Thu, 30 Jun 2022 21:27:17 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAAD5A477
        for <sparclinux@vger.kernel.org>; Thu, 30 Jun 2022 18:26:56 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id a127-20020a624d85000000b00525950b1feeso222319pfb.0
        for <sparclinux@vger.kernel.org>; Thu, 30 Jun 2022 18:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=N2ZBZX0ts4Mk2TYGZHAbQ0+iD2FAHUFhD02Oe5yw0x8=;
        b=O1+XSLj0oSVLFId1abGtsY3tm0452of7YtoG6NXZHX/e84inEivfhRvPM2mxa0YyIW
         IVE4lsrSj5BWadwFDlAWpmHnRK/doKl5AOePnDPGsAS+cA+NgfaWURouVPcfJ+UegMnP
         gFn2YJgYpdS58AkA+jg1y+IJirkP1kEzvd9LDdSLlSQ/Sq4aCkWSKEc/oTe6fZiOhW65
         BjkrHlyKrTJJXC29sJDuGTXqd5/40GhwO7WCZbDbcQB2MuJGIhtqAJ7KaIiPcGoYN1l9
         s4fr0zbsiZbvNiOgTU00jLdLs0pkeLRUFjFRS2ioFddA+CNMuoRvkffPzuaP06JwXoHV
         SNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=N2ZBZX0ts4Mk2TYGZHAbQ0+iD2FAHUFhD02Oe5yw0x8=;
        b=SR5/6E5wTKZXQW72Ux6/1wmTni4a+JJ8aOGDpexbGqRfSNMfYsRsyWSq5eV95DkruP
         RjEpQYHveYWxidTBqWJ5kgHG2IU6vobJKUW0AxG6EGLx2yfC4ApPD+gVQ+cnxst/bNdH
         TxTzo6vv0F5e0XIaomuHfJO22zUrrXCl/pG1H6FBRvfietO/pJykXBSS0gQoLMzw+OEb
         wmldyy8b7vfcjR5G6xqubYDIjnXCvHqhDBeazcGB+tbBgJL3EdUApdc3JdKjptEQkt/A
         HowlJwYNl3PlXjcqxThjxLV82aNoR9zmoAhHsAb2BGiodM3hWDJEYwFiPd7sn5cl28Lc
         95vg==
X-Gm-Message-State: AJIora/CzEcA4YmkgEJJiGcCkUfpmG3K4S7bQC5XnngUjJxfjfber5QM
        64QrGzUe//DJuMSZbwUSSbYWtZgmWwyfGNg=
X-Google-Smtp-Source: AGRyM1sj2jrR3+blrSHPqJTzLp24osPeSbuJ6WFdrG/ishciKwr2k4mXrnUZAcDZaxDsMilQN7eUGTW8uxdoZkM=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:3973:d0f0:34a8:bf61])
 (user=saravanak job=sendgmr) by 2002:a05:6a00:1995:b0:525:bca8:b062 with SMTP
 id d21-20020a056a00199500b00525bca8b062mr18860129pfl.26.1656638814784; Thu,
 30 Jun 2022 18:26:54 -0700 (PDT)
Date:   Thu, 30 Jun 2022 18:26:39 -0700
In-Reply-To: <20220701012647.2007122-1-saravanak@google.com>
Message-Id: <20220701012647.2007122-2-saravanak@google.com>
Mime-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 1/2] driver core: Add probe_no_timeout flag for drivers
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tobias Klauser <tklauser@distanz.ch>,
        Russell King <linux@armlinux.org.uk>,
        Vineet Gupta <vgupta@kernel.org>,
        Richard Genoud <richard.genoud@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Baruch Siach <baruch@tkos.co.il>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Gabriel Somlo <gsomlo@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pali Rohar <pali@kernel.org>,
        Andreas Farber <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "David S. Miller" <davem@davemloft.net>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Timur Tabi <timur@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh@kernel.org>, sascha hauer <sha@pengutronix.de>,
        peng fan <peng.fan@nxp.com>, kevin hilman <khilman@kernel.org>,
        ulf hansson <ulf.hansson@linaro.org>,
        len brown <len.brown@intel.com>, pavel machek <pavel@ucw.cz>,
        joerg roedel <joro@8bytes.org>, will deacon <will@kernel.org>,
        andrew lunn <andrew@lunn.ch>,
        heiner kallweit <hkallweit1@gmail.com>,
        eric dumazet <edumazet@google.com>,
        jakub kicinski <kuba@kernel.org>,
        paolo abeni <pabeni@redhat.com>,
        linus walleij <linus.walleij@linaro.org>,
        hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
        david ahern <dsahern@kernel.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-actions@lists.infradead.org,
        linux-unisoc@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        sparclinux@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

This flag only needs to be set for drivers of devices that meet all the
following conditions:
- Need to probe successfully before userspace init in started
- Have optional suppliers
- Can't wait for deferred_probe_timeout to expire

fw_devlink=on uses this info, as needed, to ignore dependencies on supplier
devices that have not been added or supplier devices that don't have any
drivers.  It's still up to the driver to decide which of the missing
suppliers are optional or not.

Fixes: 71066545b48e ("driver core: Set fw_devlink.strict=1 by default")
Reported-by: Sascha Hauer <sha@pengutronix.de>
Reported-by: Peng Fan <peng.fan@nxp.com>
Reported-by: Fabio Estevam <festevam@gmail.com>
Reported-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Tested-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/base.h           |  1 +
 drivers/base/core.c           |  7 +++++++
 drivers/base/dd.c             |  3 +++
 include/linux/device.h        |  7 +++++++
 include/linux/device/driver.h | 11 +++++++++++
 5 files changed, 29 insertions(+)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index b3a43a164dcd..149822d2086f 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -193,6 +193,7 @@ extern void device_links_no_driver(struct device *dev);
 extern bool device_links_busy(struct device *dev);
 extern void device_links_unbind_consumers(struct device *dev);
 extern void fw_devlink_drivers_done(void);
+extern void fw_devlink_probe_no_timeout(void);
 
 /* device pm support */
 void device_pm_move_to_tail(struct device *dev);
diff --git a/drivers/base/core.c b/drivers/base/core.c
index ccdd5b4295de..8e18904a1584 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -54,6 +54,7 @@ static unsigned int defer_sync_state_count = 1;
 static DEFINE_MUTEX(fwnode_link_lock);
 static bool fw_devlink_is_permissive(void);
 static bool fw_devlink_drv_reg_done;
+static bool fw_devlink_no_timeout;
 static bool fw_devlink_best_effort;
 
 /**
@@ -969,6 +970,7 @@ static void device_links_missing_supplier(struct device *dev)
 static bool dev_is_best_effort(struct device *dev)
 {
 	return (fw_devlink_best_effort && dev->can_match) ||
+		(fw_devlink_no_timeout && dev->probe_no_timeout) ||
 		(dev->fwnode && (dev->fwnode->flags & FWNODE_FLAG_BEST_EFFORT));
 }
 
@@ -1688,6 +1690,11 @@ void fw_devlink_drivers_done(void)
 	device_links_write_unlock();
 }
 
+void fw_devlink_probe_no_timeout(void)
+{
+	fw_devlink_no_timeout = true;
+}
+
 /**
  * wait_for_init_devices_probe - Try to probe any device needed for init
  *
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 70f79fc71539..943b0363aaab 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -324,6 +324,8 @@ static int deferred_probe_initcall(void)
 
 	if (!IS_ENABLED(CONFIG_MODULES))
 		fw_devlink_drivers_done();
+	else
+		fw_devlink_probe_no_timeout();
 
 	/*
 	 * Trigger deferred probe again, this time we won't defer anything
@@ -734,6 +736,7 @@ static int __driver_probe_device(struct device_driver *drv, struct device *dev)
 		return -EBUSY;
 
 	dev->can_match = true;
+	dev->probe_no_timeout = drv->probe_no_timeout;
 	pr_debug("bus: '%s': %s: matched device %s with driver %s\n",
 		 drv->bus->name, __func__, dev_name(dev), drv->name);
 
diff --git a/include/linux/device.h b/include/linux/device.h
index 424b55df0272..e6246b6cf6cf 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -536,6 +536,12 @@ struct device_physical_location {
  * @can_match:	The device has matched with a driver at least once or it is in
  *		a bus (like AMBA) which can't check for matching drivers until
  *		other devices probe successfully.
+ * @probe_no_timeout: Set by driver core to indicate that this device's probe
+ *		can't wait till driver_probe_timeout expires. This information
+ *		is used by fw_devlink=on to avoid deferring the probe of this
+ *		device to wait on supplier devices that haven't been added or
+ *		probed successfully.
+ *		See also: probe_no_timeout in struct driver.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
  * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
@@ -642,6 +648,7 @@ struct device {
 	bool			of_node_reused:1;
 	bool			state_synced:1;
 	bool			can_match:1;
+	bool			probe_no_timeout:1;
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 7acaabde5396..2ce60e511504 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -55,6 +55,15 @@ enum probe_type {
  * @owner:	The module owner.
  * @mod_name:	Used for built-in modules.
  * @suppress_bind_attrs: Disables bind/unbind via sysfs.
+ * @probe_no_timeout: Set to true by drivers that bind to devices that meet all
+ *		these conditions:
+ *		- Need to probe successfully before userspace init in started
+ *		- Have optional suppliers
+ *		- Can't wait for deferred_probe_timeout to expire
+ *		fw_devlink=on uses this info, as needed, to ignore dependencies
+ *		on supplier devices that have not been added or supplier devices
+ *		that don't have any drivers. It's still up to the driver to
+ *		decide which of the missing suppliers are optional or not.
  * @probe_type:	Type of the probe (synchronous or asynchronous) to use.
  * @of_match_table: The open firmware table.
  * @acpi_match_table: The ACPI match table.
@@ -101,6 +110,8 @@ struct device_driver {
 	const char		*mod_name;	/* used for built-in modules */
 
 	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
+	bool probe_no_timeout;
+
 	enum probe_type probe_type;
 
 	const struct of_device_id	*of_match_table;
-- 
2.37.0.rc0.161.g10f37bed90-goog

