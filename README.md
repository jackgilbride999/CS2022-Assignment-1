# VHDL Processor

High-Level Implementation Details:
- The processor contains 9 registers. 8 are accessable via assembly level instructions in memory and are labeled from "000" to "111". A ninth processor, labeled "1000" is available to the control to store values during microcoded operations without affecting the values in other registers.
- The registers each hold 16 bits.
- The Arithmetic Logic Unit (ALU) is implemented using a 16-bit ripple adder.
- The 16-bit Shifter Unit performs logical shift operations, i.e. the bit 0 is shifted in from both the left and right.
- The datapath contains functionality for addition, subtraction, logical shift and register transfer operations. Operations such as multiplication will be performed by the datapath sequencing microoperations within the datapath.
- The condition code flags coming out of the datapath are set by the ALU but not the shifter. Thus their output is undefined for shift operations.
- Control memory contains 256 28-bit addresses, using the least significant 8 bits of the addresses.
- External memory contains 512 16-bit addresses, using the least significant 9 bits of the address.
- The processor will implement the following assembly level instructions; ADI, LD, SR, INC, NOT, ADD , unconditional jump and a conditional branch.
