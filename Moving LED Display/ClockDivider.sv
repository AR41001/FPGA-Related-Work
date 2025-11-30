`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2025 15:13:17
// Design Name: 
// Module Name: ClockDivider
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

module ClockDivider(
    input  logic clkin,     // 100 MHz
    input  logic rst,       // async reset
    output logic div_clk    // 1 Hz output
);

    // 27 bits are enough because 2^27 = 134M > 100M
    logic [26:0] count;

    always_ff @(posedge clkin or posedge rst) begin
        if (rst) begin
            count   <= 0;
            div_clk <= 0;
        end else begin
            if (count == 50000000 - 1) begin
                count   <= 0;
                div_clk <= ~div_clk;   // toggle clock
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule
