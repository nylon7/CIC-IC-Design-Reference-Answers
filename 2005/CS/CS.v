module	CS(Y,X,reset,clk);

input clk,reset;
input [7:0] X;

output [9:0]Y;

reg [9:0] Y;
reg [7:0] x_value [8:0];
reg [7:0] x_total;
reg [7:0] x_avg ;
reg [7:0] x_appr ;
reg [7:0] xi_xappr;
integer i,j,k,fp;
reg [7:0] reg_a,reg_b;

always@(clk)
begin

	if(reset)
	begin	
		i=0;
		j=0;
		k=0;
		
		x_avg=0;
		x_total=0;
		x_appr=0;
		xi_xappr=0;
		reg_a=0;
		reg_b=0;
		fp=0;
		
  end
	else if(!clk)
	  begin
	    for(i=0;i<8;i=i+1)
	     begin
	       x_value[i]=X;
	       x_total=x_value[i]+x_total;
	       $display("Input:%d",x_value[i]);
	     end 
	     $stop;
	   end
		
	else
	begin
	  if(i==8)
	   
	    begin
	     
	       x_value[i]=X;
	       x_total=x_value[i]+x_total;
	       x_avg=x_total/9;
		    for(j=0;j<9;j=j+1)
					begin
						if(x_value[j] < x_avg && reg_a <x_value[j])
							begin
								reg_a=x_value[j];
								x_appr=reg_a;
								for(k=0;k<9;k=k+1)
										begin
											reg_b=x_value[k]+x_appr;
											xi_xappr=reg_b+xi_xappr;
												if(k==8)
													begin
														Y=xi_xappr/8;
														fp=1;
														end
										end
								end
				   end
			end
			

else if(fp==1)
    begin
		for(i=1;i<9;i=i+1)
			begin
        x_value[i-1]=x_value[i];
			
			end
	    end

end

end
endmodule
