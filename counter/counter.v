/* module */
module top (
    input CLK,
    output LED1,
    output LED2,
    output LED3,
    output LED4,
    output LED5,
    output LED6,
    output LED7,
    output LED8
);

    /* reg */
    reg [32:0] counter;

    /* assign */
    assign LED1 = counter[24];
    assign LED2 = counter[25];
    assign LED3 = counter[26];
    assign LED4 = counter[27];
    assign LED5 = counter[28];
    assign LED6 = counter[29];
    assign LED7 = counter[30];
    assign LED8 = counter[31];


    /* always */
    always @ (posedge CLK) begin
        counter <= counter + 1;
    end

endmodule

