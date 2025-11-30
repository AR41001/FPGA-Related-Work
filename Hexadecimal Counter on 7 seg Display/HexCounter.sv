`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2025 03:00:29
// Design Name: 
// Module Name: HexCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module HexCounter(
input logic clkIn,
output logic [3:0] HexCount,
input logic rst
    );
    
    
    reg div_clk;
    ClockDivider my_divider ( clkIn, rst, div_clk );
  
    
    always_ff @(posedge div_clk or posedge rst)
    begin
        if (rst) begin
            HexCount <= 0; end
        else if ( HexCount == 4'b1111 ) begin
            HexCount <= 4'b0000; end
        else begin
            HexCount <= HexCount + 1; end
            
    end     
endmodule
