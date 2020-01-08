  
module vector(clk, xin, xout, rxout);
    input clk;
    input [6:0] xin;

    output reg [6:0] xout = 0;
    output reg rxout = 0;

    reg rx = 0;
    reg [2:0] speedcount = 0;
    
    always @(posedge clk) begin

        case(rx)
            1'b0: begin
                if (xin == 7'd124)
                    rxout <= 1'b1;
                        
                else if (speedcount >= 3'd2)
                    xout <= xin + 7'd1;
                end
            1'b1: begin
                if (xin == 7'd0)
                    rxout <= 1'b0;
                        
                else if (speedcount >= 3'd2)
                    xout <= xin - 7'd1;
                end
            default: rxout <= 1'b0;
        endcase
    end
endmodule