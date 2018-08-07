module barrel_shifter_gate(in, shift, out);
input  [7:0] in;
input  [2:0] shift;
output [7:0] out;

/*Write your code here*/
wire gnd;
assign gnd = 1'b0;
wire [7:0] temp1;
wire [7:0] temp2;

mux m00(temp1[0],in[0],gnd,shift[0]);
mux m01(temp1[1],in[1],in[0],shift[0]);
mux m02(temp1[2],in[2],in[1],shift[0]);
mux m03(temp1[3],in[3],in[2],shift[0]);
mux m04(temp1[4],in[4],in[3],shift[0]);
mux m05(temp1[5],in[5],in[4],shift[0]);
mux m06(temp1[6],in[6],in[5],shift[0]);
mux m07(temp1[7],in[7],in[6],shift[0]);

mux m10(temp2[0],temp1[0],gnd,shift[1]);
mux m11(temp2[1],temp1[1],gnd,shift[1]);
mux m12(temp2[2],temp1[2],temp1[0],shift[1]);
mux m13(temp2[3],temp1[3],temp1[1],shift[1]);
mux m14(temp2[4],temp1[4],temp1[2],shift[1]);
mux m15(temp2[5],temp1[5],temp1[3],shift[1]);
mux m16(temp2[6],temp1[6],temp1[4],shift[1]);
mux m17(temp2[7],temp1[7],temp1[5],shift[1]);

mux m20(out[0],temp2[0],gnd,shift[2]);
mux m21(out[1],temp2[1],gnd,shift[2]);
mux m22(out[2],temp2[2],gnd,shift[2]);
mux m23(out[3],temp2[3],gnd,shift[2]);
mux m24(out[4],temp2[4],temp2[0],shift[2]);
mux m25(out[5],temp2[5],temp2[1],shift[2]);
mux m26(out[6],temp2[6],temp2[2],shift[2]);
mux m27(out[7],temp2[7],temp2[3],shift[2]);

/*End of code*/
endmodule

module mux (x,a,b,sel);
input 	a,b,sel;
output 	x;
wire sel_i,w1,w2;

not #1 n0(sel_i,sel);
and #1 a1(w1,a,sel_i);
and #1 a2(w2,b,sel);
or  #1 o1(x,w1,w2);

	
endmodule
