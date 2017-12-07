%%% @author Tony Rogvall <tony@rogvall.se>
%%% @copyright (C) 2013, Tony Rogvall
%%% @doc
%%% x86 simd instruction interface
%%% @end
%%% Created : 4 Apr 2013 by Tony Rogvall <tony@rogvall.se>

-module(x86).

-on_load(init/0).

-export([mm256_add_pd/2]).
-export([mm256_add_ps/2]).
-export([mm256_addsub_pd/2]).
-export([mm256_addsub_ps/2]).

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


-export([mm_move/2]).
-export([mm_set/2]).
-export([mm_get/1]).
-export([mm_load/3]).
-export([mm_read/2]).
-export([mm_write/3]).

-export([info/1]).

-define(nif_stub(),
	erlang:nif_error({nif_not_loaded,module,?MODULE,line,?LINE})).

init() ->
    Nif = filename:join([code:priv_dir(intrin),"x86_nif"]),
    erlang:load_nif(Nif, 0).


mm256_add_pd(_Dst,_Src) -> ?nif_stub().
mm256_add_ps(_Dst,_Src) -> ?nif_stub().
mm256_addsub_pd(_Dst,_Src) -> ?nif_stub().
mm256_addsub_ps(_Dst,_Src) -> ?nif_stub().

mm_packs_pi16(_Dst,_Src) -> ?nif_stub().
mm_packs_pi32(_Dst,_Src) -> ?nif_stub().
mm_packs_pu16(_Dst,_Src) -> ?nif_stub().
mm_unpackhi_pi8(_Dst,_Src) -> ?nif_stub().
mm_unpackhi_pi16(_Dst,_Src) -> ?nif_stub().
mm_unpackhi_pi32(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_pi8(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_pi16(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_pi32(_Dst,_Src) -> ?nif_stub().
mm_add_pi8(_Dst,_Src) -> ?nif_stub().
mm_add_pi16(_Dst,_Src) -> ?nif_stub().
mm_add_pi32(_Dst,_Src) -> ?nif_stub().
mm_add_si64(_Dst,_Src) -> ?nif_stub().
mm_adds_pi8(_Dst,_Src) -> ?nif_stub().
mm_adds_pi16(_Dst,_Src) -> ?nif_stub().
mm_adds_pu8(_Dst,_Src) -> ?nif_stub().
mm_adds_pu16(_Dst,_Src) -> ?nif_stub().
mm_sub_pi8(_Dst,_Src) -> ?nif_stub().
mm_sub_pi16(_Dst,_Src) -> ?nif_stub().
mm_sub_pi32(_Dst,_Src) -> ?nif_stub().
mm_sub_si64(_Dst,_Src) -> ?nif_stub().
mm_subs_pi8(_Dst,_Src) -> ?nif_stub().
mm_subs_pi16(_Dst,_Src) -> ?nif_stub().
mm_subs_pu8(_Dst,_Src) -> ?nif_stub().
mm_subs_pu16(_Dst,_Src) -> ?nif_stub().
mm_madd_pi16(_Dst,_Src) -> ?nif_stub().
mm_mulhi_pi16(_Dst,_Src) -> ?nif_stub().
mm_mullo_pi16(_Dst,_Src) -> ?nif_stub().
mm_sll_pi16(_Dst,_Src) -> ?nif_stub().
mm_slli_pi16(_Dst,_Imm8) -> ?nif_stub().
mm_sll_pi32(_Dst,_Src) -> ?nif_stub().
mm_slli_pi32(_Dst,_Imm8) -> ?nif_stub().
mm_sll_si64(_Dst,_Src) -> ?nif_stub().
mm_slli_si64(_Dst,_Imm8) -> ?nif_stub().
mm_sra_pi16(_Dst,_Src) -> ?nif_stub().
mm_srai_pi16(_Dst,_Imm8) -> ?nif_stub().
mm_sra_pi32(_Dst,_Src) -> ?nif_stub().
mm_srai_pi32(_Dst,_Imm8) -> ?nif_stub().
mm_srl_pi16(_Dst,_Src) -> ?nif_stub().
mm_srli_pi16(_Dst,_Imm8) -> ?nif_stub().
mm_srl_pi32(_Dst,_Src) -> ?nif_stub().
mm_srli_pi32(_Dst,_Imm8) -> ?nif_stub().
mm_srl_si64(_Dst,_Src) -> ?nif_stub().
mm_srli_si64(_Dst,_Imm8) -> ?nif_stub().
mm_and_si64(_Dst,_Src) -> ?nif_stub().
mm_andnot_si64(_Dst,_Src) -> ?nif_stub().
mm_or_si64(_Dst,_Src) -> ?nif_stub().
mm_xor_si64(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_pi8(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_pi8(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_pi16(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_pi16(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_pi32(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_pi32(_Dst,_Src) -> ?nif_stub().



mm_add_ss(_Dst,_Src) -> ?nif_stub().
mm_sub_ss(_Dst,_Src) -> ?nif_stub().
mm_mul_ss(_Dst,_Src) -> ?nif_stub().
mm_div_ss(_Dst,_Src) -> ?nif_stub().
mm_sqrt_ss(_Dst,_Src) -> ?nif_stub().
mm_rcp_ss(_Dst,_Src) -> ?nif_stub().
mm_rsqrt_ss(_Dst,_Src) -> ?nif_stub().
mm_min_ss(_Dst,_Src) -> ?nif_stub().
mm_max_ss(_Dst,_Src) -> ?nif_stub().


mm_add_ps(_Dst,_Src) -> ?nif_stub().
mm_sub_ps(_Dst,_Src) -> ?nif_stub().
mm_mul_ps(_Dst,_Src) -> ?nif_stub().
mm_div_ps(_Dst,_Src) -> ?nif_stub().
mm_sqrt_ps(_Dst,_Src) -> ?nif_stub().
mm_rcp_ps(_Dst,_Src) -> ?nif_stub().
mm_rsqrt_ps(_Dst,_Src) -> ?nif_stub().
mm_min_ps(_Dst,_Src) -> ?nif_stub().
mm_max_ps(_Dst,_Src) -> ?nif_stub().
mm_and_ps(_Dst,_Src) -> ?nif_stub().
mm_andnot_ps(_Dst,_Src) -> ?nif_stub().
mm_or_ps(_Dst,_Src) -> ?nif_stub().
mm_xor_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_ss(_Dst,_Src) -> ?nif_stub().
mm_cmplt_ss(_Dst,_Src) -> ?nif_stub().
mm_cmple_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpge_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpneq_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpnlt_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpnle_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpngt_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpnge_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpord_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpunord_ss(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_ps(_Dst,_Src) -> ?nif_stub().
mm_cmplt_ps(_Dst,_Src) -> ?nif_stub().
mm_cmple_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpge_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpneq_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpnlt_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpnle_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpngt_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpnge_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpord_ps(_Dst,_Src) -> ?nif_stub().
mm_cmpunord_ps(_Dst,_Src) -> ?nif_stub().
mm_comieq_ss(_Dst,_Src) -> ?nif_stub().
mm_comilt_ss(_Dst,_Src) -> ?nif_stub().
mm_comile_ss(_Dst,_Src) -> ?nif_stub().
mm_comigt_ss(_Dst,_Src) -> ?nif_stub().
mm_comige_ss(_Dst,_Src) -> ?nif_stub().
mm_comineq_ss(_Dst,_Src) -> ?nif_stub().
mm_ucomieq_ss(_Dst,_Src) -> ?nif_stub().
mm_ucomilt_ss(_Dst,_Src) -> ?nif_stub().
mm_ucomile_ss(_Dst,_Src) -> ?nif_stub().
mm_ucomigt_ss(_Dst,_Src) -> ?nif_stub().
mm_ucomige_ss(_Dst,_Src) -> ?nif_stub().
mm_ucomineq_ss(_Dst,_Src) -> ?nif_stub().

mm_unpackhi_ps(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_ps(_Dst,_Src) -> ?nif_stub().



mm_add_pd(_Dst,_Src) -> ?nif_stub().
mm_add_sd(_Dst,_Src) -> ?nif_stub().
mm_sub_pd(_Dst,_Src) -> ?nif_stub().
mm_sub_sd(_Dst,_Src) -> ?nif_stub().
mm_mul_pd(_Dst,_Src) -> ?nif_stub().
mm_mul_sd(_Dst,_Src) -> ?nif_stub().
mm_div_pd(_Dst,_Src) -> ?nif_stub().
mm_div_sd(_Dst,_Src) -> ?nif_stub().
mm_sqrt_pd(_Dst,_Src) -> ?nif_stub().
mm_sqrt_sd(_Dst,_Src) -> ?nif_stub().
mm_min_pd(_Dst,_Src) -> ?nif_stub().
mm_min_sd(_Dst,_Src) -> ?nif_stub().
mm_max_pd(_Dst,_Src) -> ?nif_stub().
mm_max_sd(_Dst,_Src) -> ?nif_stub().
mm_and_pd(_Dst,_Src) -> ?nif_stub().
mm_andnot_pd(_Dst,_Src) -> ?nif_stub().
mm_or_pd(_Dst,_Src) -> ?nif_stub().
mm_xor_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_pd(_Dst,_Src) -> ?nif_stub().
mm_cmplt_pd(_Dst,_Src) -> ?nif_stub().
mm_cmple_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpge_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpneq_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpnlt_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpnle_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpngt_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpnge_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpord_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpunord_pd(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_sd(_Dst,_Src) -> ?nif_stub().
mm_cmplt_sd(_Dst,_Src) -> ?nif_stub().
mm_cmple_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpge_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpneq_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpnlt_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpnle_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpngt_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpnge_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpord_sd(_Dst,_Src) -> ?nif_stub().
mm_cmpunord_sd(_Dst,_Src) -> ?nif_stub().
mm_comieq_sd(_Dst,_Src) -> ?nif_stub().
mm_comilt_sd(_Dst,_Src) -> ?nif_stub().
mm_comile_sd(_Dst,_Src) -> ?nif_stub().
mm_comigt_sd(_Dst,_Src) -> ?nif_stub().
mm_comige_sd(_Dst,_Src) -> ?nif_stub().
mm_comineq_sd(_Dst,_Src) -> ?nif_stub().
mm_ucomieq_sd(_Dst,_Src) -> ?nif_stub().
mm_ucomilt_sd(_Dst,_Src) -> ?nif_stub().
mm_ucomile_sd(_Dst,_Src) -> ?nif_stub().
mm_ucomigt_sd(_Dst,_Src) -> ?nif_stub().
mm_ucomige_sd(_Dst,_Src) -> ?nif_stub().
mm_ucomineq_sd(_Dst,_Src) -> ?nif_stub().

mm_unpackhi_pd(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_pd(_Dst,_Src) -> ?nif_stub().



mm_packs_epi16(_Dst,_Src) -> ?nif_stub().
mm_packs_epi32(_Dst,_Src) -> ?nif_stub().
mm_packus_epi16(_Dst,_Src) -> ?nif_stub().
mm_unpackhi_epi8(_Dst,_Src) -> ?nif_stub().
mm_unpackhi_epi16(_Dst,_Src) -> ?nif_stub().
mm_unpackhi_epi32(_Dst,_Src) -> ?nif_stub().
mm_unpackhi_epi64(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_epi8(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_epi16(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_epi32(_Dst,_Src) -> ?nif_stub().
mm_unpacklo_epi64(_Dst,_Src) -> ?nif_stub().
mm_add_epi8(_Dst,_Src) -> ?nif_stub().
mm_add_epi16(_Dst,_Src) -> ?nif_stub().
mm_add_epi32(_Dst,_Src) -> ?nif_stub().
mm_add_epi64(_Dst,_Src) -> ?nif_stub().
mm_adds_epi8(_Dst,_Src) -> ?nif_stub().
mm_adds_epi16(_Dst,_Src) -> ?nif_stub().
mm_adds_epu8(_Dst,_Src) -> ?nif_stub().
mm_adds_epu16(_Dst,_Src) -> ?nif_stub().
mm_sub_epi8(_Dst,_Src) -> ?nif_stub().
mm_sub_epi16(_Dst,_Src) -> ?nif_stub().
mm_sub_epi32(_Dst,_Src) -> ?nif_stub().
mm_sub_epi64(_Dst,_Src) -> ?nif_stub().
mm_subs_epi8(_Dst,_Src) -> ?nif_stub().
mm_subs_epi16(_Dst,_Src) -> ?nif_stub().
mm_subs_epu8(_Dst,_Src) -> ?nif_stub().
mm_subs_epu16(_Dst,_Src) -> ?nif_stub().
mm_madd_epi16(_Dst,_Src) -> ?nif_stub().
mm_mulhi_epi16(_Dst,_Src) -> ?nif_stub().
mm_mullo_epi16(_Dst,_Src) -> ?nif_stub().

mm_mul_epu32(_Dst,_Src) -> ?nif_stub().
mm_slli_epi16(_Dst,_Imm8) -> ?nif_stub().
mm_slli_epi32(_Dst,_Imm8) -> ?nif_stub().
mm_slli_epi64(_Dst,_Imm8) -> ?nif_stub().
mm_srai_epi16(_Dst,_Imm8) -> ?nif_stub().
mm_srai_epi32(_Dst,_Imm8) -> ?nif_stub().
mm_srli_si128(_Dst,_Imm8) -> ?nif_stub().
mm_slli_si128(_Dst,_Imm8) -> ?nif_stub().
mm_srli_epi16(_Dst,_Imm8) -> ?nif_stub().
mm_srli_epi32(_Dst,_Imm8) -> ?nif_stub().
mm_srli_epi64(_Dst,_Imm8) -> ?nif_stub().
mm_sll_epi16(_Dst,_Src) -> ?nif_stub().
mm_sll_epi32(_Dst,_Src) -> ?nif_stub().
mm_sll_epi64(_Dst,_Src) -> ?nif_stub().
mm_sra_epi16(_Dst,_Src) -> ?nif_stub().
mm_sra_epi32(_Dst,_Src) -> ?nif_stub().
mm_srl_epi16(_Dst,_Src) -> ?nif_stub().
mm_srl_epi32(_Dst,_Src) -> ?nif_stub().
mm_srl_epi64(_Dst,_Src) -> ?nif_stub().
mm_and_si128(_Dst,_Src) -> ?nif_stub().
mm_andnot_si128(_Dst,_Src) -> ?nif_stub().
mm_or_si128(_Dst,_Src) -> ?nif_stub().
mm_xor_si128(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_epi8(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_epi16(_Dst,_Src) -> ?nif_stub().
mm_cmpeq_epi32(_Dst,_Src) -> ?nif_stub().
mm_cmplt_epi8(_Dst,_Src) -> ?nif_stub().
mm_cmplt_epi16(_Dst,_Src) -> ?nif_stub().
mm_cmplt_epi32(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_epi8(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_epi16(_Dst,_Src) -> ?nif_stub().
mm_cmpgt_epi32(_Dst,_Src) -> ?nif_stub().




mm_max_epi16(_Dst,_Src) -> ?nif_stub().
mm_max_epu8(_Dst,_Src) -> ?nif_stub().
mm_min_epi16(_Dst,_Src) -> ?nif_stub().
mm_min_epu8(_Dst,_Src) -> ?nif_stub().

mm_mulhi_epu16(_Dst,_Src) -> ?nif_stub().
mm_shufflehi_epi16(_Dst,_Src,_Imm8) -> ?nif_stub().
mm_shufflelo_epi16(_Dst,_Src,_Imm8) -> ?nif_stub().
mm_shuffle_epi32(_Dst,_Src,_Imm8) -> ?nif_stub().

mm_avg_epu8(_Dst,_Src) -> ?nif_stub().
mm_avg_epu16(_Dst,_Src) -> ?nif_stub().
mm_sad_epu8(_Dst,_Src) -> ?nif_stub().





mm_addsub_ps(_Dst,_Src) -> ?nif_stub().
mm_hadd_ps(_Dst,_Src) -> ?nif_stub().
mm_hsub_ps(_Dst,_Src) -> ?nif_stub().


mm_addsub_pd(_Dst,_Src) -> ?nif_stub().
mm_hadd_pd(_Dst,_Src) -> ?nif_stub().
mm_hsub_pd(_Dst,_Src) -> ?nif_stub().



mm_hadd_epi16(_Dst,_Src) -> ?nif_stub().
mm_hadd_epi32(_Dst,_Src) -> ?nif_stub().
mm_hadds_epi16(_Dst,_Src) -> ?nif_stub().



mm_hsub_epi16(_Dst,_Src) -> ?nif_stub().
mm_hsub_epi32(_Dst,_Src) -> ?nif_stub().
mm_hsubs_epi16(_Dst,_Src) -> ?nif_stub().



mm_maddubs_epi16(_Dst,_Src) -> ?nif_stub().

mm_mulhrs_epi16(_Dst,_Src) -> ?nif_stub().

mm_shuffle_epi8(_Dst,_Src) -> ?nif_stub().

mm_sign_epi8(_Dst,_Src) -> ?nif_stub().
mm_sign_epi16(_Dst,_Src) -> ?nif_stub().
mm_sign_epi32(_Dst,_Src) -> ?nif_stub().





mm_abs_epi8(_Dst,_Src) -> ?nif_stub().
mm_abs_epi16(_Dst,_Src) -> ?nif_stub().
mm_abs_epi32(_Dst,_Src) -> ?nif_stub().



mm_min_epi8(_Dst,_Src) -> ?nif_stub().
mm_max_epi8(_Dst,_Src) -> ?nif_stub().
mm_min_epu16(_Dst,_Src) -> ?nif_stub().
mm_max_epu16(_Dst,_Src) -> ?nif_stub().
mm_min_epi32(_Dst,_Src) -> ?nif_stub().
mm_max_epi32(_Dst,_Src) -> ?nif_stub().
mm_min_epu32(_Dst,_Src) -> ?nif_stub().
mm_max_epu32(_Dst,_Src) -> ?nif_stub().
mm_mullo_epi32(_Dst,_Src) -> ?nif_stub().
mm_mul_epi32(_Dst,_Src) -> ?nif_stub().
mm_testz_si128(_Dst,_Src) -> ?nif_stub().
mm_testc_si128(_Dst,_Src) -> ?nif_stub().
mm_testnzc_si128(_Dst,_Src) -> ?nif_stub().


mm_move(_Dst,_Src) -> ?nif_stub().
mm_set(_Dst,_Data) -> ?nif_stub().
mm_load(_Dst,_Offset,_Data) -> ?nif_stub().
mm_get(_Src) -> ?nif_stub().

%% fixme: tuple?
mm_read(u8, Src) -> [ X || <<X:8/native>> <= mm_get(Src)];
mm_read(u16, Src) -> [ X || <<X:16/native>> <= mm_get(Src)];
mm_read(u32, Src) -> [ X || <<X:32/native>> <= mm_get(Src)];
mm_read(u64, Src) -> [ X || <<X:64/native>> <= mm_get(Src)];
mm_read(i8, Src) -> [ X || <<X:8/signed-native>> <= mm_get(Src)];
mm_read(i16, Src) -> [ X || <<X:16/signed-native>> <= mm_get(Src)];
mm_read(i32, Src) -> [ X || <<X:32/signed-native>> <= mm_get(Src)];
mm_read(i64, Src) -> [ X || <<X:64/signed-native>> <= mm_get(Src)];
mm_read(ss, Src) -> [ X || <<X:32/float-native>> <= mm_get(Src)];
mm_read(pd, Src) -> [ X || <<X:64/float-native>> <= mm_get(Src)].

mm_write(u8, Dst, Xs) -> mm_set(Dst, << <<X:8/native>> || X <- Xs >>);
mm_write(u16, Dst, Xs) -> mm_set(Dst, << <<X:16/native>> || X <- Xs >>);
mm_write(u32, Dst, Xs) -> mm_set(Dst, << <<X:32/native>> || X <- Xs >>);
mm_write(u64, Dst, Xs) -> mm_set(Dst, << <<X:64/native>> || X <- Xs >>);
mm_write(i8, Dst, Xs) -> mm_set(Dst, << <<X:8/signed-native>> || X <- Xs >>);
mm_write(i16, Dst, Xs) -> mm_set(Dst, << <<X:16/signed-native>> || X <- Xs >>);
mm_write(i32, Dst, Xs) -> mm_set(Dst, << <<X:32/signed-native>> || X <- Xs >>);
mm_write(i64, Dst, Xs) -> mm_set(Dst, << <<X:64/signed-native>> || X <- Xs >>);
mm_write(ss, Dst, Xs) -> mm_set(Dst, << <<X:32/float-native>> || X <- Xs >>);
mm_write(ps, Dst, Xs) -> mm_set(Dst, << <<X:32/float-native>> || X <- Xs >>);
mm_write(pd, Dst, Xs) -> mm_set(Dst, << <<X:64/float-native>> || X <- Xs >>).

info(_Info) -> ?nif_stub().
