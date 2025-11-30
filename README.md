**FPGA Projects**

- A portfolio of FPGA based projects demonstrating understanding of implementing different systems on an FPGA Board.
- These projects are done on **Vivado 2018.2**
- The Board used for this repository is Basys 3
- The coding is done using SystemVerilog

**Notes for Decade Counter on FPGA**
  -  Its simply a counter which counts from 0 to 9 and if it counts further, reset occurs and the counter starts from 0 again
  -  The internal clock of the FPGA was not used since it works on 100MHz which is too fast to observe the lights behavior with a naked eye, hence the SW1 switch was manually used as a clk input
  -  To achieve this the clock was disabled in the constraints file using the following line "set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]"
  -  Ideally for a design the internal clock is used with a divide logic

**Notes for Moving LED Display**
  -  This code implements a high level logic of LED lights of a car ( for example an Audi where the signalling lights move ) moving sequentially from right to left and vice versa
  -  The clock is implemented for 1Hz so that it is visible to the human eye, which is why the "ClockDivider.sv" is present. The natural 100MHz clock goes in that module and the output signal is a 1Hz clock
  -  The top module is "sequentiallights.sv", here the logic is implemented in a way that if the control input is low the lights move in one direction and when it is high it changes the direction
  -  The reset button resets the cycle

**Notes for Hexadecimal Counter on 7 segment**
  -  This code is intended to practice using the 7 segment display on the FPGA board
  -  Similar to the above mentioned project, the same clock divider is used and amended to handle the functionality of the 7 segment display since the backend logic is in a way that for us the see the proper digits, the timing needs to be proper
  -  Another file is created "BCD_Seg.sv" which has predefined values for the 7 segment which is called in the top module in order to make the design more hierarchichal
  -  The file "HexCounter" simply counts from 0-F in a cycle
  -  Finally, the top module "HexBCD" calls all these together so we can see the counter from 0-F on the right most 7 segment display of the FPGA
  -  Pictures added in the folder

