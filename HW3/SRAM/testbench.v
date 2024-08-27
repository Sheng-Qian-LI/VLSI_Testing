`timescale 1ns/1ps
`define CYCLE_TIME 10
module SRAM_tb;

//======================================
//          I/O PORTS
//======================================
reg clk;
reg rst_n;
reg cs_n_tb;
reg we_n_tb;
reg [1:0] data_in_tb;
reg [1:0] data_in_tb2;
reg [3:0] address_tb;
wire [1:0] data_out;

sram sram(
	.clk(clk),
	.rst_n(rst_n),
	.we_n(we_n_tb), 
	.cs_n(cs_n_tb), 
	.data_in(data_in_tb), 
	.data_out(data_out),
	.address(address_tb)
);

//======================================
//      PARAMETERS & VARIABLES
//======================================
parameter CYCLE      = `CYCLE_TIME;
parameter PATNUM     = 4;
integer   SEED       = 122;
integer i, j, k, l,m,n,o;
reg [4:0] read_iteration;
reg [4:0] initial_num;
reg [4:0] interval;
reg data0;
reg data1;
reg in_valid;
reg [31:0] pattern_data;
reg [31:0] input_data;
reg [31:0] input_data3 ;
reg [31:0] input_data4 ;
reg [3:0] p ;

//======================================
//              Clock
//======================================
initial clk = 1'b0;
always #(CYCLE/2.0) clk = ~clk;

//======================================
//              MAIN
//======================================
initial main_task;

//======================================
//              TASKS
//======================================
task main_task; begin
    reset_task;
    $display("\n\t\t\t\t    DATA IN     |  DATA[1]    DATA[0]  |   DATA OUT   |  DATA[1]    DATA[0]  ");
	$display("\t\t\t\t    -------     |  -------    -------  |   --------   |  -------    -------  ");

    for(j=0; j<1; j = j + 1) begin
		input_pattern_task;
		write_task;
		read_task;
		display_task2;
		o = o+1 ;
	end
	
	for(l=0; l<PATNUM; l = l + 1) begin
		input_pattern_task;
		write_task2;
	//	input_task;
		read_task2;
		o = o+1 ;
		if(read_iteration > 0) begin
			display_task2;
			end
	end
    repeat(2) @(negedge clk);
	$finish;
end endtask

//**************************************
//      Reset Task
//**************************************
task reset_task; begin
    clk   = 0;
	in_valid = 0;
    rst_n       = 1;
	i = 0;
	j = 0;
	k = 0;
	l = 0;
	m = 0;
	o = 0; 
	
    #(CYCLE/2.0) rst_n = 0;
    #(CYCLE/2.0) rst_n = 1;
end endtask

//**************************************
//      Input Task
//**************************************
task input_pattern_task; begin
	$write("\n\t============================================== PATTERN %0d =============================================",o+1);
	in_valid = 1;
	pattern_data[7:0] = {$random()} % 256;
	pattern_data[15:8] = {$random()} % 256;
	pattern_data[23:16] = {$random()} % 256;
	pattern_data[31:24] = {$random()} % 256;
	repeat(1) @(negedge clk);
	in_valid = 0;
end endtask

//**************************************
//      Write Task
//**************************************
task write_task; begin
	
	we_n_tb = 0 ;
	cs_n_tb = 0;
	$write("\nWRIRE STATE   cs=%d we=%d",cs_n_tb,we_n_tb) ;
	input_data = pattern_data;
	for(i = 0; i < 16; i = i + 1) begin
		input_task;
		display_task;
	end
	input_data4 = input_data3 ;
	//input_data = 32'bx;
	data_in_tb = 2'bx;
end endtask

task write_task2; begin
	
	cs_n_tb = {$random()}%2;
	we_n_tb = 0;
	$write("\nWRIRE STATE   cs=%d we=%d",cs_n_tb,we_n_tb);
	if(cs_n_tb == 0) begin
		input_data = pattern_data;
		input_data4 = input_data3 ;
	end
	else begin  
	input_data = 'bx;	
	input_data4 = 32'bx;
	end
	pattern_data = 32'bx;

	for( m = 0; m < {$random(SEED)}%16 ; m = m + 1) begin
			input_task;
			display_task;
			//if(cs_n_tb==0)input_data4 = input_data3 ;
	end
	
    data_in_tb = 2'bx;
end endtask

task input_task; begin
	if(j == 0) address_tb = i;
	else address_tb = {$random(SEED+1)}%16;
	i = address_tb;
	if(i == 0) begin
		if(cs_n_tb==0) input_data3[31:30] = input_data[31:30];
		data_in_tb = input_data[31:30];
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 1) begin
		if(cs_n_tb==0)input_data3[29:28] = input_data[29:28];
		data_in_tb = input_data[29:28];	
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 2) begin

		if(cs_n_tb==0)input_data3[27:26] = input_data[27:26];
		data_in_tb = input_data[27:26];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 3) begin

		if(cs_n_tb==0)input_data3[25:24] = input_data[25:24];
		data_in_tb = input_data[25:24];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 4) begin

		if(cs_n_tb==0)input_data3[23:22] = input_data[23:22];
		data_in_tb = input_data[23:22];		
		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 5) begin

		if(cs_n_tb==0)input_data3[21:20] = input_data[21:20];
		data_in_tb = input_data[21:20];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 6) begin

		if(cs_n_tb==0)input_data3[19:18] = input_data[19:18];
		data_in_tb = input_data[19:18];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 7) begin

		if(cs_n_tb==0)input_data3[17:16] = input_data[17:16];
		data_in_tb = input_data[17:16];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 8) begin

		if(cs_n_tb==0)input_data3[15:14] = input_data[15:14];
		data_in_tb = input_data[15:14];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 9) begin

		if(cs_n_tb==0)input_data3[13:12] = input_data[13:12];
		data_in_tb = input_data[13:12];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 10) begin

		if(cs_n_tb==0)input_data3[11:10] = input_data[11:10];
		data_in_tb = input_data[11:10];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 11) begin

		if(cs_n_tb==0)input_data3[9:8] = input_data[9:8];
		data_in_tb = input_data[9:8];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 12) begin

		if(cs_n_tb==0)input_data3[7:6] = input_data[7:6];
		data_in_tb = input_data[7:6];	
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 13) begin

		if(cs_n_tb==0)input_data3[5:4] = input_data[5:4];
		data_in_tb = input_data[5:4];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 14) begin

		if(cs_n_tb==0)input_data3[3:2] = input_data[3:2];
		data_in_tb = input_data[3:2];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 15) begin

		if(cs_n_tb==0)input_data3[1:0] = input_data[1:0];
		data_in_tb = input_data[1:0];		
		data1 = data_in_tb[1];
		data0 = data_in_tb[0];
		repeat(1) @(negedge clk);
	end
end endtask


task display_task; begin
	$write("\n\taddress_tb %0d:\t\t       %d        \t%b\t   %b         %d          %b          %b", i, data_in_tb, data1, data0, data_out,data_out[1],data_out[0]);
end endtask
task display_task3; begin
	$write("\n\taddress_tb %0d:\t\t       %d        \t%b\t   %b        ", k, data_in_tb2, data1, data0, );
end endtask
task display_task2; begin
	$write("%d          %b          %b", data_out,data_out[1],data_out[0]);
end endtask


//**************************************
//      Read Task
//**************************************
task read_task; begin
	$write("\nREAD STATE") ;
	data_in_tb = 2'bx;
	we_n_tb = 1;
	cs_n_tb = 0;
	for(k = 0; k < 16; k = k + 1) begin
		if(k < 16) begin
			address_tb = k;
			input_data2 ;
			if(k >0) begin
			display_task2;
			
			end
			display_task3;
			p = k ;
			@(negedge clk);
		end
		else begin
			address_tb = k;
		end
	end
	

end endtask


task input_data2; begin
    k = address_tb ;
	if(k == 0) begin
		data_in_tb2 = input_data4[31:30];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 1) begin
		data_in_tb2 = input_data4[29:28];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 2) begin
		data_in_tb2 = input_data4[27:26];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 3) begin
		data_in_tb2 = input_data4[25:24];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 4) begin
		data_in_tb2 = input_data4[23:22];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 5) begin
		data_in_tb2 = input_data4[21:20];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 6) begin
		data_in_tb2 = input_data4[19:18];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 7) begin
		data_in_tb2 = input_data4[17:16];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 8) begin
		data_in_tb2 = input_data4[15:14];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 9) begin
		data_in_tb2 = input_data4[13:12];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 10) begin
		data_in_tb2 = input_data4[11:10];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 11) begin
		data_in_tb2 = input_data4[9:8];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 12) begin
		data_in_tb2 = input_data4[7:6];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 13) begin
		data_in_tb2 = input_data4[5:4];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 14) begin
		data_in_tb2 = input_data4[3:2];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
	else if(k == 15) begin
		data_in_tb2 = input_data4[1:0];
		data1 = data_in_tb2[1];
		data0 = data_in_tb2[0];
	end
end endtask


task read_task2; begin
	cs_n_tb = {$random()}%2;
    we_n_tb = 1;
	read_iteration = {$random(SEED)} % 16;
	$write("\nREAD STATE  cs=%d we=%d read_iteration=%d",cs_n_tb,we_n_tb,read_iteration) ;
	
	
	if (cs_n_tb == 0) input_data4 = input_data3 ;
	else input_data4 = 32'bx ;
	for(n = 0; n < read_iteration; n = n + 1) begin
		if(n < (read_iteration)) begin
			address_tb = {$random(SEED)}%16;
			input_data2 ;
			if(n >0) begin
			display_task2;
			
			end
			display_task3;
			p = n ;
			repeat(1) @(negedge clk);
		end
	end
end endtask

initial begin
	//$sdf_annotate("test_syn.sdf", SRAM);
	$fsdbDumpfile("./sram.fsdb");
	$fsdbDumpvars;
end
endmodule
