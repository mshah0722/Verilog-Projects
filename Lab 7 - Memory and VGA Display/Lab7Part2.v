// Part 2 skeleton

module Lab7Part2
    (
        CLOCK_50,                        //    On Board 50 MHz
        // Your inputs and outputs here
        KEY,                            // On Board Keys
        SW,
        // The ports below are for the VGA output.  Do not change.
        VGA_CLK,                           //    VGA Clock
        VGA_HS,                            //    VGA H_SYNC
        VGA_VS,                            //    VGA V_SYNC
        VGA_BLANK_N,                        //    VGA BLANK
        VGA_SYNC_N,                        //    VGA SYNC
        VGA_R,                           //    VGA Red[9:0]
        VGA_G,                             //    VGA Green[9:0]
        VGA_B                           //    VGA Blue[9:0]
    );

    input            CLOCK_50;                //    50 MHz
    input    [3:0]    KEY;    
    input [9:0] SW;                
    // Declare your inputs and outputs here
    // Do not change the following outputs
    output            VGA_CLK;                   //    VGA Clock
    output            VGA_HS;                    //    VGA H_SYNC
    output            VGA_VS;                    //    VGA V_SYNC
    output            VGA_BLANK_N;                //    VGA BLANK
    output            VGA_SYNC_N;                //    VGA SYNC
    output    [7:0]    VGA_R;                   //    VGA Red[7:0] Changed from 10 to 8-bit DAC
    output    [7:0]    VGA_G;                     //    VGA Green[7:0]
    output    [7:0]    VGA_B;                   //    VGA Blue[7:0]
    
    wire reset;
    assign reset = KEY[0];
    
    // Create the colour, x, y and writeEn wires that are inputs to the controller.

    wire [2:0] colour;
    wire [7:0] x;
    wire [6:0] y;
    wire go;
    reg plot;
    wire Lx, Ly, Lc, enable;
    wire [2:0] DataColour;

    assign go = ~KEY[3];
    assign colour = SW[9:7];

    always @(*) begin
        case (~KEY[2])
            1'b1: plot = 1'b1;
            1'b0: plot = ~KEY[1];
            default: plot = ~KEY[1];
        endcase
    end

    // Create an Instance of a VGA controller - there can be only one!
    // Define the number of colours as well as the initial background
    // image file (.MIF) for the controller.
    vga_adapter VGA(
            .resetn(reset),
            .clock(CLOCK_50),
            .colour(DataColour),
            .x(x),
            .y(y),
            .plot(plot),
            /* Signals for the DAC to drive the monitor. */
            .VGA_R(VGA_R),
            .VGA_G(VGA_G),
            .VGA_B(VGA_B),
            .VGA_HS(VGA_HS),
            .VGA_VS(VGA_VS),
            .VGA_BLANK(VGA_BLANK_N),
            .VGA_SYNC(VGA_SYNC_N),
            .VGA_CLK(VGA_CLK));
        defparam VGA.RESOLUTION = "160x120";
        defparam VGA.MONOCHROME = "FALSE";
        defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
        defparam VGA.BACKGROUND_IMAGE = "black.mif";
            
    // Put your code here. Your code should produce signals x,y,colour and writeEn
    // for the VGA controller, in addition to any other functionality your design may require.
    control C0(
        .clk(CLOCK_50),
        .resetn(reset),
        .plot(plot),
        .enable(enable),
        .go(go),

        .lx(Lx), 
        .ly(Ly),
        .lc(Lc)
    );

    datapath D0(
        .clk(CLOCK_50),
        .resetn(reset),
        .plot(plot),
        .enable(enable),

        .lx(Lx), 
        .ly(Ly),
        .lc(Lc),
        .lb(~KEY[2]),
        .xin(SW[6:0]),
        .yin(SW[6:0]),
        .colour(colour),
        .cout(DataColour),
        .xout(x),
        .yout(y)
    );
    
endmodule

module control(clk, resetn, plot, enable, go, lx, ly, lc);

    input clk;
    input go;
    input resetn;
    input plot;
    output reg enable;
    output reg lx;
    output reg ly; 
    output reg lc;

    reg [3:0] current_state;
    reg [3:0] next_state;
    
    localparam  S_LOAD_X       = 3'd0,
                S_LOAD_WAIT_X  = 3'd1,
                S_LOAD_Y          = 3'd2,
                S_LOAD_WAIT_Y  = 3'd3,
                CYCLE_0        = 3'd4,
                S_DONE         = 3'd5;
                    
    always@(*)
    begin: state_table
            case (current_state)
                S_LOAD_X: next_state = go ? S_LOAD_WAIT_X : S_LOAD_X;
                S_LOAD_WAIT_X: next_state = go ? S_LOAD_WAIT_X : S_LOAD_Y; 
                S_LOAD_Y: next_state = go ? S_LOAD_WAIT_Y : S_LOAD_Y;    
                S_LOAD_WAIT_Y: next_state = go ? S_LOAD_WAIT_Y : CYCLE_0; 
                CYCLE_0: next_state = S_DONE;
                S_DONE: next_state = S_LOAD_X;
                default: next_state = S_LOAD_X;
            endcase
    end
   
always @(*)
    begin: enable_signals
        // By default make all our signals 0
        lx = 1'b0;
        enable = 1'b0;
        lc = 1'b0;
        ly = 1'b0;
  
 
        case (current_state)
            S_LOAD_X: begin
                lx = 1'b1;
                lc = 1'b1;
                enable = 1'b0;    
                ly = 1'b0;
            end
                          
            S_LOAD_Y: begin
                lx = 1'b0;
                lc = 1'b0;
                enable = 1'b0;    
                ly = 1'b1;
            end
                          
            CYCLE_0: begin
                lx = 1'b0;
                lc = 1'b0;
                enable = 1'b1;    
                ly = 1'b0;
            end
                          
            S_DONE: begin
                lx = 1'b0;
                lc = 1'b0;
                enable = 1'b1;    
                ly = 1'b0;
            end
      endcase
    end
                    
    // current_state registers
    always@(posedge clk)
    begin: state_FFs
        if (!resetn)
            current_state <= S_LOAD_X;
        else
            current_state <= next_state;
    end // state_FFS
endmodule 


module datapath(lx, ly, lc, lb, xin, yin, enable, plot, resetn, clk, xout, yout, colour, cout);

    input clk;
    input resetn;
    input plot;
    input enable;
    input lx;
    input ly; 
    input lc;
    input lb;

    input [2:0] colour;
    input [6:0] xin;
    input [6:0] yin;
    output reg [7:0] xout = 0;
    output reg [6:0] yout = 0;
    output reg [2:0] cout = 0;

    reg [2:0] regcolour = 0;
    reg [7:0] Xorigin = 0;
    reg [6:0] Yorigin = 0;
    reg [3:0] counter = 0;
    reg [2:0] regBlack = 0;
    reg [14:0] counterBlack = 0;

    always@(posedge clk) begin
        if (!resetn) begin
            Xorigin <= 8'b0;
            Yorigin <= 7'b0;
            regcolour <= 3'b0;
        end
        else begin

            if (lx)
                Xorigin <= {1'b0, xin};
            if (ly)
                Yorigin <= yin;
            if (lc)
                regcolour <= colour;
        end
    end
        
    always@ (posedge clk) begin
        
        if (lb) begin
            counterBlack <= counterBlack + 1'b1;
            xout <= counterBlack[7:0];
            yout <= counterBlack[14:8];
            cout <= 3'b000;
        end
        else begin
            if (plot)
                begin
                    if (!resetn) begin

                        xout <= 8'b0;
                        yout <= 7'b0;
                        counter <= 4'b0;
                        cout <= 3'b0; 
                        counterBlack <= 15'b0;
                    end
                    if (counter <= 4'b1111) begin

                        counterBlack <= 15'b0;
                        cout <= regcolour  + 1'b0;
                        xout <= Xorigin + counter[1:0];
                        yout <= Yorigin + counter[3:2];
                        counter <= counter + 1'b1;
                    end
                    else begin
                        xout <= xout;
                        yout <= yout;
                        cout <= 3'b0;
                    end
                end
            else begin
                xout <= xout;
                yout <= yout;
            end
        end
    end
endmodule