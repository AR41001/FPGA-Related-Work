`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2025 02:57:38
// Design Name: 
// Module Name: HexBCD
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


module HexBCD(
input  logic clkIn,
input  logic rst,
output logic [3:0] anode,
output logic [6:0] seg
);

logic [3:0] hex_value;

// Counter instance
HexCounter counter (clkIn, hex_value, rst);

// 7-seg converter
bcdto7seg display (hex_value,seg);

// Enable only rightmost digit (AN0), others off
assign anode = 4'b1110;

endmodule
