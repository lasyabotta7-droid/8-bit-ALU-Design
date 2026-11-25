`timescale 1ns/1ps
module tb_alu8;
    reg [7:0] a,b; reg [2:0] opcode;
    wire [7:0] result; wire carry,zero;
    alu8 dut(.a(a),.b(b),.opcode(opcode),.result(result),.carry(carry),.zero(zero));
    task check(input [2:0] op,input [7:0] aa,input [7:0] bb,input [7:0] expected);
    begin opcode=op;a=aa;b=bb;#1;
        if(result!==expected) $fatal(1,"op=%b got=%h expected=%h",op,result,expected);
        $display("PASS op=%b a=%h b=%h result=%h carry=%b zero=%b",op,a,b,result,carry,zero);
    end endtask
    initial begin
        check(3'b000,8'd15,8'd10,8'd25);
        check(3'b001,8'd15,8'd10,8'd5);
        check(3'b010,8'hF0,8'h0F,8'h00);
        check(3'b011,8'hF0,8'h0F,8'hFF);
        check(3'b100,8'hAA,8'hFF,8'h55);
        check(3'b101,8'h0F,8'h00,8'hF0);
        check(3'b110,8'h81,8'h00,8'h02);
        check(3'b111,8'h5A,8'hFF,8'h5A);
        $display("PASS: all ALU tests"); $finish;
    end
endmodule
