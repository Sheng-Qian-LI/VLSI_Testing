module march_mux_addr(
    normal_inputs_addr, 
    test_pattren_addr, 
    test_bist, 

    addr
);

input [3:0] normal_inputs_addr;
input [3:0] test_pattren_addr;
input test_bist;
output [3:0] addr;

wire [3:0] addr;

assign addr = (test_bist)? normal_inputs_addr:test_pattren_addr;

endmodule
