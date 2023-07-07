module testbench;
reg clk1,clk2;

integer k;

mips32 uut(
.clk1(clk1),.clk2(clk2));

initial
begin
clk1=0;  clk2=0;
repeat(60)
begin
#5 clk1=1; #5 clk1=0;
#5 clk2=1; #5 clk2=0;
end
end

initial
begin
for (k=0;k<31;k=k+1)
	uut.Reg[k] =k;

uut.Mem[0] = 32'h280a00c8;   //ADDI r10,r0,200
uut.Mem[1] = 32'h28020001;   //ADDI r2,r0,1
uut.Mem[2] = 32'h0e94a000;   //OR   r20,r20,r20
uut.Mem[3] = 32'h21430000;   //LW   r3,0(r10)
uut.Mem[4] = 32'h0e94a000;   //OR   r20,r20,r20
uut.Mem[5] = 32'h14431000;   //Loop:MUL r2,r2,r3
uut.Mem[6] = 32'h2c630001;   //SUBI     r3,r3,1
uut.Mem[7] = 32'h0e94a000;  //OR   r20,r20,r20
uut.Mem[8] = 32'h3460fffc;  //BNEQZ r3,Loop (-4 OFFSET)
uut.Mem[9] = 32'h2542fffe;  //SW  r2,-2(r10)
uut.Mem[10] = 32'hfc000000; //HLT
uut.Mem[200]=32'h00000007;
uut.HALTED = 0;
uut.PC = 0;
uut.TAKEN_BRANCH=0;

end


endmodule
