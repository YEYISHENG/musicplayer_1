//输出字符数据
    parameter show_0 = "MUSIC           ";
    parameter show_1 = "MODE            ";
    parameter show_2 = "SPEED           ";
    parameter show_3 = "VOLUME          ";
    parameter show_4 = "music_1         ";
    parameter show_5 = "music_2         ";
    parameter show_6 = "play in order   ";
    parameter show_7 = "single cycle    ";
    parameter show_8 = "1               ";
    parameter show_9 = "1.25            ";
    parameter show_A = "0.75            ";
    parameter show_B = "VOLUME_1        ";
    parameter show_C = "VOLUME_2        ";
    parameter show_D = "VOLUME_3        ";
    parameter show_E = "VOLUME_4        ";
    parameter show_F = "VOLUME_5        ";
	parameter show_F1= "music_3         ";
	parameter show_F2= "    music_1     ";
	parameter show_F3= "    music_2     ";
	parameter show_F4= "    music_3     ";
	parameter show_F5= "            1m23";
	parameter show_F6= "            2m34";
	parameter show_F7= "            3m45";
	parameter show_F8= "      PAU_1     ";
	parameter show_F9= "      PAU_2     ";
	parameter show_FA= "      PAU_3     ";

	parameter crt_F8= 56'h11_19_1d_1f_1d_19_11;  //下一曲符号，须在CGRAM中自定义
	parameter crt_F9= 56'h11_13_17_1f_17_13_11;  //上一曲符号，须在CGRAM中自定义
	parameter crt_FA= 56'h1b_1b_1b_1b_1b_1b_1b;  //下正在播放符号，须在CGRAM中自定义
	parameter crt_FB= 56'h10_18_1c_1f_1c_18_10;  //暂停播放符号，须在CGRAM中自定义
    parameter arrow = 8'b0111_1111;


//状态机的状态,此处用了格雷码,一次只有一位变化(在二进制下)
	parameter IDLE = 8'h00;							//闲置状态
	parameter SET_FUNCTION = 8'h01;					//工作方式设置，用来设置8(4)数据接口、2(1)行显示、5*8(5*10)dot
	parameter DISP_OFF = 8'h03;						//显示开关设置关，设置是否显示字符和光标
	parameter DISP_CLEAR = 8'h02;					//清屏
	parameter ENTRY_MODE = 8'h06;					//进入模式设置，写入新数据后光标是否移动？移动方向？
	parameter DISP_ON = 8'h07;						//显示开关设置开
	parameter ROW1_ADDR = 8'h05;					//第一行显示首地址(DDRAM地址)
	parameter ROW1_0 = 8'h04;						//显示字符数据(DDRAM中的数据)
	parameter ROW1_1 = 8'h0C;
	parameter ROW1_2 = 8'h0D;
	parameter ROW1_3 = 8'h0F;
	parameter ROW1_4 = 8'h0E;
	parameter ROW1_5 = 8'h0A;
	parameter ROW1_6 = 8'h0B;
	parameter ROW1_7 = 8'h09;
	parameter ROW1_8 = 8'h08;
	parameter ROW1_9 = 8'h18;
	parameter ROW1_A = 8'h19;
	parameter ROW1_B = 8'h1B;
	parameter ROW1_C = 8'h1A;
	parameter ROW1_D = 8'h1E;
	parameter ROW1_E = 8'h1F;
	parameter ROW1_F = 8'h1D;
	parameter ROW2_ADDR = 8'h1C;					//第二行显示首地址(DDRAM地址)
	parameter ROW2_0 = 8'h14;
	parameter ROW2_1 = 8'h15;
	parameter ROW2_2 = 8'h17;
	parameter ROW2_3 = 8'h16;
	parameter ROW2_4 = 8'h12;
	parameter ROW2_5 = 8'h13;
	parameter ROW2_6 = 8'h11;
	parameter ROW2_7 = 8'h10;
	parameter ROW2_8 = 8'h30;
	parameter ROW2_9 = 8'h31;
	parameter ROW2_A = 8'h33;
	parameter ROW2_B = 8'h32;
	parameter ROW2_C = 8'h36;
	parameter ROW2_D = 8'h37;
	parameter ROW2_E = 8'h35;
	parameter ROW2_F = 8'h34;

	parameter WEDD1  = 8'h3C;						//write self-defining data ,向CGRAM中写入自定义字符数据1
	parameter WEDD2  = 8'h3D;						//write self-defining data ,向CGRAM中写入自定义字符数据2
	parameter WEDD3  = 8'h3F;						//write self-defining data ,向CGRAM中写入自定义字符数据3
	parameter WEDD4  = 8'h3E;						//write self-defining data ,向CGRAM中写入自定义字符数据4
	parameter SEE0_0 = 8'h3A;						//self-defining data,向CGRAM中写入的自定义字符数据,一次需写入7个8bit数据
	parameter SEE0_1 = 8'h3B;
	parameter SEE0_2 = 8'h39;
	parameter SEE0_3 = 8'h38;
	parameter SEE0_4 = 8'h28;
	parameter SEE0_5 = 8'h29;
	parameter SEE0_6 = 8'h2B;
	parameter SEE1_0 = 8'h2A;
	parameter SEE1_1 = 8'h2E;
	parameter SEE1_2 = 8'h2F;
	parameter SEE1_3 = 8'h2D;
	parameter SEE1_4 = 8'h2C;
	parameter SEE1_5 = 8'h24;
	parameter SEE1_6 = 8'h25;
	parameter SEE2_0 = 8'h27;
	parameter SEE2_1 = 8'h26;
	parameter SEE2_2 = 8'h22;
	parameter SEE2_3 = 8'h23;
	parameter SEE2_4 = 8'h21;
	parameter SEE2_5 = 8'h20;
	parameter SEE2_6 = 8'h60;
	parameter SEE3_0 = 8'h61;
	parameter SEE3_1 = 8'h63;
	parameter SEE3_2 = 8'h62;
	parameter SEE3_3 = 8'h66;
	parameter SEE3_4 = 8'h67;
	parameter SEE3_5 = 8'h65;
	parameter SEE3_6 = 8'h64;