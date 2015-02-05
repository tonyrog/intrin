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

#ifndef __X86_UTIL_H__
#define __X86_UTIL_H__

extern int x86_cpu_cache_line_size(void);
extern int x86_cpu_vendor_name(char* buf, size_t maxlen);
extern int x86_cpu_serial_number(unsigned char* buf, size_t maxlen);
extern int x86_cpu_features(char* buf, size_t maxlen);
extern int x86_cpuid_check(int cxmask, int dxmask);
extern void x86_init(void);

#endif

