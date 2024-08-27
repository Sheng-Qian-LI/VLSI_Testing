module sram ( 
	clk, 
	rst_n, 
	address, 	
	we_n, 
	cs_n,
	data_in,

	data_out 
);

input clk; 
input rst_n;
input [1:0] data_in;
output reg [1:0] data_out;

reg [3:0] space0 [3:0];
reg [3:0] space1 [3:0];
input [3:0] address;
input wire we_n;
input wire cs_n;

always@(posedge clk) begin
	if (!rst_n) begin
		space0[0] <= 0;
		space0[1] <= 0;
		space0[2] <= 0;
		space0[3] <= 0;
		space1[0] <= 0;
		space1[1] <= 0;
		space1[2] <= 0;
		space1[3] <= 0;
		data_out <= 2'b0;
	end
	
	else if (we_n == 0 && cs_n == 0) begin
		space0[address[3:2]][address[1:0]] <= data_in[0];
		space1[address[3:2]][address[1:0]] <= data_in[1];
		data_out[0] <= 1'bx;
		data_out[1] <= 1'bx;
	end 
	
	else if(we_n == 1 && cs_n == 0)begin
		// Fault_free
		data_out[0] <= space0[address[3:2]][address[1:0]];
		data_out[1] <= space1[address[3:2]][address[1:0]];

		//Stuck at fault
		/*if(address[3:2] == 1 && address[1:0] == 1)begin
			data_out[0] <= space0[address[3:2]][address[1:0]];
			data_out[1] <= 1'b1;
		end
		else begin
			data_out[0] <= space0[address[3:2]][address[1:0]];
			data_out[1] <= space1[address[3:2]][address[1:0]];
		end*/
	end

	else if(cs_n == 1)begin
		data_out[0] <= 1'bx;
		data_out[1] <= 1'bx;
	end

	else begin
		space0[0] <= 0;
		space0[1] <= 0;
		space0[2] <= 0;
		space0[3] <= 0;
		space1[0] <= 0;
		space1[1] <= 0;
		space1[2] <= 0;
		space1[3] <= 0;
	end
end

//assign space1[1][0] = 1'bx;
//assign data_out[1] = space1[1][0];

endmodule




