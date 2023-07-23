You can find the verilog source file of the MIPS 32 core here.
# CORE Overview: 
  clk1 and clk2 should be non overlapping,so that correct pipeline operation is obtained.
  The five stages in the pipeline are:
      Instruction Fetch,Instruction Decode,Execution,Memory Access,Write Back. 
  Instruction and Data Read-Writeable Memory is 1023 bytes.
Let the instruction to be fetched is i.

# Instruction Fetch Stage:
In this satge, pc value is updated,if HALT signal is zero.Let the instruction to be fetched is i.If the (i-2)th instruction(which will be at its wb stage now) has executed a branching instruction with branching condition true,then the (i+1)th instruction has to be fetched from a different location in memory.If branch is taken the i-1 instrcution will be restricted from memory accessing and writing back into register.

# Instruction Decode:
You can find the entire instruction set at this site. https://opencores.org/projects/plasma/opcodes

In this stage,the operands will be decoded from the instruction and the type of operation to be executed in the next stage will be found.
Another important addition in this stage is the hazard detection and forwarding.
Data Hazard:
In a pipelined processor, data hazards occur when there are dependencies between instructions that cause conflicts in accessing or updating data. These hazards can lead to incorrect results or stalls in the pipeline, reducing the performance advantage of pipelining.To overcome this we decode the operands either from the target register or directly from the previous instrcution's execution stage.

# Execution Stage:
This stage is used for doing arithmetic and logical operations.When branching instruction is executed the branching condition will be set based on the result of the operation.

# Memory Accessing Stage:
In this stage the memory will be accessed for writing(STORE)/reading(LOAD).

# Write Back Stage:
In this stage the result of arithmetic operations are writtten into registers and value from memory will be written into register(LOAD).
