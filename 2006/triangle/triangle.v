module triangle (clk, reset, nt, xi, yi, busy, po, xo, yo);
input clk, reset, nt;
input [2:0] xi, yi;
output busy, po;
output [2:0] xo, yo;
  
reg busy, po;
reg [2:0] xo, yo;  
reg [2:0] xi_da[2:0];                
reg [2:0] yi_da[2:0]; 
reg [2:0] xi_da_run;                
reg [2:0] yi_da_run; 
integer slash;
integer slash1;

integer status,run_status,i;
always@(posedge clk or reset)
begin
  if(reset)
    begin
      busy=0;
      status=0;
      run_status=0;
      i=1;
    end
    
  else
    begin
      case(status)
      2'd0:begin   
             if(busy==0 && nt==1)
               begin
                 xi_da[0]=xi;
                 yi_da[0]=yi;
                 status=1;
                 $display("=>(x1,y1)=(%d,%d)\n",xi_da[0],yi_da[0]); 
               end
           end
      2'd1:begin     
             if(busy==0 && nt==0)
               begin
                 xi_da[1]=xi;
                 yi_da[1]=yi;
                 status=2;
                 busy=1;
                 $display("=>(x2,y2)=(%d,%d)\n",xi_da[1],yi_da[1]);
               end
           end
      2'd2:begin
             if(busy==1 && nt==0)
               begin
                 xi_da[2]=xi;
                 yi_da[2]=yi;
                 status=3;
                 run_status=0;
                 xi_da_run=xi_da[0];
                 yi_da_run=yi_da[0];
                 $display("=>(x3,y3)=(%d,%d)\n",xi_da[2],yi_da[2]);
               end
           end
      2'd3:begin
             //$stop;
             case(run_status)
             2'd0:begin
                    po=0;
                    slash=(xi_da_run-xi_da[0])*(yi_da[1]-yi_da[0]);
                    slash1=(xi_da[1]-xi_da[0])*(yi_da_run-yi_da[0]);
                    $display("=>slash=%d, slash1=%d\n",slash,slash1);
                    //$stop;
                    if(slash<=slash1)
                      begin
                        po=1;
                        xo=xi_da_run;
                        yo=yi_da_run;
                        $display("=>Output=(%d,%d)\n",xi_da_run,yi_da_run);
                        //po=0;
                        if(xi_da_run==xi_da[1])
                          begin
                            xi_da_run=xi_da[0];
                            yi_da_run=yi_da[0]+i;  
                            run_status=1;
                            i=i+1;
                            //$stop;    
                          end    
                        else
                           begin
                            xi_da_run=xi_da_run+1; 
                           end
                      end      
                  end  
             2'd1:begin
                    //$display("=>x=%d, x1=%d, y2=%d, y1=%d\n",xi_da_run,xi_da[1],yi_da[2],yi_da[1]);
                    //$display("=>x2=%d, x1=%d, y=%d, y1=%d\n",xi_da[2],xi_da[1],yi_da_run,yi_da[1]);
                    po=0;
                    slash=((xi_da_run-xi_da[1])*(yi_da[2]-yi_da[1]));
                    slash1=((xi_da[2]-xi_da[1])*(yi_da_run-yi_da[1]));
                    
                    $display("=>slash=%d, slash1=%d\n",slash,slash1);
                    //$stop;  
                    if(slash<=slash1)
                      begin
                        po=1;
                        xo=xi_da_run;
                        yo=yi_da_run;
                        $display("=>Output=(%d,%d)\n",xi_da_run,yi_da_run);
                        //po=0;
                        xi_da_run=xi_da_run+1; 
                        //$stop;                      
                      end
                    else if(slash>slash1)
                      begin
                        if(yi_da_run==yi_da[2])
                          begin
                            po=0;
                            xo=xi_da_run;
                            yo=yi_da_run;
                            $display("=>Output=(%d,%d)\n",xi_da_run,yi_da_run);
                            //po=0; //notice
                            run_status=2;
                            //$stop; 
                          end  
                        else 
                          begin 
                            xi_da_run=xi_da[0];
                            yi_da_run=yi_da[0]+i;  
                            i=i+1;
                          end
                        //run_status=1;
   
                        //$stop;       
                      end      
                  end  
             2'd2:begin
                    //po=0; 
                    busy=0;
                    status=0;
                    run_status=0;
                    i=1;
                    //$stop;
                  end      
             endcase    
           end     
      endcase                  
    end      
end 
   
endmodule
