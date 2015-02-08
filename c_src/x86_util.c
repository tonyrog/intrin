/***************************************************************************
 *
 * Copyright (C) 2007 - 2012, Rogvall Invest AB, <tony@rogvall.se>
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

#include "x86_util.h"
#include "x86_cpuid.h"

static unsigned char   serial_number[64];
static size_t          serial_number_len = 0;
static char            vendor_name[64];
static size_t          vendor_name_len = 0;
static char            features[1024];
static size_t          features_len = 0;
static int             cache_line_size = 0;
static uint32_t   feature_cx = 0;
static uint32_t   feature_dx = 0;

//
// Return cpu serial number if available
// return 0 if not available otherwise the 
// length of the full serial number in bytes
//
int x86_cpu_serial_number(unsigned char* buf, size_t maxlen)
{
    int n = (serial_number_len > maxlen) ? maxlen : serial_number_len;
    memcpy(buf, serial_number, n);
    return serial_number_len;
}

//
// Return cpu vendor name if available
// retur 0 if not avaiable otherwise the 
// lenfth of the full cpu vendor name in bytes
//
int x86_cpu_vendor_name(char* buf, size_t maxlen)
{
    int n = (vendor_name_len > maxlen) ? maxlen : vendor_name_len;
    memcpy(buf, vendor_name, n);
    return n;
}

int x86_cpu_features(char* buf, size_t maxlen)
{
    int n = (features_len > maxlen) ? maxlen : features_len;
    memcpy(buf, features, n);
    return n;
}

int x86_cpu_cache_line_size()
{
    return cache_line_size;
}

int x86_cpuid_check(uint32_t cxmask, uint32_t dxmask)
{
    return (((cxmask & feature_cx) == cxmask) &&
	    ((dxmask & feature_dx) == dxmask));
}

#if defined(__i386__) || defined(__x86_64__)
//
// http://en.wikipedia.org/wiki/CPUID
//
static char* feature_name_dx[32] =
{
    "fpu",    // 0  - Floating-point Unit On-Chip
    "vme",    // 1  - Virtual Mode Extension
    "de",     // 2  - Debugging Extension
    "pse",    // 3  - Page Size Extension
    "tsc",    // 4  - Time Stamp Counter
    "msr",    // 5  - Model Specific Registers
    "pae",    // 6  - Physical Address Extension
    "mce",    // 7  - Machine-Check Exception
    "cx8",    // 8  - CMPXCHG8 Instruction
    "apic",   // 9  - On-chip APIC Hardware
    "_",      // 10 - Reserved
    "sep",    // 11 - Fast System Call
    "mtrr",   // 12 - Memory Type Range Registers
    "pge",    // 13 - Page Global Enable
    "mca",    // 14 - Machine-Check Architecture
    "cmov",   // 15 - Conditional Move Instruction
    "pat",    // 16 - Page Attribute Table
    "pse36",  // 17 - 36-bit Page Size Extension
    "psn",    // 18 - Processor serial number is present and enabled
    "clfsh",  // 19 - CLFLUSH Instruction
    "_",      // 20 - Reserved
    "ds",     // 21 - Debug Store
    "acpi",   // 22 - Thermal Monitor and Software Controlled Clock Facilities
    "mmx",    // 23 - MMX technology
    "fxsr",   // 24 - FXSAVE and FXSTOR Instructions
    "sse",    // 25 - Streaming SIMD Extensions
    "sse2",   // 26 - Streaming SIMD Extensions 2
    "ss",     // 27 - Self-Snoop
    "ht",     // 28 - Multi-Threading
    "tm",     // 29 - Thermal Monitor
    "ia64",   // 30 - Reserved ? 64-bit
    "pbe"     // 31 - Pending Break Enable
};

// uses short name sse3 instead of pni !
static char* feature_name_cx[32] =
{
    "sse3",         // 0  - Streaming SIMD Extensions 3
    "pclmulqdq",    // 1  - PCLMULDQ Instruction
    "dtes64",       // 2  - 64-Bit Debug Store
    "monitor",      // 3  - MONITOR/MWAIT
    "ds_cpl",       // 4  - CPL Qualified Debug Store
    "vmx",          // 5  - Virtual Machine Extensions
    "smx",          // 6  - Safer Mode Extensions
    "est",          // 7  - Enhanced Intel SpeedStep® Technology
    "tm2",          // 8  - Thermal Monitor 2
    "ssse3",        // 9  - Supplemental Streaming SIMD Extensions 3
    "cid",          // 10 - L1 Context ID
    "_",            // 11 - Reserved
    "fma",          // 12 - Fused Multiply Add
    "cx16",         // 13 - CMPXCHG16B
    "xtpr",         // 14 - xTPR Update Control
    "pdcm",         // 15 - Perfmon and Debug Capability
    "_",            // 16 - Reserved
    "pcid",         // 17 - Process Context Identifiers
    "dca",          // 18 - Direct Cache Access
    "sse41",        // 19 - Streaming SIMD Extensions 4.1
    "sse42",        // 20 - Streaming SIMD Extensions 4.2
    "x2apic",       // 21 - Extended xAPIC Support
    "movbe",        // 22 - MOVBE Instruction
    "popcnt",       // 23 - POPCNT Instruction
    "tscdeadline",  // 24 - Time Stamp Counter Deadline
    "aes",          // 25 - AES Instruction Extensions
    "xsave",        // 26 - XSAVE/XSTOR States
    "osxsave",      // 27 - OS-Enabled Extended State Management
    "avx",          // 28 - Advanced Vector Extensions
    "f16c",         // 29 - 16-bit floating-point conversion instructions
    "rdrnd",        // 30 - RDRAND instruction supported
    "hypervisor"    // 31 - (Not used in Intel doc...)
};


static void cpuid(uint32_t f,
		  uint32_t* eax, uint32_t* ebx, 
		  uint32_t* ecx, uint32_t* edx)
{
  __asm__ __volatile__(
#if defined(__x86_64__) || defined(_M_AMD64) || defined (_M_X64)
    "pushq %%rbx     \n\t" /* save %rbx */
#else
    "pushl %%ebx     \n\t" /* save %ebx */
#endif
    "cpuid            \n\t"
    "movl %%ebx ,%[ebx]  \n\t" /* write the result into output var */
#if defined(__x86_64__) || defined(_M_AMD64) || defined (_M_X64)
    "popq %%rbx \n\t"
#else
    "popl %%ebx \n\t"
#endif
    : "=a"(*eax), [ebx] "=r"(*ebx), "=c"(*ecx), "=d"(*edx)
    : "a"(f));
}

// name must be at least 13 chars long 
static char* cpuid_vendor_name(char* name)
{
    uint32_t a,b,c,d;

    cpuid(0,&a,&b,&c,&d);

    *((uint32_t*)&name[0]) = b;
    *((uint32_t*)&name[4]) = d;
    *((uint32_t*)&name[8]) = c;
    name[12] = '\0';
    return name;
}

static int cpuid_feature(uint32_t* ecx, uint32_t* edx)
{
    uint32_t a, b, c, d;

    cpuid(1, &a, &b, &c, &d);
    *ecx = c;
    *edx = d;
    return 0;
}

// Serial number is 12 bytes 
static int cpuid_serial(unsigned char* serial)
{
    uint32_t a, b, c, d;
    int i;
    cpuid(1, &a, &b, &c, &d);
    for (i = 0; i < 3; i++) {
	*serial++ = (a >> 24);
	a <<= 8;
    }
    cpuid(3, &a, &b, &c, &d);
    for (i = 0; i < 3; i++) {
	*serial++ = (d >> 24);
	d <<= 8;
    }
    for (i = 0; i < 3; i++) {
	*serial++ = (c >> 24);
	c <<= 8;
    }
    return 12;
} 

/* static int multiCoresPerProcPak() */
/* { */
/*     int a, b, c, d; */
/*     cpuid2(4,0, &a,&b,&c,&d); */
/*     return ((a & CPUID_CORES_PER_PROCPAK) >> 26) + 1; */
/* } */

static int cpuid_cache_line_size()
{
    uint32_t a, b, c, d;

    cpuid(1, &a, &b, &c, &d);
    return ((b & CPUID_CLFUSH_SIZE) >> 8) << 3;
}
#endif


void x86_init()
{
#if defined(__i386__) || defined(__x86_64__)
    char* name;
    int i;
    int j;

    name = cpuid_vendor_name(vendor_name);
    vendor_name_len = strlen(name);

    cpuid_feature(&feature_cx, &feature_dx);

    j = 0;
    // first the old dx flags
    for (i = 0; i < 32; i++) {
	if ((1 << i) & feature_dx) {
	    size_t len = strlen(feature_name_dx[i]);
	    if (j+len+1 < (int)sizeof(features)) {
		memcpy(&features[j], feature_name_dx[i], len);
		features[j+len] = ',';
		j++;
		j += len;
	    }
	}
    }
    // then the later cx flags
    for (i = 0; i < 32; i++) {
	if ((1 << i) & feature_cx) {
	    size_t len = strlen(feature_name_cx[i]);
	    if (j+len+1 < (int)sizeof(features)) {
	        memcpy(&features[j], feature_name_cx[i], len);
		features[j+len] = ',';
		j++;
		j += len;
	    }
	}
    }

    if (j > 0) {
	j--;
	features[j] = '\0';
    }
    features_len = j;

    cache_line_size = cpuid_cache_line_size();

    if (feature_cx & CPUID_PSN) {
	cpuid_serial(serial_number);
	serial_number_len = 12;
    }
    else {
	memset(serial_number, 0, sizeof(serial_number));
	serial_number_len = 0;
    }

#endif
}
