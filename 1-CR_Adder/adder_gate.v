module adder_gate(x, y, carry, out);
input [7:0] x, y;
output carry;
output [7:0] out;

/*Write your code here*/
wire [6:0] cc;
hadder h0(x[0],y[0],cc[0],out[0]);
fadder f1(x[1],y[1],cc[0],cc[1],out[1]);
fadder f2(x[2],y[2],cc[1],cc[2],out[2]);
fadder f3(x[3],y[3],cc[2],cc[3],out[3]);
fadder f4(x[4],y[4],cc[3],cc[4],out[4]);
fadder f5(x[5],y[5],cc[4],cc[5],out[5]);
fadder f6(x[6],y[6],cc[5],cc[6],out[6]);
fadder f7(x[7],y[7],cc[6],carry,out[7]);

/*End of code*/

endmodule


module fadder(x, y, ci, co, s);
input x,y,ci;
output co,s;
wire [2:0] temp;
and #1 and1(temp[0],x,y);
and #1 and2(temp[1],x,ci);
and #1 and3(temp[2],y,ci);
or #1 or1(co,temp[0],temp[1],temp[2]);
xor #1 xor1(s,x,y,ci);
endmodule

module hadder(x, y, co, s);
input x,y;
output co,s;
and #1 and1(co,x,y);
xor #1 xor1(s,x,y);

endmodule
