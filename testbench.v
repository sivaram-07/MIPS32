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

uut.Mem[0] = 32'h280a00c8;
uut.Mem[1] = 32'h28020001;
uut.Mem[2] = 32'h0c94a000;
uut.Mem[3] = 32'h21430000;
uut.Mem[4] = 32'h0c94a000;
uut.Mem[5] = 32'h14431000;
uut.Mem[6] = 32'h2c630001;
uut.Mem[7] = 32'h0e94a000;
uut.Mem[8] = 32'h3460fffc;
uut.Mem[9] = 32'h2542fffe;
uut.Mem[10] = 32'hfc000000;
uut.Mem[200]=32'h00000007;
uut.HALTED = 0;
uut.PC = 0;
uut.TAKEN_BRANCH=0;

end


endmodule