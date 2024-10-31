class encoder_seq_item extends uvm_sequence_item;

//payload information
rand bit[7:0]din;

//analysis information 
bit [2:0]y;

`uvm_object_utils_begin(encoder_seq_item)
	`uvm_field_int(din,UVM_ALL_ON + UVM_BIN)
`uvm_object_utils_end

function new(string name = "encoder_seq_item");
super.new(name);
endfunction

endclass