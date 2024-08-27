module march_mux_cs(
    normal_inputs_cs, 
    test_pattren_cs, 
    test_bist, 
    
    cs
);

input normal_inputs_cs;
input test_pattren_cs;
input test_bist;
output cs;

wire cs;

assign cs = (test_bist)? normal_inputs_cs:test_pattren_cs;

endmodule
