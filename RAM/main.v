module RAM #(parameter ADD_WIDTH = 4 , DATA_WIDTH = 8)(
  input wire clk,
  input wire en,
  input wire [ADD_WIDTH-1:0]addr,
  input wire [DATA_WIDTH-1:0]d_in,
  output reg [DATA_WIDTH-1:0]d_out);
  
  reg [DATA_WIDTH-1:0]mem[2**ADD_WIDTH-1:0];
  
  always @(posedge clk) begin
    if(en)
      mem[addr] <= d_in;
    else
      d_out <= mem[addr];
    end
  
endmodule
