
`timescale 1ns/1ps

module digital_door_lock_tb;

    reg clk;
    reg reset;
    reg [3:0] password;
    reg enter;

    wire door_unlock;
    wire wrong_password;

    digital_door_lock uut (
        .clk(clk),
        .reset(reset),
        .password(password),
        .enter(enter),
        .door_unlock(door_unlock),
        .wrong_password(wrong_password)
    );

        always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        password = 4'b0000;
        enter = 0;

        $monitor("Time=%0t | Reset=%b | Password=%b | Enter=%b | Door Unlock=%b | Wrong Password=%b",
                  $time, reset, password, enter, door_unlock, wrong_password);

        #10;
        reset = 0;

        #10;
        password = 4'b1010;
        enter = 1;
        #10;
        enter = 0;

        #10;
        password = 4'b1100;
        enter = 1;
        #10;
        enter = 0;

        #10;
        password = 4'b0001;
        enter = 1;
        #10;
        enter = 0;

        #10;
        password = 4'b1010;
        enter = 1;
        #10;
        enter = 0;

        #10;
        reset = 1;
        #10;
        reset = 0;

        #20;
        $finish;

    end

endmodule
