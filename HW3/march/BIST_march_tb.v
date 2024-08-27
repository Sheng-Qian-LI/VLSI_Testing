`timescale 1ns/1ps
`define CYCLE_TIME 10
module BIST_tb;

//======================================
//          I/O PORTS
//======================================
reg clk;
reg rst_n;
reg tester;
reg normal_inputs_cs;
reg normal_inputs_we;
reg [1:0] normal_inputs_data;
reg [3:0] normal_inputs_addr;

wire [1:0] data_out;

wire pass_or_fail;
wire test_down ;

integer q,r;

parameter CYCLE      = `CYCLE_TIME;
parameter PATNUM     = 19;
integer   SEED       = 122;
integer   SEED2       = 5;
integer i, j, k, l,m,n,o;
reg [4:0] read_iteration;
reg [4:0] initial_num;
reg [4:0] interval;
reg data0;
reg data1;
reg in_valid;

reg [1:0] normal_inputs_data2;
reg [31:0] pattern_data;
reg [31:0] input_data;
reg [31:0] input_data3 ;
reg [31:0] input_data4 ;
reg [3:0] p ;

march_mux_top march_mux_top(
	.clk(clk), 
	.rst_n(rst_n), 
	
	.normal_inputs_data(normal_inputs_data), 
	.normal_inputs_addr(normal_inputs_addr), 
	.normal_inputs_cs(normal_inputs_cs), 
	.normal_inputs_we(normal_inputs_we), 

	.tester(tester), 

	.pass_or_fail(pass_or_fail), 
	.test_down(test_down)

);

//======================================
//              Clock
//======================================
initial clk = 1'b0;
always #(CYCLE/2.0) clk = ~clk;

//======================================
//             tester
//======================================
initial begin 

	for(r = 0; r < 5; r = r + 1)begin
		tester = {$random(SEED2)} % 2;
		rst_n = 1;
    	#(CYCLE/2.0) rst_n = 0;
    	#(CYCLE*2.0) rst_n = 1;
		//tester = {$random(SEED2)} % 2;
		reset_task;
		if(tester == 0) begin 
			finish;
			pass_task;
		end
		else begin
			main_task;
		end
	end
	repeat(5) @(negedge clk);
	$finish;
end

//======================================
//          checkerboard
//======================================
task finish; begin
	for(q =0; q < 1; q = test_down) begin 
		@(negedge clk);
	end

	repeat(5) @(negedge clk);
	//$finish;

end endtask

//======================================
//            main  TASKS
//======================================
task main_task; begin
    $display("\n\t\t\t\t    DATA IN     |  DATA[1]    DATA[0]  |   DATA OUT   |  DATA[1]    DATA[0]  ");
	$display("\t\t\t\t    -------     |  -------    -------  |   --------   |  -------    -------  ");
    for(j=0; j<1; j = j + 1) begin
		input_pattern_task;
		repeat(1) @(negedge clk);
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
    repeat(5) @(negedge clk);
	//$finish;
end endtask

//**************************************
//      Reset Task
//**************************************
task reset_task; begin
    clk   = 0;
	in_valid = 0;
    rst_n  = 1;
	i = 0;
	j = 0;
	k = 0;
	l = 0;
	m = 0;
	o = 0; 
	
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
	//repeat(1) @(negedge clk);
	in_valid = 0;
end endtask

//**************************************
//      Write Task
//**************************************
task write_task; begin
	
	normal_inputs_we = 0 ;
	normal_inputs_cs = 0;
	$write("\nWRIRE STATE   cs=%d we=%d",normal_inputs_cs,normal_inputs_we) ;
	input_data = pattern_data;
	for(i = 0; i < 16; i = i + 1) begin
		input_task;
		display_task;
	end
	input_data4 = input_data3 ;
	//input_data = 32'bx;
	normal_inputs_data = 2'bx;
end endtask

task write_task2; begin
	
	normal_inputs_cs = {$random()}%2;
	normal_inputs_we = 0;
	$write("\nWRIRE STATE   cs=%d we=%d",normal_inputs_cs,normal_inputs_we);
	if(normal_inputs_cs == 0) begin
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
			//if(normal_inputs_cs==0)input_data4 = input_data3 ;
	end
	
    normal_inputs_data = 2'bx;
end endtask

task input_task; begin
	if(j == 0) normal_inputs_addr = i;
	else normal_inputs_addr = {$random(SEED+1)}%16;
	i = normal_inputs_addr;
	if(i == 0) begin
		if(normal_inputs_cs==0) input_data3[31:30] = input_data[31:30];
		normal_inputs_data = input_data[31:30];
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 1) begin
		if(normal_inputs_cs==0)input_data3[29:28] = input_data[29:28];
		normal_inputs_data = input_data[29:28];	
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 2) begin

		if(normal_inputs_cs==0)input_data3[27:26] = input_data[27:26];
		normal_inputs_data = input_data[27:26];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 3) begin

		if(normal_inputs_cs==0)input_data3[25:24] = input_data[25:24];
		normal_inputs_data = input_data[25:24];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 4) begin

		if(normal_inputs_cs==0)input_data3[23:22] = input_data[23:22];
		normal_inputs_data = input_data[23:22];		
		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 5) begin

		if(normal_inputs_cs==0)input_data3[21:20] = input_data[21:20];
		normal_inputs_data = input_data[21:20];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 6) begin

		if(normal_inputs_cs==0)input_data3[19:18] = input_data[19:18];
		normal_inputs_data = input_data[19:18];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 7) begin

		if(normal_inputs_cs==0)input_data3[17:16] = input_data[17:16];
		normal_inputs_data = input_data[17:16];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 8) begin

		if(normal_inputs_cs==0)input_data3[15:14] = input_data[15:14];
		normal_inputs_data = input_data[15:14];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 9) begin

		if(normal_inputs_cs==0)input_data3[13:12] = input_data[13:12];
		normal_inputs_data = input_data[13:12];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 10) begin

		if(normal_inputs_cs==0)input_data3[11:10] = input_data[11:10];
		normal_inputs_data = input_data[11:10];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 11) begin

		if(normal_inputs_cs==0)input_data3[9:8] = input_data[9:8];
		normal_inputs_data = input_data[9:8];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 12) begin

		if(normal_inputs_cs==0)input_data3[7:6] = input_data[7:6];
		normal_inputs_data = input_data[7:6];	
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 13) begin

		if(normal_inputs_cs==0)input_data3[5:4] = input_data[5:4];
		normal_inputs_data = input_data[5:4];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 14) begin

		if(normal_inputs_cs==0)input_data3[3:2] = input_data[3:2];
		normal_inputs_data = input_data[3:2];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
	else if(i == 15) begin

		if(normal_inputs_cs==0)input_data3[1:0] = input_data[1:0];
		normal_inputs_data = input_data[1:0];		
		data1 = normal_inputs_data[1];
		data0 = normal_inputs_data[0];
		repeat(1) @(negedge clk);
	end
end endtask


task display_task; begin
	$write("\n\tnormal_inputs_addr %0d:\t\t       %d        \t%b\t   %b         %d          %b          %b", i, normal_inputs_data, data1, data0, data_out,data_out[1],data_out[0]);
end endtask
task display_task3; begin
	$write("\n\tnormal_inputs_addr %0d:\t\t       %d        \t%b\t   %b        ", k, normal_inputs_data2, data1, data0, );
end endtask
task display_task2; begin
	$write("%d          %b          %b", data_out,data_out[1],data_out[0]);
end endtask

//**************************************
//      Read Task
//**************************************
task read_task; begin
	$write("\nREAD STATE") ;
	normal_inputs_data = 2'bx;
	normal_inputs_we = 1;
	normal_inputs_cs = 0;
	for(k = 0; k < 16; k = k + 1) begin
		if(k < 16) begin
			normal_inputs_addr = k;
			input_data2 ;
			if(k >0) begin
			display_task2;
			
			end
			display_task3;
			p = k ;
			@(negedge clk);
		end
		else begin
			normal_inputs_addr = k;
		end
	end
	

end endtask


task input_data2; begin
    k = normal_inputs_addr ;
	if(k == 0) begin
		normal_inputs_data2 = input_data4[31:30];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 1) begin
		normal_inputs_data2 = input_data4[29:28];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 2) begin
		normal_inputs_data2 = input_data4[27:26];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 3) begin
		normal_inputs_data2 = input_data4[25:24];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 4) begin
		normal_inputs_data2 = input_data4[23:22];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 5) begin
		normal_inputs_data2 = input_data4[21:20];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 6) begin
		normal_inputs_data2 = input_data4[19:18];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 7) begin
		normal_inputs_data2 = input_data4[17:16];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 8) begin
		normal_inputs_data2 = input_data4[15:14];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 9) begin
		normal_inputs_data2 = input_data4[13:12];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 10) begin
		normal_inputs_data2 = input_data4[11:10];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 11) begin
		normal_inputs_data2 = input_data4[9:8];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 12) begin
		normal_inputs_data2 = input_data4[7:6];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 13) begin
		normal_inputs_data2 = input_data4[5:4];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 14) begin
		normal_inputs_data2 = input_data4[3:2];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
	else if(k == 15) begin
		normal_inputs_data2 = input_data4[1:0];
		data1 = normal_inputs_data2[1];
		data0 = normal_inputs_data2[0];
	end
end endtask



task read_task2; begin
	normal_inputs_cs = {$random()}%2;
    normal_inputs_we = 1;
	read_iteration = {$random(SEED)} % 16;
	$write("\nREAD STATE  cs=%d we=%d read_iteration=%d",normal_inputs_cs,normal_inputs_we,read_iteration) ;
	
	
	if (normal_inputs_cs == 0) input_data4 = input_data3 ;
	else input_data4 = 32'bx ;
	for(n = 0; n < read_iteration; n = n + 1) begin
		if(n < (read_iteration)) begin
			normal_inputs_addr = {$random(SEED)}%16;
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

task pass_task; begin
	$display("\033[1;33m                `oo+oy+`                            \033[1;35m Congratulation!!! \033[1;0m                                   ");
    $display("\033[1;33m               /h/----+y        `+++++:             \033[1;35m PASS This Lab........Maybe \033[1;0m                          ");
    $display("\033[1;33m             .y------:m/+ydoo+:y:---:+o                                                                                      ");
    $display("\033[1;33m              o+------/y--::::::+oso+:/y                             \033[1;30m  --                                          ");
    $display("\033[1;33m              s/-----:/:----------:+ooy+-                             \033[1;32m    --                                       ");
    $display("\033[1;33m             /o----------------/yhyo/::/o+/:-.`                       \033[1;34m   --                                        ");
    $display("\033[1;33m            `ys----------------:::--------:::+yyo+                     \033[1;35m   --                                       ");
    $display("\033[1;33m            .d/:-------------------:--------/--/hos/                   \033[1;36m   --                                       ");
    $display("\033[1;33m            y/-------------------::ds------:s:/-:sy-                   \033[1;90m    --                                      ");
    $display("\033[1;33m           +y--------------------::os:-----:ssm/o+`                    \033[1;37m  --                                        ");
    $display("\033[1;33m          `d:-----------------------:-----/+o++yNNmms                  \033[1;38m  --                                        ");
    $display("\033[1;33m           /y-----------------------------------hMMMMN.                \033[1;92m --                                         ");
    $display("\033[1;33m           o+---------------------://:----------:odmdy/+.               \033[1;95m --                                        ");
    $display("\033[1;33m           o+---------------------::y:------------::+o-/h                \033[1;94m --                                       ");
    $display("\033[1;33m           :y-----------------------+s:--------\033[1;33m----/h:-:d               \033[1;39m --                              ");
    $display("\033[1;33m           `m/-----------------------+y/-----\033[1;33m----\033[1;30m|XXXX|\033[1;39mXXXXXXXXXXXXXX\033[1;91mXXXX            ");
    $display("\033[1;33m            /h------------------------:os++/:::/+o/:--:h-                                                                    ");
    $display("\033[1;33m         `:+ym--------------------------://++++o/:---:h/                                                                  	 ");
    $display("\033[1;31m        `hhhhhoooo++oo+/:\033[1;33m--------------------:oo----\033[1;31m+dd+                                                 ");
    $display("\033[1;31m         shyyyhhhhhhhhhhhso/:\033[1;33m---------------:+/---\033[1;31m/ydyyhs:`                                            	 ");
    $display("\033[1;31m         .mhyyyyyyhhhdddhhhhhs+:\033[1;33m----------------\033[1;31m:sdmhyyyyyyo:                                       	 ");
    $display("\033[1;31m        `hhdhhyyyyhhhhhddddhyyyyyo++/:\033[1;33m--------\033[1;31m:odmyhmhhyyyyhy                                            ");
    $display("\033[1;31m        -dyyhhyyyyyyhdhyhhddhhyyyyyhhhs+/::\033[1;33m-\033[1;31m:ohdmhdhhhdmdhdmy:                            		         ");
    $display("\033[1;31m         hhdhyyyyyyyyyddyyyyhdddhhyyyyyhhhyyhdhdyyhyys+ossyhssy:-`                                             		         ");
    $display("\033[1;31m         `Ndyyyyyyyyyyymdyyyyyyyhddddhhhyhhhhhhhhy+/:\033[1;33m-------::/+o++++-`                                  		     ");
    $display("\033[1;31m          dyyyyyyyyyyyyhNyydyyyyyyyyyyhhhhyyhhy+/\033[1;33m------------------:/ooo:`                                   		 ");
    $display("\033[1;31m         :myyyyyyyyyyyyyNyhmhhhyyyyyhdhyyyhho/\033[1;33m-------------------------:+o/`                                   	 ");
    $display("\033[1;31m        /dyyyyyyyyyyyyyyddmmhyyyyyyhhyyyhh+:\033[1;33m-----------------------------:+s-                                    	 ");
    $display("\033[1;31m      +dyyyyyyyyyyyyyyydmyyyyyyyyyyyyyds:\033[1;33m---------------------------------:s+                                    	 ");
    $display("\033[1;31m      -ddhhyyyyyyyyyyyyyddyyyyyyyyyyyhd+\033[1;33m------------------------------------:oo              `-++o+:.`             ");
    $display("\033[1;31m       `/dhshdhyyyyyyyyyhdyyyyyyyyyydh:\033[1;33m---------------------------------------s/            -o/://:/+s             ");
    $display("\033[1;31m         os-:/oyhhhhyyyydhyyyyyyyyyds:\033[1;33m----------------------------------------:h:--.`      `y:------+os            ");
    $display("\033[1;33m         h+-----\033[1;31m:/+oosshdyyyyyyyyhds\033[1;33m-------------------------------------------+h//o+s+-.` :o-------s/y  ");
    $display("\033[1;33m         m:------------\033[1;31mdyyyyyyyyymo\033[1;33m--------------------------------------------oh----:://++oo------:s/d  ");
    $display("\033[1;33m        `N/-----------+\033[1;31mmyyyyyyyydo\033[1;33m---------------------------------------------sy---------:/s------+o/d  ");
    $display("\033[1;33m        .m-----------:d\033[1;31mhhyyyyyyd+\033[1;33m----------------------------------------------y+-----------+:-----oo/h  ");
    $display("\033[1;33m        +s-----------+N\033[1;31mhmyyyyhd/\033[1;33m----------------------------------------------:h:-----------::-----+o/m  ");
    $display("\033[1;33m        h/----------:d/\033[1;31mmmhyyhh:\033[1;33m-----------------------------------------------oo-------------------+o/h  ");
    $display("\033[1;33m       `y-----------so /\033[1;31mNhydh:\033[1;33m-----------------------------------------------/h:-------------------:soo  ");
    $display("\033[1;33m    `.:+o:---------+h   \033[1;31mmddhhh/:\033[1;33m---------------:/osssssoo+/::---------------+d+//++///::+++//::::::/y+`  ");
    $display("\033[1;33m   -s+/::/--------+d.   \033[1;31mohso+/+y/:\033[1;33m-----------:yo+/:-----:/oooo/:----------:+s//::-.....--:://////+/:`  	 ");
    $display("\033[1;33m   s/------------/y`           `/oo:--------:y/-------------:/oo+:------:/s:                                                 ");
    $display("\033[1;33m   o+:--------::++`              `:so/:-----s+-----------------:oy+:--:+s/``````                                             ");
    $display("\033[1;33m    :+o++///+oo/.                   .+o+::--os-------------------:oy+oo:`/o+++++o-                                         	 ");
    $display("\033[1;33m       .---.`                          -+oo/:yo:-------------------:oy-:h/:---:+oyo                                          ");
    $display("\033[1;33m                                          `:+omy/---------------------+h:----:y+//so                                         ");
    $display("\033[1;33m                                              `-ys:-------------------+s-----+s///om                                         ");
    $display("\033[1;33m                                                 -os+::---------------/y-----ho///om                                         ");
    $display("\033[1;33m                                                    -+oo//:-----------:h-----h+///+d                                         ");
    $display("\033[1;33m                                                       `-oyy+:---------s:----s/////y                                         ");
    $display("\033[1;33m                                                           `-/o+::-----:+----oo///+s                                         ");
    $display("\033[1;33m                                                               ./+o+::-------:y///s:                                         ");
    $display("\033[1;33m                                                                   ./+oo/-----oo/+h                                          ");
    $display("\033[1;33m                                                                       `://++++syo`                                          ");
    $display("\033[1;0m"); 
end
endtask 


initial begin
	//$sdf_annotate("gcd_syn.sdf",march_mux_top);
	$fsdbDumpfile("./BIST_MARCH_MUX.fsdb");
	$fsdbDumpvars;
end
endmodule