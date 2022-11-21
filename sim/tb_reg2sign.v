`timescale 1ns/1ns
module tb_reg2sign;

    reg               clk         ;
    reg               rst_n       ;
    reg  [2:0]        reg_sign    ;
    wire              flag_sign   ;



    initial begin
        clk <= 1'b0;
        rst_n <= 1'b0;
        reg_sign <= 3'd0;
        #200
        rst_n <= 1'b1;
        #80
        reg_sign <=3'd2;
        #120
        reg_sign <=3'd3;
        #160
        reg_sign <=3'd0;
        #120
        reg_sign <=3'd5;
        #80
        reg_sign <=3'd4;
        #100
        reg_sign <=3'd1;
    end

    always #10 clk <= ~clk;


    reg2sign #(3) tb_reg2sign_inst 
    (
    .clk       (clk)  ,
    .rst_n     (rst_n)  ,
    .reg_sign  (reg_sign)  ,
    .flag_sign (flag_sign)     
    );
endmodule