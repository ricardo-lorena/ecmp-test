`timescale 1ns / 1ps
`include "iob_lib.vh"

module circuit
 #(
    parameter W=32
    )
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(en,1),
   `OUTPUT(y,W)
	
   );

   `SIGNAL(cnt, 7) //7-bit counter as iterator
   
   `SIGNAL(y_int, W) //internal y
   `SIGNAL(y_int_n_1, W) 
   `SIGNAL(x, W) 
   `SIGNAL2OUT(y, y_int) //connect internal y to output
	

   //y shift register 
   `REG_ARE(clk, rst, 1'b0, cnt!=99, y_int_n_1, y_int)

`COUNTER_ARE(clk, rst, cnt!=99, cnt)
`COMB begin 
if (cnt==0) y_int=x;
else
y_int = 2*y_int_n_1  +x; 


end

  
   
endmodule
