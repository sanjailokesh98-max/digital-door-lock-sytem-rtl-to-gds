`timescale 1ns/1ps 

module digital_door_lock(
    input clk,
    input reset,
    input [3:0] password,
    input enter,
    output reg door_unlock,
    output reg wrong_password
);

    parameter [3:0] CORRECT_PASSWORD = 4'b1010;

    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            door_unlock <= 1'b0;
            wrong_password <= 1'b0;
        end
        else if (enter)
        begin
            if (password == CORRECT_PASSWORD)
            begin
                door_unlock <= 1'b1;
                wrong_password <= 1'b0;
            end
            else
            begin
                door_unlock <= 1'b0;
                wrong_password <= 1'b1;
            end
        end
    end

endmodule

