class encoder_sequencer extends uvm_sequencer #(encoder_seq_item);

//utility macros
`uvm_component_utils(encoder_sequencer)

//constructor
function new(string name = "encoder_sequencer", uvm_component parent);
super.new(name,parent);
endfunction

endclass
