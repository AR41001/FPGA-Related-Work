`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2025 15:12:42
// Design Name: 
// Module Name: sequentiallights
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


module sequentiallights(
    input logic clkIn,
    input logic control_switch,
    input logic rst,
    output logic [7:0] led
    );
    
    reg div_clk;
    ClockDivider lights ( clkIn, rst, div_clk);
    
    initial begin
    led = 8'd1;
    end
    
    always_ff @(posedge div_clk or posedge rst)
    begin
    
        if (rst) begin
            led <= 8'd1; end
        else if ( control_switch == 1 ) begin
            if ( led == 8'd1 ) begin
                led <= 8'd128; end
            else begin
                led <= led / 2;
             end
          end
          
         else if ( control_switch == 0 ) begin
            if ( led == 8'd128 ) begin
                    led <= 8'd1; end
            else begin
                    led <= led * 2;
                    end
             end        
                             
    end
endmodule
