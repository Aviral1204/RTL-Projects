// Code your testbench here
// or browse Examples

module tb;
  reg clk ;
  reg rst ;
  reg din;
  
  wire sequence_found;
  
  sequence_det uut(
    .clk(clk),
    .rst(rst),
    .din(din),
    .sequence_found(sequence_found)
  );
  
  initial begin
  clk = 0;
  forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1;
    din = 0;
    #10 rst = 0;
    
    din = 1 ; #10;
      din = 0 ; #10;
      din = 1 ; #10;
      din = 1 ; #10;
      din = 0 ; #10;
      din = 1 ; #10;
      din = 0 ; #10;
    din = 1 ; #10;
    din = 0 ; #10;
    $stop;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
  end
  
endmodule
