%% p2.erl
-module(p2).
-export([start/0, loop/0]).

%% team: Nandan Mogili, Sreekar Kompella, Karthik Konuru

%% get_number/0: Reads a line of input from the keyboard.
get_number() ->
    io:get_line("Enter a number: ").

%% parse_number/1: Trims the input and attempts to convert it to an integer.
%% Returns {ok, Int} if successful; otherwise, returns {error, not_integer}.
parse_number(String) ->
    Trimmed = string:trim(String),
    case Trimmed of
        "" ->
            {error, not_integer};
        _ ->
            case catch string:to_integer(Trimmed) of
                {Int, ""} -> {ok, Int};
                _ -> {error, not_integer}
            end
    end.

%% start/0: Entry point for the looping input process.
start() ->
    loop().

%% loop/0: Repeatedly:
%%   - Reads input from the user.
%%   - Parses the input into an integer.
%%   - Calls p1:process_input/1 to perform the corresponding computation.
%%   - Terminates if the input integer is 0.
loop() ->
    Input = get_number(),
    case parse_number(Input) of
         {ok, N} ->
             p1:process_input(N),
             if N =:= 0 ->
                     io:format("Terminating the program as input was 0.~n"),
                     ok;
                true ->
                     loop()
             end;
         {error, not_integer} ->
             io:format("Input error: The entered value is not a valid integer. Please try again.~n"),
             loop()
    end.
