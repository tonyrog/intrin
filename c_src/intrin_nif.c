//
// Nif interface to SIMD functions (experimental)
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "erl_nif.h"

#include "intrin_util.h"
#include "intrin_cpuid.h"

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

#define NUM_XMM_REGS 8

uint8_t xmm_data[16*NUM_XMM_REGS+15];
__m128* xmm;

#endif

#ifdef __MMX__
#define NUM_MM_REGS 8

uint8_t  mm_data[8*NUM_MM_REGS+7];
__m64* mm;

#endif


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
DECL_ATOM(altivec);
DECL_ATOM(neon);

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

int get_imm8(ErlNifEnv* env, const ERL_NIF_TERM term, uint8_t* value)
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
 *  intrin_info
 *  support()  = mmx|sse|sse2|sse3|ssse3|sse41|sse42|altivec|neon
 *  cpu_vendor_name :: string()
 *  cpu_features    :: string()
 *  cpu_cache_line_size :: integer()
 *  cpu_simd_support    :: [simd_suppor()]
 *****************************************************************************/

static ERL_NIF_TERM intrin_info(ErlNifEnv* env, int argc, 
				const ERL_NIF_TERM argv[])
{
    (void) argc;
    if (argv[0] == ATOM(cpu_vendor_name)) {
	char buf[1024];
	int n = intrin_cpu_vendor_name(buf, sizeof(buf));
	return enif_make_string_len(env, buf, n, ERL_NIF_LATIN1);
    }
    else if (argv[0] == ATOM(cpu_features)) {
	char buf[1024];
	int n = intrin_cpu_features(buf, sizeof(buf));
	return enif_make_string_len(env, buf, n, ERL_NIF_LATIN1);
    }
    else if (argv[0] == ATOM(cpu_cache_line_size)) {
	return enif_make_int(env, intrin_cpu_cache_line_size());
    }
    else if (argv[0] == ATOM(cpu_simd_support)) {
	ERL_NIF_TERM list;

	list = enif_make_list(env, 0);
#if defined(__MMX__)
	if (intrin_cpuid_check(0, CPUID_MMX))
	    list = enif_make_list_cell(env, ATOM(mmx), list);
#endif
#if defined(__SSE__)
	if (intrin_cpuid_check(0, CPUID_SSE))
	    list = enif_make_list_cell(env, ATOM(sse), list);
#endif
#if defined(__SSE2__)
	if (intrin_cpuid_check(0, CPUID_SSE2))
	    list = enif_make_list_cell(env, ATOM(sse2), list);
#endif
#if defined(__SSE3__)
	if (intrin_cpuid_check(CPUID_SSE3, 0))
	    list = enif_make_list_cell(env, ATOM(sse3), list);
#endif
#if defined(__SSSE3__)
	if (intrin_cpuid_check(CPUID_SSSE3, 0))
	    list = enif_make_list_cell(env, ATOM(ssse3), list);
#endif
#if defined(__SSE4_1__)
	if (intrin_cpuid_check(CPUID_SSE4_1, 0))
	    list = enif_make_list_cell(env, ATOM(sse41), list);
#endif
#if defined(__SSE4_2__)
	if (intrin_cpuid_check(CPUID_SSE4_2, 0))
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

#define DEF_void_MMd_MMs(pfx,nm,dt,st)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_mm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_mm(env, argv[1], &src)) return enif_make_badarg(env);	\
    mm[dst] = (__m64) pfx##nm((dt)mm[dst], (st)mm[src]);		\
    return ATOM(ok);							\
}

#define DEF_void_MMd(pfx,nm,dt)						\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int dst;								\
    if (!get_mm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    mm[dst] = (__m64) pfx##nm((dt)mm[dst]);				\
    return ATOM(ok);							\
}

#define DEF_bool_MMd_MMs(pfx,nm,dt,st)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_mm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_mm(env, argv[1], &src)) return enif_make_badarg(env);	\
    return (pfx##nm((dt)mm[dst], (st)mm[src])) ? ATOM(true) : ATOM(false); \
}

#define DEF_void_MMd_imm8(pfx,nm,dt,vt)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    uint8_t val;							\
    int dst;								\
    if (!get_mm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_imm8(env, argv[1], &val)) return enif_make_badarg(env);	\
    mm[dst] = (__m64)pfx##nm((dt)mm[dst], (vt)val);			\
    return ATOM(ok);							\
}

#else

#define DEF_void_MMd_MMs(pfx,nm,dt,st)  NOT_SUPPORTED(nm)
#define DEF_void_MMd(pfx,nm,dt)      NOT_SUPPORTED(nm)
#define DEF_bool_MMd_MMs(pfx,nm,dt,dt)  NOT_SUPPORTED(nm)
#define DEF_void_MMd_imm8(pfx,nm,dt,vt) NOT_SUPPORTED(nm)

#endif

#if defined(__SSE__)

#define DEF_void_XMMd_XMMs1(pfx,nm,st)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_xmm(env, argv[1], &src)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128)pfx##nm((st)xmm[src]);				\
    return ATOM(ok);							\
}

#define DEF_void_XMMd_XMMs(pfx,nm,dt,st)				\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_xmm(env, argv[1], &src)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128)pfx##nm((dt)xmm[dst], (st)xmm[src]);		\
    return ATOM(ok);							\
}

#define DEF_void_XMMd(pfx,nm,dt)					\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int dst;								\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128) pfx##nm((dt)xmm[dst]);				\
    return ATOM(ok);							\
}

#define DEF_bool_XMMd_XMMs(pfx,nm,dt,st)				\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int src, dst;							\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_xmm(env, argv[1], &src)) return enif_make_badarg(env);	\
    return (pfx##nm((dt)xmm[dst],(st)xmm[src])) ? ATOM(true) : ATOM(false); \
}

#define DEF_void_XMMd_imm8(pfx,nm,dt,vt)				\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    uint8_t val;							\
    int dst;								\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_imm8(env, argv[1], &val)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128)pfx##nm((dt)xmm[dst],(vt)val);			\
    return ATOM(ok);							\
}


#define DEF_void_XMMd_XMMs_imm8(pfx,nm,dt,st,vt)			\
static ERL_NIF_TERM nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    uint8_t val;							\
    int src,dst;							\
    if (!get_xmm(env, argv[0], &dst)) return enif_make_badarg(env);	\
    if (!get_xmm(env, argv[1], &src)) return enif_make_badarg(env);	\
    if (!get_imm8(env, argv[2], &val)) return enif_make_badarg(env);	\
    xmm[dst] = (__m128)pfx##nm((st)xmm[src],(vt)val);			\
    return ATOM(ok);							\
}

#else

#define DEF_void_XMMd_XMMs1(pfx,nm,st) NOT_SUPPORTED(nm)
#define DEF_void_XMMd_XMMs(pfx,nm,dt,st) NOT_SUPPORTED(nm)
#define DEF_void_XMMd(pfx,nm,dt)      NOT_SUPPORTED(nm)
#define DEF_bool_XMMd_XMMs(pfx,nm,dt,st) NOT_SUPPORTED(nm)
#define DEF_void_XMMd_imm8(pfx,nm,dt,vt) NOT_SUPPORTED(nm)
#define DEF_void_XMMd_XMMs_imm8(pfx,nm,dt,st,vt) NOT_SUPPORTED(nm)

#endif

#include "mmx.inc"
#include "sse.inc"
#include "sse2.inc"
#include "sse3.inc"
#include "ssse3.inc"
#include "sse4.1.inc"


static ERL_NIF_TERM mm_move(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    int src, dst;

    if (get_xmm(env, argv[0], &dst) && get_xmm(env, argv[1], &src)) {
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
    ErlNifBinary bin;
    ERL_NIF_TERM r;
    int src;

    if (get_xmm(env, argv[0], &src)) {
#if defined(__SSE__)
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

    if (get_xmm(env, argv[0], &dst) && (bin.size == VSIZE128)) {
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

    if (get_xmm(env, argv[0], &dst) && (bin.size-offset >= VSIZE128)) {
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

#undef DEF_void_XMMd_XMMs1
#undef DEF_void_XMMd_XMMs
#undef DEF_void_XMMd
#undef DEF_bool_XMMd_XMMs
#undef DEF_void_XMMd_imm8
#undef DEF_void_XMMd_XMMs_imm8
#undef DEF_void_MMd_MMs
#undef DEF_void_MMd
#undef DEF_bool_MMd_MMs
#undef DEF_void_MMd_imm8

#define DEF_void_XMMd_XMMs1(pfx,nm,st) { #nm, 2, nm },
#define DEF_void_XMMd_XMMs(pfx,nm,dt,st) { #nm, 2, nm },
#define DEF_void_XMMd(pfx,nm,dt)      { #nm, 1, nm },
#define DEF_bool_XMMd_XMMs(pfx,nm,dt,st) { #nm, 2, nm },
#define DEF_void_XMMd_imm8(pfx,nm,dt,vt) { #nm, 2, nm },
#define DEF_void_XMMd_XMMs_imm8(pfx,nm,dt,st,vt) { #nm, 3, nm },
#define DEF_void_MMd_MMs(pfx,nm,dt,st)   { #nm, 2, nm },
#define DEF_void_MMd(pfx,nm,dt)       { #nm, 1, nm },
#define DEF_bool_MMd_MMs(pfx,nm,dt,st)   { #nm, 2, nm },
#define DEF_void_MMd_imm8(pfx,nm,dt,vt)  { #nm, 2, nm },

static ErlNifFunc nif_funcs[] = {
#include "mmx.inc"
#include "sse.inc"
#include "sse2.inc"
#include "sse3.inc"
#include "ssse3.inc"
#include "sse4.1.inc"
    { "mm_move", 2, mm_move },   // dst src
    { "mm_set",  2, mm_set },    // dst Vector::binary()
    { "mm_get",  1, mm_get },    // get => Vector::binary()
    { "mm_load", 3, mm_load },   // dst:reg(),Offset::unsigned(),Data::binary()
    { "info",    1, intrin_info }, 
};

static int atload(ErlNifEnv* env, void** priv_data, ERL_NIF_TERM load_info)
{
    intrin_init();
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
    LOAD_ATOM(altivec);
    LOAD_ATOM(neon);

#ifdef __MMX__
    memset(&mm_data[0], 0, sizeof(mm_data));
    mm = (__m64*) vector64_align(&mm_data[0]);
#endif
#ifdef __SSE2__
    memset(&xmm_data[0], 0, sizeof(xmm_data));
    xmm = (__m128*) vector128_align(&xmm_data[0]);
#endif

    return 0;
}

ERL_NIF_INIT(intrin, nif_funcs, atload, NULL, NULL, NULL)
