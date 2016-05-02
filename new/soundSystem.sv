module soundSystem(input logic clk,[4:0]song,output logic songplay);
	logic song1,song2, song3, song4, song5;
	A(clk, song1);
	B(clk, song2);
	C(clk, song3);
	D(clk, song4);
	E(clk, song5);
	always_ff@(posedge div_clk)
		case (song)
			default: begin songplay = 0; end
			5'b00001:begin songplay = song1; end
			5'b00010:begin songplay = song2; end
			5'b00100:begin songplay = song3; end
			5'b01000:begin songplay = song4; end
			5'b10000:begin songplay = song5; end
		endcase
endmodule

module A(clk, song);)//440HZ
reg [14:0] counter;
always @(posedge clk) if(counter==28408) counter<=0; else counter <= counter+1;

reg speaker;
always @(posedge clk) if(counter==28408) speaker <= ~speaker;
endmodule


module B(clk, song);//400Hz
reg [20:0] counter;
always @(posedge clk) if(counter==29999999) counter <= 0; else counter <= counter+1;

assign speaker = counter[20];
endmodule

module C(clk, song);//350Hz
reg [30:0] counter;
always @(posedge clk) if(counter==39999999) counter <= 0; else counter <= counter+1;

assign speaker = counter[30];
endmodule


module D(clk, song);//300Hz
reg [40:0] counter;
always @(posedge clk) if(counter==49999999) counter <= 0; else counter <= counter+1;

assign speaker = counter[40];
endmodule

module E(clk, song);//250Hz
reg [50:0] counter;
always @(posedge clk) if(counter==59999999) counter <= 0; else counter <= counter+1;

assign speaker = counter[50];
endmodule
