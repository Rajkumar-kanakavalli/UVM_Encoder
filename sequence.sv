class encoder_rand_addr_data_seq extends uvm_sequence #(encoder_seq_item);

`uvm_object_utils(encoder_rand_addr_data_seq)

encoder_seq_item pkt; //handle of seq_item to randomize

virtual task body();

pkt=encoder_seq_item::type_id::create("pkt");

repeat(20)
begin
`uvm_do_with(pkt,{pkt.din inside {1,2,4,8,16,32,64,128};}) //randomized  data values
end

endtask

endclass