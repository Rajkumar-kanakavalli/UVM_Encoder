class encoder_agent2 extends uvm_agent; //pasive agent

//utility macros
`uvm_component_utils(encoder_agent2)

//passive agent component
encoder_mon2 mon2;

//constructor
function new(string name = "encoder_agent2",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
mon2 = encoder_mon2::type_id::create("mon2",this);
endfunction

endclass
