module car_parking_system_tb();

    
reg clk,front_sensor,back_sensor;
reg  [3:0] password;
reg [3:0] input_password;
    

   wire gate_open;

    // Instantiate the car parking system module
    car_parking_system ab(clk,front_sensor,back_sensor, password,input_password,gate_open);

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test scenario
    initial begin
        // Initialize inputs
        front_sensor = 0;
        back_sensor = 0;
        password = 4'b1010;
        input_password = 4'b0000;

        // Apply front sensor
        #10 front_sensor = 1;
        #10 front_sensor = 0;

        // Wait for password input
        #10 input_password = 4'b1101;

        // Wait for password verification
        #10 input_password = 4'b1010;

        // Check if gate is open
        #10 $display("Gate open: %b", gate_open);

        // Apply back sensor
        #10 back_sensor = 1;
        #10 back_sensor = 0;

        // Check if gate is closed
        #10 $display("Gate open: %b", gate_open);

        // End simulation
        #10 $finish;
    end

endmodule

module car_parking_system(clk,front_sensor,back_sensor, password,input_password,gate_open);
input clk,front_sensor,back_sensor;
input  [3:0] password;
input [3:0] input_password;
    output reg gate_open;
parameter IDLE = 2'b00, PASSWORD_VERIFIED = 2'b01,  CAR_EXIT = 2'b10, WAIT_FOR_PASSWORD = 2'b11;
reg [1:0] state, next_state;
     // logic [2:0] state{IDLE,WAIT_FOR_PASSWORD,PASSWORD_VERIFIED,CAR_EXIT}state, next_state;

    always @(posedge clk)
 begin
        if (front_sensor)
            next_state <= WAIT_FOR_PASSWORD;
        else if (back_sensor)
            next_state <= CAR_EXIT;
        else if (input_password != 4'b0000)
            next_state <= PASSWORD_VERIFIED;
        else
            next_state <= IDLE;
    end

    always @(posedge clk) begin
        if (front_sensor)
            state <= next_state;
        else if (back_sensor)
            state <= next_state;
        else if (input_password != 4'b0000)
            state <= next_state;
        else
            state <= next_state;
    end

    always @(posedge clk) begin
        if (state == PASSWORD_VERIFIED)
            gate_open <= 1'b1;
        else
            gate_open <= 1'b0;
    end

endmodule
