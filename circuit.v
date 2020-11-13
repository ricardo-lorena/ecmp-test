`timescale 1ns / 1ps
`include "iob_lib.vh"

module circuit
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(en,1),
   `INPUT(x,32),
   `OUTPUT(y,32)
   );

   `SIGNAL(acc, 32)
   `ACC_ARE(clk, rst, 1'b0, en, acc, x)
   `SIGNAL2OUT(y, acc)
   
endmodule
