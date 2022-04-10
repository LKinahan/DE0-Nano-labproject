// labproject.sv - top-level module for ELEX 7660 labproject
// Zachary Sheppard  March 4, 2021

module labproject ( output logic [3:0] kpc,  // column select, active-low
              (* altera_attribute = "-name WEAK_PULL_UP_RESISTOR ON" *)
              input logic  [3:0] kpr,  // rows, active-low w/ pull-ups
              output logic [7:0] leds, // active-low LED segments 
              output logic [3:0] ct,   // " digit enables
				  output logic spkr, rst,
				  output logic [3:0] num_rand, //where the random number is set and outputted to kpdecode
				  input logic [1:0] digit,
				  
              input logic  reset_n, FPGA_CLK1_50,
				  input logic [(14 - 1):0] seed) ;

   logic clk ;                  		
   logic kphit ;                  	// a key is pressed
	logic [3:0] num;
	logic [1:0] random_num;		//where the random number is initially stored
	reg [(14 - 1):0]out;			//variable holding random number using LFSR
	logic [31:0] desiredFrequency; 	// desired note frequency (e.g C = 261Hz, A = 440Hz etc.)
	logic [31:0] count = 0; 
	
   //assign ct = { {3{1'b0}}, kphit } ;
	//assign ct = {kphit, 3'b000 } ;
   pll pll0 ( .inclk0(FPGA_CLK1_50), .c0(clk) ) ;
	

   // instantiate your modules here...
	colseq colseq_0 (.*);
	kpdecode kpdecode_0 (.*);
	decode2 decode2_0 (.*);
	decode7 decode7_0 (.*);
	lfsr lfsr_0 (.*);
	decodeSPKR decodeSPKR_0 (.*);
	MusicBox MusicBox_0 (.*);
	
	enum {menu,init,display} state = menu, statenext;
	
	always_ff @(posedge FPGA_CLK1_50) begin
		/*
		state <= statenext;
		
		case(state)
			
			menu: begin
				count <= 0;
				random_num <= 0;
			end
			
			init: begin
				count <= 0;
				rst <= 1;
				random_num <= out % 4;
			end
			
			display: begin
						
						if(count < 10000000) begin
							case(random_num)
								0: num_rand <= 4'h0;
								1: num_rand <= 4'h1;
								2: num_rand <= 4'h2;
								3: num_rand <= 4'h3;
								default: num_rand <= 4'h4;
							endcase
							count <= count + 1;
						end
						
						/*
						while(count < 10000000) begin
							num <= random_num;
							count <= count + 1;
						end
						*/
			//end
		//endcase 
	
	
	end
	
	always_comb begin
	/*
		case(state)
			menu: begin
					if(num == 11)
							statenext = init;
					else
						statenext = menu;
				end
			init:
					statenext = display;
			
			display: begin
					if(count >= 10000000)
						statenext = menu;
					else
						statenext = display;
				end
			
			default: statenext = menu;
		endcase
		*/
	end
	

endmodule

// megafunction wizard: %ALTPLL%
// ...
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ...

module pll ( inclk0, c0);

        input     inclk0;
        output    c0;

        wire [0:0] sub_wire2 = 1'h0;
        wire [4:0] sub_wire3;
        wire  sub_wire0 = inclk0;
        wire [1:0] sub_wire1 = {sub_wire2, sub_wire0};
        wire [0:0] sub_wire4 = sub_wire3[0:0];
        wire  c0 = sub_wire4;

        altpll altpll_component ( .inclk (sub_wire1), .clk
          (sub_wire3), .activeclock (), .areset (1'b0), .clkbad
          (), .clkena ({6{1'b1}}), .clkloss (), .clkswitch
          (1'b0), .configupdate (1'b0), .enable0 (), .enable1 (),
          .extclk (), .extclkena ({4{1'b1}}), .fbin (1'b1),
          .fbmimicbidir (), .fbout (), .fref (), .icdrclk (),
          .locked (), .pfdena (1'b1), .phasecounterselect
          ({4{1'b1}}), .phasedone (), .phasestep (1'b1),
          .phaseupdown (1'b1), .pllena (1'b1), .scanaclr (1'b0),
          .scanclk (1'b0), .scanclkena (1'b1), .scandata (1'b0),
          .scandataout (), .scandone (), .scanread (1'b0),
          .scanwrite (1'b0), .sclkout0 (), .sclkout1 (),
          .vcooverrange (), .vcounderrange ());

        defparam
                altpll_component.bandwidth_type = "AUTO",
                altpll_component.clk0_divide_by = 25000,
                altpll_component.clk0_duty_cycle = 50,
                altpll_component.clk0_multiply_by = 1,
                altpll_component.clk0_phase_shift = "0",
                altpll_component.compensate_clock = "CLK0",
                altpll_component.inclk0_input_frequency = 20000,
                altpll_component.intended_device_family = "Cyclone IV E",
                altpll_component.lpm_hint = "CBX_MODULE_PREFIX=lab1clk",
                altpll_component.lpm_type = "altpll",
                altpll_component.operation_mode = "NORMAL",
                altpll_component.pll_type = "AUTO",
                altpll_component.port_activeclock = "PORT_UNUSED",
                altpll_component.port_areset = "PORT_UNUSED",
                altpll_component.port_clkbad0 = "PORT_UNUSED",
                altpll_component.port_clkbad1 = "PORT_UNUSED",
                altpll_component.port_clkloss = "PORT_UNUSED",
                altpll_component.port_clkswitch = "PORT_UNUSED",
                altpll_component.port_configupdate = "PORT_UNUSED",
                altpll_component.port_fbin = "PORT_UNUSED",
                altpll_component.port_inclk0 = "PORT_USED",
                altpll_component.port_inclk1 = "PORT_UNUSED",
                altpll_component.port_locked = "PORT_UNUSED",
                altpll_component.port_pfdena = "PORT_UNUSED",
                altpll_component.port_phasecounterselect = "PORT_UNUSED",
                altpll_component.port_phasedone = "PORT_UNUSED",
                altpll_component.port_phasestep = "PORT_UNUSED",
                altpll_component.port_phaseupdown = "PORT_UNUSED",
                altpll_component.port_pllena = "PORT_UNUSED",
                altpll_component.port_scanaclr = "PORT_UNUSED",
                altpll_component.port_scanclk = "PORT_UNUSED",
                altpll_component.port_scanclkena = "PORT_UNUSED",
                altpll_component.port_scandata = "PORT_UNUSED",
                altpll_component.port_scandataout = "PORT_UNUSED",
                altpll_component.port_scandone = "PORT_UNUSED",
                altpll_component.port_scanread = "PORT_UNUSED",
                altpll_component.port_scanwrite = "PORT_UNUSED",
                altpll_component.port_clk0 = "PORT_USED",
                altpll_component.port_clk1 = "PORT_UNUSED",
                altpll_component.port_clk2 = "PORT_UNUSED",
                altpll_component.port_clk3 = "PORT_UNUSED",
                altpll_component.port_clk4 = "PORT_UNUSED",
                altpll_component.port_clk5 = "PORT_UNUSED",
                altpll_component.port_clkena0 = "PORT_UNUSED",
                altpll_component.port_clkena1 = "PORT_UNUSED",
                altpll_component.port_clkena2 = "PORT_UNUSED",
                altpll_component.port_clkena3 = "PORT_UNUSED",
                altpll_component.port_clkena4 = "PORT_UNUSED",
                altpll_component.port_clkena5 = "PORT_UNUSED",
                altpll_component.port_extclk0 = "PORT_UNUSED",
                altpll_component.port_extclk1 = "PORT_UNUSED",
                altpll_component.port_extclk2 = "PORT_UNUSED",
                altpll_component.port_extclk3 = "PORT_UNUSED",
                altpll_component.width_clock = 5;


endmodule
