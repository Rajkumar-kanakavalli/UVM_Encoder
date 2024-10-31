class encoder_driver extends uvm_driver#(encoder_seq_item);

//virtual interface
virtual encoder_intf vif;

encoder_seq_item pkt;

//utility macros
`uvm_component_utils(encoder_driver)

//constructor
function new(string name= "encoder_driver",uvm_component parent);
super.new(name,parent);
endfunction

//build phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
//uvm_config_db#(virtual sram_intf)::get(this,"","vif",vif);
 if(!uvm_config_db#(virtual encoder_intf)::get(this,"","vif",vif))  //if virtual interface is not camed uvm_fatal is displayed
	`uvm_fatal("no vif",{"virtual interface must set fot: ",get_full_name(),".vif"}) 
endfunction

//run_phase
virtual task run_phase(uvm_phase phase);
pkt=encoder_seq_item::type_id::create("pkt");
forever begin
seq_item_port.get_next_item(pkt);
drive();
seq_item_port.item_done();
//`uvm_info("Driver","Drv transaction dut",UVM_NONE);
end
endtask


task drive();
//@(posedge vif.clk)
#5;
vif.din=pkt.din;
endtask

endclass