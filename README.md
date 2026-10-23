1. Objectives

The purpose of this lab is to implement an automatic decimal up-counter of numbers 0-4095 on the Basys 3 7-segment display. Doing so requires both combinational and sequential, including the creation of a clock-powered Multi-Segment Driver (MSD), a Binary to Binary Coded Decimal (BCD) converter based on the double dabble algorithm, various sub-modules to aid in implementation, and top level module connecting the system together. 

2. Introduction

Because this system required a significant number of modules, we utilized a hierarchical approach in our design. At the lowest level, the AnodeCounter, Decoder2to4, Mux4to1, and BCDto7SD modules are in tandem with each other to generate the MSD subsystem. The MSD module, alongside the Counter, ClockDiv, and BintoBCD modules, are instantiated within the top module to fully implement the up-counter.

In an effort to reuse code from previous labs, we opted to design the MSD subsystem using a 2-bit counter that generated the selection signals for the 2-to-4 Decoder and 4-to-1 Mux rather than using a shift register. The counter’s output represents the digit currently being illuminated (b00 for ones place, b01 for tens place, etc.), and is used both as the selector for the mux (allowing the value of one numerical place to be converted to its 7SD value) and as the input for the decoder (allowing said value’s corresponding 7SD digit to illuminate). 

Due to the nature of the system, however, there exists some overlap between levels of the design. For instance, the Counter module required a ~1 Hz clock rate to ensure the up-counting behavior ran at a reasonable pace, whereas the MSD (more specifically, the Anode Counter) required a ~1 KHz clock rate to rapidly switch between the digits of the 7SD, giving the illusion that all 4 digits illuminate simultaneously. Additionally, the BintoBCD module takes the original clock, as the double-dabble algorithm requires a significant number of cycles to complete its conversion.

Nonetheless, the counter came together elegantly in the top level module, which required only 2 inputs (a clock signal and active low reset) and 3 outputs (the anode selection for the digit, the converted 7SD digit value, and a ready signal). This allowed both simpler testing in the top level testbench module and straightforward physical implementation on the board itself.


3. Additional Sources

https://hilite.me/ - Used to format Appendix code in Lab Report
