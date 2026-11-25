# 8-bit ALU (Verilog)

Supports ADD, SUB, AND, OR, XOR, NOT A, and logical shift-left.
`zero` is asserted when the result is zero; `carry` is the carry-out for ADD
and the no-borrow indicator for SUB.

## Opcodes
- 000 ADD
- 001 SUB
- 010 AND
- 011 OR
- 100 XOR
- 101 NOT A
- 110 Shift-left A
- 111 Pass A

## Run
```bash
iverilog -g2012 -o sim.out rtl/alu8.v tb/tb_alu8.v
vvp sim.out
```
