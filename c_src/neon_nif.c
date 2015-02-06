//
// Nif interface to SIMD functions (experimental)
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "erl_nif.h"

#include "neon_util.h"
#include "neon_cpuid.h"

#if defined(__arm__)
// Always compile, but we must check this feature in runtime!
#define __ARM_FEATURE_FMA
#include <arm_neon.h>
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

#define NUM_D_REGS 32   // 32 64bit registers
#define NUM_Q_REGS 16   // 16 128bit registers (dual view)

#if defined(__arm__)

// d0,d1 = q0, d2,d3=q1 ... d30,d31=q15
uint8_t reg_data[NUM_Q_REGS*16 + 15];
int8x8_t*  dreg;   // D registers
int8x16_t* qreg;   // Q regitsers (dual view)

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

DECL_ATOM(q0);
DECL_ATOM(q1);
DECL_ATOM(q2);
DECL_ATOM(q3);
DECL_ATOM(q4);
DECL_ATOM(q5);
DECL_ATOM(q6);
DECL_ATOM(q7);
DECL_ATOM(q8);
DECL_ATOM(q9);
DECL_ATOM(q10);
DECL_ATOM(q11);
DECL_ATOM(q12);
DECL_ATOM(q13);
DECL_ATOM(q14);
DECL_ATOM(q15);

DECL_ATOM(d0);
DECL_ATOM(d1);
DECL_ATOM(d2);
DECL_ATOM(d3);
DECL_ATOM(d4);
DECL_ATOM(d5);
DECL_ATOM(d6);
DECL_ATOM(d7);
DECL_ATOM(d8);
DECL_ATOM(d9);
DECL_ATOM(d10);
DECL_ATOM(d11);
DECL_ATOM(d12);
DECL_ATOM(d13);
DECL_ATOM(d14);
DECL_ATOM(d15);
DECL_ATOM(d16);
DECL_ATOM(d17);
DECL_ATOM(d18);
DECL_ATOM(d19);
DECL_ATOM(d20);
DECL_ATOM(d21);
DECL_ATOM(d22);
DECL_ATOM(d23);
DECL_ATOM(d24);
DECL_ATOM(d25);
DECL_ATOM(d26);
DECL_ATOM(d27);
DECL_ATOM(d28);
DECL_ATOM(d29);
DECL_ATOM(d30);
DECL_ATOM(d31);

DECL_ATOM(cpu_features);
DECL_ATOM(cpu_vendor_name);
DECL_ATOM(cpu_serial_number);
DECL_ATOM(cpu_cache_line_size);
DECL_ATOM(cpu_simd_support);

DECL_ATOM(neon);

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

int get_qreg(ErlNifEnv* env, const ERL_NIF_TERM term, int* value)
{
    int r;

    if (!enif_get_int(env, term, &r)) {
	if (term == ATOM(q0)) r = 0;
	else if (term == ATOM(q1)) r = 1;
	else if (term == ATOM(q2)) r = 2;
	else if (term == ATOM(q3)) r = 3;
	else if (term == ATOM(q4)) r = 4;
	else if (term == ATOM(q5)) r = 5;
	else if (term == ATOM(q6)) r = 6;
	else if (term == ATOM(q7)) r = 7;
	else if (term == ATOM(q8)) r = 8;
	else if (term == ATOM(q9)) r = 9;
	else if (term == ATOM(q10)) r = 10;
	else if (term == ATOM(q11)) r = 11;
	else if (term == ATOM(q12)) r = 12;
	else if (term == ATOM(q13)) r = 13;
	else if (term == ATOM(q14)) r = 14;
	else if (term == ATOM(q15)) r = 15;
	else return 0;
    }
    if ((r < 0) || (r >= NUM_Q_REGS))
	return 0;
    *value = r;
    return 1;
}

int get_dreg(ErlNifEnv* env, const ERL_NIF_TERM term, int* value)
{
    int r;

    if (!enif_get_int(env, term, &r)) {
	if (term == ATOM(d0)) r = 0;
	else if (term == ATOM(d1)) r = 1;
	else if (term == ATOM(d2)) r = 2;
	else if (term == ATOM(d3)) r = 3;
	else if (term == ATOM(d4)) r = 4;
	else if (term == ATOM(d5)) r = 5;
	else if (term == ATOM(d6)) r = 6;
	else if (term == ATOM(d7)) r = 7;
	else if (term == ATOM(d8)) r = 8;
	else if (term == ATOM(d9)) r = 9;
	else if (term == ATOM(d10)) r = 10;
	else if (term == ATOM(d11)) r = 11;
	else if (term == ATOM(d12)) r = 12;
	else if (term == ATOM(d13)) r = 13;
	else if (term == ATOM(d14)) r = 14;
	else if (term == ATOM(d15)) r = 15;
	else if (term == ATOM(d16)) r = 16;
	else if (term == ATOM(d17)) r = 17;
	else if (term == ATOM(d18)) r = 18;
	else if (term == ATOM(d19)) r = 19;
	else if (term == ATOM(d20)) r = 20;
	else if (term == ATOM(d21)) r = 21;
	else if (term == ATOM(d22)) r = 22;
	else if (term == ATOM(d23)) r = 23;
	else if (term == ATOM(d24)) r = 24;
	else if (term == ATOM(d25)) r = 25;
	else if (term == ATOM(d26)) r = 26;
	else if (term == ATOM(d27)) r = 27;
	else if (term == ATOM(d28)) r = 28;
	else if (term == ATOM(d29)) r = 29;
	else if (term == ATOM(d30)) r = 30;
	else if (term == ATOM(d31)) r = 31;
	else return 0;
    }
    if ((r < 0) || (r >= NUM_D_REGS))
	return 0;
    *value = r;
    return 1;
}


/******************************************************************************
 *
 *  cpu_info
 *  support()  = neon
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
	int n = neon_cpu_vendor_name(buf, sizeof(buf));
	return enif_make_string_len(env, buf, n, ERL_NIF_LATIN1);
    }
    else if (argv[0] == ATOM(cpu_features)) {
	char buf[1024];
	int n = neon_cpu_features(buf, sizeof(buf));
	return enif_make_string_len(env, buf, n, ERL_NIF_LATIN1);
    }
    else if (argv[0] == ATOM(cpu_cache_line_size)) {
	return enif_make_int(env, neon_cpu_cache_line_size());
    }
    else if (argv[0] == ATOM(cpu_simd_support)) {
	ERL_NIF_TERM list;

	list = enif_make_list(env, 0);
#if defined(__arm__)
	if (neon_cpuid_check(CPUID_NEON))
	    list = enif_make_list_cell(env, ATOM(neon), list);
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

#if defined(__arm__)

#define iop1(op,dt,d,s,x) case (x): (d)=(dt)op((s),(x)); break
#define iop2(op,dt,d,s,x) iop1(op,dt,d,s,x); iop1(op,dt,d,s,(x)+1)
#define iop4(op,dt,d,s,x) iop2(op,dt,d,s,x); iop2(op,dt,d,s,(x)+2)
#define iop8(op,dt,d,s,x) iop4(op,dt,d,s,x); iop4(op,dt,d,s,(x)+4)
#define iop16(op,dt,d,s,x) iop8(op,dt,d,s,x); iop8(op,dt,d,s,(x)+8)
#define iop32(op,dt,d,s,x) iop16(op,dt,d,s,x); iop16(op,dt,d,s,(x)+16)
#define iop64(op,dt,d,s,x) iop32(op,dt,d,s,x); iop32(op,dt,d,s,(x)+32)

#define op_x8(op,dt,d,s)  iop8(op,dt,d,s,0)
#define op_x16(op,dt,d,s) iop16(op,dt,d,s,0)
#define op_x32(op,dt,d,s) iop32(op,dt,d,s,0)
#define op_x64(op,dt,d,s) iop64(op,dt,d,s,0)

#define op_y8(op,dt,d,s)  iop8(op,dt,d,s,1)
#define op_y16(op,dt,d,s) iop16(op,dt,d,s,1)
#define op_y32(op,dt,d,s) iop32(op,dt,d,s,1)
#define op_y64(op,dt,d,s) iop64(op,dt,d,s,1)

#define iop1_2(op,dt,d,s1,s2,x) case (x): (d)=(dt)op((s1),(s2),(x)); break
#define iop2_2(op,dt,d,s1,s2,x) \
  iop1_2(op,dt,d,s1,s2,x); iop1_2(op,dt,d,s1,s2,(x)+1)
#define iop4_2(op,dt,d,s1,s2,x) \
  iop2_2(op,dt,d,s1,s2,x); iop2_2(op,dt,d,s1,s2,(x)+2)
#define iop8_2(op,dt,d,s1,s2,x) \
  iop4_2(op,dt,d,s1,s2,x); iop4_2(op,dt,d,s1,s2,(x)+4)
#define iop16_2(op,dt,d,s1,s2,x) \
  iop8_2(op,dt,d,s1,s2,x); iop8_2(op,dt,d,s1,s2,(x)+8)
#define iop32_2(op,dt,d,s1,s2,x) \
  iop16_2(op,dt,d,s1,s2,x); iop16_2(op,dt,d,s1,s2,(x)+16)
#define iop64_2(op,dt,d,s1,s2,x) \
  iop32_2(op,dt,d,s1,s2,x); iop32_2(op,dt,d,s1,s2,(x)+32)

#define op_x8_2(op,dt,d,s1,s2)  iop8_2(op,dt,d,s1,s2,0)
#define op_x16_2(op,dt,d,s1,s2) iop16_2(op,dt,d,s1,s2,0)
#define op_x32_2(op,dt,d,s1,s2) iop32_2(op,dt,d,s1,s2,0)
#define op_x64_2(op,dt,d,s1,s2) iop64_2(op,dt,d,s1,s2,0)

#define op_y8_2(op,dt,d,s1,s2)  iop8_2(op,dt,d,s1,s2,1)
#define op_y16_2(op,dt,d,s1,s2) iop16_2(op,dt,d,s1,s2,1)
#define op_y32_2(op,dt,d,s1,s2) iop32_2(op,dt,d,s1,s2,1)
#define op_y64_2(op,dt,d,s1,s2) iop64_2(op,dt,d,s1,s2,1)

#define op_DD(nm,dd,dn)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n;							\
    if (!get_dreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    dreg[d] = (int8x8_t) nm((dn)dreg[n]);				\
    return ATOM(ok);							\
}

#define op_QQ(nm,qd,qn)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    qreg[d] = (int8x16_t) nm((qn)qreg[n]);		\
    return ATOM(ok);							\
}

#define op_QD(nm,qd,dn)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    qreg[d] = (int8x16_t) nm((dn)dreg[n]);		\
    return ATOM(ok);							\
}

#define op_DDD(nm,dd,dn,dm)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m;							\
    if (!get_dreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    dreg[d] = (int8x8_t) nm((dn)dreg[n], (dm)dreg[m]);		\
    return ATOM(ok);							\
}

#define op_DDz(nm,dd,dn,z)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, i;							\
    if (!get_dreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!enif_get_int(env, argv[2], &i))return enif_make_badarg(env);	\
    switch(i) {								\
      op##_##z(nm,int8x8_t,dreg[d],(dn)dreg[n]);			\
    default: return enif_make_badarg(env);				\
    }									\
    return ATOM(ok);							\
}

#define op_DQz(nm,dd,qn,z)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, i;							\
    if (!get_dreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!enif_get_int(env, argv[2], &i))return enif_make_badarg(env);	\
    switch(i) {								\
      op##_##z(nm,int8x8_t,dreg[d],(qn)qreg[n]);			\
    default: return enif_make_badarg(env);				\
    }									\
    return ATOM(ok);							\
}

#define op_QQQ(nm,qd,qn,qm)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    qreg[d] = (int8x16_t) nm((qn)qreg[n], (qm)qreg[m]);		\
    return ATOM(ok);							\
}

#define op_QDz(nm,qd,dn,z)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, i;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!enif_get_int(env, argv[2], &i)) return enif_make_badarg(env);	\
    switch(i) {								\
      op##_##z(nm,int8x16_t,qreg[d],(dn)dreg[n]);			\
    default: return enif_make_badarg(env);				\
    }									\
    return ATOM(ok);							\
}


#define op_QQz(nm,qd,qn,z)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, i;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!enif_get_int(env, argv[2], &i)) return enif_make_badarg(env);	\
    switch(i) {								\
      op##_##z(nm,int8x16_t,qreg[d],(qn)qreg[n]);			\
    default: return enif_make_badarg(env);				\
    }									\
    return ATOM(ok);							\
}

#define op_QDD(nm,qd,dn,dm)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    qreg[d] = (int8x16_t) nm((dn)dreg[n], (dm)dreg[m]);		\
    return ATOM(ok);							\
}

#define op_QQD(nm,qd,qn,dm)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    qreg[d] = (int8x16_t) nm((qn)qreg[n], (dm)dreg[m]);		\
    return ATOM(ok);							\
}

#define op_DQQ(nm,qd,qn,qm)				\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m;							\
    if (!get_dreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    dreg[d] = (int8x8_t) nm((qn)qreg[n], (qm)qreg[m]);		\
    return ATOM(ok);							\
}

#define op_DDDD(nm,dd,dn,dm,dk)			\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m, k;							\
    if (!get_dreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[3], &k)) return enif_make_badarg(env);	\
    dreg[d] = (int8x8_t) nm((dn)dreg[n], (dm)dreg[m], (dk)dreg[k]);	\
    return ATOM(ok);							\
}

#define op_DDDz(nm,dd,dn,dm,z)			\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m, i;							\
    if (!get_dreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    if (!enif_get_int(env, argv[3], &i))return enif_make_badarg(env);	\
    switch(i) {								\
      op##_##z##_2(nm,int8x8_t,dreg[d],(dn)dreg[n],(dm)dreg[m]);	\
    default: return enif_make_badarg(env);				\
    }									\
    return ATOM(ok);							\
}

#define op_QQQQ(nm,qd,qn,qm,qk)			\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m, k;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[3], &k)) return enif_make_badarg(env);	\
    qreg[d] = (int8x16_t) nm((qn)qreg[n], (qm)qreg[m],(qk)qreg[k]);	\
    return ATOM(ok);							\
}

#define op_QQQz(nm,qd,qn,qm,z)			\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m, i;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    if (!enif_get_int(env, argv[3], &i))return enif_make_badarg(env);	\
    switch(i) {								\
      op##_##z##_2(nm,int8x16_t,qreg[d],(qn)qreg[n],(qm)qreg[m]);	\
    default: return enif_make_badarg(env);				\
    }									\
    return ATOM(ok);							\
}

#define op_QQDD(nm,qd,qn,dm,dk)			\
static ERL_NIF_TERM nif_neon_##nm(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) \
{									\
    int d, n, m, k;							\
    if (!get_qreg(env, argv[0], &d)) return enif_make_badarg(env);	\
    if (!get_qreg(env, argv[1], &n)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[2], &m)) return enif_make_badarg(env);	\
    if (!get_dreg(env, argv[3], &k)) return enif_make_badarg(env);	\
    qreg[d] = (int8x16_t) nm((qn)qreg[n], (dm)dreg[m],(dk)dreg[k]);	\
    return ATOM(ok);							\
}

#else

#define op_DD(nm,dd,dn) NOT_SUPPORTED(nif_neon_##nm)
#define op_QQ(nm,qd,qn) NOT_SUPPORTED(nif_neon_##nm)
#define op_QD(nm,qd,dn) NOT_SUPPORTED(nif_neon_##nm)
#define op_DDD(nm,dd,dn,dm) NOT_SUPPORTED(nif_neon_##nm)
#define op_DDz(nm,dd,dn,z) NOT_SUPPORTED(nif_neon_##nm)
#define op_DQz(nm,dd,dn,z) NOT_SUPPORTED(nif_neon_##nm)
#define op_QQQ(nm,qd,qn,qm) NOT_SUPPORTED(nif_neon_##nm)
#define op_QQz(nm,qd,qn,z) NOT_SUPPORTED(nif_neon_##nm)
#define op_QDz(nm,qd,dn,z) NOT_SUPPORTED(nif_neon_##nm)
#define op_QQz(nm,qd,qn,z) NOT_SUPPORTED(nif_neon_##nm)
#define op_QDD(nm,qd,dn,dm) NOT_SUPPORTED(nif_neon_##nm)
#define op_QQD(nm,qd,dn,dm) NOT_SUPPORTED(nif_neon_##nm)
#define op_DQQ(nm,qd,qn,qm) NOT_SUPPORTED(nif_neon_##nm)
#define op_DDDD(nm,dd,dn,dm,dk) NOT_SUPPORTED(nif_neon_##nm)
#define op_DDDz(nm,dd,dn,dm,z) NOT_SUPPORTED(nif_neon_##nm)
#define op_QQQQ(nm,qd,qn,qm,qk) NOT_SUPPORTED(nif_neon_##nm)
#define op_QQQz(nm,qd,qn,qm,z) NOT_SUPPORTED(nif_neon_##nm)
#define op_QQDD(nm,qd,qn,dm,dk) NOT_SUPPORTED(nif_neon_##nm)

#endif

#include "neon.inc"

static ERL_NIF_TERM vmov(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    int src, dst;

    if (get_qreg(env, argv[0], &dst) && get_qreg(env, argv[1], &src)) {
#if defined(__arm__)
	qreg[dst] = qreg[src];
	return ATOM(ok);
#endif
    }
    else if (get_dreg(env, argv[0], &dst) && get_dreg(env, argv[1], &src)) {
#if defined(__arm__)
	dreg[dst] = dreg[src];
	return ATOM(ok);
#endif
    }
    else
	return enif_make_badarg(env);
    return ATOM(error);
}

static ERL_NIF_TERM vget(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    int src;

    if (get_qreg(env, argv[0], &src)) {
#if defined(__arm__)
	ErlNifBinary bin;
	ERL_NIF_TERM r;

	if (!enif_alloc_binary(VSIZE128, &bin))
	    return ATOM(error);
	memcpy(bin.data,&qreg[src],VSIZE128);
	r = enif_make_binary(env, &bin);
	enif_release_binary(&bin);
	return r;
#endif
    }
    else if (get_dreg(env, argv[0], &src)) {
#if defined(__arm__)
	ErlNifBinary bin;
	ERL_NIF_TERM r;

	if (!enif_alloc_binary(VSIZE64, &bin))
	    return ATOM(error);
	memcpy(bin.data,&dreg[src],VSIZE64);
	r = enif_make_binary(env, &bin);
	enif_release_binary(&bin);
	return r;
#endif
    }
    else
	return enif_make_badarg(env);	
    return ATOM(error);
}

static ERL_NIF_TERM vset(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    int dst;

    if (!enif_inspect_iolist_as_binary(env, argv[1], &bin))
	return enif_make_badarg(env);

    if (get_qreg(env, argv[0], &dst) && (bin.size == VSIZE128)) {
#if defined(__arm__)
	memcpy(&qreg[dst], bin.data, VSIZE128);
	return ATOM(ok);
#endif
    }
    else if (get_dreg(env, argv[0], &dst) && (bin.size == VSIZE64)) {
#if defined(__arm__)
	memcpy(&dreg[dst], bin.data, VSIZE64);
	return ATOM(ok);
#endif
    }
    else
	return enif_make_badarg(env);
    return ATOM(error);
}

static ERL_NIF_TERM vld(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    unsigned int offset;
    int dst;

    if (!enif_inspect_binary(env, argv[2], &bin))
	return enif_make_badarg(env);

    if (!enif_get_uint(env, argv[1], &offset))
	return enif_make_badarg(env);

    if (get_qreg(env, argv[0], &dst) && (bin.size-offset >= VSIZE128)) {
#if defined(__arm__)
	memcpy(&qreg[dst], bin.data+offset, VSIZE128);
	return ATOM(ok);
#endif
    }
    else if (get_dreg(env, argv[0], &dst) && (bin.size-offset >= VSIZE64)) {
#if defined(__arm__)
	memcpy(&qreg[dst], bin.data+offset, VSIZE64);
	return ATOM(ok);
#endif
    }
    else
	return enif_make_badarg(env);
    return ATOM(error);
}

#undef op_DD
#undef op_QQ
#undef op_QD
#undef op_DDD
#undef op_DDz
#undef op_DQz
#undef op_QQQ
#undef op_QQz
#undef op_QDz
#undef op_QQz
#undef op_QDD
#undef op_QQD
#undef op_DQQ
#undef op_DDDD
#undef op_DDDz
#undef op_QQQQ
#undef op_QQQz
#undef op_QQDD

#define op_DD(nm,dd,dn)  { #nm, 2, nif_neon_##nm },
#define op_QQ(nm,qd,qn)  { #nm, 2, nif_neon_##nm },
#define op_QD(nm,qd,dn)  { #nm, 2, nif_neon_##nm },
#define op_DDD(nm,dd,dn,dm)  { #nm, 3, nif_neon_##nm },
#define op_DDz(nm,dd,dn,z)  { #nm, 3, nif_neon_##nm },
#define op_DQz(nm,dd,dn,z)  { #nm, 3, nif_neon_##nm },
#define op_QQQ(nm,qd,qn,qm)  { #nm, 3, nif_neon_##nm },
#define op_QQz(nm,qd,qn,z)  { #nm, 3, nif_neon_##nm },
#define op_QDz(nm,qd,qn,z)  { #nm, 3, nif_neon_##nm },
#define op_QQz(nm,qd,qn,z)  { #nm, 3, nif_neon_##nm },
#define op_QDD(nm,qd,dn,dm)  { #nm, 3, nif_neon_##nm },
#define op_QQD(nm,qd,dn,dm)  { #nm, 3, nif_neon_##nm },
#define op_DQQ(nm,qd,qn,qm)  { #nm, 3, nif_neon_##nm },
#define op_DDDD(nm,dd,dn,dm,dk)  { #nm, 4, nif_neon_##nm },
#define op_DDDz(nm,dd,dn,dm,z)  { #nm, 4, nif_neon_##nm },
#define op_QQQQ(nm,qd,qn,qm,qk)  { #nm, 4, nif_neon_##nm },
#define op_QQQz(nm,qd,qn,qm,z)  { #nm, 4, nif_neon_##nm },
#define op_QQDD(nm,qd,qn,dm,dk)  { #nm, 4, nif_neon_##nm },

static ErlNifFunc nif_funcs[] = {
#include "neon.inc"
    { "vmov",    2, vmov },      // dst src
    { "vset",    2, vset },      // dst Vector::binary()
    { "vget",    1, vget },      // get => Vector::binary()
    { "vld",     3, vld },       // dst:reg(),Offset::unsigned(),Data::binary()
    { "info",    1, cpu_info }, 
};

static int atload(ErlNifEnv* env, void** priv_data, ERL_NIF_TERM load_info)
{
    neon_init();
    // Load atoms
    LOAD_ATOM(ok);
    LOAD_ATOM(true);
    LOAD_ATOM(false);
    LOAD_ATOM(undefined);
    LOAD_ATOM(error);

    LOAD_ATOM(q0);
    LOAD_ATOM(q1);
    LOAD_ATOM(q2);
    LOAD_ATOM(q3);
    LOAD_ATOM(q4);
    LOAD_ATOM(q5);
    LOAD_ATOM(q6);
    LOAD_ATOM(q7);
    LOAD_ATOM(q8);
    LOAD_ATOM(q9);
    LOAD_ATOM(q10);
    LOAD_ATOM(q11);
    LOAD_ATOM(q12);
    LOAD_ATOM(q13);
    LOAD_ATOM(q14);
    LOAD_ATOM(q15);

    LOAD_ATOM(d0);
    LOAD_ATOM(d1);
    LOAD_ATOM(d2);
    LOAD_ATOM(d3);
    LOAD_ATOM(d4);
    LOAD_ATOM(d5);
    LOAD_ATOM(d6);
    LOAD_ATOM(d7);
    LOAD_ATOM(d8);
    LOAD_ATOM(d9);
    LOAD_ATOM(d10);
    LOAD_ATOM(d11);
    LOAD_ATOM(d12);
    LOAD_ATOM(d13);
    LOAD_ATOM(d14);
    LOAD_ATOM(d15);
    LOAD_ATOM(d16);
    LOAD_ATOM(d17);
    LOAD_ATOM(d18);
    LOAD_ATOM(d19);
    LOAD_ATOM(d20);
    LOAD_ATOM(d21);
    LOAD_ATOM(d22);
    LOAD_ATOM(d23);
    LOAD_ATOM(d24);
    LOAD_ATOM(d25);
    LOAD_ATOM(d26);
    LOAD_ATOM(d27);
    LOAD_ATOM(d28);
    LOAD_ATOM(d29);
    LOAD_ATOM(d30);
    LOAD_ATOM(d31);

    LOAD_ATOM(cpu_features);
    LOAD_ATOM(cpu_vendor_name);
    LOAD_ATOM(cpu_serial_number);
    LOAD_ATOM(cpu_cache_line_size);
    LOAD_ATOM(cpu_simd_support);

    LOAD_ATOM(neon);

#if defined(__arm__)
    memset(&reg_data[0], 0, sizeof(reg_data));
    qreg = (int8x16_t*) vector128_align(&reg_data[0]);
    dreg = (int8x8_t*) qreg;
#endif

    return 0;
}

ERL_NIF_INIT(neon, nif_funcs, atload, NULL, NULL, NULL)
