Return-Path: <sparclinux-owner@vger.kernel.org>
X-Original-To: lists+sparclinux@lfdr.de
Delivered-To: lists+sparclinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3867B46B6
	for <lists+sparclinux@lfdr.de>; Sun,  1 Oct 2023 12:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbjJAKXc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+sparclinux@lfdr.de>); Sun, 1 Oct 2023 06:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234641AbjJAKXb (ORCPT
        <rfc822;sparclinux@vger.kernel.org>); Sun, 1 Oct 2023 06:23:31 -0400
Received: from esa.hc3777-42.iphmx.com (esa.hc3777-42.iphmx.com [216.71.141.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 92C20BF
        for <sparclinux@vger.kernel.org>; Sun,  1 Oct 2023 03:23:28 -0700 (PDT)
X-CSE-ConnectionGUID: mc8OhoYtSa6Bn78JsA5q+Q==
X-CSE-MsgGUID: Bna+SeeAQYqeXT1M9jhl6w==
X-IronPort-RemoteIP: 40.93.13.29
X-IronPort-MID: 9248085
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: O365_Users_Outgoing_Mail
X-IronPort-MailFlowPolicy: $O365_Users_Outgoing_Mail
Received: from mail-centralusazlp17012029.outbound.protection.outlook.com (HELO DM4PR02CU001.outbound.protection.outlook.com) ([40.93.13.29])
  by ob1.hc3777-42.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Oct 2023 06:23:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHrlkuO122sBdX+ENE+bNneOU5dXmxPRdJhrLSRsdepIKCRFC6XQ18HBXwUcpN36K9C7vupMsmRSTCtn1Z2YeVSTrMtDlVSoTqaQIB+kIZkfDzIp+y3Ysg6CuRI/M65oF7h5JzyoT9hCNSgoopD/JxoTCn5cKRTTlyJsU706aZP3KgAc1MN+FEpj63c0w4u4/pap9LLDyDVFG6cDFSiQvkVHHNo+6rNRbughiAjUQOCF88ZbO3wKYyLyqOGU7MPS+c8O6htC0ZUUf7DVPp2tyPG6GCiiFy5chvLqCGbCboWXjXFRZwoNYMQtZt4EOheAxKJbhprZdLlPys7X6GY6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fhsZPxJ9NQMFJAce935rdsIFGwCXvABDnqTGGCsNf4=;
 b=BsLVpS3xgBYA0siJPnToKEBTXhAINeGRgMjY9wt/h5+PSrES5sl93Ml2bAp4WC9q4vdaooY19l8gsefq1UCRrxGXSesIXdNhihZRkSAiu3DIEMHrmgLE6qN0P9kqkKxEyRvrQidjfKK6xOM6dGh+dACg37fjJVHFsc/8HDUjRzXDOTo0JsRm7lYcsm1AP/9zMNHPpP6S4p2tOHWDv2hGtKBHuPb5GKUzP8o24wzORdCzlf5YEqoxGheTGLDMX/RxKbnMgaL2fCFtJirQBUQdU6bZu4KBilpMNtt7ShoJNX8w51TYmhjeCiT1fYoGEdx/2OWQYje6NNIrHV1s1gZBgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.91.48.123) smtp.rcpttodomain=columbus.rr.com smtp.mailfrom=xmails.me;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=xmails.me;
 dkim=none (message not signed); arc=none
Received: from MW4P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::20)
 by SJ0PR05MB8678.namprd05.prod.outlook.com (2603:10b6:a03:38e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Sun, 1 Oct
 2023 10:23:19 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::fb) by MW4P222CA0015.outlook.office365.com
 (2603:10b6:303:114::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29 via Frontend
 Transport; Sun, 1 Oct 2023 10:23:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.91.48.123) smtp.mailfrom=XMAILS.ME; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=XMAILS.ME;
Received: from ACDCSWPAPP749.cummins.svcnet (146.91.48.123) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.6838.17 via Frontend Transport; Sun, 1 Oct 2023 10:23:19 +0000
Received: from [185.225.73.120] (185.225.73.120) by
 ACDCSWPAPP749.cummins.svcnet (10.208.14.105) with Microsoft SMTP Server id
 15.0.1497.42; Sun, 1 Oct 2023 05:23:01 -0500
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Description: Mail message body
Subject: Hello Good Day ..
To:     Recipients <SUPPORT@XMAILS.ME>
From:   Mualla Freedman <SUPPORT@XMAILS.ME>
Date:   Sun, 1 Oct 2023 03:22:55 -0700
Reply-To: <infomualla@yandex.com>
Message-ID: <1c8fa1406d72416dac58ee8986a848b4@ACDCSWPAPP749.cummins.svcnet>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SJ0PR05MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 00676274-c076-4027-5873-08dbc2686ee0
AntiSpoofAllow: True
AllowCheck1: True
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uQJ2sHMmtzul+eDhgiy24vUwRvddDU3RrbKqoSM2HCE9fGohA1ooFR/7d5?=
 =?iso-8859-1?Q?KHidZBMqjeXrp2TqojsNpLihy+CwZ4zS9vj7hN8TH+bh+wjvTPYUTjzkuU?=
 =?iso-8859-1?Q?DpMOIhqpvPD8euCm6RcRmH4HxJ7kq+xXnlZNuYwbdLQq89N2+bBJOFjsuz?=
 =?iso-8859-1?Q?y3NzN14lV4/PVtprVobobGt14s9o9wvn87UF4g9LDeYmFezvOxOYAfbKYc?=
 =?iso-8859-1?Q?C65oCuBU8fCbBncXP4fsCuUQ+dTRU3msP5c4rEe36M7Zvc3WbL2MM/FsZH?=
 =?iso-8859-1?Q?plis1X+7rxNr76SNIeeE2iQARme2LodhJAzXGVSxESO4K9kTSfTf89EEf/?=
 =?iso-8859-1?Q?/J2/iFN6+0V0yfKaGYpjA081N8TITOCdRnzATx6CYnV7HgagVpKvBCjgYo?=
 =?iso-8859-1?Q?QjTmbLA52m1jS5arvv96Etqg7uVjZCRhmwke66epC0QJknvZu4e8Q5U8FK?=
 =?iso-8859-1?Q?m5SZrPx7eN/aqzk11uvpoLfMIDVp6M4VBS3CVmgX91hKxQzvlZCrK7/DpJ?=
 =?iso-8859-1?Q?6CrSJkHjeBWW6DThii8DycsNeTdyxs+a9zY1NXXuBZpe8mMCO9agfy9fif?=
 =?iso-8859-1?Q?TbOItXO5OVutRABeDeXQfwW1o+oHGwnNeoggh+oM0dvIocyXWkBBPzECVQ?=
 =?iso-8859-1?Q?41Q0CP4AcChjqVpSgvqXpbL8/CJK37evQZ9LnMh+zrBJxKF491pg83KZ1s?=
 =?iso-8859-1?Q?CVK3L6iV4O6nX/2EuoXkSnKLnXVWg2qUYO3GAdTFdLG5H41Lze2Ybf/z4r?=
 =?iso-8859-1?Q?4V5WiJm74cZEHnN+DRZGykKC45MCb20FCRARwdyT9b7R10MpuPmWKUokYX?=
 =?iso-8859-1?Q?T12QWFFVJbFqiKANUjntjnEtDvzPzIOaG3oIy//eplIHBJEavLF3eDV/qt?=
 =?iso-8859-1?Q?agnXh/R0JtkKm2oAWJPnciEOJC4JESTIb2itxRj1Pl+dPeSiLyKo4Bo0c7?=
 =?iso-8859-1?Q?TpTb3AJvbdKVKSYhADWG0CbNllPFUGO6xN5dXBtS+PJ9h87U0tAqASnJn2?=
 =?iso-8859-1?Q?vYiFmsvLXDDkeDey1k+gKHxD20Rw7bbP+O8NHO04gmBLVfx4rFCA9uiDAc?=
 =?iso-8859-1?Q?Mb3ut6AfqL2FgkpMzS8Ark8Ln/FE2HGVnPqM4sn1/jYgP6m5jxwoOh1ip0?=
 =?iso-8859-1?Q?bYPrU6GgpsUz1mMrZ/nbfFwwC85tpfZujOkzmr1UfSWB4h/88pJ0luRqV2?=
 =?iso-8859-1?Q?CYScqCUwlDtDuAQfxC9TOmvIJcUPsxo8XpZLYX+m59qWxgsJpemLTFR9nn?=
 =?iso-8859-1?Q?9/tMmt/nST55nhh2I2wsesizN723MV6Qao7fxDjuE=3D?=
X-Forefront-Antispam-Report: CIP:146.91.48.123;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:ACDCSWPAPP749.cummins.svcnet;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(48200799006)(61400799006)(82310400011)(64100799003)(451199024)(40470700004)(46966006)(2860700004)(70206006)(16576012)(336012)(6706004)(26005)(70586007)(35950700001)(956004)(83380400001)(356005)(6666004)(40460700003)(24736004)(82740400003)(86362001)(81166007)(47076005)(82960400001)(40480700001)(3480700007)(558084003)(108616005)(9686003)(498600001)(2906002)(7406005)(7416002)(7366002)(6200100001)(8936002)(8676002)(316002)(41300700001)(5660300002)(7116003)(6862004)(62346018);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?iso-8859-1?Q?3tzaIzYRUEqMHd9tAncCBGpOmf10c9gSdzMZFmAvU65JbrXfRLPwk0efWQ?=
 =?iso-8859-1?Q?SMVgZTfY/MY/JiVgP4N2OYLMuDWLokcguyyX+QHpsz8ZF/riPJ5ukplp8U?=
 =?iso-8859-1?Q?599XuzSQnR/sCsdUuFklSnUp7i347stRENBkpznxTK/TEeenc/i4PmcfU0?=
 =?iso-8859-1?Q?Tq619SSkojW7x7uT3aeL20+OmeFsXI7id50HEoOTkal6zcI8JFXM+y4emy?=
 =?iso-8859-1?Q?siz9ZYrWH2uPoAh93Spu0euHG85aMmItv5fqZmsTFhIj5jOeqPndjmTWYJ?=
 =?iso-8859-1?Q?4dlMc0HIfqC617ythVk9EaoGLJyvFcyrxUV4Ep5hAsYCqmuHikGFJ0EnU5?=
 =?iso-8859-1?Q?5n7Mj8YGWklOu5/coPr7jiqbIgae1jvgvkxVRaXXsEFnbhBJRhIclBULSr?=
 =?iso-8859-1?Q?OxfIYQ/ycyjFxiXmo3hC7QzzovjhSaCgd6yHezOI1ZI8NVEvlHn9BJa+ll?=
 =?iso-8859-1?Q?/YR6kvoSvoTTTUI5C+1tSvfMGJ+vrOwhPts/+uOeFDEQKs/enfd5GdvKi/?=
 =?iso-8859-1?Q?HU1yMVIYAgfl2Gcm+OT4DE40Jm9mRjSVpF3xE1sTjGk4fzh/3JEGY5KvC8?=
 =?iso-8859-1?Q?gMrBXb66TQkUL5S58LWqi0eOtB7i/jzuu519tfwKZEaPOdSqeY/E2qtG7P?=
 =?iso-8859-1?Q?y+bX0dCtJxU7g09NWlqkBtYRZd77N6/FPrTYWbkzrOreQWDgZsAdpJsTL6?=
 =?iso-8859-1?Q?BbcvLjybibCknVwxMoMipBXGR2xpqgpR3b4O4YOkhyowZ9JLcGmQH56EK6?=
 =?iso-8859-1?Q?vzz3xC8IHRQY21SbWfR4BXGgNbvWP/t4pY5azwLinzp6Ij+v0u8SY9W7cx?=
 =?iso-8859-1?Q?tcna3Zf2hLeimEKFEL8G4Z0ltiCqs5r4rVY9MVUYjdnfLhVpGu8ln3Q4hq?=
 =?iso-8859-1?Q?pKZph9QlrhR636daGuYXprpuEScBqXd/9jJisTeLetYfR8XcBRat6fIzZ/?=
 =?iso-8859-1?Q?Obf3169+AqN3Oo0K1A1Fkauutul2avj0B58TnfH/cluX2MEXu2/mZllJ0+?=
 =?iso-8859-1?Q?ekO39c98WJniyr8kK4hlxvbP4o8xe7IqLMEQ2q4vpFUeZGQmdN5ouVRWcr?=
 =?iso-8859-1?Q?Pq9ir1TirxMQ6O/1rTNcnw21lAWxGLZpFjTvl8cCZK6L0aOZjOpXx35x2l?=
 =?iso-8859-1?Q?hqrDR656jPdDQt/D2hGCKp0ketdKadCzJ7+rHFixbjwTheJkXOPBKUj1pC?=
 =?iso-8859-1?Q?fzpj2UkqONY4czXjUc7BVMpc8JB7ingEHFvdwb6KDMuYiPCY0e5IGGQ8zA?=
 =?iso-8859-1?Q?4GP8k9h2Qz/TbtK3mPETH4GT2PwqvuNdzh7P+XZKqmDvyGcAKU2UnStk3b?=
 =?iso-8859-1?Q?T2Lwu/qQmt3HpMDpbRN0BZV3ATuQYk3mhTrk3rDZ2fcPeQBS1ehdVtdc11?=
 =?iso-8859-1?Q?AZ2T72SVTrm/wBvP16gB1+D9yRpjveuJb6fqcrVk3BirwIdWiAJpIOyiku?=
 =?iso-8859-1?Q?2EH2x+wv/tKgXSwu6LhSpzpWD5dmpf05RSRUzkztsXA/CUzKE1J+7+/wpD?=
 =?iso-8859-1?Q?5vpGZMSz3adHaqX8kX7W3S93odcbWhh10y6K4ZutPidoS3j73yzmXWNwRY?=
 =?iso-8859-1?Q?mfSqg72jcZ1hvuzNrYDwvOphN+GQVIBt5m4XvpO1afKTcubwPctLQ3qpsk?=
 =?iso-8859-1?Q?neFYz3jxZKmpmDM2rsyToTfXPUy+ET5sAV6/kK2CVwp5nJ/rBwVfWxwgCA?=
 =?iso-8859-1?Q?pOb8f+AxJvJrZy95Pa/X50ctP6Ye5uW6H/6vfnm6X3MTrY22Myoa8+N7cG?=
 =?iso-8859-1?Q?wLbHmtJ11nwD6T1VDVOLjZ3jnrAt2dKzxj+soYncfdLpoNmb7AmDuTWdgo?=
 =?iso-8859-1?Q?6sCaxmUPMypawFH0/Zx3q0SKagw4ywmOS1yu/QSkW4UDMi/ENqV0LPL+1A?=
 =?iso-8859-1?Q?sL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: xFlr637HWgGjOAwn9MzJ1xv1cJR71iTO6UIcEMLEq8t2NIKAx8gdSd9xMYWxv+H5hssOXsyf+LEfmKrrPDa15RfyAq8RFCCm8rbSloGp+sQcaA7RN5KD9QOapIKFw/WaZ5EMBIY7KeOy+QgzhpOyC+pO0HVryX+nVBlttS3JhzA0kEgdUnEq2uZWTrM+UVBr3UP6Q+PtvRTqlo4rMh+mgi4Av8mnowG69rH3+446Yvjq4lif6qNRF35MU2C7xI/rcb3EHqc+qrfe3P+Tc7OpI23aYYxfqEtq7114XVevz4oeMmApvLYrOM2ULtO75LwAMTry56yJP0DTz4WMp1RZ8LMlC5URL1Z69HGYF88HZstRxQpsOcyut64zN+YiTIsf8VQtTyJ4FZ7Q/QVhdtqEDFpec2YKveLgDehXqR2H5RNz+VwulHc8cbwe+00CYkHLujmn/fhNkIfOhl5M7pLX8mvfn2bNI7cqPJ9RyVFm3rTY3iiCKQxAvCDa0GFwz8FoFiQic9qnGgb9/KQNurTCMUIK6tQ2TCleaVjT/6NGXWiVQ69/rchMgtIIA+mP4CjE79a32P1Y4cIP7JOSBDBeKh8RrCsRK05YmeI1xSy8w9oboaldD+Mgqe1n8RCuGfSjDfK36QkIduHdlqT5gJanKFX6hqSfneGPv9tK4dnebT/tLpcNyGJwb50o0aZ89jXkHqVbx3Laqk1zCkOgoxTTHP7EXsap64emr+IneTGzQMA7sCVbs30TY/xiiBF1scL/sFUk9VHYGD05R6MIezSF9MCyLbY336XRoxHkq7xFO8T4eRx6zXQIC2eR
X-OriginatorOrg: Cummins365.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2023 10:23:19.2984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00676274-c076-4027-5873-08dbc2686ee0
X-MS-Exchange-CrossTenant-Id: b31a5d86-6dda-4457-85e5-c55bbc07923d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b31a5d86-6dda-4457-85e5-c55bbc07923d;Ip=[146.91.48.123];Helo=[ACDCSWPAPP749.cummins.svcnet]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB8678
X-Spam-Status: Yes, score=6.3 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_REPLYTO,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,RCVD_IN_SBL,
        RCVD_IN_VALIDITY_RPBL,SPF_FAIL,SPF_HELO_PASS,TO_EQ_FM_DOM_SPF_FAIL,
        TO_EQ_FM_SPF_FAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [216.71.141.138 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  1.3 RCVD_IN_VALIDITY_RPBL RBL: Relay in Validity RPBL,
        *      https://senderscore.org/blocklistlookup/
        *      [216.71.141.138 listed in bl.score.senderscore.com]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [185.225.73.120 listed in zen.spamhaus.org]
        *  1.7 RCVD_IN_MSPIKE_L4 RBL: Bad reputation (-4)
        *      [216.71.141.138 listed in bl.mailspike.net]
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        *  0.0 SPF_FAIL SPF: sender does not match SPF record (fail)
        *      [SPF failed: Please see http://www.openspf.org/Why?s=mfrom;id=bounces%2Bsrs%3Dxvk8j%3Dfp%40cummins365.onmicrosoft.com;ip=216.71.141.138;r=lindbergh.monkeyblade.net]
        *  0.0 RCVD_IN_MSPIKE_BL Mailspike blocklisted
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
        *  0.0 TO_EQ_FM_SPF_FAIL To == From and external SPF failed
        *  0.0 TO_EQ_FM_DOM_SPF_FAIL To domain == From domain and external SPF
        *       failed
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <sparclinux.vger.kernel.org>
X-Mailing-List: sparclinux@vger.kernel.org

Greetings,

I am a Private Consultant Mr Mualla Freedman. My Client deposited funds for investments in a private Bank. I want you to be part of the investment plans. I shall provide you with details when you reply positively to this proposal. This is urgent.

Mualla Freedman
Email:infomualla@yandex.com
