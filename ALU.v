 module Binary_Alu(A,B,sel,M,Cin,Sum,Cout);
  input[3:0]A,B;
  input[1:0]sel;
  input M,Cin;
 
  assign Cin = M;
  output reg[3:0]Sum,Cout;
 
  always@(A or B or sel or M or Cin or Sum or Cout)
  case(sel)
    2'b00:
   
    begin
   Sum[0] = (A[0]^(B[0]^M))^Cin;
   Cout[0] = (A[0]&(B[0]^M))|((A[0]^(B[0]^M))&Cin);

   Sum[1] = (A[1]^(B[1]^M))^Cout[0];
   Cout[1] = (A[1]&(B[1]^M))|((A[1]^(B[1]^M))&Cout[0]);

   Sum[2] = (A[2]^(B[2]^M))^Cout[1];
   Cout[2] = (A[2]&(B[2]^M))|((A[2]^(B[2]^M))&Cout[1]);

   Sum[3] = (A[3]^(B[3]^M))^Cout[2];
   Cout[3] = (A[3]&(B[3]^M))|((A[3]^(B[3]^M))&Cout[2]);
 
 if(M==1 && Cout[3] == 0)
   Sum = ((!Sum)+1);
 end
 
 2'b01:
 begin
   Sum = A&B;
 end
 
 2'b10:
 begin
   Sum = A|B;
 end
 
 2'b11:
 begin
   Sum[0] = !A[0];
   Sum[1] = !A[1];
   Sum[2] = !A[2];
   Sum[3] = !A[3];
   
   Cout[0] = !B[0];
   Cout[1] = !B[1];
   Cout[2] = !B[2];
   Cout[3] = !B[3];
end
endcase
endmodule
