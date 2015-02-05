



%%% @author Tony Rogvall <tony@rogvall.se>
%%% @copyright (C) 2015, Tony Rogvall
%%% @doc
%%% neon simd instruction interface
%%% @end
%%% Created : 4 Apr 2015 by Tony Rogvall <tony@rogvall.se>

-module(neon).

-on_load(init/0).



-export([vadd_s8/3]).
-export([vadd_s16/3]).
-export([vadd_s32/3]).
-export([vadd_s64/3]).
-export([vadd_f32/3]).
-export([vadd_u8/3]).
-export([vadd_u16/3]).
-export([vadd_u32/3]).
-export([vadd_u64/3]).


-export([vaddq_s8/3]).
-export([vaddq_s16/3]).
-export([vaddq_s32/3]).
-export([vaddq_s64/3]).
-export([vaddq_f32/3]).
-export([vaddq_u8/3]).
-export([vaddq_u16/3]).
-export([vaddq_u32/3]).
-export([vaddq_u64/3]).


-export([vaddl_s8/3]).
-export([vaddl_s16/3]).
-export([vaddl_s32/3]).
-export([vaddl_u8/3]).
-export([vaddl_u16/3]).
-export([vaddl_u32/3]).


-export([vaddw_s8/3]).
-export([vaddw_s16/3]).
-export([vaddw_s32/3]).
-export([vaddw_u8/3]).
-export([vaddw_u16/3]).
-export([vaddw_u32/3]).


-export([vhadd_s8/3]).
-export([vhadd_s16/3]).
-export([vhadd_s32/3]).
-export([vhadd_u8/3]).
-export([vhadd_u16/3]).
-export([vhadd_u32/3]).


-export([vhaddq_s8/3]).
-export([vhaddq_s16/3]).
-export([vhaddq_s32/3]).
-export([vhaddq_u8/3]).
-export([vhaddq_u16/3]).
-export([vhaddq_u32/3]).



-export([vrhadd_s8/3]).
-export([vrhadd_s16/3]).
-export([vrhadd_s32/3]).
-export([vrhadd_u8/3]).
-export([vrhadd_u16/3]).
-export([vrhadd_u32/3]).


-export([vrhaddq_s8/3]).
-export([vrhaddq_s16/3]).
-export([vrhaddq_s32/3]).
-export([vrhaddq_u8/3]).
-export([vrhaddq_u16/3]).
-export([vrhaddq_u32/3]).


-export([vqadd_s8/3]).
-export([vqadd_s16/3]).
-export([vqadd_s32/3]).
-export([vqadd_s64/3]).
-export([vqadd_u8/3]).
-export([vqadd_u16/3]).
-export([vqadd_u32/3]).
-export([vqadd_u64/3]).


-export([vqaddq_s8/3]).
-export([vqaddq_s16/3]).
-export([vqaddq_s32/3]).
-export([vqaddq_s64/3]).
-export([vqaddq_u8/3]).
-export([vqaddq_u16/3]).
-export([vqaddq_u32/3]).
-export([vqaddq_u64/3]).


-export([vaddhn_s16/3]).
-export([vaddhn_s32/3]).
-export([vaddhn_s64/3]).
-export([vaddhn_u16/3]).
-export([vaddhn_u32/3]).
-export([vaddhn_u64/3]).


-export([vraddhn_s16/3]).
-export([vraddhn_s32/3]).
-export([vraddhn_s64/3]).
-export([vraddhn_u16/3]).
-export([vraddhn_u32/3]).
-export([vraddhn_u64/3]).


-export([vmul_s8/3]).
-export([vmul_s16/3]).
-export([vmul_s32/3]).
-export([vmul_f32/3]).
-export([vmul_u8/3]).
-export([vmul_u16/3]).
-export([vmul_u32/3]).



-export([vmulq_s8/3]).
-export([vmulq_s16/3]).
-export([vmulq_s32/3]).
-export([vmulq_f32/3]).
-export([vmulq_u8/3]).
-export([vmulq_u16/3]).
-export([vmulq_u32/3]).



-export([vqdmulh_s16/3]).
-export([vqdmulh_s32/3]).


-export([vqdmulhq_s16/3]).
-export([vqdmulhq_s32/3]).


-export([vqrdmulh_s16/3]).
-export([vqrdmulh_s32/3]).


-export([vqrdmulhq_s16/3]).
-export([vqrdmulhq_s32/3]).



-export([vmull_s8/3]).
-export([vmull_s16/3]).
-export([vmull_s32/3]).
-export([vmull_u8/3]).
-export([vmull_u16/3]).
-export([vmull_u32/3]).



-export([vqdmull_s16/3]).
-export([vqdmull_s32/3]).


-export([vmla_s8/4]).
-export([vmla_s16/4]).
-export([vmla_s32/4]).
-export([vmla_f32/4]).
-export([vmla_u8/4]).
-export([vmla_u16/4]).
-export([vmla_u32/4]).


-export([vmlaq_s8/4]).
-export([vmlaq_s16/4]).
-export([vmlaq_s32/4]).
-export([vmlaq_f32/4]).
-export([vmlaq_u8/4]).
-export([vmlaq_u16/4]).
-export([vmlaq_u32/4]).


-export([vmlal_s8/4]).
-export([vmlal_s16/4]).
-export([vmlal_s32/4]).
-export([vmlal_u8/4]).
-export([vmlal_u16/4]).
-export([vmlal_u32/4]).


-export([vqdmlal_s16/4]).
-export([vqdmlal_s32/4]).


-export([vmls_s8/4]).
-export([vmls_s16/4]).
-export([vmls_s32/4]).
-export([vmls_f32/4]).
-export([vmls_u8/4]).
-export([vmls_u16/4]).
-export([vmls_u32/4]).


-export([vmlsq_s8/4]).
-export([vmlsq_s16/4]).
-export([vmlsq_s32/4]).
-export([vmlsq_f32/4]).
-export([vmlsq_u8/4]).
-export([vmlsq_u16/4]).
-export([vmlsq_u32/4]).


-export([vmlsl_s8/4]).
-export([vmlsl_s16/4]).
-export([vmlsl_s32/4]).
-export([vmlsl_u8/4]).
-export([vmlsl_u16/4]).
-export([vmlsl_u32/4]).


-export([vqdmlsl_s16/4]).
-export([vqdmlsl_s32/4]).

-export([vsub_s8/3]).
-export([vsub_s16/3]).
-export([vsub_s32/3]).
-export([vsub_s64/3]).
-export([vsub_f32/3]).
-export([vsub_u8/3]).
-export([vsub_u16/3]).
-export([vsub_u32/3]).
-export([vsub_u64/3]).


-export([vsubq_s8/3]).
-export([vsubq_s16/3]).
-export([vsubq_s32/3]).
-export([vsubq_s64/3]).
-export([vsubq_f32/3]).
-export([vsubq_u8/3]).
-export([vsubq_u16/3]).
-export([vsubq_u32/3]).
-export([vsubq_u64/3]).


-export([vsubl_s8/3]).
-export([vsubl_s16/3]).
-export([vsubl_s32/3]).
-export([vsubl_u8/3]).
-export([vsubl_u16/3]).
-export([vsubl_u32/3]).


-export([vsubw_s8/3]).
-export([vsubw_s16/3]).
-export([vsubw_s32/3]).
-export([vsubw_u8/3]).
-export([vsubw_u16/3]).
-export([vsubw_u32/3]).


-export([vhsub_s8/3]).
-export([vhsub_s16/3]).
-export([vhsub_s32/3]).
-export([vhsub_u8/3]).
-export([vhsub_u16/3]).
-export([vhsub_u32/3]).


-export([vhsubq_s8/3]).
-export([vhsubq_s16/3]).
-export([vhsubq_s32/3]).
-export([vhsubq_u8/3]).
-export([vhsubq_u16/3]).
-export([vhsubq_u32/3]).


-export([vqsub_s8/3]).
-export([vqsub_s16/3]).
-export([vqsub_s32/3]).
-export([vqsub_s64/3]).
-export([vqsub_u8/3]).
-export([vqsub_u16/3]).
-export([vqsub_u32/3]).
-export([vqsub_u64/3]).


-export([vqsubq_s8/3]).
-export([vqsubq_s16/3]).
-export([vqsubq_s32/3]).
-export([vqsubq_s64/3]).
-export([vqsubq_u8/3]).
-export([vqsubq_u16/3]).
-export([vqsubq_u32/3]).
-export([vqsubq_u64/3]).


-export([vsubhn_s16/3]).
-export([vsubhn_s32/3]).
-export([vsubhn_s64/3]).
-export([vsubhn_u16/3]).
-export([vsubhn_u32/3]).
-export([vsubhn_u64/3]).


-export([vrsubhn_s16/3]).
-export([vrsubhn_s32/3]).
-export([vrsubhn_s64/3]).
-export([vrsubhn_u16/3]).
-export([vrsubhn_u32/3]).
-export([vrsubhn_u64/3]).


-export([vceq_s8/3]).
-export([vceq_s16/3]).
-export([vceq_s32/3]).
-export([vceq_f32/3]).
-export([vceq_u8/3]).
-export([vceq_u16/3]).
-export([vceq_u32/3]).



-export([vcge_s8/3]).
-export([vcge_s16/3]).
-export([vcge_s32/3]).
-export([vcge_f32/3]).
-export([vcge_u8/3]).
-export([vcge_u16/3]).
-export([vcge_u32/3]).



-export([vcle_s8/3]).
-export([vcle_s16/3]).
-export([vcle_s32/3]).
-export([vcle_f32/3]).
-export([vcle_u8/3]).
-export([vcle_u16/3]).
-export([vcle_u32/3]).



-export([vcgt_s8/3]).
-export([vcgt_s16/3]).
-export([vcgt_s32/3]).
-export([vcgt_f32/3]).
-export([vcgt_u8/3]).
-export([vcgt_u16/3]).
-export([vcgt_u32/3]).



-export([vclt_s8/3]).
-export([vclt_s16/3]).
-export([vclt_s32/3]).
-export([vclt_f32/3]).
-export([vclt_u8/3]).
-export([vclt_u16/3]).
-export([vclt_u32/3]).



-export([vceqq_s8/3]).
-export([vceqq_s16/3]).
-export([vceqq_s32/3]).
-export([vceqq_f32/3]).
-export([vceqq_u8/3]).
-export([vceqq_u16/3]).
-export([vceqq_u32/3]).



-export([vcgeq_s8/3]).
-export([vcgeq_s16/3]).
-export([vcgeq_s32/3]).
-export([vcgeq_f32/3]).
-export([vcgeq_u8/3]).
-export([vcgeq_u16/3]).
-export([vcgeq_u32/3]).



-export([vcleq_s8/3]).
-export([vcleq_s16/3]).
-export([vcleq_s32/3]).
-export([vcleq_f32/3]).
-export([vcleq_u8/3]).
-export([vcleq_u16/3]).
-export([vcleq_u32/3]).



-export([vcgtq_s8/3]).
-export([vcgtq_s16/3]).
-export([vcgtq_s32/3]).
-export([vcgtq_f32/3]).
-export([vcgtq_u8/3]).
-export([vcgtq_u16/3]).
-export([vcgtq_u32/3]).



-export([vcltq_s8/3]).
-export([vcltq_s16/3]).
-export([vcltq_s32/3]).
-export([vcltq_f32/3]).
-export([vcltq_u8/3]).
-export([vcltq_u16/3]).
-export([vcltq_u32/3]).


-export([vmov/2]).
-export([vset/2]).
-export([vget/1]).
-export([vld/3]).

-export([info/1]).

init() ->
    Nif = filename:join([code:priv_dir(intrin),"neon_nif"]),
    erlang:load_nif(Nif, 0).



vadd_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vadd_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vadd_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vadd_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vadd_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vadd_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vadd_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vadd_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vadd_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vaddq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddq_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddq_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vaddl_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddl_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddl_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddl_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddl_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddl_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vaddw_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddw_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddw_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddw_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddw_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddw_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vhadd_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhadd_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhadd_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhadd_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhadd_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhadd_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vhaddq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhaddq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhaddq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhaddq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhaddq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhaddq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vrhadd_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhadd_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhadd_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhadd_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhadd_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhadd_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vrhaddq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhaddq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhaddq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhaddq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhaddq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrhaddq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vqadd_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqadd_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqadd_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqadd_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqadd_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqadd_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqadd_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqadd_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vqaddq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqaddq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqaddq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqaddq_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqaddq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqaddq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqaddq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqaddq_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vaddhn_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddhn_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddhn_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddhn_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddhn_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vaddhn_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vraddhn_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vraddhn_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vraddhn_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vraddhn_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vraddhn_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vraddhn_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vmul_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmul_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmul_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmul_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmul_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmul_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmul_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vmulq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vqdmulh_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqdmulh_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vqdmulhq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqdmulhq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vqrdmulh_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrdmulh_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vqrdmulhq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrdmulhq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vmull_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmull_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmull_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmull_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmull_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmull_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vqdmull_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqdmull_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vmla_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmla_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmla_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmla_f32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmla_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmla_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmla_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).


vmlaq_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlaq_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlaq_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlaq_f32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlaq_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlaq_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlaq_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).


vmlal_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlal_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlal_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlal_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlal_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlal_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).


vqdmlal_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vqdmlal_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).


vmls_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmls_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmls_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmls_f32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmls_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmls_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmls_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).


vmlsq_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsq_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsq_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsq_f32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsq_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsq_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsq_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).


vmlsl_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsl_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsl_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsl_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsl_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vmlsl_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).


vqdmlsl_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vqdmlsl_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).

vsub_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsub_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsub_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsub_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsub_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsub_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsub_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsub_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsub_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vsubq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubq_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubq_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vsubl_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubl_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubl_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubl_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubl_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubl_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vsubw_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubw_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubw_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubw_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubw_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubw_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vhsub_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsub_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsub_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsub_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsub_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsub_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vhsubq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsubq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsubq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsubq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsubq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vhsubq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vqsub_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsub_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsub_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsub_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsub_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsub_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsub_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsub_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vqsubq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsubq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsubq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsubq_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsubq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsubq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsubq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqsubq_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vsubhn_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubhn_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubhn_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubhn_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubhn_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vsubhn_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vrsubhn_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrsubhn_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrsubhn_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrsubhn_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrsubhn_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrsubhn_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).


vceq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vcge_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcge_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcge_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcge_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcge_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcge_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcge_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vcle_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcle_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcle_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcle_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcle_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcle_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcle_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vcgt_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgt_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgt_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgt_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgt_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgt_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgt_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vclt_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vclt_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vclt_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vclt_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vclt_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vclt_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vclt_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vceqq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceqq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceqq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceqq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceqq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceqq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vceqq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vcgeq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgeq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgeq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgeq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgeq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgeq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgeq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vcleq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcleq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcleq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcleq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcleq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcleq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcleq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vcgtq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgtq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgtq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgtq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgtq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgtq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcgtq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).



vcltq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcltq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcltq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcltq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcltq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcltq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vcltq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).


vmov(_Dst,_Src) -> erlang:error(nif_not_loaded).
vset(_Dst,_Data) -> erlang:error(nif_not_loaded).
vld(_Dst,_Offset,_Data) -> erlang:error(nif_not_loaded).
vget(_Src) -> erlang:error(nif_not_loaded).

info(_Info) -> erlang:error(nif_not_loaded).
