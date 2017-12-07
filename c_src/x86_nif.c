//
// Nif interface to SIMD functions (experimental)
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "erl_nif.h"

#include "x86_util.h"
#include "x86_cpuid.h"

#if defined(__MMX__)
#include <mmintrin.h>
#endif

#if defined(__SSE__)
#include <xmmintrin.h>
#endif

#if defined(__SSE2__)
#include <emmintrin.h>
#endif

#if defined(__SSE3__)
#include <pmmintrin.h>
#endif

#if defined(__SSSE3__)
#include <tmmintrin.h>
#endif

#if defined(__SSE4_1__)
#include <smmintrin.h>
#endif

#if defined(__AVX__)
//#include <avxintrin.h>
#include <immintrin.h>
#endif

#if defined(__AVX2__)
// #include <avx2intrin.h>
#include <immintrin.h>
#endif

#define VSIZE512 64
typedef uint8_t vector512_t __attribute__ ((vector_size (VSIZE512)));
#define vector512_align(ptr) \
    ((uint8_t*)((((intptr_t)((uint8_t*)(ptr)))+(sizeof(vector512_t)-1)) & \
		~(sizeof(vector512_t)-1)))


#define VSIZE256 32
typedef uint8_t vector256_t __attribute__ ((vector_size (VSIZE256)));
#define vector256_align(ptr) \
    ((uint8_t*)((((intptr_t)((uint8_t*)(ptr)))+(sizeof(vector256_t)-1)) & \
		~(sizeof(vector256_t)-1)))

#define VSIZE128 16
typedef uint8_t vector128_t __attribute__ ((vector_size (VSIZE128)));

#define vector128_align(ptr) \
    ((uint8_t*)((((intptr_t)((uint8_t*)(ptr)))+(sizeof(vector128_t)-1)) & \
		~(sizeof(vector128_t)-1)))

#define VSIZE64 8
typedef uint8_t vector64_t __attribute__ ((vector_size (VSIZE64)));

#define vector64_align(ptr) \
    ((uint8_t*)((((intptr_t)((uint8_t*)(ptr)))+(sizeof(vector64_t)-1)) & \
		~(sizeof(vector64_t)-1)))

#define m128i_imm8_op(op,v,imm8) case (imm8): return op((v),(imm8))

#define m128i_imm8_opx2(op,v,imm8) \
    m128i_imm8_op(op,v,imm8); m128i_imm8_op(op,v,imm8+1)

#define m128i_imm8_opx4(op,v,imm8) \
    m128i_imm8_opx2(op,v,imm8); m128i_imm8_opx2(op,v,imm8+2)

#define m128i_imm8_opx8(op,v,imm8) \
    m128i_imm8_opx4(op,v,imm8); m128i_imm8_opx4(op,v,imm8+4)

#define m128i_imm8_opx16(op,v,imm8) \
    m128i_imm8_opx8(op,v,imm8); m128i_imm8_opx8(op,v,imm8+8)

#define m128i_imm8_opx32(op,v,imm8) \
    m128i_imm8_opx16(op,v,imm8); m128i_imm8_opx16(op,v,imm8+16)

#define m128i_imm8_opx64(op,v,imm8) \
    m128i_imm8_opx32(op,v,imm8); m128i_imm8_opx32(op,v,imm8+32)

#define m128i_imm8_opx128(op,v,imm8) \
    m128i_imm8_opx64(op,v,imm8); m128i_imm8_opx64(op,v,imm8+64)

#define m128i_imm8_opx256(op,v,imm8) \
    m128i_imm8_opx128(op,v,imm8); m128i_imm8_opx128(op,v,imm8+128)

#ifdef __x86_64__
#define NUM_XMM_REGS 16
#define NUM_YMM_REGS 32
#define NUM_ZMM_REGS 32
#else
#define NUM_XMM_REGS 8
#endif

#ifdef __SSE2__
// paramterized shuffle functions

static __m128i imm_shuffle_epi32(__m128i v, uint8_t imm)
{
    switch(imm) {
	m128i_imm8_opx256(_mm_shuffle_epi32, v, 0);
    default: return v;
    }
}

static __m128i imm_shufflelo_epi16(__m128i v, uint8_t imm)
{
    switch(imm) {
	m128i_imm8_opx256(_mm_shufflelo_epi16, v, 0);
    default: return v;
    }
}

static __m128i imm_shufflehi_epi16(__m128i v, uint8_t imm)
{
    switch(imm) {
	m128i_imm8_opx256(_mm_shufflehi_epi16, v, 0);
    default: return v;
    }
}

static __m128i imm_srli_si128(__m128i v, uint8_t imm)
{
    if (imm > 15) imm = 16;
    switch(imm) {
	m128i_imm8_opx16(_mm_srli_si128, v, 0);
    default: return v;
    }
}

static __m128i imm_slli_si128(__m128i v, uint8_t imm)
{
    if (imm > 15) imm = 16;
    switch(imm) {
	m128i_imm8_opx16(_mm_slli_si128, v, 0);
    default: return v;
    }
}

uint8_t xmm_data[16*NUM_XMM_REGS+15];
__m128* xmm;

#endif

#ifdef __AVX__
uint8_t ymm_data[32*NUM_YMM_REGS+31];
__m256* ymm;
#endif

#ifdef __AVX512__
uint8_t zmm_data[64*NUM_YMM_REGS+63];
__m512* zmm;
#endif

#define NUM_MM_REGS 8

#ifdef __MMX__
uint8_t  mm_data[8*NUM_MM_REGS+7];
__m64* mm;
#endif

#define NUM_D_REGS 32   // 32 64bit registers
#define NUM_Q_REGS 16   // 16 128bit registers (dual view)

#define ATOM(name) atm_##name

#define DECL_ATOM(name) \
    ERL_NIF_TERM atm_##name = 0

// require env in context (ugly)
#define LOAD_ATOM(name)			\
    atm_##name = enif_make_atom(env,#name)

DECL_ATOM(ok);
DECL_ATOM(true);
DECL_ATOM(false);
DECL_ATOM(undefined);
DECL_ATOM(error);

DECL_ATOM(mm0);
DECL_ATOM(mm1);
DECL_ATOM(mm2);
DECL_ATOM(mm3);
DECL_ATOM(mm4);
DECL_ATOM(mm5);
DECL_ATOM(mm6);
DECL_ATOM(mm7);

DECL_ATOM(xmm0);
DECL_ATOM(xmm1);
DECL_ATOM(xmm2);
DECL_ATOM(xmm3);
DECL_ATOM(xmm4);
DECL_ATOM(xmm5);
DECL_ATOM(xmm6);
DECL_ATOM(xmm7);
DECL_ATOM(xmm8);
DECL_ATOM(xmm9);
DECL_ATOM(xmm10);
DECL_ATOM(xmm11);
DECL_ATOM(xmm12);
DECL_ATOM(xmm13);
DECL_ATOM(xmm14);
DECL_ATOM(xmm15);

DECL_ATOM(ymm0);
DECL_ATOM(ymm1);
DECL_ATOM(ymm2);
DECL_ATOM(ymm3);
DECL_ATOM(ymm4);
DECL_ATOM(ymm5);
DECL_ATOM(ymm6);
DECL_ATOM(ymm7);
DECL_ATOM(ymm8);
DECL_ATOM(ymm9);
DECL_ATOM(ymm10);
DECL_ATOM(ymm11);
DECL_ATOM(ymm12);
DECL_ATOM(ymm13);
DECL_ATOM(ymm14);
DECL_ATOM(ymm15);
DECL_ATOM(ymm16);
DECL_ATOM(ymm17);
DECL_ATOM(ymm18);
DECL_ATOM(ymm19);
DECL_ATOM(ymm20);
DECL_ATOM(ymm21);
DECL_ATOM(ymm22);
DECL_ATOM(ymm23);
DECL_ATOM(ymm24);
DECL_ATOM(ymm25);
DECL_ATOM(ymm26);
DECL_ATOM(ymm27);
DECL_ATOM(ymm28);
DECL_ATOM(ymm29);
DECL_ATOM(ymm30);
DECL_ATOM(ymm31);

DECL_ATOM(zmm0);
DECL_ATOM(zmm1);
DECL_ATOM(zmm2);
DECL_ATOM(zmm3);
DECL_ATOM(zmm4);
DECL_ATOM(zmm5);
DECL_ATOM(zmm6);
DECL_ATOM(zmm7);
DECL_ATOM(zmm8);
DECL_ATOM(zmm9);
DECL_ATOM(zmm10);
DECL_ATOM(zmm11);
DECL_ATOM(zmm12);
DECL_ATOM(zmm13);
DECL_ATOM(zmm14);
DECL_ATOM(zmm15);
DECL_ATOM(zmm16);
DECL_ATOM(zmm17);
DECL_ATOM(zmm18);
DECL_ATOM(zmm19);
DECL_ATOM(zmm20);
DECL_ATOM(zmm21);
DECL_ATOM(zmm22);
DECL_ATOM(zmm23);
DECL_ATOM(zmm24);
DECL_ATOM(zmm25);
DECL_ATOM(zmm26);
DECL_ATOM(zmm27);
DECL_ATOM(zmm28);
DECL_ATOM(zmm29);
DECL_ATOM(zmm30);
DECL_ATOM(zmm31);


DECL_ATOM(cpu_features);
DECL_ATOM(cpu_vendor_name);
DECL_ATOM(cpu_serial_number);
DECL_ATOM(cpu_cache_line_size);
DECL_ATOM(cpu_simd_support);

DECL_ATOM(mmx);
DECL_ATOM(sse);
DECL_ATOM(sse2);
DECL_ATOM(sse3);
DECL_ATOM(ssse3);
DECL_ATOM(sse41);
DECL_ATOM(sse42);

int get_zmm(ErlNifEnv* env, const ERL_NIF_TERM term, int* value)
{
    int r;

    if (!enif_get_int(env, term, &r)) {
	if (term == ATOM(zmm0)) r = 0;
	else if (term == ATOM(zmm1)) r = 1;
	else if (term == ATOM(zmm2)) r = 2;
	else if (term == ATOM(zmm3)) r = 3;
	else if (term == ATOM(zmm4)) r = 4;
	else if (term == ATOM(zmm5)) r = 5;
	else if (term == ATOM(zmm6)) r = 6;
	else if (term == ATOM(zmm7)) r = 7;
	else if (term == ATOM(zmm8)) r = 8;
	else if (term == ATOM(zmm9)) r = 9;
	else if (term == ATOM(zmm10)) r = 10;
	else if (term == ATOM(zmm11)) r = 11;
	else if (term == ATOM(zmm12)) r = 12;
	else if (term == ATOM(zmm13)) r = 13;
	else if (term == ATOM(zmm14)) r = 14;
	else if (term == ATOM(zmm15)) r = 15;
	else if (term == ATOM(zmm16)) r = 16;
	else if (term == ATOM(zmm17)) r = 17;
	else if (term == ATOM(zmm18)) r = 18;
	else if (term == ATOM(zmm19)) r = 19;
	else if (term == ATOM(zmm20)) r = 20;
	else if (term == ATOM(zmm21)) r = 21;
	else if (term == ATOM(zmm22)) r = 22;
	else if (term == ATOM(zmm23)) r = 23;
	else if (term == ATOM(zmm24)) r = 24;
	else if (term == ATOM(zmm25)) r = 25;
	else if (term == ATOM(zmm26)) r = 26;
	else if (term == ATOM(zmm27)) r = 27;
	else if (term == ATOM(zmm28)) r = 28;
	else if (term == ATOM(zmm29)) r = 29;
	else if (term == ATOM(zmm30)) r = 30;
	else if (term == ATOM(zmm31)) r = 31;
	else return 0;
    }
    if ((r < 0) || (r >= NUM_ZMM_REGS))
	return 0;
    *value = r;
    return 1;
}

int get_ymm(ErlNifEnv* env, const ERL_NIF_TERM term, int* value)
{
    int r;

    if (!enif_get_int(env, term, &r)) {
	if (term == ATOM(ymm0)) r = 0;
	else if (term == ATOM(ymm1)) r = 1;
	else if (term == ATOM(ymm2)) r = 2;
	else if (term == ATOM(ymm3)) r = 3;
	else if (term == ATOM(ymm4)) r = 4;
	else if (term == ATOM(ymm5)) r = 5;
	else if (term == ATOM(ymm6)) r = 6;
	else if (term == ATOM(ymm7)) r = 7;
	else if (term == ATOM(ymm8)) r = 8;
	else if (term == ATOM(ymm9)) r = 9;
	else if (term == ATOM(ymm10)) r = 10;
	else if (term == ATOM(ymm11)) r = 11;
	else if (term == ATOM(ymm12)) r = 12;
	else if (term == ATOM(ymm13)) r = 13;
	else if (term == ATOM(ymm14)) r = 14;
	else if (term == ATOM(ymm15)) r = 15;
	else if (term == ATOM(ymm16)) r = 16;
	else if (term == ATOM(ymm17)) r = 17;
	else if (term == ATOM(ymm18)) r = 18;
	else if (term == ATOM(ymm19)) r = 19;
	else if (term == ATOM(ymm20)) r = 20;
	else if (term == ATOM(ymm21)) r = 21;
	else if (term == ATOM(ymm22)) r = 22;
	else if (term == ATOM(ymm23)) r = 23;
	else if (term == ATOM(ymm24)) r = 24;
	else if (term == ATOM(ymm25)) r = 25;
	else if (term == ATOM(ymm26)) r = 26;
	else if (term == ATOM(ymm27)) r = 27;
	else if (term == ATOM(ymm28)) r = 28;
	else if (term == ATOM(ymm29)) r = 29;
	else if (term == ATOM(ymm30)) r = 30;
	else if (term == ATOM(ymm31)) r = 31;
	else return 0;
    }
    if ((r < 0) || (r >= NUM_YMM_REGS))
	return 0;
    *value = r;
    return 1;
}

int get_xmm(ErlNifEnv* env, const ERL_NIF_TERM term, int* value)
{
    int r;

    if (!enif_get_int(env, term, &r)) {
	if (term == ATOM(xmm0)) r = 0;
	else if (term == ATOM(xmm1)) r = 1;
	else if (term == ATOM(xmm2)) r = 2;
	else if (term == ATOM(xmm3)) r = 3;
	else if (term == ATOM(xmm4)) r = 4;
	else if (term == ATOM(xmm5)) r = 5;
	else if (term == ATOM(xmm6)) r = 6;
	else if (term == ATOM(xmm7)) r = 7;
	else if (term == ATOM(xmm8)) r = 8;
	else if (term == ATOM(xmm9)) r = 9;
	else if (term == ATOM(xmm10)) r = 10;
	else if (term == ATOM(xmm11)) r = 11;
	else if (term == ATOM(xmm12)) r = 12;
	else if (term == ATOM(xmm13)) r = 13;
	else if (term == ATOM(xmm14)) r = 14;
	else if (term == ATOM(xmm15)) r = 15;
	else return 0;
    }
    if ((r < 0) || (r >= NUM_XMM_REGS))
	return 0;
    *value = r;
    return 1;
}


int get_mm(ErlNifEnv* env, const ERL_NIF_TERM term, int* value)
{
    int r;

    if (!enif_get_int(env, term, &r)) {
	if (term == ATOM(mm0)) r = 0;
	else if (term == ATOM(mm1)) r = 1;
	else if (term == ATOM(mm2)) r = 2;
	else if (term == ATOM(mm3)) r = 3;
	else if (term == ATOM(mm4)) r = 4;
	else if (term == ATOM(mm5)) r = 5;
	else if (term == ATOM(mm6)) r = 6;
	else if (term == ATOM(mm7)) r = 7;
	else return 0;
    }
    if ((r < 0) || (r >= NUM_MM_REGS))
	return 0;
    *value = r;
    return 1;
}

int get_byte(ErlNifEnv* env, const ERL_NIF_TERM term, uint8_t* value)
{
    int r;

    if (!enif_get_int(env, term, &r))
	return 0;
    if ((r < 0) || (r > 255))
	return 0;
    *value = r;
    return 1;
}

/******************************************************************************
 *
 *  cpu_info
 *  support()  = mmx|sse|sse2|sse3|ssse3|sse41|sse42
 *  cpu_vendor_name :: string()
 *  cpu_features    :: string()
 *  cpu_cache_line_size :: integer()
 *  cpu_simd_support    :: [support()]
 *****************************************************************************/

static ERL_NIF_TERM cpu_info(ErlNifEnv* env, int argc, 
			     const ERL_NIF_TERM argv[])
{
    (void) argc;
    if (argv[0] == ATOM(cpu_vendor_name)) {
	char buf[1024];
	int n = x86_cpu_vendor_name(buf, sizeof(buf));
	return enif_make_string_len(env, buf, n, ERL_NIF_LATIN1);
    }
    else if (argv[0] == ATOM(cpu_features)) {
	char buf[1024];
	int n = x86_cpu_features(buf, sizeof(buf));
	return enif_make_string_len(env, buf, n, ERL_NIF_LATIN1);
    }
    else if (argv[0] == ATOM(cpu_cache_line_size)) {
	return enif_make_int(env, x86_cpu_cache_line_size());
    }
    else if (argv[0] == ATOM(cpu_simd_support)) {
	ERL_NIF_TERM list;

	list = enif_make_list(env, 0);
#if defined(__MMX__)
	if (x86_cpuid_check(0, CPUID_MMX))
	    list = enif_make_list_cell(env, ATOM(mmx), list);
#endif
#if defined(__SSE__)
	if (x86_cpuid_check(0, CPUID_SSE))
	    list = enif_make_list_cell(env, ATOM(sse), list);
#endif
#if defined(__SSE2__)
	if (x86_cpuid_check(0, CPUID_SSE2))
	    list = enif_make_list_cell(env, ATOM(sse2), list);
#endif
#if defined(__SSE3__)
	if (x86_cpuid_check(CPUID_SSE3, 0))
	    list = enif_make_list_cell(env, ATOM(sse3), list);
#endif
#if defined(__SSSE3__)
	if (x86_cpuid_check(CPUID_SSSE3, 0))
	    list = enif_make_list_cell(env, ATOM(ssse3), list);
#endif
#if defined(__SSE4_1__)
	if (x86_cpuid_check(CPUID_SSE4_1, 0))
	    list = enif_make_list_cell(env, ATOM(sse41), list);
#endif
#if defined(__SSE4_2__)
	if (x86_cpuid_check(CPUID_SSE4_2, 0))
	    list = enif_make_list_cell(env, ATOM(sse42), list);
#endif
	return list;
    }
    return enif_make_badarg(env);
}

#define NOT_SUPPORTED(nm) \
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    return ATOM(error);							\
}

#if defined(__MMX__)

#define op_MM(pfx,nm,dt,st)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_mm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_mm(env, argv[1], &src)) return enif_make_badarg(env);	\
    mm[dst] = (__m64) pfx##nm((dt)mm[dst], (st)mm[src]);		\
    return ATOM(ok);							\
}

#define op_M(pfx,nm,dt)						\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int dst;								\
    if (!get_mm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    mm[dst] = (__m64) pfx##nm((dt)mm[dst]);				\
    return ATOM(ok);							\
}

#define bool_MM(pfx,nm,dt,st)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_mm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_mm(env, argv[1], &src)) return enif_make_badarg(env);	\
    return (pfx##nm((dt)mm[dst], (st)mm[src])) ? ATOM(true) : ATOM(false); \
}

#define op_My(pfx,nm,dt,vt)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    uint8_t val;							\
    int dst;								\
    if (!get_mm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_byte(env, argv[1], &val)) return enif_make_badarg(env);	\
    mm[dst] = (__m64)pfx##nm((dt)mm[dst], (vt)val);			\
    return ATOM(ok);							\
}

#else

#define op_MM(pfx,nm,dt,st)  NOT_SUPPORTED(nm)
#define op_M(pfx,nm,dt)      NOT_SUPPORTED(nm)
#define bool_MM(pfx,nm,dt,st)  NOT_SUPPORTED(nm)
#define op_My(pfx,nm,dt,vt)  NOT_SUPPORTED(nm)

#endif

#if defined(__SSE__)

#define op_XX1(pfx,nm,dt,st)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_xmm(env, argv[1], &src)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128)pfx##nm((dt)xmm[src]);				\
    return ATOM(ok);							\
}

#define op_XX(pfx,nm,dt,st)				\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_xmm(env, argv[1], &src)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128)pfx##nm((dt)xmm[dst], (st)xmm[src]);		\
    return ATOM(ok);							\
}

#define op_X(pfx,nm,dt)						\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int dst;								\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128) pfx##nm((dt)xmm[dst]);				\
    return ATOM(ok);							\
}

#define bool_XX(pfx,nm,dt,st)				\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_xmm(env, argv[1], &src)) return enif_make_badarg(env);	\
    return (pfx##nm((dt)xmm[dst],(st)xmm[src])) ? ATOM(true) : ATOM(false); \
}

#define op_Xy(pfx,nm,dt,vt)				\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    uint8_t val;							\
    int dst;								\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_byte(env, argv[1], &val)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128)pfx##nm((dt)xmm[dst],(vt)val);			\
    return ATOM(ok);							\
}


#define op_XXy(pfx,nm,dt,st,vt)			\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    uint8_t val;							\
    int src,dst;							\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_xmm(env, argv[1], &src)) return enif_make_badarg(env);	\
    if (!get_byte(env, argv[2], &val)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128)pfx##nm((st)xmm[src],(vt)val);			\
    return ATOM(ok);							\
}

#else

#define op_XX1(pfx,nm,dt,st) NOT_SUPPORTED(nm)
#define op_XX(pfx,nm,dt,st) NOT_SUPPORTED(nm)
#define op_X(pfx,nm,dt)      NOT_SUPPORTED(nm)
#define bool_XX(pfx,nm,dt,st) NOT_SUPPORTED(nm)
#define op_Xy(pfx,nm,dt,vt) NOT_SUPPORTED(nm)
#define op_XXy(pfx,nm,dt,st,vt) NOT_SUPPORTED(nm)

#endif

#if defined(__AVX__)

#define op_YY(pfx,nm,dt,st)				\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_ymm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_ymm(env, argv[1], &src)) return enif_make_badarg(env);	\
    ymm[dst] = (__m256)pfx##nm((dt)ymm[dst], (st)ymm[src]);		\
    return ATOM(ok);							\
}

#else

#define op_YY(pfx,nm,dt,st) NOT_SUPPORTED(nm)

#endif

#include "mmx.inc"
#include "sse.inc"
#include "sse2.inc"
#include "sse3.inc"
#include "ssse3.inc"
#include "sse4.1.inc"
#include "avx.inc"

static ERL_NIF_TERM mm_move(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    int src, dst;

    if (get_ymm(env, argv[0], &dst) && get_ymm(env, argv[1], &src)) {
#if defined(__AVX__)
	ymm[dst] = ymm[src];
	return ATOM(ok);
#endif
    }    
    else if (get_xmm(env, argv[0], &dst) && get_xmm(env, argv[1], &src)) {
#if defined(__SSE__)
	xmm[dst] = xmm[src];
	return ATOM(ok);
#endif
    }
    else if (get_mm(env, argv[0], &dst) && get_mm(env, argv[1], &src)) {
#if defined(__MMX__)
	mm[dst] = mm[src];
	return ATOM(ok);
#endif
    }
    else
	return enif_make_badarg(env);
    return ATOM(error);
}

static ERL_NIF_TERM mm_get(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    int src;

    if (get_ymm(env, argv[0], &src)) {
#if defined(__AVX__)
	ErlNifBinary bin;
	ERL_NIF_TERM r;

	if (!enif_alloc_binary(VSIZE256, &bin))
	    return ATOM(error);
	memcpy(bin.data,&ymm[src],VSIZE256);
	r = enif_make_binary(env, &bin);
	enif_release_binary(&bin);
	return r;
#endif
    }
    else if (get_xmm(env, argv[0], &src)) {
#if defined(__SSE__)
	ErlNifBinary bin;
	ERL_NIF_TERM r;

	if (!enif_alloc_binary(VSIZE128, &bin))
	    return ATOM(error);
	memcpy(bin.data,&xmm[src],VSIZE128);
	r = enif_make_binary(env, &bin);
	enif_release_binary(&bin);
	return r;
#endif
    }
    else if (get_mm(env, argv[0], &src)) {
#if defined(__MMX__)
	ErlNifBinary bin;
	ERL_NIF_TERM r;

	if (!enif_alloc_binary(VSIZE64, &bin))
	    return ATOM(error);
	memcpy(bin.data,&mm[src],VSIZE64);
	r = enif_make_binary(env, &bin);
	enif_release_binary(&bin);
	return r;
#endif
    }
    else
	return enif_make_badarg(env);	
    return ATOM(error);
}

static ERL_NIF_TERM mm_set(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    int dst;

    if (!enif_inspect_iolist_as_binary(env, argv[1], &bin))
	return enif_make_badarg(env);

    if (get_ymm(env, argv[0], &dst) && (bin.size == VSIZE256)) {
#if defined(__AVX__)
	memcpy(&ymm[dst], bin.data, VSIZE256);
	return ATOM(ok);
#endif
    }
    else if (get_xmm(env, argv[0], &dst) && (bin.size == VSIZE128)) {
#if defined(__SSE__)
	memcpy(&xmm[dst], bin.data, VSIZE128);
	return ATOM(ok);
#endif
    }
    else if (get_mm(env, argv[0], &dst) && (bin.size == VSIZE64)) {
#if defined(__MMX__)
	memcpy(&mm[dst], bin.data, VSIZE64);
	return ATOM(ok);
#endif
    }
    else
	return enif_make_badarg(env);
    return ATOM(error);
}

static ERL_NIF_TERM mm_load(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    unsigned int offset;
    int dst;

    if (!enif_inspect_binary(env, argv[2], &bin))
	return enif_make_badarg(env);

    if (!enif_get_uint(env, argv[1], &offset))
	return enif_make_badarg(env);

    if (get_ymm(env, argv[0], &dst) && (bin.size-offset >= VSIZE256)) {
#if defined(__AVX__)
	memcpy(&ymm[dst], bin.data+offset, VSIZE256);
	return ATOM(ok);
#endif
    } 
    else if (get_xmm(env, argv[0], &dst) && (bin.size-offset >= VSIZE128)) {
#if defined(__SSE__)
	memcpy(&xmm[dst], bin.data+offset, VSIZE128);
	return ATOM(ok);
#endif
    }
    else if (get_mm(env, argv[0], &dst) && (bin.size-offset >= VSIZE64)) {
#if defined(__MMX__)
	memcpy(&mm[dst], bin.data+offset, VSIZE64);
	return ATOM(ok);
#endif
    }
    else
	return enif_make_badarg(env);
    return ATOM(error);
}

#undef op_YY
#undef op_XX1
#undef op_XX
#undef op_X
#undef bool_XX
#undef op_Xy
#undef op_XXy
#undef op_MM
#undef op_M
#undef bool_MM
#undef op_My

#define op_YY(pfx,nm,dt,st) { #nm, 2, nm },
#define op_XX1(pfx,nm,dt,st) { #nm, 2, nm },
#define op_XX(pfx,nm,dt,st) { #nm, 2, nm },
#define op_X(pfx,nm,dt)      { #nm, 1, nm },
#define bool_XX(pfx,nm,dt,st) { #nm, 2, nm },
#define op_Xy(pfx,nm,dt,vt) { #nm, 2, nm },
#define op_XXy(pfx,nm,dt,st,vt) { #nm, 3, nm },
#define op_MM(pfx,nm,dt,st)   { #nm, 2, nm },
#define op_M(pfx,nm,dt)       { #nm, 1, nm },
#define bool_MM(pfx,nm,dt,st)   { #nm, 2, nm },
#define op_My(pfx,nm,dt,vt)  { #nm, 2, nm },

static ErlNifFunc nif_funcs[] = {
#include "mmx.inc"
#include "sse.inc"
#include "sse2.inc"
#include "sse3.inc"
#include "ssse3.inc"
#include "sse4.1.inc"
#include "avx.inc"
    { "mm_move", 2, mm_move },   // dst src
    { "mm_set",  2, mm_set },    // dst Vector::binary()
    { "mm_get",  1, mm_get },    // get => Vector::binary()
    { "mm_load", 3, mm_load },   // dst:reg(),Offset::unsigned(),Data::binary()
    { "info",    1, cpu_info }, 
};

static int atload(ErlNifEnv* env, void** priv_data, ERL_NIF_TERM load_info)
{
    x86_init();
    // Load atoms
    LOAD_ATOM(ok);
    LOAD_ATOM(true);
    LOAD_ATOM(false);
    LOAD_ATOM(undefined);
    LOAD_ATOM(error);

    LOAD_ATOM(mm0);
    LOAD_ATOM(mm1);
    LOAD_ATOM(mm2);
    LOAD_ATOM(mm3);
    LOAD_ATOM(mm4);
    LOAD_ATOM(mm5);
    LOAD_ATOM(mm6);
    LOAD_ATOM(mm7);

    LOAD_ATOM(xmm0);
    LOAD_ATOM(xmm1);
    LOAD_ATOM(xmm2);
    LOAD_ATOM(xmm3);
    LOAD_ATOM(xmm4);
    LOAD_ATOM(xmm5);
    LOAD_ATOM(xmm6);
    LOAD_ATOM(xmm7);
    LOAD_ATOM(xmm8);
    LOAD_ATOM(xmm9);
    LOAD_ATOM(xmm10);
    LOAD_ATOM(xmm11);
    LOAD_ATOM(xmm12);
    LOAD_ATOM(xmm13);
    LOAD_ATOM(xmm14);
    LOAD_ATOM(xmm15);

    LOAD_ATOM(ymm0);
LOAD_ATOM(ymm1);
LOAD_ATOM(ymm2);
LOAD_ATOM(ymm3);
LOAD_ATOM(ymm4);
LOAD_ATOM(ymm5);
LOAD_ATOM(ymm6);
LOAD_ATOM(ymm7);
LOAD_ATOM(ymm8);
LOAD_ATOM(ymm9);
LOAD_ATOM(ymm10);
LOAD_ATOM(ymm11);
LOAD_ATOM(ymm12);
LOAD_ATOM(ymm13);
LOAD_ATOM(ymm14);
LOAD_ATOM(ymm15);
LOAD_ATOM(ymm16);
LOAD_ATOM(ymm17);
LOAD_ATOM(ymm18);
LOAD_ATOM(ymm19);
LOAD_ATOM(ymm20);
LOAD_ATOM(ymm21);
LOAD_ATOM(ymm22);
LOAD_ATOM(ymm23);
LOAD_ATOM(ymm24);
LOAD_ATOM(ymm25);
LOAD_ATOM(ymm26);
LOAD_ATOM(ymm27);
LOAD_ATOM(ymm28);
LOAD_ATOM(ymm29);
LOAD_ATOM(ymm30);
LOAD_ATOM(ymm31);

LOAD_ATOM(zmm0);
LOAD_ATOM(zmm1);
LOAD_ATOM(zmm2);
LOAD_ATOM(zmm3);
LOAD_ATOM(zmm4);
LOAD_ATOM(zmm5);
LOAD_ATOM(zmm6);
LOAD_ATOM(zmm7);
LOAD_ATOM(zmm8);
LOAD_ATOM(zmm9);
LOAD_ATOM(zmm10);
LOAD_ATOM(zmm11);
LOAD_ATOM(zmm12);
LOAD_ATOM(zmm13);
LOAD_ATOM(zmm14);
LOAD_ATOM(zmm15);
LOAD_ATOM(zmm16);
LOAD_ATOM(zmm17);
LOAD_ATOM(zmm18);
LOAD_ATOM(zmm19);
LOAD_ATOM(zmm20);
LOAD_ATOM(zmm21);
LOAD_ATOM(zmm22);
LOAD_ATOM(zmm23);
LOAD_ATOM(zmm24);
LOAD_ATOM(zmm25);
LOAD_ATOM(zmm26);
LOAD_ATOM(zmm27);
LOAD_ATOM(zmm28);
LOAD_ATOM(zmm29);
LOAD_ATOM(zmm30);
LOAD_ATOM(zmm31);


    LOAD_ATOM(cpu_features);
    LOAD_ATOM(cpu_vendor_name);
    LOAD_ATOM(cpu_serial_number);
    LOAD_ATOM(cpu_cache_line_size);
    LOAD_ATOM(cpu_simd_support);

    LOAD_ATOM(mmx);
    LOAD_ATOM(sse);
    LOAD_ATOM(sse2);
    LOAD_ATOM(sse3);
    LOAD_ATOM(ssse3);
    LOAD_ATOM(sse41);
    LOAD_ATOM(sse42);

#ifdef __MMX__
    memset(&mm_data[0], 0, sizeof(mm_data));
    mm = (__m64*) vector64_align(&mm_data[0]);
#endif
#ifdef __SSE2__
    memset(&xmm_data[0], 0, sizeof(xmm_data));
    xmm = (__m128*) vector128_align(&xmm_data[0]);
#endif
#ifdef __AVX__
    memset(&ymm_data[0], 0, sizeof(ymm_data));
    ymm = (__m256*) vector256_align(&ymm_data[0]);
#endif
#ifdef __AVX512__
    memset(&zmm_data[0], 0, sizeof(zmm_data));
    zmm = (__m512*) vector512_align(&zmm_data[0]);
#endif    
    return 0;
}

ERL_NIF_INIT(x86, nif_funcs, atload, NULL, NULL, NULL)
