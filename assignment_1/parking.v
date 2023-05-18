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
