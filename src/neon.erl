




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
-export([vmul_p8/3]).

-export([vmulq_s8/3]).
-export([vmulq_s16/3]).
-export([vmulq_s32/3]).
-export([vmulq_f32/3]).
-export([vmulq_u8/3]).
-export([vmulq_u16/3]).
-export([vmulq_u32/3]).
-export([vmulq_p8/3]).

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
-export([vmull_p8/3]).

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
-export([vceq_p8/3]).

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
-export([vceqq_p8/3]).

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

-export([vcage_f32/3]).

-export([vcageq_f32/3]).

-export([vcale_f32/3]).

-export([vcaleq_f32/3]).

-export([vcagt_f32/3]).

-export([vcagtq_f32/3]).

-export([vcalt_f32/3]).

-export([vcaltq_f32/3]).

-export([vtst_s8/3]).
-export([vtst_s16/3]).
-export([vtst_s32/3]).
-export([vtst_u8/3]).
-export([vtst_u16/3]).
-export([vtst_u32/3]).
-export([vtst_p8/3]).

-export([vtstq_s8/3]).
-export([vtstq_s16/3]).
-export([vtstq_s32/3]).
-export([vtstq_u8/3]).
-export([vtstq_u16/3]).
-export([vtstq_u32/3]).
-export([vtstq_p8/3]).

-export([vabd_s8/3]).
-export([vabd_s16/3]).
-export([vabd_s32/3]).
-export([vabd_f32/3]).
-export([vabd_u8/3]).
-export([vabd_u16/3]).
-export([vabd_u32/3]).

-export([vabdq_s8/3]).
-export([vabdq_s16/3]).
-export([vabdq_s32/3]).
-export([vabdq_f32/3]).
-export([vabdq_u8/3]).
-export([vabdq_u16/3]).
-export([vabdq_u32/3]).

-export([vabdl_s8/3]).
-export([vabdl_s16/3]).
-export([vabdl_s32/3]).
-export([vabdl_u8/3]).
-export([vabdl_u16/3]).
-export([vabdl_u32/3]).

-export([vaba_s8/4]).
-export([vaba_s16/4]).
-export([vaba_s32/4]).
-export([vaba_u8/4]).
-export([vaba_u16/4]).
-export([vaba_u32/4]).

-export([vabaq_s8/4]).
-export([vabaq_s16/4]).
-export([vabaq_s32/4]).
-export([vabaq_u8/4]).
-export([vabaq_u16/4]).
-export([vabaq_u32/4]).

-export([vabal_s8/4]).
-export([vabal_s16/4]).
-export([vabal_s32/4]).
-export([vabal_u8/4]).
-export([vabal_u16/4]).
-export([vabal_u32/4]).

-export([vmax_s8/3]).
-export([vmax_s16/3]).
-export([vmax_s32/3]).
-export([vmax_f32/3]).
-export([vmax_u8/3]).
-export([vmax_u16/3]).
-export([vmax_u32/3]).

-export([vmaxq_s8/3]).
-export([vmaxq_s16/3]).
-export([vmaxq_s32/3]).
-export([vmaxq_f32/3]).
-export([vmaxq_u8/3]).
-export([vmaxq_u16/3]).
-export([vmaxq_u32/3]).

-export([vmin_s8/3]).
-export([vmin_s16/3]).
-export([vmin_s32/3]).
-export([vmin_f32/3]).
-export([vmin_u8/3]).
-export([vmin_u16/3]).
-export([vmin_u32/3]).

-export([vminq_s8/3]).
-export([vminq_s16/3]).
-export([vminq_s32/3]).
-export([vminq_f32/3]).
-export([vminq_u8/3]).
-export([vminq_u16/3]).
-export([vminq_u32/3]).

-export([vpadd_s8/3]).
-export([vpadd_s16/3]).
-export([vpadd_s32/3]).
-export([vpadd_f32/3]).
-export([vpadd_u8/3]).
-export([vpadd_u16/3]).
-export([vpadd_u32/3]).

-export([vpaddl_s8/2]).
-export([vpaddl_s16/2]).
-export([vpaddl_s32/2]).
-export([vpaddl_u8/2]).
-export([vpaddl_u16/2]).
-export([vpaddl_u32/2]).

-export([vpaddlq_s8/2]).
-export([vpaddlq_s16/2]).
-export([vpaddlq_s32/2]).
-export([vpaddlq_u8/2]).
-export([vpaddlq_u16/2]).
-export([vpaddlq_u32/2]).

-export([vpadal_s8/3]).
-export([vpadal_s16/3]).
-export([vpadal_s32/3]).
-export([vpadal_u8/3]).
-export([vpadal_u16/3]).
-export([vpadal_u32/3]).

-export([vpadalq_s8/3]).
-export([vpadalq_s16/3]).
-export([vpadalq_s32/3]).
-export([vpadalq_u8/3]).
-export([vpadalq_u16/3]).
-export([vpadalq_u32/3]).

-export([vpmax_s8/3]).
-export([vpmax_s16/3]).
-export([vpmax_s32/3]).
-export([vpmax_f32/3]).
-export([vpmax_u8/3]).
-export([vpmax_u16/3]).
-export([vpmax_u32/3]).

-export([vpmin_s8/3]).
-export([vpmin_s16/3]).
-export([vpmin_s32/3]).
-export([vpmin_f32/3]).
-export([vpmin_u8/3]).
-export([vpmin_u16/3]).
-export([vpmin_u32/3]).

-export([vrecps_f32/3]).

-export([vrecpsq_f32/3]).

-export([vrsqrts_f32/3]).

-export([vrsqrtsq_f32/3]).

-export([vshl_s8/3]).
-export([vshl_s16/3]).
-export([vshl_s32/3]).
-export([vshl_s64/3]).
-export([vshl_u8/3]).
-export([vshl_u16/3]).
-export([vshl_u32/3]).
-export([vshl_u64/3]).

-export([vshlq_s8/3]).
-export([vshlq_s16/3]).
-export([vshlq_s32/3]).
-export([vshlq_s64/3]).
-export([vshlq_u8/3]).
-export([vshlq_u16/3]).
-export([vshlq_u32/3]).
-export([vshlq_u64/3]).

-export([vrshl_s8/3]).
-export([vrshl_s16/3]).
-export([vrshl_s32/3]).
-export([vrshl_s64/3]).
-export([vrshl_u8/3]).
-export([vrshl_u16/3]).
-export([vrshl_u32/3]).
-export([vrshl_u64/3]).

-export([vrshlq_s8/3]).
-export([vrshlq_s16/3]).
-export([vrshlq_s32/3]).
-export([vrshlq_s64/3]).
-export([vrshlq_u8/3]).
-export([vrshlq_u16/3]).
-export([vrshlq_u32/3]).
-export([vrshlq_u64/3]).

-export([vqshl_s8/3]).
-export([vqshl_s16/3]).
-export([vqshl_s32/3]).
-export([vqshl_s64/3]).
-export([vqshl_u8/3]).
-export([vqshl_u16/3]).
-export([vqshl_u32/3]).
-export([vqshl_u64/3]).

-export([vqshlq_s8/3]).
-export([vqshlq_s16/3]).
-export([vqshlq_s32/3]).
-export([vqshlq_s64/3]).
-export([vqshlq_u8/3]).
-export([vqshlq_u16/3]).
-export([vqshlq_u32/3]).
-export([vqshlq_u64/3]).

-export([vqrshl_s8/3]).
-export([vqrshl_s16/3]).
-export([vqrshl_s32/3]).
-export([vqrshl_s64/3]).
-export([vqrshl_u8/3]).
-export([vqrshl_u16/3]).
-export([vqrshl_u32/3]).
-export([vqrshl_u64/3]).

-export([vqrshlq_s8/3]).
-export([vqrshlq_s16/3]).
-export([vqrshlq_s32/3]).
-export([vqrshlq_s64/3]).
-export([vqrshlq_u8/3]).
-export([vqrshlq_u16/3]).
-export([vqrshlq_u32/3]).
-export([vqrshlq_u64/3]).

-export([vshr_n_s8/3]).
-export([vshr_n_s16/3]).
-export([vshr_n_s32/3]).
-export([vshr_n_s64/3]).
-export([vshr_n_u8/3]).
-export([vshr_n_u16/3]).
-export([vshr_n_u32/3]).
-export([vshr_n_u64/3]).

-export([vshrq_n_s8/3]).
-export([vshrq_n_s16/3]).
-export([vshrq_n_s32/3]).
-export([vshrq_n_s64/3]).
-export([vshrq_n_u8/3]).
-export([vshrq_n_u16/3]).
-export([vshrq_n_u32/3]).
-export([vshrq_n_u64/3]).

-export([vrshr_n_s8/3]).
-export([vrshr_n_s16/3]).
-export([vrshr_n_s32/3]).
-export([vrshr_n_s64/3]).
-export([vrshr_n_u8/3]).
-export([vrshr_n_u16/3]).
-export([vrshr_n_u32/3]).
-export([vrshr_n_u64/3]).

-export([vrshrq_n_s8/3]).
-export([vrshrq_n_s16/3]).
-export([vrshrq_n_s32/3]).
-export([vrshrq_n_s64/3]).
-export([vrshrq_n_u8/3]).
-export([vrshrq_n_u16/3]).
-export([vrshrq_n_u32/3]).
-export([vrshrq_n_u64/3]).

-export([vshrn_n_s16/3]).
-export([vshrn_n_s32/3]).
-export([vshrn_n_s64/3]).
-export([vshrn_n_u16/3]).
-export([vshrn_n_u32/3]).
-export([vshrn_n_u64/3]).

-export([vrshrn_n_s16/3]).
-export([vrshrn_n_s32/3]).
-export([vrshrn_n_s64/3]).
-export([vrshrn_n_u16/3]).
-export([vrshrn_n_u32/3]).
-export([vrshrn_n_u64/3]).

-export([vqshrn_n_s16/3]).
-export([vqshrn_n_s32/3]).
-export([vqshrn_n_s64/3]).
-export([vqshrn_n_u16/3]).
-export([vqshrn_n_u32/3]).
-export([vqshrn_n_u64/3]).

-export([vqrshrn_n_s16/3]).
-export([vqrshrn_n_s32/3]).
-export([vqrshrn_n_s64/3]).
-export([vqrshrn_n_u16/3]).
-export([vqrshrn_n_u32/3]).
-export([vqrshrn_n_u64/3]).

-export([vqshrun_n_s16/3]).
-export([vqshrun_n_s32/3]).
-export([vqshrun_n_s64/3]).

-export([vqrshrun_n_s16/3]).
-export([vqrshrun_n_s32/3]).
-export([vqrshrun_n_s64/3]).

-export([vshl_n_s8/3]).
-export([vshl_n_s16/3]).
-export([vshl_n_s32/3]).
-export([vshl_n_s64/3]).
-export([vshl_n_u8/3]).
-export([vshl_n_u16/3]).
-export([vshl_n_u32/3]).
-export([vshl_n_u64/3]).

-export([vshlq_n_s8/3]).
-export([vshlq_n_s16/3]).
-export([vshlq_n_s32/3]).
-export([vshlq_n_s64/3]).
-export([vshlq_n_u8/3]).
-export([vshlq_n_u16/3]).
-export([vshlq_n_u32/3]).
-export([vshlq_n_u64/3]).

-export([vqshl_n_s8/3]).
-export([vqshl_n_s16/3]).
-export([vqshl_n_s32/3]).
-export([vqshl_n_s64/3]).
-export([vqshl_n_u8/3]).
-export([vqshl_n_u16/3]).
-export([vqshl_n_u32/3]).
-export([vqshl_n_u64/3]).

-export([vqshlq_n_s8/3]).
-export([vqshlq_n_s16/3]).
-export([vqshlq_n_s32/3]).
-export([vqshlq_n_s64/3]).
-export([vqshlq_n_u8/3]).
-export([vqshlq_n_u16/3]).
-export([vqshlq_n_u32/3]).
-export([vqshlq_n_u64/3]).

-export([vqshlu_n_s8/3]).
-export([vqshlu_n_s16/3]).
-export([vqshlu_n_s32/3]).
-export([vqshlu_n_s64/3]).

-export([vqshluq_n_s8/3]).
-export([vqshluq_n_s16/3]).
-export([vqshluq_n_s32/3]).
-export([vqshluq_n_s64/3]).

-export([vshll_n_s8/3]).
-export([vshll_n_s16/3]).
-export([vshll_n_s32/3]).
-export([vshll_n_u8/3]).
-export([vshll_n_u16/3]).
-export([vshll_n_u32/3]).

-export([vsra_n_s8/4]).
-export([vsra_n_s16/4]).
-export([vsra_n_s32/4]).
-export([vsra_n_s64/4]).
-export([vsra_n_u8/4]).
-export([vsra_n_u16/4]).
-export([vsra_n_u32/4]).
-export([vsra_n_u64/4]).

-export([vsraq_n_s8/4]).
-export([vsraq_n_s16/4]).
-export([vsraq_n_s32/4]).
-export([vsraq_n_s64/4]).
-export([vsraq_n_u8/4]).
-export([vsraq_n_u16/4]).
-export([vsraq_n_u32/4]).
-export([vsraq_n_u64/4]).

-export([vrsra_n_s8/4]).
-export([vrsra_n_s16/4]).
-export([vrsra_n_s32/4]).
-export([vrsra_n_s64/4]).
-export([vrsra_n_u8/4]).
-export([vrsra_n_u16/4]).
-export([vrsra_n_u32/4]).
-export([vrsra_n_u64/4]).

-export([vrsraq_n_s8/4]).
-export([vrsraq_n_s16/4]).
-export([vrsraq_n_s32/4]).
-export([vrsraq_n_s64/4]).
-export([vrsraq_n_u8/4]).
-export([vrsraq_n_u16/4]).
-export([vrsraq_n_u32/4]).
-export([vrsraq_n_u64/4]).

-export([vsri_n_s8/4]).
-export([vsri_n_s16/4]).
-export([vsri_n_s32/4]).
-export([vsri_n_s64/4]).
-export([vsri_n_u8/4]).
-export([vsri_n_u16/4]).
-export([vsri_n_u32/4]).
-export([vsri_n_u64/4]).
-export([vsri_n_p8/4]).
-export([vsri_n_p16/4]).

-export([vsriq_n_s8/4]).
-export([vsriq_n_s16/4]).
-export([vsriq_n_s32/4]).
-export([vsriq_n_s64/4]).
-export([vsriq_n_u8/4]).
-export([vsriq_n_u16/4]).
-export([vsriq_n_u32/4]).
-export([vsriq_n_u64/4]).
-export([vsriq_n_p8/4]).
-export([vsriq_n_p16/4]).

-export([vsli_n_s8/4]).
-export([vsli_n_s16/4]).
-export([vsli_n_s32/4]).
-export([vsli_n_s64/4]).
-export([vsli_n_u8/4]).
-export([vsli_n_u16/4]).
-export([vsli_n_u32/4]).
-export([vsli_n_u64/4]).
-export([vsli_n_p8/4]).
-export([vsli_n_p16/4]).

-export([vsliq_n_s8/4]).
-export([vsliq_n_s16/4]).
-export([vsliq_n_s32/4]).
-export([vsliq_n_s64/4]).
-export([vsliq_n_u8/4]).
-export([vsliq_n_u16/4]).
-export([vsliq_n_u32/4]).
-export([vsliq_n_u64/4]).
-export([vsliq_n_p8/4]).
-export([vsliq_n_p16/4]).

-export([vabs_s8/2]).
-export([vabs_s16/2]).
-export([vabs_s32/2]).
-export([vabs_f32/2]).

-export([vabsq_s8/2]).
-export([vabsq_s16/2]).
-export([vabsq_s32/2]).
-export([vabsq_f32/2]).

-export([vqabs_s8/2]).
-export([vqabs_s16/2]).
-export([vqabs_s32/2]).

-export([vqabsq_s8/2]).
-export([vqabsq_s16/2]).
-export([vqabsq_s32/2]).

-export([vneg_s8/2]).
-export([vneg_s16/2]).
-export([vneg_s32/2]).
-export([vneg_f32/2]).

-export([vnegq_s8/2]).
-export([vnegq_s16/2]).
-export([vnegq_s32/2]).
-export([vnegq_f32/2]).

-export([vqneg_s8/2]).
-export([vqneg_s16/2]).
-export([vqneg_s32/2]).

-export([vqnegq_s8/2]).
-export([vqnegq_s16/2]).
-export([vqnegq_s32/2]).

-export([vmvn_s8/2]).
-export([vmvn_s16/2]).
-export([vmvn_s32/2]).
-export([vmvn_u8/2]).
-export([vmvn_u16/2]).
-export([vmvn_u32/2]).
-export([vmvn_p8/2]).

-export([vmvnq_s8/2]).
-export([vmvnq_s16/2]).
-export([vmvnq_s32/2]).
-export([vmvnq_u8/2]).
-export([vmvnq_u16/2]).
-export([vmvnq_u32/2]).
-export([vmvnq_p8/2]).

-export([vcls_s8/2]).
-export([vcls_s16/2]).
-export([vcls_s32/2]).

-export([vclsq_s8/2]).
-export([vclsq_s16/2]).
-export([vclsq_s32/2]).

-export([vclz_s8/2]).
-export([vclz_s16/2]).
-export([vclz_s32/2]).
-export([vclz_u8/2]).
-export([vclz_u16/2]).
-export([vclz_u32/2]).

-export([vclzq_s8/2]).
-export([vclzq_s16/2]).
-export([vclzq_s32/2]).
-export([vclzq_u8/2]).
-export([vclzq_u16/2]).
-export([vclzq_u32/2]).

-export([vcnt_s8/2]).
-export([vcnt_u8/2]).
-export([vcnt_p8/2]).

-export([vcntq_s8/2]).
-export([vcntq_u8/2]).
-export([vcntq_p8/2]).

-export([vrecpe_f32/2]).
-export([vrecpe_u32/2]).

-export([vrecpeq_f32/2]).
-export([vrecpeq_u32/2]).

-export([vrsqrte_f32/2]).
-export([vrsqrte_u32/2]).

-export([vrsqrteq_f32/2]).
-export([vrsqrteq_u32/2]).


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
vmul_p8(_D,_N,_M) -> erlang:error(nif_not_loaded).

vmulq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmulq_p8(_D,_N,_M) -> erlang:error(nif_not_loaded).

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
vmull_p8(_D,_N,_M) -> erlang:error(nif_not_loaded).

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
vceq_p8(_D,_N,_M) -> erlang:error(nif_not_loaded).

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
vceqq_p8(_D,_N,_M) -> erlang:error(nif_not_loaded).

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

vcage_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vcageq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vcale_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vcaleq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vcagt_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vcagtq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vcalt_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vcaltq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vtst_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtst_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtst_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtst_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtst_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtst_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtst_p8(_D,_N,_M) -> erlang:error(nif_not_loaded).

vtstq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtstq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtstq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtstq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtstq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtstq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vtstq_p8(_D,_N,_M) -> erlang:error(nif_not_loaded).

vabd_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabd_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabd_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabd_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabd_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabd_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabd_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vabdq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vabdl_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdl_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdl_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdl_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdl_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vabdl_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vaba_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vaba_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vaba_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vaba_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vaba_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vaba_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).

vabaq_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabaq_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabaq_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabaq_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabaq_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabaq_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).

vabal_s8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabal_s16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabal_s32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabal_u8(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabal_u16(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).
vabal_u32(_D,_N,_M,_K) -> erlang:error(nif_not_loaded).

vmax_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmax_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmax_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmax_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmax_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmax_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmax_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vmaxq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmaxq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmaxq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmaxq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmaxq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmaxq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmaxq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vmin_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmin_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmin_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmin_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmin_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmin_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vmin_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vminq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vminq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vminq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vminq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vminq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vminq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vminq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vpadd_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadd_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadd_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadd_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadd_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadd_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadd_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vpaddl_s8(_D,_N) -> erlang:error(nif_not_loaded).
vpaddl_s16(_D,_N) -> erlang:error(nif_not_loaded).
vpaddl_s32(_D,_N) -> erlang:error(nif_not_loaded).
vpaddl_u8(_D,_N) -> erlang:error(nif_not_loaded).
vpaddl_u16(_D,_N) -> erlang:error(nif_not_loaded).
vpaddl_u32(_D,_N) -> erlang:error(nif_not_loaded).

vpaddlq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vpaddlq_s16(_D,_N) -> erlang:error(nif_not_loaded).
vpaddlq_s32(_D,_N) -> erlang:error(nif_not_loaded).
vpaddlq_u8(_D,_N) -> erlang:error(nif_not_loaded).
vpaddlq_u16(_D,_N) -> erlang:error(nif_not_loaded).
vpaddlq_u32(_D,_N) -> erlang:error(nif_not_loaded).

vpadal_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadal_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadal_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadal_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadal_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadal_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vpadalq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadalq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadalq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadalq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadalq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpadalq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vpmax_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmax_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmax_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmax_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmax_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmax_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmax_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vpmin_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmin_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmin_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmin_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmin_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmin_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vpmin_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vrecps_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vrecpsq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vrsqrts_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vrsqrtsq_f32(_D,_N,_M) -> erlang:error(nif_not_loaded).

vshl_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshl_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshl_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshl_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshl_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshl_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshl_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshl_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).

vshlq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshlq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshlq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshlq_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshlq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshlq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshlq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vshlq_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).

vrshl_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshl_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshl_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshl_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshl_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshl_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshl_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshl_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).

vrshlq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshlq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshlq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshlq_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshlq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshlq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshlq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vrshlq_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).

vqshl_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshl_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshl_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshl_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshl_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshl_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshl_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshl_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).

vqshlq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshlq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshlq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshlq_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshlq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshlq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshlq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqshlq_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).

vqrshl_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshl_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshl_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshl_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshl_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshl_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshl_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshl_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).

vqrshlq_s8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshlq_s16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshlq_s32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshlq_s64(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshlq_u8(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshlq_u16(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshlq_u32(_D,_N,_M) -> erlang:error(nif_not_loaded).
vqrshlq_u64(_D,_N,_M) -> erlang:error(nif_not_loaded).

vshr_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshr_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshr_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshr_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshr_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshr_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshr_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshr_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vshrq_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrq_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrq_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrq_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrq_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrq_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrq_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrq_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vrshr_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshr_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshr_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshr_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshr_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshr_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshr_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshr_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vrshrq_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrq_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrq_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrq_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrq_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrq_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrq_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrq_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vshrn_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrn_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrn_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrn_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrn_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshrn_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vrshrn_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrn_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrn_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrn_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrn_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vrshrn_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vqshrn_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshrn_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshrn_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshrn_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshrn_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshrn_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vqrshrn_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqrshrn_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqrshrn_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqrshrn_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqrshrn_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqrshrn_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vqshrun_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshrun_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshrun_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vqrshrun_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqrshrun_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqrshrun_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vshl_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshl_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshl_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshl_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshl_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshl_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshl_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshl_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vshlq_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshlq_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshlq_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshlq_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshlq_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshlq_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshlq_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshlq_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vqshl_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshl_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshl_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshl_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshl_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshl_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshl_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshl_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vqshlq_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlq_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlq_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlq_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlq_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlq_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlq_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlq_n_u64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vqshlu_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlu_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlu_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshlu_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vqshluq_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshluq_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshluq_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vqshluq_n_s64(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vshll_n_s8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshll_n_s16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshll_n_s32(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshll_n_u8(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshll_n_u16(_D,_N,_Z) -> erlang:error(nif_not_loaded).
vshll_n_u32(_D,_N,_Z) -> erlang:error(nif_not_loaded).

vsra_n_s8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsra_n_s16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsra_n_s32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsra_n_s64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsra_n_u8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsra_n_u16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsra_n_u32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsra_n_u64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).

vsraq_n_s8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsraq_n_s16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsraq_n_s32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsraq_n_s64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsraq_n_u8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsraq_n_u16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsraq_n_u32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsraq_n_u64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).

vrsra_n_s8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsra_n_s16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsra_n_s32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsra_n_s64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsra_n_u8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsra_n_u16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsra_n_u32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsra_n_u64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).

vrsraq_n_s8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsraq_n_s16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsraq_n_s32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsraq_n_s64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsraq_n_u8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsraq_n_u16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsraq_n_u32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vrsraq_n_u64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).

vsri_n_s8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_s16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_s32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_s64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_u8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_u16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_u32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_u64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_p8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsri_n_p16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).

vsriq_n_s8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_s16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_s32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_s64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_u8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_u16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_u32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_u64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_p8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsriq_n_p16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).

vsli_n_s8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_s16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_s32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_s64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_u8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_u16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_u32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_u64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_p8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsli_n_p16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).

vsliq_n_s8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_s16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_s32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_s64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_u8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_u16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_u32(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_u64(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_p8(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).
vsliq_n_p16(_D,_N,_M,_Z) -> erlang:error(nif_not_loaded).

vabs_s8(_D,_N) -> erlang:error(nif_not_loaded).
vabs_s16(_D,_N) -> erlang:error(nif_not_loaded).
vabs_s32(_D,_N) -> erlang:error(nif_not_loaded).
vabs_f32(_D,_N) -> erlang:error(nif_not_loaded).

vabsq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vabsq_s16(_D,_N) -> erlang:error(nif_not_loaded).
vabsq_s32(_D,_N) -> erlang:error(nif_not_loaded).
vabsq_f32(_D,_N) -> erlang:error(nif_not_loaded).

vqabs_s8(_D,_N) -> erlang:error(nif_not_loaded).
vqabs_s16(_D,_N) -> erlang:error(nif_not_loaded).
vqabs_s32(_D,_N) -> erlang:error(nif_not_loaded).

vqabsq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vqabsq_s16(_D,_N) -> erlang:error(nif_not_loaded).
vqabsq_s32(_D,_N) -> erlang:error(nif_not_loaded).

vneg_s8(_D,_N) -> erlang:error(nif_not_loaded).
vneg_s16(_D,_N) -> erlang:error(nif_not_loaded).
vneg_s32(_D,_N) -> erlang:error(nif_not_loaded).
vneg_f32(_D,_N) -> erlang:error(nif_not_loaded).

vnegq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vnegq_s16(_D,_N) -> erlang:error(nif_not_loaded).
vnegq_s32(_D,_N) -> erlang:error(nif_not_loaded).
vnegq_f32(_D,_N) -> erlang:error(nif_not_loaded).

vqneg_s8(_D,_N) -> erlang:error(nif_not_loaded).
vqneg_s16(_D,_N) -> erlang:error(nif_not_loaded).
vqneg_s32(_D,_N) -> erlang:error(nif_not_loaded).

vqnegq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vqnegq_s16(_D,_N) -> erlang:error(nif_not_loaded).
vqnegq_s32(_D,_N) -> erlang:error(nif_not_loaded).

vmvn_s8(_D,_N) -> erlang:error(nif_not_loaded).
vmvn_s16(_D,_N) -> erlang:error(nif_not_loaded).
vmvn_s32(_D,_N) -> erlang:error(nif_not_loaded).
vmvn_u8(_D,_N) -> erlang:error(nif_not_loaded).
vmvn_u16(_D,_N) -> erlang:error(nif_not_loaded).
vmvn_u32(_D,_N) -> erlang:error(nif_not_loaded).
vmvn_p8(_D,_N) -> erlang:error(nif_not_loaded).

vmvnq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vmvnq_s16(_D,_N) -> erlang:error(nif_not_loaded).
vmvnq_s32(_D,_N) -> erlang:error(nif_not_loaded).
vmvnq_u8(_D,_N) -> erlang:error(nif_not_loaded).
vmvnq_u16(_D,_N) -> erlang:error(nif_not_loaded).
vmvnq_u32(_D,_N) -> erlang:error(nif_not_loaded).
vmvnq_p8(_D,_N) -> erlang:error(nif_not_loaded).

vcls_s8(_D,_N) -> erlang:error(nif_not_loaded).
vcls_s16(_D,_N) -> erlang:error(nif_not_loaded).
vcls_s32(_D,_N) -> erlang:error(nif_not_loaded).

vclsq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vclsq_s16(_D,_N) -> erlang:error(nif_not_loaded).
vclsq_s32(_D,_N) -> erlang:error(nif_not_loaded).

vclz_s8(_D,_N) -> erlang:error(nif_not_loaded).
vclz_s16(_D,_N) -> erlang:error(nif_not_loaded).
vclz_s32(_D,_N) -> erlang:error(nif_not_loaded).
vclz_u8(_D,_N) -> erlang:error(nif_not_loaded).
vclz_u16(_D,_N) -> erlang:error(nif_not_loaded).
vclz_u32(_D,_N) -> erlang:error(nif_not_loaded).

vclzq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vclzq_s16(_D,_N) -> erlang:error(nif_not_loaded).
vclzq_s32(_D,_N) -> erlang:error(nif_not_loaded).
vclzq_u8(_D,_N) -> erlang:error(nif_not_loaded).
vclzq_u16(_D,_N) -> erlang:error(nif_not_loaded).
vclzq_u32(_D,_N) -> erlang:error(nif_not_loaded).

vcnt_s8(_D,_N) -> erlang:error(nif_not_loaded).
vcnt_u8(_D,_N) -> erlang:error(nif_not_loaded).
vcnt_p8(_D,_N) -> erlang:error(nif_not_loaded).

vcntq_s8(_D,_N) -> erlang:error(nif_not_loaded).
vcntq_u8(_D,_N) -> erlang:error(nif_not_loaded).
vcntq_p8(_D,_N) -> erlang:error(nif_not_loaded).

vrecpe_f32(_D,_N) -> erlang:error(nif_not_loaded).
vrecpe_u32(_D,_N) -> erlang:error(nif_not_loaded).

vrecpeq_f32(_D,_N) -> erlang:error(nif_not_loaded).
vrecpeq_u32(_D,_N) -> erlang:error(nif_not_loaded).

vrsqrte_f32(_D,_N) -> erlang:error(nif_not_loaded).
vrsqrte_u32(_D,_N) -> erlang:error(nif_not_loaded).

vrsqrteq_f32(_D,_N) -> erlang:error(nif_not_loaded).
vrsqrteq_u32(_D,_N) -> erlang:error(nif_not_loaded).


vmov(_Dst,_Src) -> erlang:error(nif_not_loaded).
vset(_Dst,_Data) -> erlang:error(nif_not_loaded).
vld(_Dst,_Offset,_Data) -> erlang:error(nif_not_loaded).
vget(_Src) -> erlang:error(nif_not_loaded).

info(_Info) -> erlang:error(nif_not_loaded).
