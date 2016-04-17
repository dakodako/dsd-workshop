module part2(SW,LEDR,KEY);
input [1:0] SW;
input [0:0] KEY;
wire z;
//input [9:0] LEDR;
assign LEDR[9] = z;
output [9:0] LEDR;
wire Reset = ~SW[0];
wire clk = KEY[0];
wire w = SW[1];
reg [8:0] y_Q,y_D;//y_Q represents the current state, y_D represents the next state
parameter A = 4'b0000, B = 4'b0001, C = 4'b0010, 
D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110,
 H = 4'b0111, I = 4'b1000;

 always@(w, y_Q)
 begin: state_table
 	case(y_Q)
 		A: if(!w) y_D = B;
 			else y_D = F;
 		B: if(!w) y_D = C;
 			else y_D = F;
 		C: if(!w) y_D = D;
 			else y_D = F;
 		D: if(!w) y_D = E;
 			else y_D = F;
 		E: if(!w) y_D = E;
 			else y_D = F;
 		F: if(!w) y_D = B;
 			else y_D = G;
 		G: if(!w) y_D = B;
 			else y_D = H;
 		H: if(!w) y_D = B;
 			else y_D = I;
 		I: if(!w) y_D = B;
 			else y_D = I;
 		default: y_D = A;
 	endcase
 end// state_table
always@(posedge clk) 
begin: state_FFs
	if(Reset) y_Q <= A;
	else y_Q <= y_D;
end// state_FFs
assign z = (y_Q == E) | (y_Q == I);
assign LEDR[3:0] = y_Q;
endmodule
