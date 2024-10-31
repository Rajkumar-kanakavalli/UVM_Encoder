module encoder_dut(encoder_intf.dut intf);

always@(intf.din) begin
 case(intf.din)
	8'b0000_0001 : intf.y = 3'b000;
	8'b0000_0010 : intf.y = 3'b001;
	8'b0000_0100 : intf.y = 3'b010;
	8'b0000_1000 : intf.y = 3'b011;
	8'b0001_0000 : intf.y = 3'b100;
	8'b0010_0000 : intf.y = 3'b101;
	8'b0100_0000 : intf.y = 3'b110;
	8'b1000_0000 : intf.y = 3'b111;
	default intf.y=3'bxxx;
 endcase
end

endmodule