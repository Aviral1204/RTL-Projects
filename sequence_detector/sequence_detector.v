// Code your design here
module sequence_det(
  input clk , rst , din,
  output reg sequence_found
);
  
  typedef enum reg [2:0]{
  s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b010,
      s3 = 3'b011,
      s4 = 3'b100
  }state; 
  
  state current_state , next_state;
  
  always @(posedge clk or posedge rst) begin
    if(rst)
      current_state <= s0;
    else
        current_state <= next_state;
  end
  always @(*) begin
    case(current_state)
      s0: if(din == 1)
        next_state <= s1;
      else
        next_state <= s0;
      
      s1: if(din == 0)
        next_state <= s1;
      else
        next_state <= s2;
      
      s2: if(din == 1)
        next_state <= s3;
      else
        next_state <= s0;
      
      s3: if(din == 1)
        next_state <= s4;
      else
        next_state <= s0;
      
      s4: if(din == 1)
        next_state <= s1;
      else
        next_state <= s0;
    endcase
  end
      
      always @(*)begin
        if(next_state == s4)
          sequence_found = 1;
        else 
          sequence_found = 0 ;
      end
endmodule
