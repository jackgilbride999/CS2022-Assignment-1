# VHDL Processor

High-Level Implementation Details:
- 8 registers from address "000" to address "111".
- The registers each hold 16 bits.
- The Arithmetic Logic Unit (ALU) is implemented using a 16-bit ripple adder.
- The 16-bit Shifter Unit performs logical shift operations, i.e. the bit 0 is shifted in from both the left and right.
- The datapath contains functionality for addition, subtraction, logical shift and register transfer operations. Operations such as multiplication will be performed by the datapath sequencing microoperations within the datapath.
- The condition code flags coming out of the datapath are set by the ALU but not the shifter. Thus their output is undefined for shift operations.
