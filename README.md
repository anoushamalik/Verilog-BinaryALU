
# Binary Arithmetic Logic Unit (ALU)

This project is a Verilog implementation of a 4-bit Binary Arithmetic Logic Unit (ALU). The ALU performs basic arithmetic and logical operations on two 4-bit binary inputs (`A` and `B`) based on a 2-bit selection signal (`sel`). The operations include addition, bitwise AND, bitwise OR, and bitwise NOT operations. The design also includes a carry input (`Cin`) and produces a carry output (`Cout`).

## Features

- **4-bit Arithmetic Operations:**
  - **Addition:** Adds two 4-bit numbers with an optional carry-in.
- **4-bit Logical Operations:**
  - **AND:** Performs a bitwise AND operation between two 4-bit numbers.
  - **OR:** Performs a bitwise OR operation between two 4-bit numbers.
  - **NOT:** Performs a bitwise NOT operation on the first 4-bit input (`A`) and outputs the result.
- **Two’s Complement Handling:** If the operation involves subtraction (determined by `M`), the result is automatically adjusted to reflect two's complement.

## Inputs and Outputs

### Inputs

- **A [3:0]:** 4-bit input operand.
- **B [3:0]:** 4-bit input operand.
- **sel [1:0]:** 2-bit selection signal to choose the operation.
- **M:** Mode signal to control the operation (used for two's complement).
- **Cin:** Carry input (used in addition).

### Outputs

- **Sum [3:0]:** 4-bit output result of the selected operation.
- **Cout [3:0]:** 4-bit carry output, mainly relevant for addition.

## Operation Selection

The ALU's operation is determined by the `sel` signal:

- **`sel = 2'b00` (Addition):**
  - Performs binary addition of `A` and `B` with a carry-in (`Cin`). The result is stored in `Sum`, and the carry-out is stored in `Cout`.
  - Handles two's complement subtraction when `M = 1`.

- **`sel = 2'b01` (AND):**
  - Performs a bitwise AND operation between `A` and `B`. The result is stored in `Sum`.

- **`sel = 2'b10` (OR):**
  - Performs a bitwise OR operation between `A` and `B`. The result is stored in `Sum`.

- **`sel = 2'b11` (NOT):**
  - Performs a bitwise NOT operation on `A`. The result is stored in `Sum`.
  - Also outputs the bitwise NOT of `B` in `Cout`.

## Usage

### Simulation and Synthesis

1. **Simulation:** You can simulate the ALU using any Verilog-compatible simulation tool such as ModelSim, Xilinx ISim, or Vivado.
2. **Synthesis:** This code can be synthesized for use on FPGA platforms. Ensure that the target FPGA board supports 4-bit operations and the necessary I/O configuration.


## Contributing

Feel free to contribute by submitting issues or pull requests. Any enhancements to the ALU operations or optimizations are welcome.

## License

This project is open-source and available under the MIT License. See the LICENSE file for more details.
