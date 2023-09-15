Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487307A249A
	for <lists+sparclinux@lfdr.de>; Fri, 15 Sep 2023 19:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235714AbjIORYV (ORCPT <rfc822;lists+sparclinux@lfdr.de>);
        Fri, 15 Sep 2023 13:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235765AbjIORXz (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Fri, 15 Sep 2023 13:23:55 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7C7AC1;
        Fri, 15 Sep 2023 10:23:49 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 09EFA92009D; Fri, 15 Sep 2023 19:23:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 03E9292009C;
        Fri, 15 Sep 2023 18:23:44 +0100 (BST)
Date:   Fri, 15 Sep 2023 18:23:44 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Gleixner <tglx@linutronix.de>
cc:     John Ogness <john.ogness@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>,
        Thierry Reding <treding@nvidia.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Davis <afd@ti.com>,
        Matthew Howell <matthew.howell@sealevel.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, Lukas Wunner <lukas@wunner.de>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Russell King <linux@armlinux.org.uk>,
        Hongyu Xie <xiehongyu1@kylinos.cn>,
        Jiamei Xie <jiamei.xie@arm.com>, Rob Herring <robh@kernel.org>,
        delisun <delisun@pateo.com.cn>,
        Lino Sanfilippo <l.sanfilippo@kunbus.com>,
        Yangtao Li <frank.li@vivo.com>,
        Vineet Gupta <vgupta@kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Richard Genoud <richard.genoud@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Arend van Spriel <arend.vanspriel@broadcom.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Baruch Siach <baruch@tkos.co.il>,
        Sherry Sun <sherry.sun@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sergey Organov <sorganov@gmail.com>, Tom Rix <trix@redhat.com>,
        Marek Vasut <marex@denx.de>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Gabriel Somlo <gsomlo@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Lucas Tanure <tanure@linux.com>,
        linux-amlogic@lists.infradead.org,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        Xiongfeng Wang <wangxiongfeng2@huawei.com>,
        Yuan Can <yuancan@huawei.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-unisoc@lists.infradead.org,
        Kevin Cernekee <cernekee@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lech Perczak <lech.perczak@camlingroup.com>,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Isaac True <isaac.true@canonical.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Nick Hu <nick.hu@sifive.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        linux-riscv@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-stm32@st-md-mailman.stormreply.com,
        "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Hammer Hsieh <hammerh0314@gmail.com>,
        Timur Tabi <timur@kernel.org>,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH tty v1 00/74] serial: wrappers for uart port lock
In-Reply-To: <87il8b1w3l.ffs@tglx>
Message-ID: <alpine.DEB.2.21.2309151739290.57368@angie.orcam.me.uk>
References: <20230914183831.587273-1-john.ogness@linutronix.de> <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk> <87il8b1w3l.ffs@tglx>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

On Fri, 15 Sep 2023, Thomas Gleixner wrote:

> >> Patches 2-74 switch all uart port locking call sites to use the new
> >> wrappers. These patches were automatically generated using coccinelle.
> >
> >  Hmm, no need to do this for drivers/tty/serial/zs.c?
> 
> zs.c does not use port lock at all. It has like a couple of other
> drivers a local homebrewn spinlock.

 Ah, right, that's because there are registers shared between two ports 
within one SCC, so the spinlock has to be shared as well.

 This also indicates that dz.c is wrong and shouldn't be using a per-port 
spinlock as the DZ has a shared register set between all the four ports 
(it's a serial line multiplexer rather than a set discrete ports; up to 8 
lines are architecturally supported, though we don't have support in Linux 
for systems having those), e.g. there's only one 16-bit receiver buffer 
register for all the four ports, supplying the 8-bit character received 
along with the receive status and the number of the line this data arrived 
on, and similarly there's only one transmit data register, which supplies 
data to the next enabled line whose transmit buffer needs servicing, and 
the chip routes the data itself.  Therefore the driver ought to use a 
shared spinlock too.

 I guess it wasn't noticed so far because DZ devices aren't that common 
(and my usual test machine is currently broken too, pending an SRAM chip 
replacement, hopefully in the next few weeks) and then hardly ever more 
than one serial line has been used at a time with these devices.  It looks 
like the first issue for me to look into once the machine has been fixed.

 Maybe dz.c shouldn't be touched by this series then?  (Though obviously 
both drivers will have to be eventually adapted for the ultimate console 
rework.)

 Thanks for your input, as it turns out it has had an unexpected outcome.

  Maciej
