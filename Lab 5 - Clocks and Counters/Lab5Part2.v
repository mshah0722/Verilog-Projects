module Lab5Part2(SW, CLOCK_50, HEX0);
    input [1:0] SW;
    input CLOCK_50;
    output [6:0] HEX0;

    reg [3:0] Data_out;
    reg [26:0] count;
    reg [26:0] counter;
    wire enable;

    initial Data_out <= 4'b0;
    initial count <= 27'b000000000000000000000000001;
    initial counter <= 27'b000000000000000000000000000;
    assign enable = (counter == 27'b000000000000000000000000000) ? 1 : 0;

    seg7_HEX u1 (Data_out, HEX0);

    always@(*)
        begin
            case(SW)
                2'b00: count = 27'b000000000000000000000000001;
                2'b01: count = 27'b001011111010111100001000000;
                2'b10: count = 27'b010111110101111000010000000;
                2'b11: count = 27'b101111101011110000100000000;
                default: count = 27'b000000000000000000000000001;
            endcase
        end

    always@(posedge CLOCK_50)
        begin
            if (counter >= count)
                counter <= 27'b000000000000000000000000000;
            else
                counter <= counter + 1;

            if (enable)
                Data_out <= Data_out + 1;
            
            if (Data_out > 4'b1111)
                Data_out <= 0; 
        end

endmodule

module seg7_HEX (data, HEX_display);
    input [0:3] data;
    output [6:0] HEX_display;

    assign HEX_display[0] = (~ data[0] & ~ data[1] & ~ data[2] & data[3]) | (~ data[0] & data[1] & ~ data[2] & ~ data[3]) | (data[0] & ~ data[1] & data[2] & data[3]) | (data[0] & data[1] & ~ data[2] & data[3]);
    assign HEX_display[1] = (data[0] & data[1] & data[2] & data[3]) | (data[0] & data[1] & data[2] & ~ data[3]) | (data[0] & data[1] & ~ data[2] & ~ data[3]) | (data[0] & ~ data[1] & data[2] & data[3]) | (~ data[0] & data[1] & data[2] & ~ data[3]) | (~ data[0] & data[1] & ~ data[2] & data[3]);
    assign HEX_display[2] = (data[0] & data[1] & data[2] & data[3]) | (data[0] & data[1] & data[2] & ~ data[3]) | (data[0] & data[1] & ~ data[2] & ~ data[3]) | (~ data[0] & ~ data[1] & data[2] & ~ data[3]);
    assign HEX_display[3] = (data[0] & data[1] & data[2] & data[3]) | (data[0] & ~ data[1] & data[2] & ~ data[3]) | (data[0] & ~ data[1] & ~ data[2] & data[3]) | (~ data[0] & data[1] & data[2] & data[3]) | (~ data[0] & data[1] & ~ data[2] & ~ data[3]) | (~ data[0] & ~ data[1] & ~ data[2] & data[3]);
    assign HEX_display[4] = (data[0] & ~ data[1] & ~ data[2] & data[3]) | (~ data[0] & data[1] & data[2] & data[3]) | (~ data[0] & data[1] & ~ data[2] & data[3]) | (~ data[0] & data[1] & ~ data[2] & ~ data[3]) | (~ data[0] & ~ data[1] & data[2] & data[3]) | (~ data[0] & ~ data[1] & ~ data[2] & data[3]);
    assign HEX_display[5] = (data[0] & data[1] & ~ data[2] & data[3]) | (~ data[0] & data[1] & data[2] & data[3]) | (~ data[0] & ~ data[1] & data[2] & data[3]) | (~ data[0] & ~ data[1] & data[2] & ~ data[3]) | (~ data[0] & ~ data[1] & ~ data[2] & data[3]);
    assign HEX_display[6] = (data[0] & data[1] & ~ data[2] & ~ data[3]) | (~ data[0] & data[1] & data[2] & data[3]) | (~ data[0] & ~ data[1] & ~ data[2] & data[3]) | (~ data[0] & ~ data[1] & ~ data[2] & ~ data[3]);
endmodule