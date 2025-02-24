
module tb_vending_machine;

   
    reg clk;
    reg reset;
    reg nickel_in;
    reg dime_in;
    reg quarter_in;

   
    wire soda_out;
    wire [3:0] change_out;

  vending_machine uut (
        .clk(clk),
        .reset(reset),
        .nickel_in(nickel_in),
        .dime_in(dime_in),
        .quarter_in(quarter_in),
        .soda_out(soda_out),
        .change_out(change_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        nickel_in = 0;
        dime_in = 0;
        quarter_in = 0;
        #10 reset = 0; 

        dime_in = 1; #10; 
        dime_in = 0; #10;
        nickel_in = 1; #10; 
        nickel_in = 0; #10;
   

       
        quarter_in = 1; #10; 
        quarter_in = 0; #10;
       

        dime_in = 1; #10; 
        dime_in = 0; #10;
        dime_in = 1; #10; 
        dime_in = 0; #10;
   

        $stop;
    end
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end
  
endmodule
