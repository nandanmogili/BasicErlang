%% p1.erl
-module(p1).
-export([process_input/1, factorial/1]).

%% team: Nandan Mogili, Sreekar Kompella, Karthik Konuru

%% process_input/1:
%%   Processes an integer input by determining which operation to perform.
%%
%%   - 0: Simply outputs 0.
%%   - Negative integer: Computes the absolute value raised to the 7th power.
%%   - Positive integer:
%%       * If it is a multiple of 7: Computes the 5th root.
%%       * Otherwise: Computes the factorial.
%%
%% For non-integer input, a descriptive error message is printed.
process_input(Number) when is_integer(Number) ->
    case Number of
        0 ->
            io:format("Input is 0. Output: 0~n");
        N when N < 0 ->
            Result = math:pow(abs(N), 7),
            io:format("Input is negative (~w). Operation: Absolute value raised to the 7th power (|N|^7). Result: ~w~n", [N, Result]);
        N when N > 0 ->
            if N rem 7 == 0 ->
                    Root = math:pow(N, 1/5),
                    io:format("Input (~w) is a multiple of 7. Operation: 5th root. Result: ~w~n", [N, Root]);
               true ->
                    F = factorial(N),
                    io:format("Input (~w) is positive but not a multiple of 7. Operation: Factorial. Result: ~w~n", [N, F])
            end
    end;
process_input(Other) ->
    io:format("Input error: ~w is not an integer.~n", [Other]).

%% factorial/1: Computes the factorial of a nonnegative integer using tail recursion.
factorial(N) when N >= 0 ->
    factorial(N, 1).

factorial(0, Acc) ->
    Acc;
factorial(N, Acc) when N > 0 ->
    factorial(N - 1, Acc * N).
