`timescale 1ns/1ps
module MyMUX(input x,y,s,output m);

wire N1;
wire N2;
wire N3;
wire N4;


assign #1 N1 = ~s;
assign #1 N2 = x & N1;
assign #1 N3 = s & y;
assign #1 N4 = x & y;
assign #1 m = N3 | N2 | N4;

endmodule
