`timescale 1ns/1ps
module Test;
reg x,y,s;
wire m;
MyMUX my_mux(.x(x),.y(y),.s(s),.m(m));
initial begin
s = 0;
repeat (16) #5 s = !s;
//$display("m: %b",m);
end
initial begin
x = 0;
repeat (8) #10 x = !x;
end

initial begin
y = 0;
repeat (4) #20 y = !y;
end

endmodule
