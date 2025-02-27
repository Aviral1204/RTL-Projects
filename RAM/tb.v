module tb;
  parameter ADD_WIDTH = 4 ;
  parameter DATA_WIDTH = 8;
  
  reg clk;
  reg en;
  reg [ADD_WIDTH-1:0]addr;
  reg [DATA_WIDTH-1:0]d_in;
  wire [DATA_WIDTH-1:0]d_out;
  
  RAM #(.ADD_WIDTH(ADD_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)) uut(.clk(clk), 
                                     .en(en) ,
                                     .addr(addr),
                                     .d_in(d_in),
                                     .d_out(d_out));
  
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    en = 0 ;
    d_in = 0;
    addr = 0;
    
    #10 en = 1;
    addr = 4'b0000;  d_in = 8'h3A ; #10 ;
     addr = 4'b0001;  d_in = 8'h5A ; #10 ;
     addr = 4'b0010;  d_in = 8'h7A ; #10 ;
    
       
    en = 0; #10;
    addr = 4'b0000;#10;
    addr = 4'b0001;#10;
    addr = 4'b0010;#10;
    
      
    $stop;
    
  end
                                     
  
endmodule
