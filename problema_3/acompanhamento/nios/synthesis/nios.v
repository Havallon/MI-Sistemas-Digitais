// nios.v

// Generated using ACDS version 17.0 602

`timescale 1 ps / 1 ps
module nios (
		input  wire       clk_clk,       //   clk.clk
		output wire [7:0] led_export,    //   led.export
		input  wire       reset_reset_n, // reset.reset_n
		input  wire       rs232_rxd,     // rs232.rxd
		output wire       rs232_txd      //      .txd
	);

	wire  [31:0] nios_data_master_readdata;                          // mm_interconnect_0:nios_data_master_readdata -> nios:d_readdata
	wire         nios_data_master_waitrequest;                       // mm_interconnect_0:nios_data_master_waitrequest -> nios:d_waitrequest
	wire         nios_data_master_debugaccess;                       // nios:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:nios_data_master_debugaccess
	wire  [13:0] nios_data_master_address;                           // nios:d_address -> mm_interconnect_0:nios_data_master_address
	wire   [3:0] nios_data_master_byteenable;                        // nios:d_byteenable -> mm_interconnect_0:nios_data_master_byteenable
	wire         nios_data_master_read;                              // nios:d_read -> mm_interconnect_0:nios_data_master_read
	wire         nios_data_master_write;                             // nios:d_write -> mm_interconnect_0:nios_data_master_write
	wire  [31:0] nios_data_master_writedata;                         // nios:d_writedata -> mm_interconnect_0:nios_data_master_writedata
	wire  [31:0] nios_instruction_master_readdata;                   // mm_interconnect_0:nios_instruction_master_readdata -> nios:i_readdata
	wire         nios_instruction_master_waitrequest;                // mm_interconnect_0:nios_instruction_master_waitrequest -> nios:i_waitrequest
	wire  [13:0] nios_instruction_master_address;                    // nios:i_address -> mm_interconnect_0:nios_instruction_master_address
	wire         nios_instruction_master_read;                       // nios:i_read -> mm_interconnect_0:nios_instruction_master_read
	wire  [31:0] mm_interconnect_0_nios_debug_mem_slave_readdata;    // nios:debug_mem_slave_readdata -> mm_interconnect_0:nios_debug_mem_slave_readdata
	wire         mm_interconnect_0_nios_debug_mem_slave_waitrequest; // nios:debug_mem_slave_waitrequest -> mm_interconnect_0:nios_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_nios_debug_mem_slave_debugaccess; // mm_interconnect_0:nios_debug_mem_slave_debugaccess -> nios:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_nios_debug_mem_slave_address;     // mm_interconnect_0:nios_debug_mem_slave_address -> nios:debug_mem_slave_address
	wire         mm_interconnect_0_nios_debug_mem_slave_read;        // mm_interconnect_0:nios_debug_mem_slave_read -> nios:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_nios_debug_mem_slave_byteenable;  // mm_interconnect_0:nios_debug_mem_slave_byteenable -> nios:debug_mem_slave_byteenable
	wire         mm_interconnect_0_nios_debug_mem_slave_write;       // mm_interconnect_0:nios_debug_mem_slave_write -> nios:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_nios_debug_mem_slave_writedata;   // mm_interconnect_0:nios_debug_mem_slave_writedata -> nios:debug_mem_slave_writedata
	wire         mm_interconnect_0_rs232_s1_chipselect;              // mm_interconnect_0:rs232_s1_chipselect -> rs232:chipselect
	wire  [15:0] mm_interconnect_0_rs232_s1_readdata;                // rs232:readdata -> mm_interconnect_0:rs232_s1_readdata
	wire   [2:0] mm_interconnect_0_rs232_s1_address;                 // mm_interconnect_0:rs232_s1_address -> rs232:address
	wire         mm_interconnect_0_rs232_s1_read;                    // mm_interconnect_0:rs232_s1_read -> rs232:read_n
	wire         mm_interconnect_0_rs232_s1_begintransfer;           // mm_interconnect_0:rs232_s1_begintransfer -> rs232:begintransfer
	wire         mm_interconnect_0_rs232_s1_write;                   // mm_interconnect_0:rs232_s1_write -> rs232:write_n
	wire  [15:0] mm_interconnect_0_rs232_s1_writedata;               // mm_interconnect_0:rs232_s1_writedata -> rs232:writedata
	wire         mm_interconnect_0_led_s1_chipselect;                // mm_interconnect_0:led_s1_chipselect -> led:chipselect
	wire  [31:0] mm_interconnect_0_led_s1_readdata;                  // led:readdata -> mm_interconnect_0:led_s1_readdata
	wire   [1:0] mm_interconnect_0_led_s1_address;                   // mm_interconnect_0:led_s1_address -> led:address
	wire         mm_interconnect_0_led_s1_write;                     // mm_interconnect_0:led_s1_write -> led:write_n
	wire  [31:0] mm_interconnect_0_led_s1_writedata;                 // mm_interconnect_0:led_s1_writedata -> led:writedata
	wire         mm_interconnect_0_memoria_s1_chipselect;            // mm_interconnect_0:memoria_s1_chipselect -> memoria:chipselect
	wire  [31:0] mm_interconnect_0_memoria_s1_readdata;              // memoria:readdata -> mm_interconnect_0:memoria_s1_readdata
	wire   [9:0] mm_interconnect_0_memoria_s1_address;               // mm_interconnect_0:memoria_s1_address -> memoria:address
	wire   [3:0] mm_interconnect_0_memoria_s1_byteenable;            // mm_interconnect_0:memoria_s1_byteenable -> memoria:byteenable
	wire         mm_interconnect_0_memoria_s1_write;                 // mm_interconnect_0:memoria_s1_write -> memoria:write
	wire  [31:0] mm_interconnect_0_memoria_s1_writedata;             // mm_interconnect_0:memoria_s1_writedata -> memoria:writedata
	wire         mm_interconnect_0_memoria_s1_clken;                 // mm_interconnect_0:memoria_s1_clken -> memoria:clken
	wire         irq_mapper_receiver0_irq;                           // rs232:irq -> irq_mapper:receiver0_irq
	wire  [31:0] nios_irq_irq;                                       // irq_mapper:sender_irq -> nios:irq
	wire         rst_controller_reset_out_reset;                     // rst_controller:reset_out -> [led:reset_n, memoria:reset, mm_interconnect_0:rs232_reset_reset_bridge_in_reset_reset, rs232:reset_n, rst_translator:in_reset]
	wire         rst_controller_reset_out_reset_req;                 // rst_controller:reset_req -> [memoria:reset_req, rst_translator:reset_req_in]
	wire         rst_controller_001_reset_out_reset;                 // rst_controller_001:reset_out -> [irq_mapper:reset, mm_interconnect_0:nios_reset_reset_bridge_in_reset_reset, nios:reset_n]
	wire         rst_controller_001_reset_out_reset_req;             // rst_controller_001:reset_req -> [nios:reset_req, rst_translator_001:reset_req_in]
	wire         nios_debug_reset_request_reset;                     // nios:debug_reset_request -> rst_controller_001:reset_in1

	nios_led led (
		.clk        (clk_clk),                             //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),     //               reset.reset_n
		.address    (mm_interconnect_0_led_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_s1_readdata),   //                    .readdata
		.out_port   (led_export)                           // external_connection.export
	);

	nios_memoria memoria (
		.clk        (clk_clk),                                 //   clk1.clk
		.address    (mm_interconnect_0_memoria_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_memoria_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_memoria_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_memoria_s1_write),      //       .write
		.readdata   (mm_interconnect_0_memoria_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_memoria_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_memoria_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),          // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),      //       .reset_req
		.freeze     (1'b0)                                     // (terminated)
	);

	nios_nios nios (
		.clk                                 (clk_clk),                                            //                       clk.clk
		.reset_n                             (~rst_controller_001_reset_out_reset),                //                     reset.reset_n
		.reset_req                           (rst_controller_001_reset_out_reset_req),             //                          .reset_req
		.d_address                           (nios_data_master_address),                           //               data_master.address
		.d_byteenable                        (nios_data_master_byteenable),                        //                          .byteenable
		.d_read                              (nios_data_master_read),                              //                          .read
		.d_readdata                          (nios_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (nios_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (nios_data_master_write),                             //                          .write
		.d_writedata                         (nios_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (nios_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (nios_instruction_master_address),                    //        instruction_master.address
		.i_read                              (nios_instruction_master_read),                       //                          .read
		.i_readdata                          (nios_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (nios_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (nios_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (nios_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_nios_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_nios_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_nios_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_nios_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_nios_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_nios_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_nios_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_nios_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                    // custom_instruction_master.readra
	);

	nios_rs232 rs232 (
		.clk           (clk_clk),                                  //                 clk.clk
		.reset_n       (~rst_controller_reset_out_reset),          //               reset.reset_n
		.address       (mm_interconnect_0_rs232_s1_address),       //                  s1.address
		.begintransfer (mm_interconnect_0_rs232_s1_begintransfer), //                    .begintransfer
		.chipselect    (mm_interconnect_0_rs232_s1_chipselect),    //                    .chipselect
		.read_n        (~mm_interconnect_0_rs232_s1_read),         //                    .read_n
		.write_n       (~mm_interconnect_0_rs232_s1_write),        //                    .write_n
		.writedata     (mm_interconnect_0_rs232_s1_writedata),     //                    .writedata
		.readdata      (mm_interconnect_0_rs232_s1_readdata),      //                    .readdata
		.rxd           (rs232_rxd),                                // external_connection.export
		.txd           (rs232_txd),                                //                    .export
		.irq           (irq_mapper_receiver0_irq)                  //                 irq.irq
	);

	nios_mm_interconnect_0 mm_interconnect_0 (
		.clk_clk_clk                             (clk_clk),                                            //                           clk_clk.clk
		.nios_reset_reset_bridge_in_reset_reset  (rst_controller_001_reset_out_reset),                 //  nios_reset_reset_bridge_in_reset.reset
		.rs232_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                     // rs232_reset_reset_bridge_in_reset.reset
		.nios_data_master_address                (nios_data_master_address),                           //                  nios_data_master.address
		.nios_data_master_waitrequest            (nios_data_master_waitrequest),                       //                                  .waitrequest
		.nios_data_master_byteenable             (nios_data_master_byteenable),                        //                                  .byteenable
		.nios_data_master_read                   (nios_data_master_read),                              //                                  .read
		.nios_data_master_readdata               (nios_data_master_readdata),                          //                                  .readdata
		.nios_data_master_write                  (nios_data_master_write),                             //                                  .write
		.nios_data_master_writedata              (nios_data_master_writedata),                         //                                  .writedata
		.nios_data_master_debugaccess            (nios_data_master_debugaccess),                       //                                  .debugaccess
		.nios_instruction_master_address         (nios_instruction_master_address),                    //           nios_instruction_master.address
		.nios_instruction_master_waitrequest     (nios_instruction_master_waitrequest),                //                                  .waitrequest
		.nios_instruction_master_read            (nios_instruction_master_read),                       //                                  .read
		.nios_instruction_master_readdata        (nios_instruction_master_readdata),                   //                                  .readdata
		.led_s1_address                          (mm_interconnect_0_led_s1_address),                   //                            led_s1.address
		.led_s1_write                            (mm_interconnect_0_led_s1_write),                     //                                  .write
		.led_s1_readdata                         (mm_interconnect_0_led_s1_readdata),                  //                                  .readdata
		.led_s1_writedata                        (mm_interconnect_0_led_s1_writedata),                 //                                  .writedata
		.led_s1_chipselect                       (mm_interconnect_0_led_s1_chipselect),                //                                  .chipselect
		.memoria_s1_address                      (mm_interconnect_0_memoria_s1_address),               //                        memoria_s1.address
		.memoria_s1_write                        (mm_interconnect_0_memoria_s1_write),                 //                                  .write
		.memoria_s1_readdata                     (mm_interconnect_0_memoria_s1_readdata),              //                                  .readdata
		.memoria_s1_writedata                    (mm_interconnect_0_memoria_s1_writedata),             //                                  .writedata
		.memoria_s1_byteenable                   (mm_interconnect_0_memoria_s1_byteenable),            //                                  .byteenable
		.memoria_s1_chipselect                   (mm_interconnect_0_memoria_s1_chipselect),            //                                  .chipselect
		.memoria_s1_clken                        (mm_interconnect_0_memoria_s1_clken),                 //                                  .clken
		.nios_debug_mem_slave_address            (mm_interconnect_0_nios_debug_mem_slave_address),     //              nios_debug_mem_slave.address
		.nios_debug_mem_slave_write              (mm_interconnect_0_nios_debug_mem_slave_write),       //                                  .write
		.nios_debug_mem_slave_read               (mm_interconnect_0_nios_debug_mem_slave_read),        //                                  .read
		.nios_debug_mem_slave_readdata           (mm_interconnect_0_nios_debug_mem_slave_readdata),    //                                  .readdata
		.nios_debug_mem_slave_writedata          (mm_interconnect_0_nios_debug_mem_slave_writedata),   //                                  .writedata
		.nios_debug_mem_slave_byteenable         (mm_interconnect_0_nios_debug_mem_slave_byteenable),  //                                  .byteenable
		.nios_debug_mem_slave_waitrequest        (mm_interconnect_0_nios_debug_mem_slave_waitrequest), //                                  .waitrequest
		.nios_debug_mem_slave_debugaccess        (mm_interconnect_0_nios_debug_mem_slave_debugaccess), //                                  .debugaccess
		.rs232_s1_address                        (mm_interconnect_0_rs232_s1_address),                 //                          rs232_s1.address
		.rs232_s1_write                          (mm_interconnect_0_rs232_s1_write),                   //                                  .write
		.rs232_s1_read                           (mm_interconnect_0_rs232_s1_read),                    //                                  .read
		.rs232_s1_readdata                       (mm_interconnect_0_rs232_s1_readdata),                //                                  .readdata
		.rs232_s1_writedata                      (mm_interconnect_0_rs232_s1_writedata),               //                                  .writedata
		.rs232_s1_begintransfer                  (mm_interconnect_0_rs232_s1_begintransfer),           //                                  .begintransfer
		.rs232_s1_chipselect                     (mm_interconnect_0_rs232_s1_chipselect)               //                                  .chipselect
	);

	nios_irq_mapper irq_mapper (
		.clk           (clk_clk),                            //       clk.clk
		.reset         (rst_controller_001_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),           // receiver0.irq
		.sender_irq    (nios_irq_irq)                        //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                         // reset_in0.reset
		.reset_in1      (nios_debug_reset_request_reset),         // reset_in1.reset
		.clk            (clk_clk),                                //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_001_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                                   // (terminated)
		.reset_req_in1  (1'b0),                                   // (terminated)
		.reset_in2      (1'b0),                                   // (terminated)
		.reset_req_in2  (1'b0),                                   // (terminated)
		.reset_in3      (1'b0),                                   // (terminated)
		.reset_req_in3  (1'b0),                                   // (terminated)
		.reset_in4      (1'b0),                                   // (terminated)
		.reset_req_in4  (1'b0),                                   // (terminated)
		.reset_in5      (1'b0),                                   // (terminated)
		.reset_req_in5  (1'b0),                                   // (terminated)
		.reset_in6      (1'b0),                                   // (terminated)
		.reset_req_in6  (1'b0),                                   // (terminated)
		.reset_in7      (1'b0),                                   // (terminated)
		.reset_req_in7  (1'b0),                                   // (terminated)
		.reset_in8      (1'b0),                                   // (terminated)
		.reset_req_in8  (1'b0),                                   // (terminated)
		.reset_in9      (1'b0),                                   // (terminated)
		.reset_req_in9  (1'b0),                                   // (terminated)
		.reset_in10     (1'b0),                                   // (terminated)
		.reset_req_in10 (1'b0),                                   // (terminated)
		.reset_in11     (1'b0),                                   // (terminated)
		.reset_req_in11 (1'b0),                                   // (terminated)
		.reset_in12     (1'b0),                                   // (terminated)
		.reset_req_in12 (1'b0),                                   // (terminated)
		.reset_in13     (1'b0),                                   // (terminated)
		.reset_req_in13 (1'b0),                                   // (terminated)
		.reset_in14     (1'b0),                                   // (terminated)
		.reset_req_in14 (1'b0),                                   // (terminated)
		.reset_in15     (1'b0),                                   // (terminated)
		.reset_req_in15 (1'b0)                                    // (terminated)
	);

endmodule