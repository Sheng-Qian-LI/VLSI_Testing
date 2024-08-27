`include "sram.v"
`include "bist_cb_mux_data.v"
`include "bist_cb_mux_addr.v"
`include "bist_cb_mux_cs.v"
`include "bist_cb_mux_we.v"
`include "BIST_checkerboard.v"
module cb_mux_top(
    clk, 
    rst_n,

    normal_inputs_data, 
    normal_inputs_addr, 
    normal_inputs_cs, 
    normal_inputs_we, 
    tester, 

    pass_or_fail, 
    test_down
);

input clk;
input rst_n;

input [1:0]normal_inputs_data;
input [3:0]normal_inputs_addr;
input normal_inputs_cs;
input normal_inputs_we;

input tester;

output pass_or_fail;
output test_down;

wire [3:0] address;
wire [1:0] data_in;
wire [1:0] outdata_data;
wire [1:0] data_out;
wire [1:0] memory;
wire we_n, we, we_n_tb, we_n_cb;
wire cs_n, cs, cs_n_tb, cs_n_cb; 

wire [1:0] test_pattren;
wire [3:0] aa;
wire [1:0] memory_mux;

wire [1:0] data_in_tb;
wire [3:0] address_tb;

wire [1:0] test_pattren_data;
wire [3:0] test_pattren_addr;
wire test_pattren_cs;
wire test_pattren_we;
wire test_bist;
wire [3:0]addr;


sram sram(
    .clk(clk), 
    .rst_n(rst_n), 
    .address(address), 
    .data_in(outdata_data), 
    .we_n(we), 
    .cs_n(cs),
    .data_out(memory_mux)
);


cb_mux_data cb_mux_data(
    .normal_inputs_data(normal_inputs_data), 
    .test_pattren_data(test_pattren), 
    .test_bist(tester), 
    .outdata_data(outdata_data)
);


cb_mux_addr cb_mux_addr(
    .normal_inputs_addr(normal_inputs_addr), 
    .test_pattren_addr(aa), 
    .test_bist(tester), 
    .addr(address)
);


cb_mux_cs cb_mux_cs(
    .normal_inputs_cs(normal_inputs_cs), 
    .test_pattren_cs(cs_n_cb), 
    .test_bist(tester), 
    .cs(cs)
);


cb_mux_we cb_mux_we(
    .normal_inputs_we(normal_inputs_we), 
    .test_pattren_we(we_n_cb), 
    .test_bist(tester), 
    .we(we)
);


BIST_checkerboard BIST_checkerboard(
    .clk(clk), 
    .rst_n(rst_n), 
    .test_pattren(test_pattren), 
    .aa(aa), 
    .cs_n_cb(cs_n_cb), 
    .we_n_cb(we_n_cb), 
    .memory(memory_mux), 
    .pass_or_fail(pass_or_fail), 
    .test_down(test_down),
	.tester(tester)
);




endmodule

