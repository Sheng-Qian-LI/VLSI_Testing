module cb_mux_data(
    normal_inputs_data, 
    test_pattren_data, 
    test_bist, 

    outdata_data
);

input [1:0] normal_inputs_data;
input [1:0] test_pattren_data;
input test_bist;
output [1:0] outdata_data;

wire [1:0]outdata_data;

assign outdata_data = (test_bist)? normal_inputs_data : test_pattren_data;

endmodule