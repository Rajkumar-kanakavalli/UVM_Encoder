
class encoder_env extends uvm_env;

//utility macros
`uvm_component_utils(encoder_env)

//environment components
encoder_agent1 agent1;
encoder_agent2 agent2;
encoder_scb 	scb;

//constructor
function new(string name = "encoder_env",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
agent1 = encoder_agent1::type_id::create("agent1",this);
agent2 = encoder_agent2::type_id::create("agent2",this);
scb	   = encoder_scb::type_id::create("scb",this);
endfunction

//connect_phase
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
agent1.mon1.item_collected_port1.connect(scb.ip_fifo.analysis_export);	//connecting the mon1 with scoreboard
agent2.mon2.item_collected_port2.connect(scb.op_fifo.analysis_export);	//connecting the mon2 with scoreboard
endfunction

endclass