`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2024 08:37:48 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(   );
reg [7:0] a,b;
reg clk;
wire [7:0]sum;
wire [8:0]sumc;


 integer file,file1,file2,i;
 wire [7:0]c;
 assign c[7:0]  = sumc [7:0];
 
initial begin
clk = 0;
 forever begin
#1 clk = ~clk;
end
end

    
   
 initial
 begin
  
    file = $fopen("eiffiel.bin","rb");
    file1 = $fopen("taj.bin","rb");
    file2 = $fopen("test2a.bin","wb");
        
    for(i=0;i<512*512;i=i+1)
    begin
        @(posedge clk);
        $fscanf(file,"%c",a[7:0]);
        $fscanf(file1,"%c",b[7:0]);
    end
 end 
integer j;
initial begin
for(j=0;j<512*512;j=j+1)
    begin
    @(posedge clk)
        $fwrite(file2,"%c",c[7:0]);
    end
    $fclose(file2);
    $fclose(file);
    $fclose(file1);
    $stop;
end  
adder dut (a ,b,clk,sum,sumc);

endmodule
