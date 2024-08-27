`include "sram.v"
`include "bist_march_mux_data.v"
`include "bist_march_mux_addr.v"
`include "bist_march_mux_cs.v"
`include "bist_march_mux_we.v"
`include "BIST_MARCH.v"
module march_mux_top(
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
wire clk_1;
wire clk_2;
wire rst_1;
wire rst_2;


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
wire we_n, we, we_n_tb, we_n_march;
wire cs_n, cs, cs_n_tb, cs_n_march; 

wire [1:0] test_pattren;
wire [3:0] a;
wire [3:0] aa;
wire [1:0] memory_mux;

wire [1:0] data_in_tb;
wire [3:0] address_tb;

wire [1:0] test_pattren_data;
wire [3:0] test_pattren_addr;
wire test_pattren_cs;
wire test_pattren_we;
wire test_bist;
wire [3:0] addr;




sram sram(
    .clk(clk), 
    .rst_n(rst_n), 
    .address(address), 
    .data_in(outdata_data), 
    .we_n(we), 
    .cs_n(cs),
    .data_out(memory_mux)
);

//============================
//            MUX            
//============================
march_mux_data march_mux_data(
    .normal_inputs_data(normal_inputs_data), 
    .test_pattren_data(test_pattren), 
    .test_bist(tester), 
    .outdata_data(outdata_data)
);


march_mux_addr march_mux_addr(
    .normal_inputs_addr(normal_inputs_addr), 
    .test_pattren_addr(aa), 
    .test_bist(tester), 
    .addr(address)
);


march_mux_cs march_mux_cs(
    .normal_inputs_cs(normal_inputs_cs), 
    .test_pattren_cs(cs_n_march), 
    .test_bist(tester), 
    .cs(cs)
);


march_mux_we march_mux_we(
    .normal_inputs_we(normal_inputs_we), 
    .test_pattren_we(we_n_march), 
    .test_bist(tester), 
    .we(we)
);

//============================
//           BIST           
//============================
BIST_MARCH BIST_MARCH(
    .clk(clk), 
    .rst_n(rst_n), 
    .test_pattren(test_pattren), 
    .a(aa), 
    .cs_n_march(cs_n_march),
    .we_n_march(we_n_march), 
    .memory(memory_mux), 
    .pass_or_fail(pass_or_fail), 
    .test_down(test_down),
	.tester(tester)
);





endmodule

