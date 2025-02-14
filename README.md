# Basic Erlang Programming Assignment

## Team Members
- Nandan Mogili
- Sreekar Kompella
- Karthik Konuru

## Overview
This project contains two Erlang modules—**p1.erl** and **p2.erl**—that work together to perform specific computations based on user input. The program:
- Reads input from the keyboard using `io:get_line/1` (instead of `io:read/1`).
- Parses the input to determine whether it is a valid integer.
- Performs different computations based on the input:
  - **Non-integer input:** Prints "not an integer".
  - **Negative integer:** Computes and prints the absolute value raised to the 7th power.
  - **Zero:** Prints `0` and terminates the loop.
  - **Positive integer:** 
    - If a multiple of 7, prints the 5th root.
    - Otherwise, prints the factorial of the number.
- Uses tail recursion for the looping mechanism in module **p2**.

## File Descriptions
- **p1.erl**  
  Contains:
  - `process_input/1`: Processes the input number according to the specified rules.
  - `factorial/1`: A tail-recursive function to compute the factorial of a nonnegative integer.

- **p2.erl**  
  Contains:
  - `start/0` and `loop/0`: Functions that implement the user input loop. It reads a line from the user, parses it into an integer (or handles errors), calls `p1:process_input/1` to perform computations, and repeats until the user enters `0`.

## Compilation and Execution
1. **Compile the modules** in the Erlang shell:
   ```erlang
   1> c(p1).
   2> c(p2).
   ```


## How to Run
1. Compile the modules in the Erlang shell:
    ```erlang
   1> c(p1).
   2> c(p2).
   ```
2. Start the loop by calling:
    ```erlang
   3> p2:start().
   ```

The program will prompt for a number, process the input as specified, and continue prompting until you enter 0.
