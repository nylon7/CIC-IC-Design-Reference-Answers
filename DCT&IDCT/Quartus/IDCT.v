module IDCT (value_out,value_in,display,Array_value); //8x8

output [9:0]value_out;    
input  [9:0]value_in;
input  [1:0]display;
input  [6:0]Array_value;
reg    [9:0]value_out; 
reg signed [9:0] arrayA[63:0]; 
reg signed [9:0] arrayAT[63:0];

reg signed [17:0] arrayMT[63:0];
reg signed [9:0] arrayX[63:0];
reg signed [25:0] arrayy[63:0];
reg signed [25:0]tempvalue;

integer Array_Angel_Value=9;
integer Array_Count_Value=0;
integer Array_Expansion=7;
integer i,j=0,k;
integer a,b;
integer arrayrow,arraycount=0,arrayaddr,arrayM_value;
//ArrayA
initial
begin
arrayA[0]=10'd90;   
arrayA[1]=10'd90; 
arrayA[2]=10'd90; 
arrayA[3]=10'd90; 
arrayA[4]=10'd90; 
arrayA[5]=10'd90; 
arrayA[6]=10'd90; 
arrayA[7]=10'd90; 
arrayA[8]=10'd125; 
arrayA[9]=10'd106;  
arrayA[10]=10'd71;   
arrayA[11]=10'd24; 
arrayA[12]=-10'd24; 
arrayA[13]=-10'd71; 
arrayA[14]=-10'd106; 
arrayA[15]=-10'd125; 
arrayA[16]=10'd118; 
arrayA[17]=10'd48; 
arrayA[18]=-10'd48;   
arrayA[19]=-10'd118; 
arrayA[20]=-10'd118; 
arrayA[21]=-10'd48; 
arrayA[22]=10'd48; 
arrayA[23]=10'd118; 
arrayA[24]=10'd106; 
arrayA[25]=-10'd24; 
arrayA[26]=-10'd125;   
arrayA[27]=-10'd71; 
arrayA[28]=10'd71; 
arrayA[29]=10'd125; 
arrayA[30]=10'd24; 
arrayA[31]=-10'd106; 
arrayA[32]=10'd90; 
arrayA[33]=-10'd90; 
arrayA[34]=-10'd90;   
arrayA[35]=10'd90; 
arrayA[36]=10'd90; 
arrayA[37]=-10'd90; 
arrayA[38]=-10'd90; 
arrayA[39]=10'd90; 
arrayA[40]=10'd71; 
arrayA[41]=-10'd125;
arrayA[42]=10'd24;   
arrayA[43]=10'd106; 
arrayA[44]=-10'd106; 
arrayA[45]=-10'd24; 
arrayA[46]=10'd125; 
arrayA[47]=-10'd71; 
arrayA[48]=10'd48; 
arrayA[49]=-10'd118; 
arrayA[50]=10'd118;   
arrayA[51]=-10'd48; 
arrayA[52]=-10'd48; 
arrayA[53]=10'd118; 
arrayA[54]=-10'd118; 
arrayA[55]=10'd48; 
arrayA[56]=10'd24; 
arrayA[57]=-10'd71; 
arrayA[58]=10'd106;   
arrayA[59]=-10'd125; 
arrayA[60]=10'd125; 
arrayA[61]=-10'd106; 
arrayA[62]=10'd71; 
arrayA[63]=-10'd24; 

//ArrayA => ArrayAT Start
while(Array_Expansion>=0)
   begin  
      for(i=0;i<=Array_Expansion;i=i+1) 
      begin   
        arrayAT[Array_Count_Value+(8*i)]=arrayA[Array_Count_Value+i];
        arrayAT[Array_Count_Value+i]=arrayA[Array_Count_Value+(8*i)];
      end 
      Array_Expansion=Array_Expansion-1;
      Array_Count_Value=Array_Count_Value+Array_Angel_Value;
   end
//ArrayA => ArrayAT End
//ArrayA and ArrayAT display
    //for(i=0;i<64;i=i+1)
       //begin
          //#5 value_out=arrayA[j];
          //$display("%d ArrayA=%d ,ArrayAT=%d\n",i,arrayA[i],arrayAT[i]);
       //end
end

always@(Array_value or display)
begin
   if(display==1)
      begin
        //for(i=0;i<64;i=i+1)
        //   begin
        //       if(arrayX[i]==10'bx)
        //            arrayX[i]=0;
        //   end
        for(i=0;i<64;i=i+1)
           begin
            //  #5 value_out=arrayX[i];
           // $display("%d, ArrayX=%d\n",i,arrayX[i]);
           end
        //$display("ArrayX[11]=%d\n",arrayX[11]);
        //$display("ArrayX[12]=%d\n",arrayX[12]);
        //$display("ArrayX[13]=%d\n",arrayX[13]);
        //$display("ArrayX[14]=%d\n",arrayX[14]);
        //$display("ArrayX[15]=%d\n",arrayX[15]);
      end
  // else if(display==2)
  //    begin
  //       for(i=0;i<64;i=i+1)
  //       #5 value_out=arrayX[i];
  //    end
   else //Testbench ArrayX=> IDCT ArrayX
      begin
         arrayX[Array_value]=value_in;
         //$display("%d,Array Value%d\n",Array_value,arrayX[Array_value]);
         j=j+1;
         
         if(j==65)
            begin
               //=>AT*X=MT Start
               arrayaddr=0;
               arraycount=0;
               arrayM_value=0;
               arrayrow=0;
               tempvalue=0;
               for(k=0;k<8;k=k+1)
                  begin
                     for(a=0;a<64;a=a+1)
                        begin
                           tempvalue=(arrayAT[a]*arrayX[arrayaddr])+tempvalue; 
                         //  $display("Test=>%d, arrayaddr=%d, arraycount=%d, %d*%d=%d\n",a,arrayaddr,arraycount,arrayAT[a],arrayX[arrayaddr],tempvalue);
                           arrayaddr=arrayaddr+8;
                           arraycount=arraycount+1;
                           if(arraycount==8)
                              begin
                                 arrayaddr=arrayrow;
                                 arraycount=0; 
                                 arrayMT[arrayM_value]=tempvalue;
                               //  $display("arrayrow=%d\n",arrayrow);
                               //  $display("ArrayM=>%d, Value=%d\n",arrayM_value,arrayMT[arrayM_value]);
                                 arrayM_value=arrayM_value+1;
                                 tempvalue=0;
                            
                              end   
                            
                         end  
                       arrayrow=arrayrow+1; 
                       arrayaddr=arrayrow;
                  end  
               for(i=0;i<64;i=i+1)
               begin
              //    #5 value_out=arrayX[i];
                 // $display("%d, ArrayMT=%d\n",i,arrayMT[i]);
               end 
               //=>AT*X=MT End 
               
               //=>AT*MT=Y Start
               arrayaddr=0;
               arraycount=0;
               arrayM_value=0;
               arrayrow=0;
               tempvalue=0;
               for(k=0;k<8;k=k+1)
                  begin
                     for(a=0;a<64;a=a+1)
                        begin
                           tempvalue=(arrayAT[a]*arrayMT[arrayaddr])+tempvalue; 
                      //     $display("Test=>%d, arrayaddr=%d, arraycount=%d, %d*%d=%d\n",a,arrayaddr,arraycount,arrayAT[a],arrayMT[arrayaddr],tempvalue);
                           arrayaddr=arrayaddr+8;
                           arraycount=arraycount+1;
                           if(arraycount==8)
                              begin
                                 arrayaddr=arrayrow;
                                 arraycount=0; 
                                 arrayy[arrayM_value]=tempvalue/(256*256);
                                // $display("ArrayM=>%d, Value=%d\n",arrayM_value,arrayy[arrayM_value]);
                                 arrayM_value=arrayM_value+1;
                                 tempvalue=0;
                              end    
                         end  
                     arrayrow=arrayrow+1; 
                     arrayaddr=arrayrow;   
                  end  
               for(i=0;i<64;i=i+1)
               begin
                  #5 value_out=arrayy[i];
                  $display("%d, ArrayY=%d\n",i,arrayy[i]);
               end               
               //=>AT*MT=Y End 
            end
              

           //  end   
      end  
end    


endmodule
