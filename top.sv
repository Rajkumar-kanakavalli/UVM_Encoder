`include "uvm_macros.svh"
import uvm_pkg::*;


`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "interface.sv"
`include "dut.sv"
`include "mon1.sv"
`include "agent1.sv"
`include "mon2.sv"
`include "agent2.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
/* `include "sram_inc_addr_sequence.sv"
`include "sram_inc_addr_test.sv"
`include "sram_dec_addr_sequence.sv"
`include "sram_dec_addr_test.sv"
`include "sram_inc_data_rand_addr_sequence.sv"
`include "sram_inc_data_rand_addr_test.sv"
`include "sram_dec_data_rand_addr_sequence.sv"
`include "sram_dec_data_rand_addr_test.sv"
`include "sram_inc_addr_0data_sequence.sv"
`include "sram_inc_addr_0data_test.sv"
 */

module encoder7;

/* bit rst;
bit clk;

initial begin
clk = 1'b0;
forever #5 clk = ~clk;
end

initial begin 
rst = 0;
#1;
rst = 1'b1;
end */

encoder_intf vif();
encoder_dut DUT(vif);

initial begin
uvm_config_db #(virtual encoder_intf)::set(uvm_root::get(),"*","vif",vif);

$dumpfile("dump.vcd"); $dumpvars;
end

initial begin

run_test("base_test");

end

endmodule