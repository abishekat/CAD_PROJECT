module ALU(
  output reg signed [31:0] alu_out,
  output reg beq_in_1,
  input signed [31:0] alu_ip_1, alu_ip_2,
  input [1:0] alu_op_ctrl,
  input alu_ctrl, beq_inst
  );
  
  /* 
  ALU OUTPUT SIGNALS
  00 - ADD
  01 - SUB
  10 - AND
  11 - XOR
  
  */
  
  always @(*)
  
  begin 
    if(alu_ctrl)
      begin
        case(alu_op_ctrl)
            2'd0 : alu_out = alu_ip_1 + alu_ip_2;
            2'd1 : alu_out = alu_ip_1 - alu_ip_2;
            2'd2 : alu_out = alu_ip_1 & alu_ip_2;
            2'd3 : alu_out = alu_ip_1 ^ alu_ip_2;
          endcase
        end
    else
      alu_out = 32'bX;   
    end
    
    always @(alu_out, beq_inst)
    begin
      if(beq_inst)
        begin
          if(alu_out==0)
            beq_in_1 = 1'b1;
          else
            beq_in_1 = 1'b0;
        end
      else
        beq_in_1 = 1'b0;
      
    end
      
endmodule
