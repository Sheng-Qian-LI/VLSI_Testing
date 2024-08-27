module divide_8bit ( clk, rst_n, in_valid, dividend, divisor, remainder, quotient,  out_valid);

input clk; 
input rst_n;
input in_valid;
input [7:0] dividend;       //被除數
input [7:0] divisor;        //除數
output reg out_valid;
output reg [7:0] remainder;  
output reg [7:0] quotient;

reg[2:0]  C_STATE , next_state;
reg [7:0] counter;
reg [15:0] remainder_state, divisor_state;

parameter IDLE = 2'b00;
parameter SHIFT = 2'b01;
parameter SUBSTRACT = 2'b10;
parameter RESULT = 2'b11;

always@(posedge clk or negedge rst_n)   
begin
	if (!rst_n) begin
		C_STATE <= IDLE;
	end
	else begin
		C_STATE <= next_state;
	end
end

always @(*) begin
	case(C_STATE)
	
		IDLE : begin
			if(in_valid) next_state = SHIFT;
			else next_state = IDLE;
		end

		SHIFT : if(counter < 8)begin
					next_state = SUBSTRACT;
				 end
				 else begin
					next_state = RESULT;
				 end

		SUBSTRACT : if(counter < 8)begin
					next_state = SHIFT;
				end
				else begin
					next_state = RESULT;
				end
		RESULT : next_state = IDLE;

		default next_state = C_STATE;
	endcase
end

///////////////   remainder_state & divisor_state  ///////////////
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		remainder_state <= 16'b0;
		divisor_state <= 16'b0;
	end
	else if(in_valid)begin
		remainder_state <= {8'b00000000, dividend};
		divisor_state <= {divisor, 8'b00000000};
	end
	else if (C_STATE == IDLE) begin
		remainder_state <= {8'b00000000, dividend};
		divisor_state <= {divisor, 8'b00000000};
	end
	else if (C_STATE == SHIFT) begin
		remainder_state <= remainder_state << 1 ;
	end
	else if (C_STATE == SUBSTRACT) begin
		if(remainder_state >= divisor_state)
			remainder_state <= remainder_state - divisor_state + 1;
		else begin
			remainder_state <= remainder_state;
		end
	end
	else begin
		remainder_state <= 16'b0;
		divisor_state <= 16'b0;
	end
end

///////////////////////////   counter  /////////////////////////////
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		counter <= 0;
	end
	else if(C_STATE == IDLE) begin
		counter <= 0;
	end
	else if(C_STATE == SHIFT)begin
		counter <= counter + 1;
	end
	else if(C_STATE == SUBSTRACT)begin
		counter <= counter;
	end
	else if(C_STATE == RESULT)begin
		counter <= 0;
	end
	else counter <= 0;
end

///////////////////////////   remainder  /////////////////////////////
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		remainder <=8'b0;
	end
	else if (C_STATE == IDLE) begin
		remainder <=8'b0;
	end
	else begin
		remainder <= remainder_state[15:8];
	end
end

///////////////////////////   quotient  /////////////////////////////
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		quotient <= 8'b0;
	end
	else if (C_STATE == IDLE) begin
		quotient <= 8'b0;
	end
	else begin
		quotient <= remainder_state[7:0];
	end
end

///////////////////////////   out_valid  /////////////////////////////
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) out_valid <= 0;

	else if (C_STATE == RESULT) begin
		out_valid <= 1;
	end

	else out_valid <= 0;
end

endmodule











