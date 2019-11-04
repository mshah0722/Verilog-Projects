module Lab5Part3(SW, KEY, CLOCK_50, LEDR);
    input [2:0]SW;
    input [1:0]KEY;
    input CLOCK_50;
    output reg [0:0]LEDR;

    wire enable; // 2Hz clock pulse generated for 0.5 period
    wire [26:0] half_sec_timer = 27'b001011111010111100001000000; // 0.5 sec count (2Hz)
    reg [26:0] counter;
	 
    reg [12:0] seq; // Morse Code Data
	reg [12:0] shifted_seq;
    
    initial LEDR[0] <= 0;
    initial counter <= 0;
    initial seq <= 0;
    initial shifted_seq <= 0; 
    
    always@(SW)
        begin
            case(SW)
                3'b000: seq = 13'b1010000000000; //I
                3'b001: seq = 13'b1011101110111; //J
                3'b010: seq = 13'b1110111010000; //K
                3'b011: seq = 13'b1011101010000; //L
                3'b100: seq = 13'b1110111000000; //M
                3'b101: seq = 13'b1110100000000; //N
                3'b110: seq = 13'b1110111011100; //O
                3'b111: seq = 13'b1011101110100; //P
                default: seq = 13'b0;
            endcase
        end
	
    always@(posedge enable or negedge KEY[0] or negedge KEY[1]) // 2Hz rising edge
        begin
		  
				if (KEY[0] == 1'b0)
					begin
						LEDR[0] <= 0;
						shifted_seq <= 13'b0000000000000;
					end
				else if (KEY[1] == 1'b0)
					shifted_seq <= seq;
					
				else if (enable == 1'b1)
					begin
						LEDR[0] <= shifted_seq[12];
						shifted_seq = shifted_seq << 1;
					end
        end
		  
    // Generate 2Hz clock
    assign enable = (counter == 27'b0) ? 1'b1 : 1'b0;
    always@(posedge CLOCK_50)
        begin
            if (counter >= half_sec_timer)
                counter <= 27'b0;
            else
                counter <= counter + 1;
        end
endmodule