/***************************************************************************
 *
 * Copyright (C) 2007 - 2015, Rogvall Invest AB, <tony@rogvall.se>
 *
 * This software is licensed as described in the file COPYRIGHT, which
 * you should have received as part of this distribution. The terms
 * are also available at http://www.rogvall.se/docs/copyright.txt.
 *
 * You may opt to use, copy, modify, merge, publish, distribute and/or sell
 * copies of the Software, and permit persons to whom the Software is
 * furnished to do so, under the terms of the COPYRIGHT file.
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
 * KIND, either express or implied.
 *
 ***************************************************************************/
/*
 * Simd utility fucntions
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <memory.h>

// #include <sys/auxv.h>
// #include <asm/hwcap.h>
#include "neon_util.h"

extern long getauxval(unsigned long type);


int neon_cpu_serial_number(unsigned char* buf, size_t maxlen)
{
    memset(buf, 0, maxlen);
    return 0;
}

int neon_cpu_vendor_name(char* buf, size_t maxlen)
{
    strncpy(buf, "unknown", maxlen);
    return strlen(buf);
}

int neon_cpu_features(char* buf, size_t maxlen)
{
    memset(buf, 0, maxlen);
    return 0;
}

int neon_cpu_cache_line_size()
{
    return 64;
}

int neon_cpuid_check(int mask)
{
    return 1;
}

#if 0
static char* cpuid_feature_name[32] =
{
    "swp",
    "half",
    "thumb",
    "26bit",
    "fast_mult",
    "fpa",
    "vfp",
    "edsp",
    "java",
    "iwmmxt",
    "crunch",
    "thumbee",
    "neon",
    "vfpv3",
    "vfpv3d16",
    "tls",
    "vfpv4",
    "idiva",
    "idivt"
    "vfpd32"   // 19
};
#endif

void neon_init()
{
    // long hwcap = getauxval(AT_HWCAP);  
}


    
