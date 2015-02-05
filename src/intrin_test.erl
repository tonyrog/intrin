%%% @author Tony Rogvall <tony@rogvall.se>
%%% @copyright (C) 2015, Tony Rogvall
%%% @doc
%%%    Some intrin examples and tests
%%% @end
%%% Created :  4 Feb 2015 by Tony Rogvall <tony@rogvall.se>

-module(intrin_test).

-compile(export_all).

%% float squre a float vector on neon

%% Q0 = {1,2,3,4}
%% Q1 = Q0
%% Q2 = Q0*Q1

test_neon_1() ->
    neon:vset(d0, <<<<X:32/native-float>> || X <- [1,2]>>),
    neon:vset(d1, intrin:vget(q0)),
    neon:vmulq_f32(d2, d1, d0),
    [ Y || <<Y:32/native-float>> <= neon:vget(d2)].

test_neon_2() ->
    neon:vset(q0, << <<X:32/native-float>> || X <- [1,2,3,4]>>),
    neon:vset(q1, intrin:vget(q0)),
    neon:vmulq_f32(q2, q1, q0),
    [ Y || <<Y:32/native-float>> <= neon:vget(q2)].

