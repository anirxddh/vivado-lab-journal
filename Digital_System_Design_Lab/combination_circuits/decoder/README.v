# 3-to-8 Decoder - Verilog Implementation

## Objective

Design and simulate a 3-to-8 binary decoder using Verilog in AMD Vivado.
The circuit converts a 3-bit binary input into a one-hot 8-bit output.

## What Is a Decoder?

A decoder is a combinational circuit that converts an `n`-bit binary input into up to `2^n` individual output lines. For this design, the input has three bits, so there are eight possible input combinations:

```text
2^3 = 8
```

For each input value, exactly one output becomes high. The active output position corresponds to the decimal value of the input. This one-hot output format is useful for selecting one device, memory location, control signal, or circuit path at a time.

## Input and Output Mapping

The input bus is `a[2:0]`, and the output bus is `y[7:0]`.

| Input `a` | Active output | Output `y[7:0]` |
| --------- | ------------- | --------------- |
| 000       | `y[0]`        | 00000001        |
| 001       | `y[1]`        | 00000010        |
| 010       | `y[2]`        | 00000100        |
| 011       | `y[3]`        | 00001000        |
| 100       | `y[4]`        | 00010000        |
| 101       | `y[5]`        | 00100000        |
| 110       | `y[6]`        | 01000000        |
| 111       | `y[7]`        | 10000000        |

For example, when `a = 3'b101`, the binary input represents decimal 5, so output `y[5]` becomes 1 and the complete output is `8'b00100000`.

## Logic Equations

Each output corresponds to one exact combination of the three input bits:

```text
y[0] = ~a[2] & ~a[1] & ~a[0]
y[1] = ~a[2] & ~a[1] &  a[0]
y[2] = ~a[2] &  a[1] & ~a[0]
y[3] = ~a[2] &  a[1] &  a[0]
y[4] =  a[2] & ~a[1] & ~a[0]
y[5] =  a[2] & ~a[1] &  a[0]
y[6] =  a[2] &  a[1] & ~a[0]
y[7] =  a[2] &  a[1] &  a[0]
```

Each equation is an AND term, also called a minterm. An output becomes high only when the input bits match its corresponding pattern. For example, `y[6]` is high only for `a = 3'b110`.

## Truth Table

| `a[2:0]` | `y[7:0]` | Active output |
| -------- | -------- | ------------- |
| 000      | 00000001 | `y[0]`        |
| 001      | 00000010 | `y[1]`        |
| 010      | 00000100 | `y[2]`        |
| 011      | 00001000 | `y[3]`        |
| 100      | 00010000 | `y[4]`        |
| 101      | 00100000 | `y[5]`        |
| 110      | 01000000 | `y[6]`        |
| 111      | 10000000 | `y[7]`        |

The output is one-hot for every valid binary input: one output bit is 1 and all other output bits are 0. This makes the decoder useful when a binary control value must activate exactly one destination.

## Decoder Operation Example

Consider the input `a = 3'b011`:

```text
a[2] = 0
a[1] = 1
a[0] = 1
```

Only the equation for `y[3]` evaluates to 1:

```text
y[3] = ~0 & 1 & 1 = 1
```

All other output equations contain at least one term that evaluates to 0. Therefore:

```text
y[7:0] = 8'b00001000
```

## Module Interface

| Signal | Width | Direction | Description |
| ------ | ----- | --------- | ----------- |
| `a`    | 3     | Input     | Binary input code |
| `y`    | 8     | Output    | One-hot decoded output |

## Testbench Behavior

The testbench applies all eight possible input values in ascending order:

```text
000, 001, 010, 011, 100, 101, 110, 111
```

The expected output moves the single high bit from `y[0]` through `y[7]`:

```text
00000001, 00000010, 00000100, 00001000,
00010000, 00100000, 01000000, 10000000
```

This verifies that every input code activates the correct output line.

## Files

decoder3x8.v - Verilog design module implementing the 3-to-8 decoder
decoder3x8_tb.v - Testbench used to verify all eight input combinations

## RTL Schematic

![RTL](images/logic_diagram.png)

The RTL schematic shows the NOT and AND logic used to generate the eight one-hot output lines from the 3-bit input.

## Simulation Waveform

![Waveform](images/waveform_behav.png)

The waveform verifies that each 3-bit input code activates the corresponding output bit. As the input counts from `000` to `111`, the single high output moves from `y[0]` to `y[7]`.

Observations:

- Every possible 3-bit input is tested
- Exactly one output is high for each input combination
- Input `000` activates `y[0]`
- Input `111` activates `y[7]`
- The output is one-hot throughout the simulation

This confirms correct functionality of the 3-to-8 decoder.
