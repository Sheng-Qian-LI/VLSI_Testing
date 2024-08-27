//`include "sram.v"
module BIST_MARCH(
	 clk, 
	 rst_n, 
	 memory, 
	 a,
	 we_n_march,
	 cs_n_march,
	 tester,
	 test_pattren, 
	 pass_or_fail , 
	 test_down
);
input tester;
input clk; 
input rst_n;
input [1:0] memory;

output reg[3:0] a;
output reg[1:0]test_pattren; // 接data in
output reg pass_or_fail;
output reg test_down;
output we_n_march;
output cs_n_march;

reg[4:0]  C_STATE , next_state;
reg we_n_march ;
reg cs_n_march ;
reg[1:0] c ;
reg[1:0] d ;
reg[3:0] count ;  //比較用的
reg[3:0] count1 ; //S4切S5用
reg[3:0] address_compare ;

parameter START = 3'b000;
parameter S1 = 3'b001;        //寫入0
parameter S2 = 3'b010;        //讀addr  
parameter S3 = 3'b011;        //
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter DONE = 3'b110;

//sram u1(.clk(clk),.rst_n(rst_n),.address(a),.we_n_march(we_n_march),.cs_n_march(cs_n_march),.data_in(test_pattren),.data_out(memory));

always@(posedge clk ) begin
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
			 else if (a < 16) begin
				next_state = S1;
			 end
			 else next_state = S1;

		S2 : if(a < 16) next_state = S3;
			 else next_state = S1;

		S3 : next_state = S4;

		S4 : if(a < 15) next_state = S2;
			 else if(a == 15) begin
				if(count1 == 1)next_state = S5;
				else if(count1 == 4)next_state = S5;
				else next_state = S2;
			end
			else next_state = S2;

		S5 : if(a == 15) 
				if(count1 == 2)next_state = S2;
				else next_state = DONE;
			 else next_state = S5;

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
	else if(C_STATE == S1)begin
		a <= a + 1;
	end
	else if(next_state == S2 && C_STATE == S1 )begin
		if(C_STATE == S1 ) a <= 0;
		else  a <= a;
	end
	else if(C_STATE == S3)begin
		a <= a ;
	end
	else if(C_STATE == S4)begin
			if(a==15)a <= 0;
			else a <= a + 1;
	end
	else if(C_STATE == S5)begin
		a <= a + 1;
	end
	
	else a <= a;
end

//============================
//           we/cs   
//============================
always@(posedge clk) begin
	if (!rst_n) begin
		we_n_march <= 2'b0;
		cs_n_march <= 2'b0;
		test_pattren <= 2'bx;
	end
	else if(C_STATE == START)begin
		we_n_march <= 0;
		cs_n_march <= 0;
		test_pattren <= 0;
	end
	else if(next_state == S2)begin
		we_n_march <= 1;
		cs_n_march <= 0;
		test_pattren <= 2'bx;
	end
	else if(next_state == S3)begin
		we_n_march <= 0;
		cs_n_march <= 0;
		if(count1 == 0) test_pattren <= 1;
		else if(count1 == 1) test_pattren <= 3;
		else if(count1 == 3) test_pattren <= 1;
		else if(count1 == 4) test_pattren <= 0;
		else test_pattren <= 0;
	
	end
	else if(next_state == S4)begin
		we_n_march <= 1;
		cs_n_march <= 0;
		test_pattren <= 2'bx;
		
	end
	else if(next_state == S5)begin
		we_n_march <= 1;
	end
	else if(next_state == DONE)begin
		cs_n_march <= 1;
	end
	else cs_n_march <= 0;
end

//============================
//            c               
//============================
always@(posedge clk) begin
	if (!rst_n) begin
		c <= 0 ; 
	end

	else if(C_STATE == START)begin
		c <= 0 ;
	end

	else if(next_state == S2)begin
		 if(count1 == 0 && C_STATE == S4) begin
			if(a == 15) c <= 1;
			else c <= 0;
		 end
		else if(count1 == 1)  c <= 1;
		else if(count1 == 2)  c <= 3;
		else if (count1 == 3) begin
			if(next_state == 4) c <= 1;
			else if (a == 15) c <=1; 
			else c <= 3;
		end
		else if (count1 == 4) c <= 1;
		else c <= 0;
	end

	else if(next_state == S4)begin
		c <= test_pattren;
	end

	else if(next_state == S5)begin
		if(count1 ==2 || count1 ==1) c <= 3;
		else c <= 0;
	end

	else if(next_state == DONE)begin
		c <= 0;
	end

	else c <= c;
end

//============================ 
//         count1   
//============================
always@(posedge clk) begin
	if (!rst_n) begin
		count1 <= 0 ;
	end
	else if(C_STATE == 4 && a == 15)begin
		count1 <= count1 + 1 ;
	end
	else if(C_STATE == 5 && a == 15)count1 <= count1 + 1 ;
	else count1 <= count1;
end

//============================
//            d             
//============================
always@(posedge clk) begin
	if (!rst_n) begin
		d <= 0 ; 
	end
	else if(C_STATE == START)begin
		d <= c ;
	end
	else if(next_state == S2)begin
		d <= c;
		end
	else if(next_state == S3)begin
		d <= c;
		end
	else if(next_state == S4)begin
		d <= c;
		end
	else if(next_state == S5)begin
		d <= c;	
	end
	else if(next_state == DONE)begin
		d <= c;	
	end
	else d <= c;
end

//============================
//       pass_or_fail 
//============================
always@(posedge clk) begin
	if(tester == 0) begin
		if (!rst_n) begin
			pass_or_fail <= 0 ; 
		end
		else if(count < 16)begin
			if(C_STATE == S2)begin
				if(a > 0)begin 
					if(d == memory) pass_or_fail <= 0 ; 
					else pass_or_fail <= 1;
				end
				else if ( count1 == 1) begin
					if(d == memory) pass_or_fail <= 0 ; 
					else pass_or_fail <= 1;
				end
				else if ( count1 == 3) begin
					if(d == memory) pass_or_fail <= 0 ; 
					else pass_or_fail <= 1;
				end
				else pass_or_fail <= 0 ;
			end

			else if(C_STATE == S3) begin
				if(d == memory) pass_or_fail <= 0 ; 
				else pass_or_fail <= 1;
			end

			else if(C_STATE == S5) begin
				if(d == memory) pass_or_fail <= 0 ; 
				else pass_or_fail <= 1;
			end

			else if(C_STATE == DONE) begin
				if(d == memory) pass_or_fail <= 0 ; 
				else pass_or_fail <= 1;
			end
			
			else pass_or_fail <= 0 ;
		end
		else pass_or_fail <= 0 ; 
	end
	else pass_or_fail <= 0 ;
end

//============================
//          count       
//============================
always@(posedge clk) 
begin
	if (!rst_n) begin
		count <= 1'bx;
	end
	else if(C_STATE == S2)begin
		if(a == 0) count <= 0  ;
		else count <= count + 1 ;
	end
	else if(C_STATE == S5) begin
		if(a== 0) count <= 0  ;
		else count <= count + 1 ;
	end
	else if(C_STATE == DONE) count <= 1'bx;
	else count <= count;
end

//============================ 
//     address_compare     
//============================
always@(posedge clk) 
begin
	if (!rst_n) begin
		address_compare <= 4'bx;
	end
	else if(C_STATE == S3)begin
		address_compare <= a;
	end
	else if(C_STATE == S5)begin
		address_compare <= count;
	end
	else if(C_STATE == S2)begin
		if(count1 == 3) address_compare <= count;
	end
	else if(C_STATE == DONE)begin
		if(count1 == 6) address_compare <= count;
	end
	else address_compare <= address_compare;
end

always@(posedge clk) begin
	if(tester == 0) begin ;
		if (!rst_n) begin
			test_down <= 0;
		end
		else if(C_STATE == DONE)begin
			if(address_compare == 14) test_down <= 0;
			else test_down <= 1;
		end
		else test_down <= 0;
	end
	else test_down <= 1;	
end

endmodule
