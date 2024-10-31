interface encoder_intf();

logic [7:0]din;
logic [2:0]y;


modport dut(input din,output y);

endinterface