`timescale 1ns/1ns

	module tb_LCD;
	reg 		clk			;
	reg 		rst_n		;
    reg         KEY1   ;
    reg         KEY2   ;
    reg         KEY3   ;
    reg         KEY4   ;			//输入信号要在always块中赋值，故为reg型
	wire 		LCD_E 		;
	wire 	 	LCD_RS		;
	wire [7:0]  LCD_DATA	;			//输出信号用连线引出，便于观察，故为wire型。他需要接到后面实例化模块的输出端口，输出只能驱动net型
	wire		LCD_ON		;
	wire		LCD_RW;
	wire 		order1_flag	 ;
	wire 		order2_flag	 ;
	wire      	music0_flag	 ;
	wire      	music1_flag	 ;
	wire        music2_flag	 ;
	wire        music3_flag	 ;
	wire      	volume1_flag ;
	wire      	volume2_flag ;
	wire      	volume3_flag ;
	wire      	volume4_flag ;
	wire      	volume5_flag ;
	wire      	speed1_flag	 ;
	wire      	speed2_flag	 ;
	wire      	speed3_flag	 ;
	wire 		play_flag 	 ;
	wire 		pause_flag 	 ;
	


	initial begin
		clk <= 1'b0;
		rst_n <= 1'b0;
		#20
		KEY1 <= 1'b1;
		KEY2 <= 1'b1;
		KEY3 <= 1'b1;
		KEY4 <= 1'b1;
		rst_n <=1'b1;
		#15000000
		KEY2 <= 1'b0;
		#20000000
		KEY2 <= 1'b1;					//确认
		#20000000
		KEY2 <= 1'b0;
		#20000000
		KEY2 <= 1'b1;					//确认
		// #20000000
		// KEY3 <= 1'b0;
		// #20000000
		// KEY3 <= 1'b1;					//下一首
		// #20000000
		// KEY1 <= 1'b0;
		// #20000000
		// KEY1 <= 1'b1;					//返回
		// #20000000
		// KEY2 <= 1'b0;
		// #20000000
		// KEY2 <= 1'b1;					//确认
		// #20000000
		// KEY1 <= 1'b0;
		// #20000000
		// KEY1 <= 1'b1;					//返回
		// #20000000
		// KEY3 <= 1'b0;
		// #20000000
		// KEY3 <= 1'b1;					//下翻一首
		// #20000000
		// KEY2 <= 1'b0;
		// #20000000
		// KEY2 <= 1'b1;					//确认
		// #20000000
		// KEY1 <= 1'b0;
		// #20000000
		// KEY1 <= 1'b1;					//返回
		// #20000000
		// KEY1 <= 1'b0;
		// #20000000
		// KEY1 <= 1'b1;					//返回
		// #20000000
		// KEY2 <= 1'b0;
		// #20000000
		// KEY2 <= 1'b1;					//确认(music2播放页面)
		// #20000000
		// KEY2 <= 1'b0;
		// #20000000
		// KEY2 <= 1'b1;					//暂停
		// #20000000
		// KEY2 <= 1'b0;
		// #20000000
		// KEY2 <= 1'b1;					//取消暂停
		#20000000
		KEY1 <= 1'b0;
		#20000000
		KEY1 <= 1'b1;					//返回
		#20000000
		KEY1 <= 1'b0;
		#20000000
		KEY1 <= 1'b1;					//返回
		#20000000
		KEY3 <= 1'b0;
		#20000000
		KEY3 <= 1'b1;					//下翻(MODE)
		#20000000
		KEY3 <= 1'b0;
		#20000000
		KEY3 <= 1'b1;					//下翻(speed)
		#20000000
		KEY2 <= 1'b0;
		#20000000
		KEY2 <= 1'b1;					//确认
		#20000000
		KEY3 <= 1'b0;
		#20000000
		KEY3 <= 1'b1;					//下翻(1.25)
		#20000000
		KEY2 <= 1'b0;
		#20000000
		KEY2 <= 1'b1;					//确认
		#20000000
		KEY2 <= 1'b0;
		#20000000
		KEY2 <= 1'b1;					//确认
		#20000000
		KEY4 <= 1'b0;
		#20000000
		KEY4 <= 1'b1;					//上翻(0.75)


		
		
	end

	//虽然使用了非阻塞赋值，但是由于语句间延时，是相邻两个语句之间的延时，所以仿真器来看还是相当于阻塞赋值
	always #10 clk <= ~clk;

	LCD tb_LCD_inst
	(
		.clk		 (clk) 	,
		.rst_n	 	 (rst_n) 	,
    	.KEY1	 (KEY1)   ,
    	.KEY2	 (KEY2)   ,
    	.KEY3	 (KEY3)   ,
    	.KEY4	 (KEY4)   ,
		.LCD_E 	 	 (LCD_E) 	,
		.LCD_RS	 	 (LCD_RS) 	,
		.LCD_DATA 	 (LCD_DATA) ,	
		.LCD_ON			(LCD_ON	),
    	.LCD_RW			(LCD_RW	),
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
		.play_flag 	(play_flag) 	,
		.pause_flag 	(pause_flag)     
	);

	endmodule


