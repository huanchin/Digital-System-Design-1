module asu_gate (x, y, mode, carry, out);
input [7:0] x, y;
input mode;
output carry;
output [7:0] out;

/*Write your code here*/
wire [7:0] o1;
wire [7:0] o2;
wire temp1;
adder add1(x,y,temp1,o1);
barrel_shifter bs1(x,{y[2],y[1],y[0]},o2);

assign carry= (mode==1'b0) ?1'b0 :temp1;
assign out=(mode==1'b0) ?o2:o1;

/*End of code*/


endmodule

module mux (x,a,b,sel);
input 	a,b,sel;
output 	x;
wire sel_i,w1,w2;

not n0(sel_i,sel);
and a1(w1,a,sel_i);
and a2(w2,b,sel);
or  #2.5 o1(x,w1,w2);

	
endmodule