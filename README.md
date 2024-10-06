1. ABSTRACT:
The objective of this report is to enhance this approximate adder based on FPGA that was originally designed to have a 12-bit precision but whose aim shall be to enhance image processing for real-time applications. The approximation has been performed very carefully to 8 bits of which are found to be similar in pixel-level specifications such as digital photographs. Building on previously researched adders, such as the carry prediction adders and the NAND-based half adders, the study enhances the original design and minimizes power usage while enhancing the computational speed.
The report illustrates the use of the reduced 8-bit approximation adder in image processing tasks through design and simulation using Verilog. In particular, 8x8 picture segments are used to assess the adder's performance using image addition operations, and real-time simulations are used to verify the gains in accuracy and efficiency. In addition to highlighting the possibilities for power-efficient, high-performance digital circuit designs relevant to real-world systems like image compression and signal processing, this work emphasizes the trade-off between approximation and computing speed in FPGA-based systems.

The project encompasses the following key objectives:
Implementation:
Utilize Hardware Description Language (HDL) Verilog to implement the Approximate Adder design. Employ simulation tools to verify the accuracy and various other metrics of the design.
Application:
	Using Image addition techniques to judge and evaluate according to other research papers.
Documentation and Reporting:
Prepare detailed documentation covering the design specifications, implementation details, testing methodologies, and results. 

By successfully designing FPGA-based Image processing of Approximate Adder with its hardware realization and testing of adders, this project aims to enhance the computational capabilities for processing various tasks and justifying the real-world system, making it well-suited for a broad range of applications requiring efficient calculations. 
2. INTRODUCTION:
In digital computing systems, arithmetic operations are the cornerstone of both simple and intricate computations. The need for more speed, economy, and optimal performance is growing, from basic data processing to complex activities like image, video, and signal processing. Especially in fields like artificial intelligence, machine learning, and embedded systems, where computing demands are growing, new designs that strike a compromise between accuracy and efficiency are becoming crucial. One such method is the use of approximation adders, which provide trade-offs between precision, speed, and power consumption by permitting controlled errors in arithmetic operations.

A margin of error within a specified range is introduced by approximate adders, in contrast to typical digital arithmetic circuits that yield accurate outputs. In applications where perfect precision is not necessary, such as image and video processing, where little errors usually have no effect on the final product's quality, this tolerance is frequently acceptable. Approximate adders can greatly enhance performance and lower power consumption by allowing these little inaccuracies, which makes them extremely useful in high-speed, low-power settings. These circuits are especially useful in applications that call for effective computational trade-offs because of their adaptability in adjusting the degree of approximation.

In a prior effort, Verilog was used to successfully develop an FPGA-based 12-bit approximation adder. This design investigated several architectural strategies to maximize computing performance and reduce energy consumption, such as carry prediction and reduced power-efficiency algorithms. The project showed how approximate adders can improve system performance, especially in digital circuits that need fast arithmetic operations. The foundation for incorporating approximation adders into useful applications was established by this study. 

The new study aims to extend the use of the approximation adder to image processing, with a particular focus on hardware realization and testing, building on the accomplishments of the previous project. The initial 12-bit approximation adder was improved to an 8-bit design, bringing it into compliance with common pixel formats because digital photographs generally use 8-bit pixel data. This reduction in bit width ensures the adder's compatibility with image compression and processing tasks, where performance efficiency and power reduction are critical.

An image processing workflow was created in order to evaluate the performance of the 8-bit approximation adder in practical settings. This procedure starts with using MATLAB to convert RGB photos to greyscale. Next, the approximation adder is applied in image addition, which is a crucial step in image blending and improvement. The performance of the adder was simulated using a Verilog test bench, and the results showed that the adder processes picture data efficiently while retaining a reasonable level of accuracy. 
Realizing the hardware implementation of an 8-bit approximation adder for real-time image processing applications is the main goal of this project. The research aims to test the adder's performance in real-world, energy-efficient applications including signal processing and image compression by incorporating it into FPGA-based devices.

3. PROPOSED APPROXIMATE ADDER ARCHITECTURE:

3.1 Introduction:
The primary aim is to maximize operating efficiency while minimizing the number of Look-Up Tables (LUTs) in Field-Programmable Gate Arrays (FPGAs), reducing the power requirement, speed while maintaining the error to max at 42%. The error of further bits leaving the LSB oscillates between 25 to 37 %, thus signifying that the error is not propagated beyond 37% on further approximation.

This technique helps us to multiply the algorithm for large number of bits while making the error constant and by carry prediction. It is done by wisely splitting the adder into separate pieces, directing resources to where they are most needed.

The adder's architecture is divided into five parts utilizing the segmentation concept from the research articles, the LSB part is having prediction while the MSB part have the accurate calculation. Each of which is designed to carry out a certain function during computation. The first three segments deal with approximation for the Least Significant Bits (LSBs), and the last two segments deal with accurate results for the Most Significant Bits (MSBs).
In adder design, approximation is essential because it enables a trade-off between accuracy and important performance measures like speed, power consumption, and LUT utilization. The adder's estimated portion spans seven bits, sacrificing precision in favor of increased efficiency. This calculated risk allows for large resource savings without sacrificing the adder's overall functioning.

3.2 Working:
Part 1 LSB:
This part contains the AND-OR-OR based adder. As we progress from the bit 0 to bit 2, the carry propagates and the inaccuracy increases from 28% to 42% showing that if we add more bits with this logic then the error will increase and go beyond 50%.
So other techniques need to be taken into consideration. This part does not have carry propagation as it is the Least of LSB part so neglecting the carry part.
Part 2 LSB:
This part contains NAND-NAND based adder. For the bit 3 and bit 4 the sum term is basically the nand of the input bits. From here onwards carry prediction is done for the upcoming subsequent blocks. Here the carry prediction is not based on the output of the nand gate which is sum, but it also depends on the input bits (both bits). This technique is similar to the CLA technique for carry generation, but it is simpler and takes only one logic equations. The accuracy here is 25 % and 37%. The carry generation here have the accuracy of 84%.
Part 3 LSB: 
This part contains two blocks, one when then the carry incoming is 0 and other when it is 1. When the carry is 0, then the adder will be like the previous LSB part, it doesn’t have any changes. The error also is same that is 25% and 37%. But when Carry is 1, then the adder contains AND-AND gates. This block also provides the same error as before 25% and 37%.
With the above implementation, we can see that the carry is not propagated and it oscillates between 25% and 37%. The carry from this part is the OR of the carry generated from the previous block and the carry generated in this block (with the same logic). Here the OR term is there to compensate for the inaccuracy caused in the LSBs.
Part 2 MSB:
This part contains only one block of the carry look-ahead adder on which the carry input is given from the carry output coming from part 3 LSB. 
Part 1 MSB: 
This part contains the 4-bit Carry look Ahead Adder, with the input carry coming from the previous block. This is the part of the segment which is doing accurate calculations.
This is only for 12-bit implementation. To incorporate more bits we just need to multiply the Part 2 LSB, Part 3 LSB, and Part 2 MSB such that error will remain within 37%.



