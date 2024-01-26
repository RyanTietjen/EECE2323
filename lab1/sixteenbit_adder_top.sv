module sixteenbit_adder_top(
        input logic clk,				// clock for vio
		output logic adder_ovf_flag,
		output logic [3:0] disp_en,		// 7-Segment display enable
		output logic [6:0] seg7_output    // LD3
    );
    
    wire [15:0] adder_1st_input, adder_2nd_input;
    wire [15:0] adder_output;
	
	//Instantiate the sixteenbit_alu module here	
    sixteenbit_adder adder(
        .a(adder_1st_input),
        .b(adder_2nd_input),
        .f(adder_output),
        .ovf(adder_ovf_flag)
        );
        
    Adaptor_display display(
		.clk(clk), 					// system clock
		.input_value(adder_output),	// 16-bit input [15:0] value to display
		.disp_en(disp_en),			// output [3:0] 7 segment display enable
		.seg7_output(seg7_output)	// output [6:0] 7 segment signals
	);

    //Instantiate the VIO core here
    //Find the instantiate template from Sources Pane, IP sources -> Instantiation Template -> vio_0.veo (double click to open the file)        
    vio_0 sixteenbit_adder_top (
          .clk(clk),                // input wire clk
          .probe_in0(adder_output),    // input wire [15 : 0] probe_in0
          .probe_in1(adder_ovf_flag),    // input wire [0 : 0] probe_in1
          .probe_out0(adder_1st_input),  // output wire [15 : 0] probe_out0
          .probe_out1(adder_2nd_input)  // output wire [15 : 0] probe_out1
        );
endmodule
