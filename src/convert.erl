-module(convert).

-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").
-endif.

-export([d2b/1, d2h/1, d2n/2]).

-type base() :: 2..26.

%% -----------------------------------------------------------------------------

-spec d2b(pos_integer()) -> string().

get_val(Num) ->
    [lists:nth(Num + 1, "0123456789ABCDEFGHIJKLMNOPQ")].

d2b(Num) ->
    d2n(Num, 2).

-spec d2h(pos_integer()) -> string().

d2h(Num) ->
    d2n(Num, 16).

-spec d2n(pos_integer(), base()) -> string().

d2n(Num, Base) ->
    convert_base(Num, Base, "").

convert_base(Num, Base, Result) when Num < Base->
    get_val(Num) ++ Result;
convert_base(Num, Base, Result) ->
    convert_base(Num div Base, Base, get_val(Num rem Base) ++ Result).


%% -----------------------------------------------------------------------------

-ifdef(TEST).

d2b_test() ->
    ?assertEqual(integer_to_list(0, 2), d2b(0)),
    ?assertEqual(integer_to_list(2, 2), d2b(2)),
    ?assertEqual(integer_to_list(4, 2), d2b(4)),
    ?assertEqual(integer_to_list(8, 2), d2b(8)),
    ?assertEqual(integer_to_list(10, 2), d2b(10)),
    ?assertEqual(integer_to_list(15, 2), d2b(15)),
    ?assertEqual(integer_to_list(17, 2), d2b(17)),
    ?assertEqual(integer_to_list(256, 2), d2b(256)),
    ?assertEqual(integer_to_list(1789, 2), d2b(1789)),
    ?assertEqual(integer_to_list(1987, 2), d2b(1987)),
    ?assertEqual(integer_to_list(2093948, 2), d2b(2093948)),
    ?assertEqual(integer_to_list(5672840, 2), d2b(5672840)),
    ?assertEqual(integer_to_list(9857563, 2), d2b(9857563)),
    ?assertEqual(integer_to_list(2845683, 2), d2b(2845683)).

d2h_test() ->
    ?assertEqual(integer_to_list(0, 16), d2h(0)),
    ?assertEqual(integer_to_list(2, 16), d2h(2)),
    ?assertEqual(integer_to_list(4, 16), d2h(4)),
    ?assertEqual(integer_to_list(8, 16), d2h(8)),
    ?assertEqual(integer_to_list(10, 16), d2h(10)),
    ?assertEqual(integer_to_list(15, 16), d2h(15)),
    ?assertEqual(integer_to_list(17, 16), d2h(17)),
    ?assertEqual(integer_to_list(256, 16), d2h(256)),
    ?assertEqual(integer_to_list(1789, 16), d2h(1789)),
    ?assertEqual(integer_to_list(1987, 16), d2h(1987)),
    ?assertEqual(integer_to_list(2093948, 16), d2h(2093948)),
    ?assertEqual(integer_to_list(5672840, 16), d2h(5672840)),
    ?assertEqual(integer_to_list(9857563, 16), d2h(9857563)),
    ?assertEqual(integer_to_list(2845683, 16), d2h(2845683)).

d2n_test() ->
    ?assertEqual(integer_to_list(0, 2), d2n(0,2)),
    ?assertEqual(integer_to_list(2, 4), d2n(2,4)),
    ?assertEqual(integer_to_list(4, 6), d2n(4, 6)),
    ?assertEqual(integer_to_list(8, 7), d2n(8, 7)),
    ?assertEqual(integer_to_list(10, 9), d2n(10, 9)),
    ?assertEqual(integer_to_list(15, 16), d2n(15, 16)),
    ?assertEqual(integer_to_list(17, 14), d2n(17, 14)),
    ?assertEqual(integer_to_list(256, 16), d2n(256, 16)),
    ?assertEqual(integer_to_list(1789, 20), d2n(1789, 20)),
    ?assertEqual(integer_to_list(1987, 22), d2n(1987, 22)),
    ?assertEqual(integer_to_list(2093948, 24), d2n(2093948, 24)),
    ?assertEqual(integer_to_list(5672840, 23), d2n(5672840, 23)),
    ?assertEqual(integer_to_list(9857563, 16), d2n(9857563, 16)),
    ?assertEqual(integer_to_list(2845683, 26), d2n(2845683, 26)).

-endif.