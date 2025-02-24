
module vending_machine(
input wire clk,reset,dime_in,nickel_in,quarter_in,
  output reg soda_out , output reg[3:0] change_out
);
  reg [5:0]total_amt;
  
  typedef enum reg [1:0] 
  {
    IDLE = 2'b00,
    COUNT = 2'b01,
    DISPENCE = 2'b10
  }state;
  
  state current_state , next_state;
  
  
  always @(posedge clk or posedge reset)
  begin
    if(reset)
      begin
        current_state = IDLE;
        total_amt = 0; 
      end
        else 
          current_state = next_state;
     
  end
  
  always @(*)
    begin
      case(current_state) 
        IDLE: begin
          if(dime_in || nickel_in || quarter_in)
            next_state = COUNT;
          else
            next_state = IDLE;
        end
        
        COUNT: begin
          if(total_amt >= 15) 
            next_state = DISPENCE;
          else
            next_state = COUNT;
        end
        
        DISPENCE: begin
          
          next_state = IDLE;
        end
        
        default: next_state = IDLE;
      endcase
    end
  
  always @(posedge clk) begin
    if(reset) 
      total_amt = 0;
    else if(current_state == COUNT) begin
      if(nickel_in)
        total_amt = total_amt + 5;
      else if(dime_in)
        total_amt = total_amt + 10 ;
      else if(quarter_in)
        total_amt = total_amt + 25 ;
    end
    else if(current_state == DISPENCE)
      total_amt = 0;
  end
  
  always @(*) begin
    soda_out = 0;
    change_out = 0;
    if(current_state == DISPENCE) begin
      soda_out = 1;
      if(total_amt > 15)
        change_out = total_amt - 15;
      end
  end
   
endmodule
