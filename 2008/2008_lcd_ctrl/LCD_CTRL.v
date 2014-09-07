module LCD_CTRL(clk, reset, datain, cmd, cmd_valid, dataout, output_valid, busy);
 
input           clk;
input           reset;
input   [7:0]   datain;
input   [2:0]   cmd;
input           cmd_valid;
output  [7:0]   dataout;
output          output_valid;
output          busy;

reg  [7:0]   dataout;
reg          output_valid;
reg          busy;
reg  [2:0]   cmd_data; 
reg  [7:0]   image_buffer[107:0]; 
reg  [7:0]   output_display_buf[15:0];

integer da_cout,status,cmd_permitted,fit_data_out,i;
integer x_local,y_local,zoomin_local,da_local_cmd;        
     
always@(posedge clk or reset)
begin
  if(reset) //initial state
    begin
      busy=0;
      cmd_permitted=0;  
      x_local=6;
      y_local=5;
      zoomin_local=40;
    end
    
  else
    begin
      if(cmd_valid==1 && busy==0)
        begin
          case(cmd)
          3'd0:begin //Load Data
                 cmd_data=cmd;
                 busy=1;
                 da_cout=0; 
                 cmd_permitted=1;
                 $display("CMD= 0\n");
               end
               
          3'd1:begin //Zoom in
                 //cmd_permitted=0;
                 cmd_data=cmd;
                 busy=1;
                 da_cout=0;
                 x_local=6;
                 y_local=5;
                 zoomin_local=40; 
                 cmd_permitted=0;
                 status=0;
                 da_local_cmd=zoomin_local;
                 i=0;
                 $display("CMD= 1\n");
                 //$stop;
               end  
          3'd3:begin //shift right
                 if(cmd_permitted==1)
                   begin
                     cmd_data=1;
                     busy=1; 
                   end
                 else
                   begin
                     cmd_data=cmd;
                     busy=1;
                     $display("CMD= 3\n");   
                     $stop;
                   end                   
               end   
          /*3'd4:begin //Shift left
                 if(cmd_permitted==1)
                   begin
                     cmd_data=1;
                     busy=1; 
                   end
                 else
                   begin
                     cmd_data=cmd;
                     busy=1;
                     $display("CMD= 4\n");   
                   end                   
               end*/ 
          3'd5:begin //shift up
                 if(cmd_permitted==1)
                   begin
                     cmd_data=1;
                     busy=1; 
                   end
                 else
                   begin
                     cmd_data=cmd;
                     busy=1;
                     status=0;
                     $display("CMD= 5\n");
                     //$stop;   
                   end                   
               end  
          3'd6:begin //shift down
                 if(cmd_permitted==1)
                   begin
                     cmd_data=1;
                     busy=1; 
                   end
                 else
                   begin
                     cmd_data=cmd;
                     busy=1;
                     $display("CMD= 6\n"); 
                     $stop;  
                   end                   
               end                                                                                                                   
          endcase
        end
         
      else if(cmd_valid==0 && busy==1)
        begin
          case(cmd_data)
          3'd0:begin  //Load data
                 image_buffer[da_cout]=datain;
                 //$display("image_data= %d.\n",image_buffer[da_cout]);
                 da_cout=da_cout+1;
                 if(da_cout==108)
                   begin
                     cmd_data=2; 
                     fit_data_out=13;
                     i=0;
                     status=0;
                     //$stop;
                   end    
               end   
          3'd1:begin  //Zoom in
                 case(status) 
                 2'd0:begin //collect data
                        //$stop;
                        output_display_buf[i]=image_buffer[da_local_cmd];
                        //$display("output_display_buf=%d\n",output_display_buf[i]);
                        if(i==3)
                          begin
                            da_local_cmd=da_local_cmd+9; 
                            i=i+1;
                          end 
                             
                        else if(i==7)     
                          begin
                            da_local_cmd=da_local_cmd+9; 
                            i=i+1;                       
                          end 
                             
                        else if(i==11)                                   
                          begin
                            da_local_cmd=da_local_cmd+9; 
                            i=i+1;               
                          end  
                           
                        else if(i==15)      
                          begin
                            status=1;
                            i=0;
                          end
                           
                        else      
                          begin
                            da_local_cmd=da_local_cmd+1;
                            i=i+1;
                          end                                                                      
                      end      
                      
                 2'd1:begin //output data
                        output_valid=1;
                        dataout= output_display_buf[i]; 
                        $display("output_data= %d.\n",output_display_buf[i]);
                        i=i+1;
                        //$display("i= %d.\n",i);
                        if(i==16)
                          begin
                            status=2;  
                            //$stop;   
                          end
                      end   
                 2'd2:begin
                        output_valid=0;
                        busy=0;
                        //status=0;
                        //$stop;
                      end    
                 endcase                         
  
                 //$stop;
             
               end                
          3'd2:begin  //Zoom fit data
                 case(status) 
                 2'd0:begin //collect data
                        cmd_permitted=1;
                        output_display_buf[i]=image_buffer[fit_data_out];
                        if(i==3)
                        begin
                          fit_data_out=fit_data_out+15; 
                          i=i+1;
                        end 
                          
                        else if(i==7)     
                        begin
                          fit_data_out=fit_data_out+15; 
                          i=i+1;                       
                        end 
                              
                        else if(i==11)                                   
                        begin
                          fit_data_out=fit_data_out+15; 
                          i=i+1;               
                        end  
                              
                        else if(i==15)     
                        begin
                          status=1;
                          i=0;
                          //output_valid=1;
                        end
                          
                        else      
                        begin
                          fit_data_out=fit_data_out+3;
                           i=i+1;
                        end                                                                      
                      end      
                      
                 2'd1:begin //output data
                        output_valid=1;
                        dataout= output_display_buf[i]; 
                        $display("output_data= %d.\n",output_display_buf[i]);
                        i=i+1;
                        //$display("i= %d.\n",i);
                        if(i==16)
                          begin
                            status=2;  
                            //$stop;   
                          end
                      end   
                 2'd2:begin
                        output_valid=0;
                        busy=0;
                        //cmd_permitted=0;
                        //$stop;
                      end    
                 endcase                         
               end    
          3'd5:begin
                 case(status)
                 2'd0:begin
                        if(y_local==2)
                          begin
                            status=1;
                            i=0;
                            da_local_cmd=zoomin_local;
                          end
                           
                        else
                          begin
                            y_local=y_local-1;
                            zoomin_local=zoomin_local-12;
                            i=0;
                            status=1;
                            da_local_cmd=zoomin_local;
                          end  
                      end   
                      
                 2'd1:begin //Copy display data to output display buffer
                        //$stop;
                        output_display_buf[i]=image_buffer[da_local_cmd];
                        $display("output_display_buf=%d\n",output_display_buf[i]);
                        case(i)
                        4'd3:begin
                               da_local_cmd=da_local_cmd+9; 
                               i=i+1;
                             end 
                             
                        4'd7:begin
                               da_local_cmd=da_local_cmd+9; 
                               i=i+1;                       
                             end 
                                                           
                        4'd11:begin
                               da_local_cmd=da_local_cmd+9; 
                               i=i+1;               
                              end  
                              
                        4'd15:begin
                                status=2;
                                i=0;
                              end
                              
                        default:begin
                                  da_local_cmd=da_local_cmd+1;
                                  i=i+1;
                                end                                                                  
                        endcase                  
                      end      
                      
                 2'd2:begin
                        output_valid=1;
                        dataout= output_display_buf[i];
                        $display("output_data= %d.\n",output_display_buf[i]); 
                        if(i==15)
                          begin
                            status=3;
                            //$stop;
                          end
                             
                        else
                          begin
                            i=i+1;
                          end                   
                      end 
                      
                 2'd3:begin
                        output_valid=0;
                        busy=0;
                        $stop;
                      end       
                 endcase                                           
               end                                           
          endcase
        end    
    end      
end
                                                                                     
endmodule
