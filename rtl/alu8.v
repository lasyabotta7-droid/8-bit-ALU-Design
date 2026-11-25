module alu8(
    input  wire [7:0] a, b,
    input  wire [2:0] opcode,
    output reg  [7:0] result,
    output reg        carry,
    output wire       zero
);
    reg [8:0] tmp;
    always @* begin
        result=8'h00; carry=1'b0; tmp=9'h000;
        case(opcode)
            3'b000: begin tmp={1'b0,a}+{1'b0,b}; result=tmp[7:0]; carry=tmp[8]; end
            3'b001: begin tmp={1'b0,a}-{1'b0,b}; result=tmp[7:0]; carry=(a>=b); end
            3'b010: result=a&b;
            3'b011: result=a|b;
            3'b100: result=a^b;
            3'b101: result=~a;
            3'b110: begin result=a<<1; carry=a[7]; end
            3'b111: result=a;
        endcase
    end
    assign zero=(result==8'h00);
endmodule
