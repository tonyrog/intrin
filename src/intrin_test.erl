%%% @author Tony Rogvall <tony@rogvall.se>
%%% @copyright (C) 2015, Tony Rogvall
%%% @doc
%%%    Some intrin examples and tests
%%% @end
%%% Created :  4 Feb 2015 by Tony Rogvall <tony@rogvall.se>

-module(intrin_test).

-compile(export_all).

test_x86_1() ->
    %% square pi
    x86:mm_write(pd, xmm1, [math:pi(), math:pi()]),
    x86:mm_mul_pd(xmm1, xmm1),
    x86:mm_read(pd, xmm1).
    
%% Q0 = {1,2,3,4}
%% Q1 = Q0
%% Q2 = Q0*Q1

test_neon_1() ->
    neon:vwrite(f32, d0, [1,2]),
    neon:vmov(d1, d0),
    neon:vmul_f32(d2, d1, d0),
    neon:vread(f32, d2).

test_neon_2() ->
    neon:vwrite(f32, q0, [1,2,3,4]),
    neon:vmov(q1, q0),
    neon:vmulq_f32(q2, q1, q0),
    neon:vread(f32, q2).


test_blend() ->
    Src = <<<<X>> || X <- lists:seq(2, 2+1536-1)>>,
    Dst = <<<<X>> || X <- lists:seq(3, 3+1536-1)>>,
    blend_argb(Src, Dst).

%% (source) blend two binaries on for ARGBARGB ...
%% 
%% << <<((blend(A0,A0,A1)):8,
%%       (blend(A0,R0,R1)):8,
%%       (blend(A0,G0,G1)):8,
%%       (blend(A0,B0,B1)):8 >> ||
%%     <<A0,R0,G0,B0>> <= Src;
%%     <<A1,R1,G1,B1>> <= Dst >>
%%

blend_argb(Src, Dst) ->
    blend_argb_(Src, Dst, <<>>).

blend_argb_(<<V1:16/binary,Src/binary>>,
	    <<V2:16/binary,Dst/binary>>,Acc) ->
    Acc1 = << (blend_vector(V1, V2))/binary, Acc/binary>>,
    blend_argb_(Src, Dst, Acc1);
blend_argb_(<<>>, <<>>, Acc) ->
    Acc.

blend_vector() ->
    A = <<5,25,25,25, 10,50,50,50, 100,100,100,100, 200,3,100,200>>,
    B = <<0,100,100,100, 0,10,10,10, 0,25,25,25, 100,70,30,20>>,
    C = blend_vector(A, B),
    C86 = x86_blend(A,B),
    {C, C86}.
	     
blend_vector(<<P1:4/binary,P2:4/binary,
	       P3:4/binary,P4:4/binary>>,
	     <<Q1:4/binary,Q2:4/binary,
	       Q3:4/binary,Q4:4/binary>>) ->
    R1 = blend_pixel(P1,Q1),
    R2 = blend_pixel(P2,Q2),
    R3 = blend_pixel(P3,Q3),
    R4 = blend_pixel(P4,Q4),
    <<R1/binary,R2/binary,R3/binary,R4/binary>>.

blend_pixel(<<A0,R0,G0,B0>>, <<A1,R1,G1,B1>>) ->
    A = A0, %% 
    Ar = blend(A,A0,A1),
    Rr = blend(A,R0,R1),
    Gr = blend(A,G0,G1),
    Br = blend(A,B0,B1),
    <<Ar,Rr,Gr,Br>>.
	    
blend(A,S,D) ->
    (A*(S-D) + (D*256)) div 256.


%% blend (4) ARGB pixels in Src with (4) ARGB pixels in Dst
x86_blend(Src, Dst) ->
    Zero = xmm0, x86:mm_xor_si128(xmm0, xmm0),
    T16 = xmm1, A16 = xmm2, 
    S16 = xmm3, D16 = xmm4,
    L16 = xmm5, H16 = xmm6,

    %% LOW 64
    x86:mm_set(S16, Src),             %% S16=Src
    x86:mm_unpacklo_epi8(S16, Zero),  %% S16=select low part of S16
    x86:mm_move(A16, S16),            %% A16=S16
    x86_seta(A16, T16),
    x86:mm_set(D16,Dst),
    x86:mm_unpacklo_epi8(D16, Zero),
    x86_blnda(S16, A16, T16, D16, L16),

    %% HIGH 64
    x86:mm_set(S16, Src),
    x86:mm_unpackhi_epi8(S16, Zero),
    x86:mm_move(A16, S16),           %% A16=S16
    x86_seta(A16,T16),                   %% setup alpha
    x86:mm_set(D16,Dst),             %% D16 = Dst
    x86:mm_unpackhi_epi8(D16, Zero), %% D16 = high part of D16
    x86_blnda(S16, A16, T16, D16, H16),

    %% Pack (will not work if L16 or H16 is not in range [0..255]!!!
    x86:mm_packus_epi16(L16, H16),
    x86:mm_get(L16).

%% given A16 =
%%           |   A2|   R2|   G2|   B2|   A3|   R3|   G3|   B3|
%% make
%%           |   A2|   A2|   A2|   A2|   A3|   A3|   A3|   A3|
x86_seta(A16, T16) ->
    x86:mm_slli_epi64(A16, 48),       %% A16 <<= 48
    x86:mm_move(T16, A16),            %% T16 = A16
    x86:mm_srli_epi64(T16, 16),       %% A16 >>= 16
    x86:mm_or_si128(A16, T16),        %% A16 |= T16
    x86:mm_move(T16, A16),            %% T16 = A16
    x86:mm_srli_epi64(T16, 32),       %% T16 >>= 32
    x86:mm_or_si128(A16, T16).        %% A16 |= T16

%% seta using ssse3 instruction
seta_ssse3(A16, T16) ->
    x86:mm_set(T16, <<16#00,16#01,16#00,16#01,16#00,16#01,16#00,16#01,
		      16#08,16#09,16#08,16#09,16#08,16#09,16#08,16#09>>),
    x86:mm_shuffle_epi8(A16, T16).

x86_blnda(S16, A16, T16, D16, R16) ->
    x86:mm_move(T16,S16),              %% T16=S16
    x86:mm_sub_epi16(T16, D16),        %% T16=S-D
    x86:mm_slli_epi16(D16, 8),         %% D16 <<= 8
    x86:mm_mullo_epi16(T16,A16),       %% T16 *= A16
    x86:mm_add_epi16(T16, D16),        %% T16 += D16
    x86:mm_move(R16,T16),              %% L16 = T16
    x86:mm_srli_epi16(R16, 8).         %% L16 >>= 8


%% blend (4) ARGB pixels in Src with (4) ARGB pixels in Dst
%% | d0 | d1 | d2 | d3 | d4 | d5 | d6 | d7 | d8 | d9 |
%% |    q0   |    q1   |    q2   |    q3   |    q4   |
neon_blend(Src, Dst) ->
    T16 = q1, T16H = d2, T16L = d3,
    A16 = q2,
    S16 = q3, S16H = d6, S16L = d7,
    D16 = q4, %% D16H = d8, D16L = d9,
    L16 = q5, H16 = q6,

    %% io:format("Src = ~w\n", [Src]),
    %% io:format("Dst = ~w\n", [Dst]),
    
    %% LOW 64
    neon:vset(S16, Src),              %% S16=Src
    neon:vmovl_u8(A16, S16L),         %% A16=select low part of S16
    neon:vmov(S16, A16),              %% S16 is the lower part 16 bit
    neon_seta(A16, T16),              %% generate 16 bit alpha values
    neon:vset(T16,Dst),
    neon:vmovl_u8(D16, T16L),        %% D16=unpack low D16
    %% io:format("low: A16 = ~w\n", [neon:vread(u16,A16)]),
    %% io:format("low: S16 = ~w\n", [neon:vread(u16,S16)]),
    %% io:format("low: D16 = ~w\n", [neon:vread(u16,D16)]),
    neon_blnda(S16, A16, T16, D16, L16),
    %% io:format("low: L16 = ~w\n", [neon:vread(u16,L16)]),

    %% HIGH 64
    neon:vset(S16, Src),
    neon:vmovl_u8(A16, S16H),        %% A16=unpack high S16
    neon:vmov(S16, A16),             %% S16 is the high part 16 bit
    neon_seta(A16,T16),              %% setup alpha
    neon:vset(T16,Dst),              %% T16 = Dst
    neon:vmovl_u8(D16, T16H),        %% D16=unpack high D16
    %% io:format("high: A16 = ~w\n", [neon:vread(u16,A16)]),
    %% io:format("high: S16 = ~w\n", [neon:vread(u16,S16)]),
    %% io:format("high: D16 = ~w\n", [neon:vread(u16,D16)]),
    neon_blnda(S16, A16, T16, D16, H16),
    %% io:format("low: H16 = ~w\n", [neon:vread(u16,H16)]),

    neon:vmovn_u16(T16L, L16),         %% narrow the low part
    neon:vmovn_u16(T16H, H16),         %% narrow the high part
    neon:vget(T16).


%% given A16 =
%%           |   A2|   R2|   G2|   B2|   A3|   R3|   G3|   B3|
%% make
%%           |   A2|   A2|   A2|   A2|   A3|   A3|   A3|   A3|
neon_seta(A16, T16) ->
    neon:vshlq_n_u64(A16, A16, 48),  %% A16 <<= 48
    neon:vmov(T16, A16),             %% T16 = A16
    neon:vshrq_n_u64(T16,T16,16),    %% T16 >>= 16
    neon:veorq_u8(A16, A16, T16),    %% A16 |= T16
    neon:vmov(T16, A16),             %% T16 = A16
    neon:vshrq_n_u64(T16,T16, 32),   %% T16 >>= 32
    neon:veorq_u8(A16,A16,T16).      %% A16 |= T16

neon_blnda(S16, A16, T16, D16, R16) ->
    neon:vmov(T16,S16),                 %% T16=S16
    neon:vsubq_s16(T16, T16, D16),      %% T16=S-D
    neon:vshlq_n_s16(D16,D16,8),        %% D16 <<= 8
    neon:vmulq_s16(T16,T16,A16),        %% T16 *= A16
    neon:vaddq_s16(T16,T16,D16),        %% T16 += D16
    neon:vshrq_n_s16(R16,T16,8).        %% L16 = T16 >> 8
