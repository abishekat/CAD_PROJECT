module PC_TEST_BENCH;
  
  wire [31:0] pc_out;
  reg [31:0] pc_in;
  reg pc_ctrl, clk;
  
  PROGRAM_COUNTER PC_TEST(pc_out,pc_in,pc_ctrl,clk);
  
  initial
    clk = 1;
    always 
    #50 clk = ~clk;
    
  initial
    begin
      
    
      #100 pc_ctrl = 1'b1;
      #2   pc_in   = 32'd5;
      
      #100 pc_ctrl = 1'b0;
      #2   pc_in   = 32'd13;
      
    
      
      $display ("PC_CTRL(%1d) PC_IN(%2d) = PC_OUT(%2d)",pc_ctrl, pc_in, pc_out);
      
    end
    
    initial
     begin
        $dumpfile("pc.vcd");
        $dumpvars(0,PC_TEST_BENCH);
     end
  
endmodule
