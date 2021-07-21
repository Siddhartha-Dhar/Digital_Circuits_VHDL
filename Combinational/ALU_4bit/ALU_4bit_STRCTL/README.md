# ALU_4bit_Structural_Modeling
Construction of 4 bit ALU in VHDL using Structural Modeling

## Design of the ALU
### The Top Level design of the 4 bit ALU is as follows:
![ALU_TopLevel](https://github.com/Siddhartha1999/ALU_4bit_Structural_Modeling/blob/main/ALU_TopLevel.png)

### The next abstracted view of the 4 bit ALU is as follows:
![ALU_Detailed](https://github.com/Siddhartha1999/ALU_4bit_Structural_Modeling/blob/main/ALU_Detailed.png)

** The more detailed implementations of the Blocks can be found in the Documentation.pdf File

### The Set of Operations performed by the 4bit ALU is as follows:

| S3  | S2  | S1  | S0  | Cin  |   Operation  |
|:---:|:---:|:---:|:---:|:----:|:------------:|
| 0| 0| 0| 0| 0 | (A+B) Addition |
| 0| 0| 0| 0| 1 | (A+B+1) Addition with Carry |
| 0| 0| 0| 1| 0 | (A+B') Subtract with Borrow |
| 0| 0| 0| 1| 1 | (A+B'+1) Subtraction |
| 0| 0| 1| 0| 0 | (A-1) Decrement |
| 0| 0| 1| 0| 1 | (A) Transfer |
| 0| 0| 1| 1| 0 | (A) Transfer |
| 0| 0| 1| 1| 1 | (A+1) Increment |
| 0| 1| 0| 0| - | A and B (bitwise) |
| 0| 1| 0| 1| - | A or B (bitwise) |
| 0| 1| 1| 0| - | A xor B (bitwise) |
| 0| 1| 1| 1| - | A' (Complement Bitwise) |
| 1| 0| 0| 0| - | Logical Left Shift A |
| 1| 0| 0| 1| - | Logical Right Shift A |
| 1| 0| 1| 0| - | Arithmetic Left Shift A |
| 1| 0| 1| 1| - | Arithmetic Right Shift A |
