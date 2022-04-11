module randNumberGenerator (input logic FPGA_CLK1_50,
                            output logic [3:0] randNum0);
									 
  logic [3:0] count = 3;
					
	always_ff @(posedge FPGA_CLK1_50) begin
		
			count <= count + 1;
			
			if(count >= 12) begin
				count <= 0;
			end
			randNum0 <= (11*count) /15;
			
	end
endmodule
