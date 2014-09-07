module testbench;

wire  signed [9:0]Value_out;
reg   signed [9:0]Value_in;
reg   [1:0]Display;
reg   [6:0]Array_Value;

IDCT IDCT_tb(Value_out,Value_in,Display,Array_Value);

initial
begin  

#5 Display=0; Value_in=10'bx;     //Value=0
#5 Display=0; Array_Value=7'd0;  Value_in=10'd224;   //Value=0
#5 Display=0; Array_Value=7'd1;  Value_in=-10'd380;  //Value=1
#5 Display=0; Array_Value=7'd2;  Value_in=-10'd403;   //Value=2
#5 Display=0; Array_Value=7'd3;  Value_in=-10'd220;  //Value=3
#5 Display=0; Array_Value=7'd4;  Value_in=10'd0;     //Value=4
#5 Display=0; Array_Value=7'd5;  Value_in=10'd135;   //Value=5
#5 Display=0; Array_Value=7'd6;  Value_in=10'd72;    //Value=6
#5 Display=0; Array_Value=7'd7;  Value_in=10'd0;     //Value=7
#5 Display=0; Array_Value=7'd8;  Value_in=10'd100;   //Value=8
#5 Display=0; Array_Value=7'd9;  Value_in=-10'd100;  //Value=9
#5 Display=0; Array_Value=7'd10;  Value_in=10'd55;    //Value=10
#5 Display=0; Array_Value=7'd11;  Value_in=0;     //Value=11
//#5 Display=2'dx; Value_in=10'dx;  
#5 Display=0; Array_Value=7'd12; Value_in=0;     //Value=12
//#5 Display=2'dx; Value_in=10'dx; 
#5 Display=0; Array_Value=7'd13; Value_in=0;     //Value=13
//#5 Display=2'dx; Value_in=10'dx; 
#5 Display=0; Array_Value=7'd14; Value_in=0;     //Value=14
//#5 Display=2'dx; Value_in=10'dx;  
#5 Display=0; Array_Value=7'd15; Value_in=0;     //Value=15
#5 Display=0; Array_Value=7'd16;  Value_in=10'd71;    //Value=16
#5 Display=0; Array_Value=7'd17;  Value_in=-10'd55;   //Value=17
#5 Display=0; Array_Value=7'd18;  Value_in=-10'd32;   //Value=18
#5 Display=0; Array_Value=7'd19;  Value_in=10'd67;    //Value=19
#5 Display=0; Array_Value=7'd20;  Value_in=10'd0;     //Value=20
#5 Display=0; Array_Value=7'd21;  Value_in=10'd0;     //Value=21
#5 Display=0; Array_Value=7'd22;  Value_in=10'd0;     //Value=22
#5 Display=0; Array_Value=7'd23;  Value_in=10'd0;     //Value=23
#5 Display=0; Array_Value=7'd24;  Value_in=10'd55;    //Value=24
#5 Display=0; Array_Value=7'd25;  Value_in=-10'd27;   //Value=25
#5 Display=0; Array_Value=7'd26;  Value_in=-10'd32;   //Value=26
#5 Display=0; Array_Value=7'd27;  Value_in=10'd33;    //Value=27
#5 Display=0; Array_Value=7'd28;  Value_in=10'd0;     //Value=28
#5 Display=0; Array_Value=7'd29;  Value_in=-10'd42;   //Value=29
#5 Display=0; Array_Value=7'd30;  Value_in=10'd0;     //Value=30
#5 Display=0; Array_Value=7'd31;  Value_in=10'd0;     //Value=31
#5 Display=0; Array_Value=7'd32;  Value_in=-10'd27;   //Value=32
#5 Display=0; Array_Value=7'd33;  Value_in=10'd0;     //Value=33
#5 Display=0; Array_Value=7'd34;  Value_in=10'd101;   //Value=34
#5 Display=0; Array_Value=7'd35;  Value_in=-10'd72;   //Value=25
#5 Display=0; Array_Value=7'd36;  Value_in=10'd0;     //Value=36
#5 Display=0; Array_Value=7'd37;  Value_in=10'd43;    //Value=37
#5 Display=0; Array_Value=7'd38;  Value_in=10'd0;     //Value=38
#5 Display=0; Array_Value=7'd39;  Value_in=10'd0;     //Value=39
#5 Display=0; Array_Value=7'd40;  Value_in=10'd32;    //Value=40
#5 Display=0; Array_Value=7'd41;  Value_in=-10'd33;   //Value=41
#5 Display=0; Array_Value=7'd42;  Value_in=10'd0;     //Value=42
#5 Display=0; Array_Value=7'd43;  Value_in=10'd40;    //Value=43
#5 Display=0; Array_Value=7'd44;  Value_in=10'd0;     //Value=44
#5 Display=0; Array_Value=7'd45;  Value_in=10'd0;     //Value=45
#5 Display=0; Array_Value=7'd46;  Value_in=10'd0;     //Value=46
#5 Display=0; Array_Value=7'd47;  Value_in=10'd0;     //Value=47
#5 Display=0; Array_Value=7'd48;  Value_in=-10'd97;   //Value=48
#5 Display=0; Array_Value=7'd49;  Value_in=10'd101;   //Value=49
#5 Display=0; Array_Value=7'd50;  Value_in=-10'd36;   //Value=50
#5 Display=0; Array_Value=7'd51;  Value_in=10'd0;     //Value=51
#5 Display=0; Array_Value=7'd52;  Value_in=10'd47;    //Value=52
#5 Display=0; Array_Value=7'd53;  Value_in=10'd0;     //Value=53
#5 Display=0; Array_Value=7'd54;  Value_in=10'd0;     //Value=54
#5 Display=0; Array_Value=7'd55;  Value_in=10'd0;     //Value=55
#5 Display=0; Array_Value=7'd56;  Value_in=-10'd67;   //Value=56
#5 Display=0; Array_Value=7'd57;  Value_in=10'd72;    //Value=57
#5 Display=0; Array_Value=7'd58;  Value_in=-10'd43;   //Value=58
#5 Display=0; Array_Value=7'd59;  Value_in=10'd0;     //Value=59
#5 Display=0; Array_Value=7'd60;  Value_in=10'd0;     //Value=60
#5 Display=0; Array_Value=7'd61;  Value_in=10'd0;     //Value=61
#5 Display=0; Array_Value=7'd62;  Value_in=10'd0;     //Value=62
#5 Display=0; Array_Value=7'd63;  Value_in=10'd1;     //Value=63

//#5 Display=2'd1;  Value_in=5'bx;
//#250 Display=2'd2; Value_in=5'bx;
#10000 $stop;
end
//initial
//$monitor($time, "Display=%d, Value_in=%d,Value_out=%d\n", Display,Value_in,Value_out);
endmodule
