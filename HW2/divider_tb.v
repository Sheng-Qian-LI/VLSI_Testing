`timescale 1ns/1ps
`define CYCLE_TIME 2

module testbench;

parameter period = `CYCLE_TIME;  

reg clk;
reg rst_n;
reg in_valid;
reg [7:0] dividend;    //被除數
reg [7:0] divisor;     //除數
reg [7:0] correct_quotient;
reg [7:0] correct_remainder;
wire [7:0] quotient;  //[商] 
wire [7:0]remainder;  //餘數
wire out_valid;
integer i;
integer err_cnt ;
divide_8bit u1(
	.clk(clk),
	.rst_n(rst_n),
	.in_valid(in_valid),
	.out_valid(out_valid),
	.dividend(dividend),    //被除數
	.divisor(divisor),     //除數
	.quotient(quotient),  //[商]
	.remainder(remainder) //餘數
);

//clock
initial clk = 1'b0;
always #(period/2.0) clk = ~clk;
//----------------------------------------

//TASKS
initial begin 
	reset_task;
	$display("\n\t\t   Test time | Dividend  Divisor | Correct_Quotient  Correct_Remainder | Quotient  Remainder ");
	$display("\t\t   --------- | --------  ------- | ----------------  ----------------- | --------  --------- ");
	for(i=0; i<10; i=i+1) 
	begin
		input_1;
		check_task;
	end
	if (err_cnt !== 0) fail_task;
    else pass_task;
	end

//---------------------------------------------
//reset
task reset_task; 
	begin
		clk = 0;
		rst_n = 1'b1 ;
		dividend = 0 ;
		divisor = 0  ;
		in_valid = 0 ;
		err_cnt = 0;
		#(period/2.0) rst_n = 0 ;
		#(period/2.0) rst_n = 1 ;
	end
endtask
//------------------------------------------

//input_1
task input_1; 
	 
	begin
 		in_valid = 1 ;
		dividend = {$random}%256 ;
		divisor  = {$random}%255 + 1;
		correct_quotient = dividend/divisor ;
		correct_remainder = dividend % divisor;
		$write("\n\tinput");
		$write("%d \t %d \t  %d \t\t  %d \t\t  %d",i+1,dividend,divisor,correct_quotient,correct_remainder);
		repeat(1) @(negedge clk);
		in_valid = 0 ;
		dividend = 8'bx ;
		divisor  = 8'bx ;
	end
		
endtask

task check_task; begin
	#(17*period) @(negedge clk);
	if(out_valid)begin
	$write("\t\t   %d \t      %d",quotient,remainder);
		if((correct_quotient !== quotient) || (correct_remainder !== remainder))
		begin
			$display("        >.<") ;
			err_cnt = err_cnt + 1;
		end
		else begin
			$display("         ^_^") ;
		end
	end
	repeat(1) @(negedge clk);
end endtask

task pass_task; begin
	$display("\n\033[1;32m%d Error  \n",err_cnt);
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
    repeat(5) @(negedge clk);
	$finish;
end 
endtask

task fail_task; begin
    $display("\nFAIL!! There were %d errors in all.\n", err_cnt);
    $display("                                                                                ");
    $display("                                                   ./+oo+/.                     ");
    $display("                                                  /s:-----+s`                   ");
    $display("                                                  y/-------:y                   ");
    $display("                                             `.-:/od+/------y`                  ");
    $display("                               `:///+++ooooooo+//::::-----:/y+:`                ");
    $display("                              -m+:::::::---------------------::o+.              ");
    $display("                             `hod-------------------------------:o+             ");
    $display("                       ./++/:s/-o/--------------------------------/s///::.      ");
    $display("                      /s::-://--:--------------------------------:oo/::::o+     ");
    $display("                    -+ho++++//hh:-------------------------------:s:-------+/    ");
    $display("                  -s+shdh+::+hm+--------------------------------+/--------:s    ");
    $display("                 -s:hMMMMNy---+y/-------------------------------:---------//    ");
    $display("                 y:/NMMMMMN:---:s-/o:-------------------------------------+`    ");
    $display("                 h--sdmmdy/-------:hyssoo++:----------------------------:/`     ");
    $display("                 h---::::----------+oo+/::/+o:---------------------:+++s-`      ");
    $display("                 s:----------------/s+///------------------------------o`       ");
    $display("           ``..../s------------------::--------------------------------o        ");
    $display("       -/oyhyyyyyym:----------------://////:--------------------------:/        ");
    $display("      /dyssyyyssssyh:-------------/o+/::::/+o/------------------------+`        ");
    $display("    -+o/---:/oyyssshd/-----------+o:--------:oo---------------------:/.         ");
    $display("  `++--------:/sysssddy+:-------/+------------s/------------------://`          ");
    $display(" .s:---------:+ooyysyyddoo++os-:s-------------/y----------------:++.            ");
    $display(" s:------------/yyhssyshy:---/:o:-------------:dsoo++//:::::-::+syh`            ");
    $display("`h--------------shyssssyyms+oyo:--------------/hyyyyyyyyyyyysyhyyyy`            ");
    $display("`h--------------:yyssssyyhhyy+----------------+dyyyysssssssyyyhs+/.             ");
    $display(" s:--------------/yysssssyhy:-----------------shyyyyyhyyssssyyh.                ");
    $display(" .s---------------+sooosyyo------------------/yssssssyyyyssssyo                 ");
    $display("  /+-------------------:++------------------:ysssssssssssssssy-                 ");
    $display("  `s+--------------------------------------:syssssssssssssssyo                  ");
    $display("`+yhdo--------------------:/--------------:syssssssssssssssyy.                  ");
    $display("+yysyhh:-------------------+o------------/ysyssssssssssssssy/                   ");
    $display(" /hhysyds:------------------y-----------/+yyssssssssssssssyh`                   ");
    $display(" .h-+yysyds:---------------:s----------:--/yssssssssssssssym:                   ");
    $display(" y/---oyyyyhyo:-----------:o:-------------:ysssssssssyyyssyyd-                  ");
    $display("`h------+syyyyhhsoo+///+osh---------------:ysssyysyyyyysssssyd:                 ");
    $display("/s--------:+syyyyyyyyyyyyyyhso/:-------::+oyyyyhyyyysssssssyy+-                 ");
    $display("+s-----------:/osyyysssssssyyyyhyyyyyyyydhyyyyyyssssssssyys/`                   ");
    $display("+s---------------:/osyyyysssssssssssssssyyhyyssssssyyyyso/y`                    ");
    $display("/s--------------------:/+ossyyyyyyssssssssyyyyyyysso+:----:+                    ");
    $display(".h--------------------------:::/++oooooooo+++/:::----------o`                   ");
    repeat(5) @(negedge clk);
    $finish;
end endtask

initial begin
    $sdf_annotate("gcd_syn.sdf", u1);
	$fsdbDumpfile("./lai_rtl.fsdb");
	$fsdbDumpvars;
end

endmodule