class encoder_mon2 extends uvm_monitor;

//utility macros
`uvm_component_utils(encoder_mon2)

encoder_seq_item pkt2;//seq_item handle

virtual encoder_intf vif; //virtual interface

uvm_analysis_port #(encoder_seq_item) item_collected_port2; //analysis port to connect the mon2 with scoreboard

//constructor
function new(string name = "encoder_mon2",uvm_component parent);
  super.new(name,parent);
endfunction

//build phase
virtual function void build_phase (uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db #(virtual encoder_intf)::get(this,"","vif",vif); //config_db to get virtual interface from top
  item_collected_port2=new("item_collected_port2",this);
endfunction 

task run_phase(uvm_phase phase);
 pkt2=encoder_seq_item::type_id::create("pkt2");
 forever begin
  //#2;
	//@(posedge vif.clk)
	#5;
	
	pkt2.din=vif.din;
	pkt2.y=vif.y;

	//`uvm_info("mon2","mon2 transactions",UVM_NONE);
	//@(posedge vif.clk)
	//#5;
	item_collected_port2.write(pkt2);
  end

endtask

endclass
