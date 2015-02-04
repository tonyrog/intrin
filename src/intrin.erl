






%%% @author Tony Rogvall <tony@rogvall.se>
%%% @copyright (C) 2013, Tony Rogvall
%%% @doc
%%% simd instruction interface
%%% @end
%%% Created : 4 Apr 2013 by Tony Rogvall <tony@rogvall.se>

-module(intrin).

-on_load(init/0).










-export([mm_packs_pi16/2]).
-export([mm_packs_pi32/2]).
-export([mm_packs_pu16/2]).
-export([mm_unpackhi_pi8/2]).
-export([mm_unpackhi_pi16/2]).
-export([mm_unpackhi_pi32/2]).
-export([mm_unpacklo_pi8/2]).
-export([mm_unpacklo_pi16/2]).
-export([mm_unpacklo_pi32/2]).
-export([mm_add_pi8/2]).
-export([mm_add_pi16/2]).
-export([mm_add_pi32/2]).
-export([mm_add_si64/2]).
-export([mm_adds_pi8/2]).
-export([mm_adds_pi16/2]).
-export([mm_adds_pu8/2]).
-export([mm_adds_pu16/2]).
-export([mm_sub_pi8/2]).
-export([mm_sub_pi16/2]).
-export([mm_sub_pi32/2]).
-export([mm_sub_si64/2]).
-export([mm_subs_pi8/2]).
-export([mm_subs_pi16/2]).
-export([mm_subs_pu8/2]).
-export([mm_subs_pu16/2]).
-export([mm_madd_pi16/2]).
-export([mm_mulhi_pi16/2]).
-export([mm_mullo_pi16/2]).
-export([mm_sll_pi16/2]).
-export([mm_slli_pi16/2]).
-export([mm_sll_pi32/2]).
-export([mm_slli_pi32/2]).
-export([mm_sll_si64/2]).
-export([mm_slli_si64/2]).
-export([mm_sra_pi16/2]).
-export([mm_srai_pi16/2]).
-export([mm_sra_pi32/2]).
-export([mm_srai_pi32/2]).
-export([mm_srl_pi16/2]).
-export([mm_srli_pi16/2]).
-export([mm_srl_pi32/2]).
-export([mm_srli_pi32/2]).
-export([mm_srl_si64/2]).
-export([mm_srli_si64/2]).
-export([mm_and_si64/2]).
-export([mm_andnot_si64/2]).
-export([mm_or_si64/2]).
-export([mm_xor_si64/2]).
-export([mm_cmpeq_pi8/2]).
-export([mm_cmpgt_pi8/2]).
-export([mm_cmpeq_pi16/2]).
-export([mm_cmpgt_pi16/2]).
-export([mm_cmpeq_pi32/2]).
-export([mm_cmpgt_pi32/2]).



-export([mm_add_ss/2]).
-export([mm_sub_ss/2]).
-export([mm_mul_ss/2]).
-export([mm_div_ss/2]).
-export([mm_sqrt_ss/2]).
-export([mm_rcp_ss/2]).
-export([mm_rsqrt_ss/2]).
-export([mm_min_ss/2]).
-export([mm_max_ss/2]).


-export([mm_add_ps/2]).
-export([mm_sub_ps/2]).
-export([mm_mul_ps/2]).
-export([mm_div_ps/2]).
-export([mm_sqrt_ps/2]).
-export([mm_rcp_ps/2]).
-export([mm_rsqrt_ps/2]).
-export([mm_min_ps/2]).
-export([mm_max_ps/2]).
-export([mm_and_ps/2]).
-export([mm_andnot_ps/2]).
-export([mm_or_ps/2]).
-export([mm_xor_ps/2]).
-export([mm_cmpeq_ss/2]).
-export([mm_cmplt_ss/2]).
-export([mm_cmple_ss/2]).
-export([mm_cmpgt_ss/2]).
-export([mm_cmpge_ss/2]).
-export([mm_cmpneq_ss/2]).
-export([mm_cmpnlt_ss/2]).
-export([mm_cmpnle_ss/2]).
-export([mm_cmpngt_ss/2]).
-export([mm_cmpnge_ss/2]).
-export([mm_cmpord_ss/2]).
-export([mm_cmpunord_ss/2]).
-export([mm_cmpeq_ps/2]).
-export([mm_cmplt_ps/2]).
-export([mm_cmple_ps/2]).
-export([mm_cmpgt_ps/2]).
-export([mm_cmpge_ps/2]).
-export([mm_cmpneq_ps/2]).
-export([mm_cmpnlt_ps/2]).
-export([mm_cmpnle_ps/2]).
-export([mm_cmpngt_ps/2]).
-export([mm_cmpnge_ps/2]).
-export([mm_cmpord_ps/2]).
-export([mm_cmpunord_ps/2]).
-export([mm_comieq_ss/2]).
-export([mm_comilt_ss/2]).
-export([mm_comile_ss/2]).
-export([mm_comigt_ss/2]).
-export([mm_comige_ss/2]).
-export([mm_comineq_ss/2]).
-export([mm_ucomieq_ss/2]).
-export([mm_ucomilt_ss/2]).
-export([mm_ucomile_ss/2]).
-export([mm_ucomigt_ss/2]).
-export([mm_ucomige_ss/2]).
-export([mm_ucomineq_ss/2]).

-export([mm_unpackhi_ps/2]).
-export([mm_unpacklo_ps/2]).



-export([mm_add_pd/2]).
-export([mm_add_sd/2]).
-export([mm_sub_pd/2]).
-export([mm_sub_sd/2]).
-export([mm_mul_pd/2]).
-export([mm_mul_sd/2]).
-export([mm_div_pd/2]).
-export([mm_div_sd/2]).
-export([mm_sqrt_pd/2]).
-export([mm_sqrt_sd/2]).
-export([mm_min_pd/2]).
-export([mm_min_sd/2]).
-export([mm_max_pd/2]).
-export([mm_max_sd/2]).
-export([mm_and_pd/2]).
-export([mm_andnot_pd/2]).
-export([mm_or_pd/2]).
-export([mm_xor_pd/2]).
-export([mm_cmpeq_pd/2]).
-export([mm_cmplt_pd/2]).
-export([mm_cmple_pd/2]).
-export([mm_cmpgt_pd/2]).
-export([mm_cmpge_pd/2]).
-export([mm_cmpneq_pd/2]).
-export([mm_cmpnlt_pd/2]).
-export([mm_cmpnle_pd/2]).
-export([mm_cmpngt_pd/2]).
-export([mm_cmpnge_pd/2]).
-export([mm_cmpord_pd/2]).
-export([mm_cmpunord_pd/2]).
-export([mm_cmpeq_sd/2]).
-export([mm_cmplt_sd/2]).
-export([mm_cmple_sd/2]).
-export([mm_cmpgt_sd/2]).
-export([mm_cmpge_sd/2]).
-export([mm_cmpneq_sd/2]).
-export([mm_cmpnlt_sd/2]).
-export([mm_cmpnle_sd/2]).
-export([mm_cmpngt_sd/2]).
-export([mm_cmpnge_sd/2]).
-export([mm_cmpord_sd/2]).
-export([mm_cmpunord_sd/2]).
-export([mm_comieq_sd/2]).
-export([mm_comilt_sd/2]).
-export([mm_comile_sd/2]).
-export([mm_comigt_sd/2]).
-export([mm_comige_sd/2]).
-export([mm_comineq_sd/2]).
-export([mm_ucomieq_sd/2]).
-export([mm_ucomilt_sd/2]).
-export([mm_ucomile_sd/2]).
-export([mm_ucomigt_sd/2]).
-export([mm_ucomige_sd/2]).
-export([mm_ucomineq_sd/2]).

-export([mm_unpackhi_pd/2]).
-export([mm_unpacklo_pd/2]).



-export([mm_packs_epi16/2]).
-export([mm_packs_epi32/2]).
-export([mm_packus_epi16/2]).
-export([mm_unpackhi_epi8/2]).
-export([mm_unpackhi_epi16/2]).
-export([mm_unpackhi_epi32/2]).
-export([mm_unpackhi_epi64/2]).
-export([mm_unpacklo_epi8/2]).
-export([mm_unpacklo_epi16/2]).
-export([mm_unpacklo_epi32/2]).
-export([mm_unpacklo_epi64/2]).
-export([mm_add_epi8/2]).
-export([mm_add_epi16/2]).
-export([mm_add_epi32/2]).
-export([mm_add_epi64/2]).
-export([mm_adds_epi8/2]).
-export([mm_adds_epi16/2]).
-export([mm_adds_epu8/2]).
-export([mm_adds_epu16/2]).
-export([mm_sub_epi8/2]).
-export([mm_sub_epi16/2]).
-export([mm_sub_epi32/2]).
-export([mm_sub_epi64/2]).
-export([mm_subs_epi8/2]).
-export([mm_subs_epi16/2]).
-export([mm_subs_epu8/2]).
-export([mm_subs_epu16/2]).
-export([mm_madd_epi16/2]).
-export([mm_mulhi_epi16/2]).
-export([mm_mullo_epi16/2]).

-export([mm_mul_epu32/2]).
-export([mm_slli_epi16/2]).
-export([mm_slli_epi32/2]).
-export([mm_slli_epi64/2]).
-export([mm_srai_epi16/2]).
-export([mm_srai_epi32/2]).
-export([mm_srli_si128/2]).
-export([mm_slli_si128/2]).
-export([mm_srli_epi16/2]).
-export([mm_srli_epi32/2]).
-export([mm_srli_epi64/2]).
-export([mm_sll_epi16/2]).
-export([mm_sll_epi32/2]).
-export([mm_sll_epi64/2]).
-export([mm_sra_epi16/2]).
-export([mm_sra_epi32/2]).
-export([mm_srl_epi16/2]).
-export([mm_srl_epi32/2]).
-export([mm_srl_epi64/2]).
-export([mm_and_si128/2]).
-export([mm_andnot_si128/2]).
-export([mm_or_si128/2]).
-export([mm_xor_si128/2]).
-export([mm_cmpeq_epi8/2]).
-export([mm_cmpeq_epi16/2]).
-export([mm_cmpeq_epi32/2]).
-export([mm_cmplt_epi8/2]).
-export([mm_cmplt_epi16/2]).
-export([mm_cmplt_epi32/2]).
-export([mm_cmpgt_epi8/2]).
-export([mm_cmpgt_epi16/2]).
-export([mm_cmpgt_epi32/2]).




-export([mm_max_epi16/2]).
-export([mm_max_epu8/2]).
-export([mm_min_epi16/2]).
-export([mm_min_epu8/2]).

-export([mm_mulhi_epu16/2]).
-export([mm_shufflehi_epi16/3]).
-export([mm_shufflelo_epi16/3]).
-export([mm_shuffle_epi32/3]).

-export([mm_avg_epu8/2]).
-export([mm_avg_epu16/2]).
-export([mm_sad_epu8/2]).





-export([mm_addsub_ps/2]).
-export([mm_hadd_ps/2]).
-export([mm_hsub_ps/2]).


-export([mm_addsub_pd/2]).
-export([mm_hadd_pd/2]).
-export([mm_hsub_pd/2]).



-export([mm_hadd_epi16/2]).
-export([mm_hadd_epi32/2]).
-export([mm_hadds_epi16/2]).



-export([mm_hsub_epi16/2]).
-export([mm_hsub_epi32/2]).
-export([mm_hsubs_epi16/2]).



-export([mm_maddubs_epi16/2]).

-export([mm_mulhrs_epi16/2]).

-export([mm_shuffle_epi8/2]).

-export([mm_sign_epi8/2]).
-export([mm_sign_epi16/2]).
-export([mm_sign_epi32/2]).





-export([mm_abs_epi8/2]).
-export([mm_abs_epi16/2]).
-export([mm_abs_epi32/2]).



-export([mm_min_epi8/2]).
-export([mm_max_epi8/2]).
-export([mm_min_epu16/2]).
-export([mm_max_epu16/2]).
-export([mm_min_epi32/2]).
-export([mm_max_epi32/2]).
-export([mm_min_epu32/2]).
-export([mm_max_epu32/2]).
-export([mm_mullo_epi32/2]).
-export([mm_mul_epi32/2]).
-export([mm_testz_si128/2]).
-export([mm_testc_si128/2]).
-export([mm_testnzc_si128/2]).




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


-export([mm_move/2]).
-export([mm_set/2]).
-export([mm_get/1]).
-export([mm_load/3]).

-export([vmov/2]).
-export([vset/2]).
-export([vget/1]).
-export([vld/3]).

-export([info/1]).

init() ->
    Nif = filename:join([code:priv_dir(intrin),"intrin_nif"]),
    erlang:load_nif(Nif, 0).










mm_packs_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_packs_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_packs_pu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpackhi_pi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpackhi_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpackhi_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_pi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_pi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_si64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_adds_pi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_adds_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_adds_pu8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_adds_pu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_pi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_si64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_subs_pi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_subs_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_subs_pu8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_subs_pu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_madd_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mulhi_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mullo_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sll_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_slli_pi16(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_sll_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_slli_pi32(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_sll_si64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_slli_si64(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_sra_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_srai_pi16(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_sra_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_srai_pi32(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srl_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_srli_pi16(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srl_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_srli_pi32(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srl_si64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_srli_si64(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_and_si64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_andnot_si64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_or_si64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_xor_si64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_pi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_pi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_pi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_pi32(_Dst,_Src) -> erlang:error(nif_not_loaded).



mm_add_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mul_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_div_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sqrt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_rcp_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_rsqrt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).


mm_add_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mul_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_div_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sqrt_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_rcp_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_rsqrt_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_and_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_andnot_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_or_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_xor_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmplt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmple_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpge_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpneq_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnlt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnle_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpngt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnge_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpord_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpunord_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmplt_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmple_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpge_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpneq_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnlt_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnle_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpngt_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnge_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpord_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpunord_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comieq_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comilt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comile_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comigt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comige_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comineq_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomieq_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomilt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomile_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomigt_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomige_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomineq_ss(_Dst,_Src) -> erlang:error(nif_not_loaded).

mm_unpackhi_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).



mm_add_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mul_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mul_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_div_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_div_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sqrt_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sqrt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_and_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_andnot_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_or_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_xor_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmplt_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmple_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpge_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpneq_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnlt_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnle_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpngt_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnge_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpord_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpunord_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmplt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmple_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpge_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpneq_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnlt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnle_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpngt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpnge_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpord_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpunord_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comieq_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comilt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comile_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comigt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comige_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_comineq_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomieq_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomilt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomile_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomigt_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomige_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_ucomineq_sd(_Dst,_Src) -> erlang:error(nif_not_loaded).

mm_unpackhi_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).



mm_packs_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_packs_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_packus_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpackhi_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpackhi_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpackhi_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpackhi_epi64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_unpacklo_epi64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_add_epi64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_adds_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_adds_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_adds_epu8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_adds_epu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sub_epi64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_subs_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_subs_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_subs_epu8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_subs_epu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_madd_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mulhi_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mullo_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).

mm_mul_epu32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_slli_epi16(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_slli_epi32(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_slli_epi64(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srai_epi16(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srai_epi32(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srli_si128(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_slli_si128(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srli_epi16(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srli_epi32(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_srli_epi64(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_sll_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sll_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sll_epi64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sra_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sra_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_srl_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_srl_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_srl_epi64(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_and_si128(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_andnot_si128(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_or_si128(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_xor_si128(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpeq_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmplt_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmplt_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmplt_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_cmpgt_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).




mm_max_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_epu8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_epu8(_Dst,_Src) -> erlang:error(nif_not_loaded).

mm_mulhi_epu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_shufflehi_epi16(_Dst,_Src,_Imm8) -> erlang:error(nif_not_loaded).
mm_shufflelo_epi16(_Dst,_Src,_Imm8) -> erlang:error(nif_not_loaded).
mm_shuffle_epi32(_Dst,_Src,_Imm8) -> erlang:error(nif_not_loaded).

mm_avg_epu8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_avg_epu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sad_epu8(_Dst,_Src) -> erlang:error(nif_not_loaded).





mm_addsub_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_hadd_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_hsub_ps(_Dst,_Src) -> erlang:error(nif_not_loaded).


mm_addsub_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_hadd_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_hsub_pd(_Dst,_Src) -> erlang:error(nif_not_loaded).



mm_hadd_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_hadd_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_hadds_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).



mm_hsub_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_hsub_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_hsubs_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).



mm_maddubs_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).

mm_mulhrs_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).

mm_shuffle_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).

mm_sign_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sign_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sign_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).





mm_abs_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_abs_epi16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_abs_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).



mm_min_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_epi8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_epu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_epu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_min_epu32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_max_epu32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mullo_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_mul_epi32(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_testz_si128(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_testc_si128(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_testnzc_si128(_Dst,_Src) -> erlang:error(nif_not_loaded).




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


mm_move(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_set(_Dst,_Data) -> erlang:error(nif_not_loaded).
mm_load(_Dst,_Offset,_Data) -> erlang:error(nif_not_loaded).
mm_get(_Src) -> erlang:error(nif_not_loaded).

vmov(_Dst,_Src) -> erlang:error(nif_not_loaded).
vset(_Dst,_Data) -> erlang:error(nif_not_loaded).
vld(_Dst,_Offset,_Data) -> erlang:error(nif_not_loaded).
vget(_Src) -> erlang:error(nif_not_loaded).

info(_Info) -> erlang:error(nif_not_loaded).
