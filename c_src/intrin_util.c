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
#ifdef __arm__
extern void memcpy(void* dst, void* src, size_t len);
extern void memset(void* dst, int val, size_t len);
#else
#include <memory.h>
#endif

#include "intrin_util.h"
#include "intrin_cpuid.h"

static unsigned char   cpu_serial_number[64];
static size_t          cpu_serial_number_len = 0;
static char            cpu_vendor_name[64];
static size_t          cpu_vendor_name_len = 0;
static char            cpu_features[1024];
static size_t          cpu_features_len = 0;
static int             cpu_cache_line_size = 0;
static int             cpu_feature_cx = 0;
static int             cpu_feature_dx = 0;

//
// Return cpu serial number if available
// return 0 if not available otherwise the 
// length of the full serial number in bytes
//
int intrin_cpu_serial_number(unsigned char* buf, size_t maxlen)
{
    int n = (cpu_serial_number_len > maxlen) ? maxlen : cpu_serial_number_len;
    memcpy(buf, cpu_serial_number, n);
    return cpu_serial_number_len;
}

//
// Return cpu vendor name if available
// retur 0 if not avaiable otherwise the 
// lenfth of the full cpu vendor name in bytes
//
int intrin_cpu_vendor_name(char* buf, size_t maxlen)
{
    int n = (cpu_vendor_name_len > maxlen) ? maxlen : cpu_vendor_name_len;
    memcpy(buf, cpu_vendor_name, n);
    return n;
}

int intrin_cpu_features(char* buf, size_t maxlen)
{
    int n = (cpu_features_len > maxlen) ? maxlen : cpu_features_len;
    memcpy(buf, cpu_features, n);
    return n;
}

int intrin_cpu_cache_line_size()
{
    return cpu_cache_line_size;
}

int intrin_cpuid_check(int cxmask, int dxmask)
{
    return (((cxmask & cpu_feature_cx) == cxmask) &&
	    ((dxmask & cpu_feature_dx) == dxmask));
}

#if defined(__i386__) || defined(__x86_64__)
//
// http://en.wikipedia.org/wiki/CPUID
//
static char* cpuid_feature_name_dx[32] =
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
static char* cpuid_feature_name_cx[32] =
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

static void cpuid(int f, int *eax, int *ebx, int* ecx, int* edx)
{
    // FIXME add check if cpuid instruction is available,
    //  modern cpu's should have it so it's not very important right now.
    asm volatile ("mov %%ebx, %%esi\n\t" /* Save %ebx.  */
		  "cpuid\n\t"
		  "xchgl %%ebx, %%esi" /* Restore %ebx.  */
		  : "=a" (*eax), "=S" (*ebx), "=c" (*ecx), "=d" (*edx)
		  : "0" (f)
		  : "memory");
}

/* static void cpuid2(int f1, int f2, int *eax, int *ebx, int* ecx, int* edx) */
/* { */
/*     asm volatile ("mov %%ebx, %%esi\n\t" /\* Save %ebx.  *\/ */
/* 		  "cpuid\n\t" */
/* 		  "xchgl %%ebx, %%esi" /\* Restore %ebx.  *\/ */
/* 		  : "=a" (*eax), "=S" (*ebx), "=c" (*ecx), "=d" (*edx) */
/* 		  : "0" (f1), "c" (f2) */
/* 		  : "memory"); */
/* } */

/* static int cpuidMaxInputValue() */
/* { */
/*     int a,b,c,d; */
/*     cpuid(0,&a,&b,&c,&d); */
/*     return a; */
/* } */

// name must be at least 13 chars long 
static char* cpuidVendorName(char* name)
{
    int a,b,c,d;

    cpuid(0,&a,&b,&c,&d);

    *((int*)&name[0]) = b;
    *((int*)&name[4]) = d;
    *((int*)&name[8]) = c;
    name[12] = '\0';
    return name;
}

static int cpuidFeature(int* ecx, int* edx)
{
    int a, b, c, d;

    cpuid(1, &a, &b, &c, &d);
    *ecx = c;
    *edx = d;
    return 0;
}

// Serial number is 12 bytes 
static int cpuidSerial(unsigned char* serial)
{
    int a, b, c, d;
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

static int cpuidCacheLineSize()
{
    int a, b, c, d;

    cpuid(1, &a, &b, &c, &d);
    return ((b & CPUID_CLFUSH_SIZE) >> 8) << 3;
}
#endif


void intrin_init()
{
#if defined(__i386__) || defined(__x86_64__)
    char* name;
    char* hex = "0123456789ABCDEF";
    int i;
    int j;

    name = cpuidVendorName(cpu_vendor_name);
    cpu_vendor_name_len = strlen(name);

    cpuidFeature(&cpu_feature_cx, &cpu_feature_dx);
    j = 0;
    // first the old dx flags
    for (i = 0; i < 32; i++) {
	if ((1 << i) & cpu_feature_dx) {
	    size_t len = strlen(cpuid_feature_name_dx[i]);
	    if (j+len+1 < (int)sizeof(cpu_features)) {
		memcpy(&cpu_features[j], cpuid_feature_name_dx[i], len);
		cpu_features[j+len] = ',';
		j++;
		j += len;
	    }
	}
    }
    // then the later cx flags
    for (i = 0; i < 32; i++) {
	if ((1 << i) & cpu_feature_cx) {
	    size_t len = strlen(cpuid_feature_name_cx[i]);
	    if (j+len+1 < (int)sizeof(cpu_features)) {
		memcpy(&cpu_features[j], cpuid_feature_name_cx[i], len);
		cpu_features[j+len] = ',';
		j++;
		j += len;
	    }
	}
    }

    if (j > 0) {
	j--;
	cpu_features[j] = '\0';
    }
    cpu_features_len = j;

    cpu_cache_line_size = cpuidCacheLineSize();

    if (cpu_feature_cx & CPUID_PSN) {
	char xserial[25];
	cpuidSerial(cpu_serial_number);
	cpu_serial_number_len = 12;

	for (i = 0; i < 12; i++) {
	    xserial[2*i] = hex[(cpu_serial_number[i] >> 4)&0xf];
	    xserial[2*i+1] = hex[cpu_serial_number[i] & 0xf];
	}
	xserial[24] = 0;
    }
    else {
	memset(cpu_serial_number, 0, sizeof(cpu_serial_number));
	cpu_serial_number_len = 0;
    }
#endif
}
