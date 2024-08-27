//`include "sram.v"
module BIST_checkerboard(
	clk, 
	rst_n,
	memory,
	tester,
	we_n_cb, 
	cs_n_cb, 
	aa, 
	
	test_pattren, 
	pass_or_fail, 
	test_down
);

input clk; 
input rst_n;
input [1:0]memory;
input tester;
output we_n_cb;
output cs_n_cb;
output [3:0] aa;
output reg[1:0]test_pattren; // 接data in

output reg pass_or_fail;
output reg test_down;

reg[2:0]  C_STATE , next_state;
reg we_n_cb ;
reg cs_n_cb ;

reg [3:0] a;
reg[4:0] b;
reg[1:0] c ;
reg[1:0] d ;
reg[3:0] count ; //比較用的
reg[3:0] count1 ; //S4切S5用
reg[3:0] address_compare ;
reg[3:0] address_compare_2 ;

parameter START = 2'b00;
parameter S1 = 2'b01;       
parameter S2 = 2'b10;        
parameter DONE = 2'b11;

//sram u1(.clk(clk), .rst_n(rst_n), .address(a), .we_n(we_n_cb), .cs_n(cs_n_cb), .data_in(test_pattren), .data_out(memory));

always@(posedge clk) begin
	if (!rst_n) begin
		C_STATE <= START;
	end
	else begin
		C_STATE <= next_state;
	end
end

always @(*) begin
	case(C_STATE)

		START : if(a == 0) next_state = S1;
				else next_state = START;

		S1 : if(a == 15) next_state = S2;
			 else if (a < 16) next_state = S1;
			 else next_state = S1;

		S2 : if(a == 15 && b ==1) next_state = S1;
			 else if(a == 15 && b ==2) next_state = DONE;
			 else if(a < 16 ) next_state = S2;

			 else next_state = DONE;

		DONE : next_state = DONE;

		default next_state = C_STATE;
	endcase
end

//============================
//            a            
//============================

always@(posedge clk) begin
	if (!rst_n) begin
		a <= 0;
	end

	else if(C_STATE == START)begin
		if(next_state == S1) a <= 0;
		else a <= a;
	end

	else if(C_STATE == S1)begin
		a <= a + 1;
	end

	else if(next_state == S1)begin
		if(C_STATE == S2 ) a <= 0;
		else  a <= a + 1;
	end

	else if(next_state == S2)begin
		if(C_STATE == S1 ) a <= 0;
		else  a <= a + 1;
	end
	else if(next_state == DONE)begin
		a <= a;
	end
	
	else a <= a;
end

//============================
//            b           
//============================
always@(posedge clk) begin
	if (!rst_n) begin
		b <= 0;
	end

	else if (C_STATE == START) b <= 0;

	else if(next_state == S1) b <= b;

	else if(next_state == S2 && a==15) b <= b + 1 ;
	
	else if(next_state == DONE) b <= b;
	
	else b <= b;
end

//============================
//           we/cs   
//============================
always@(posedge clk) begin
	if (!rst_n) begin
		we_n_cb <= 0;
		cs_n_cb <= 0;
	end
	else if(C_STATE == START)begin
		we_n_cb <= 0;
		cs_n_cb <= 0;
	end
	else if(next_state == S1)begin
		we_n_cb <= 0;
		cs_n_cb <= 0;
	end
	else if(next_state == S2)begin
		we_n_cb <= 1;
		cs_n_cb <= 0;
	end
	else if(next_state == DONE)begin
		cs_n_cb <= 0;
	end
	else begin
		cs_n_cb <= 0;
		we_n_cb <= we_n_cb;
		end
end

//============================
//        test_pattren   
//============================
always@(posedge clk) begin
	if (!rst_n) begin
		test_pattren <= 2'b0;
	end
	else if(C_STATE == START)begin
		test_pattren <= 2'b0;
	end
	else if(next_state == 1 && a==15)begin
		test_pattren <= 2'b11;
	end
	else if(C_STATE == S1)begin
		if(c == 0)begin
			if(a == 1 || a == 7 || a==4 || a==6 || a==9  || a==12 || a==14) test_pattren <= 2'b0;
			else test_pattren <= 2'b11;
		end
		else if(c == 1)begin
			if(a == 0 || a == 2 || a==3 || a==5 || a==8 || a==10 || a==11 || a==13) test_pattren <= 2'b0;
			else test_pattren <= 2'b11;
		end
		else test_pattren <= test_pattren;
	end
	else if(next_state == S2)begin
		test_pattren <= 2'bx;
	end
	else if(next_state == DONE)begin
		test_pattren <= test_pattren;
	end
	else test_pattren <= 0;
end

//============================
//            c               
//============================
always@(posedge clk) begin
	if (!rst_n) begin
		c <= 0; 
	end

	else if(C_STATE == START)begin
		c <= 0;
	end

	else if(C_STATE == S1)begin
		c <= c;
	end

	else if(C_STATE == S2)begin
		if(next_state == S1) c <= 1;
		else  c <= c;
	end

	else if(next_state == DONE)begin
		c <= 0;
	end

	else c <= c;
end

//============================
//            d             
//============================

always@(posedge clk) begin
	if (!rst_n) begin
		d <= 0 ; 
	end
	else if(C_STATE == START)begin
		d <= 0 ;
	end
	else if(C_STATE == S2)begin
		if(c == 0)begin
			if(a == 0 || a == 2 || a==5 || a==7 || a==8 || a==10 || a==13 || a==15) d <= 2'b0;
			else d <= 2'b11;
		end
		else if(c == 1)begin
			if(a == 1 || a == 3 || a==4 || a==6 || a==9 || a==11 || a==12 || a==14) d <= 2'b0;
			else d <= 2'b11;
		end
		else d <= d;
	end

	else if(next_state == DONE)begin
		d <= d;	
	end
	else d <= d;
end

//assign mux_out_data = (tester)? 

//============================ 
//     address_compare     
//============================
always@(posedge clk) 
begin
	if (!rst_n) begin
		address_compare <= 4'bx;
	end

	else if(C_STATE == S1)begin
		if(b ==1) address_compare <= 0;
		else address_compare <= address_compare;
	end

	else if(C_STATE == S2)begin
		address_compare <= a ;
	end
	else if(C_STATE == DONE)begin
		address_compare <= address_compare;
	end
	else address_compare <= address_compare;
end

//============================ 
//     address_compare_2     
//============================
always@(posedge clk) 
begin
	if (!rst_n) begin
		address_compare_2 <= 4'bx;
	end

	else if(C_STATE == S2)begin
		address_compare_2 <= address_compare ;
	end

	else if(C_STATE == DONE)begin
		address_compare_2 <= address_compare;
	end

	else address_compare_2 <= address_compare;
end

//============================
//       pass_or_fail 
//============================

always@(posedge clk) begin
	if(tester == 0 ) begin
		if (!rst_n) begin
			pass_or_fail <= 0 ; 
		end

		else if(C_STATE == S1) begin
			if(b ==1 && a==0)begin
				if(d == memory ) pass_or_fail <= 0 ; 
				else pass_or_fail <= 1;
			end
			else pass_or_fail <= 0;
		end

		else if(C_STATE == S2)begin
			if(a > 0)begin 
				if(d == memory) pass_or_fail <= 0 ; 
				else pass_or_fail <= 1;
			end

			else pass_or_fail <= 0 ;
		end

		else if(C_STATE == DONE) begin
			if(c == 1)begin
				if(d == memory) pass_or_fail <= 0 ; 
				else pass_or_fail <= 1;
			end
			else pass_or_fail <= 0;

		end
		
		
		else pass_or_fail <= 0 ; 
	end
	else pass_or_fail <= 0 ;
end



always@(posedge clk) begin
	if(tester == 0)begin
		if (!rst_n) begin
			test_down <= 0;
		end
		else if(C_STATE == DONE)begin
			if(address_compare_2 == 15) test_down <= 1;
			else test_down <= 0;
		end
		else test_down <= 0;
	end
	else test_down <= 1;
end

assign aa = a;

endmodule
