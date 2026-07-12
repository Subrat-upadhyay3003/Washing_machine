module wash_rtl(
	input wire clk,
	input wire rst,
	input wire start,
	output reg fill_valve,
	output reg wash_motor,
	output reg rinse_valve,
	output reg spin_motor,
	output reg done
);
typedef enum reg [2:0] {
	IDLE =3'b000,
	FILL =3'b001,
	WASH =3'b010,
	RINSE =3'b011,
	SPIN =3'b100,
	DONE =3'b101
}state_t;

state_t current_state, next_state;

always @(posedge clk or posedge rst)begin
if(rst)
	current_state<=IDLE;
else
	current_state<=next_state;
end

always@(*) begin
	case (current_state)
	IDLE: next_state=start ? FILL :IDLE;
	FILL: next_state =WASH;
	WASH: next_state =RINSE;
	RINSE: next_state =SPIN;
	SPIN: next_state =DONE;
	DONE: next_state =IDLE;
	default: next_state=IDLE;
endcase
end

always@(*) begin
	fill_valve = 0 ;
	wash_motor = 0 ;
	rinse_valve = 0 ; 
	spin_motor = 0 ;
	done = 0 ;
	case (current_state)
		FILL: fill_valve=1;
		WASH: wash_motor=1;
		RINSE: rinse_valve=1;
		SPIN: spin_motor=1;
		DONE: done=1;
	endcase
	end
endmodule
