



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
-export([mm_shufflehi_epi16/2]).
-export([mm_shufflelo_epi16/2]).
-export([mm_shuffle_epi32/2]).

-export([mm_avg_epu8/2]).
-export([mm_avg_epu16/2]).
-export([mm_sad_epu8/2]).


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





-export([mm_abs_epi8/1]).
-export([mm_abs_epi16/1]).
-export([mm_abs_epi32/1]).



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


-export([mm_move/2]).
-export([mm_set/2]).
-export([mm_get/1]).
-export([mm_load/3]).
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
mm_shufflehi_epi16(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_shufflelo_epi16(_Dst,_Imm8) -> erlang:error(nif_not_loaded).
mm_shuffle_epi32(_Dst,_Imm8) -> erlang:error(nif_not_loaded).

mm_avg_epu8(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_avg_epu16(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_sad_epu8(_Dst,_Src) -> erlang:error(nif_not_loaded).


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





mm_abs_epi8(_Dst) -> erlang:error(nif_not_loaded).
mm_abs_epi16(_Dst) -> erlang:error(nif_not_loaded).
mm_abs_epi32(_Dst) -> erlang:error(nif_not_loaded).



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


mm_move(_Dst,_Src) -> erlang:error(nif_not_loaded).
mm_set(_Dst,_Data) -> erlang:error(nif_not_loaded).
mm_load(_Dst,_Offset,_Data) -> erlang:error(nif_not_loaded).
mm_get(_Src) -> erlang:error(nif_not_loaded).
info(_Info) -> erlang:error(nif_not_loaded).
