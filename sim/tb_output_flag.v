`timescale 1ns/1ns
module tb_output_flag;

    reg             clk          ;
    reg             rst_n        ;
    reg	            order_reg	 ;  //0, 1
    reg	[1:0]	    music_reg	 ;  //1, 2, 3
    reg	[2:0]       volume_reg   ;  //1, 2, 3, 4, 5
    reg	[1:0]       speed_reg	 ;  //0, 1, 2 
    reg	            play_reg	 ;  //0, 1
    wire	        order1_flag	 ;
    wire	        order2_flag	 ;
    wire            music0_flag	 ;
    wire            music1_flag	 ;
    wire            music2_flag	 ;
    wire            music3_flag	 ;
    wire            volume1_flag ;
    wire            volume2_flag ;
    wire            volume3_flag ;
    wire            volume4_flag ;
    wire            volume5_flag ;
    wire            speed1_flag	 ;
    wire            speed2_flag	 ;
    wire            speed3_flag	 ;
    wire	        play1_flag 	 ;
    wire	        play2_flag 	 ;


    initial begin
        clk <= 1'b0;
        rst_n <= 1'b0;
        order_reg <= 1'b0;
        music_reg <= 1'b0;
        volume_reg <= 1'b0;
        speed_reg <= 1'b0;
        play_reg <= 1'b0;
        #200
        rst_n <= 1'b1;
        #100
        order_reg <= 1'd1;
        #100
        music_reg <= 2'd2;
        #100
        volume_reg <= 3'd1;
        #100
        speed_reg <= 2'd1;
        #100
        play_reg <= 1'd1;
        #200
        order_reg <= 1'd0;
        #100
        music_reg <= 2'd1;
        #100
        volume_reg <= 3'd3;
        #100
        speed_reg <= 2'd2;
        #100
        play_reg <= 1'b1;
        #200
        order_reg <= 1'b1;
        #100
        music_reg <= 2'd3;
        #100
        volume_reg <= 3'd4;
        #100
        speed_reg <= 2'b0;
        #100
        play_reg <= 1'b1;
        #200
        volume_reg <= 3'd2;
        #200
        order_reg <= 1'b0;
        #100
        music_reg <= 2'd2;
        #100
        volume_reg <= 3'd5;
        #100
        speed_reg <= 2'b1;
        #200
        order_reg <= 1'b1;
        #100
        music_reg <= 2'd2;
        #100
        speed_reg <= 2'b1;
        #100
        play_reg <= 1'b0;

    end


    always #10 clk <= ~clk;

    output_flag tb_output_flag_inst
    (
    .clk          	(clk)	,
    .rst_n        	(rst_n)	,
    .order_reg	  	(order_reg)	,
	.music_reg	  	(music_reg)	,
	.volume_reg   	(volume_reg)	,
	.speed_reg	  	(speed_reg)	,
	.play_reg	  	(play_reg)	,
    .order1_flag	(order1_flag) 	,        
    .order2_flag	(order2_flag) 	,        
    .music0_flag	(music0_flag) 	,        
	.music1_flag	(music1_flag)	,        
    .music2_flag	(music2_flag) 	,        
    .music3_flag	(music3_flag) 	,        
	.volume1_flag 	(volume1_flag)	,           
    .volume2_flag 	(volume2_flag)	,           
    .volume3_flag 	(volume3_flag)	,           
    .volume4_flag 	(volume4_flag)	,           
    .volume5_flag 	(volume5_flag)	,           
	.speed1_flag	(speed1_flag) 	,        
    .speed2_flag	(speed2_flag) 	,        
    .speed3_flag	(speed3_flag) 	,        
	.play1_flag 	(play1_flag) 	,        
    .play2_flag 	(play2_flag)          
    );




endmodule