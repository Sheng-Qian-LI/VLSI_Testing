module march_mux_we(
    normal_inputs_we, 
    test_pattren_we, 
    test_bist, 
    
    we
);

input normal_inputs_we;
input test_pattren_we;
input test_bist;
output we;

wire we;

assign we = (test_bist)? normal_inputs_we:test_pattren_we;

endmodule
