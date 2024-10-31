class encoder_mon1 extends uvm_monitor;

//utility macros
`uvm_component_utils(encoder_mon1)

encoder_seq_item pkt1; //seq_item handle for pin to pkt1 level conversion

virtual encoder_intf vif; ///virtual interface to access the pin level activity

uvm_analysis_port #(encoder_seq_item) item_collected_port1; //to connect the mon1 to scoreboard

//constructor
function new(string name = "encoder_mon1",uvm_component parent);
super.new(name,parent);
endfunction

//build phase
virtual function void build_phase (uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual encoder_intf)::get(this,"","vif",vif);//config db to get virtual interface from top
item_collected_port1=new("item_collected_port1",this);
endfunction 

//run phase
task run_phase(uvm_phase phase);
pkt1=encoder_seq_item::type_id::create("pkt1");
forever begin
//@(posedge vif.clk)
#5;
pkt1.din=vif.din;		//pin to pkt1 level conversion
pkt1.y=vif.y;
//`uvm_info("mon1","mon1 transactions",UVM_NONE);
//@(posedge vif.clk)
//#5;
item_collected_port1.write(pkt1); //sending data to scoreboard
end

endtask
endclass