/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Sat May 13 15:07:47 2023
/////////////////////////////////////////////////////////////


module divide_8bit_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX2 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX2 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module divide_8bit_DW01_inc_5 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n5, n6, n9, n10, n12, n13, n16, n17, n19, n20, n23, n24, n27, n29,
         n33, n34, n35, n36, n38, n39, n40, n42, n43, n45, net1782, net2036,
         net2151, n31, n30, n2, n1, n75, n76, n77, n78, n79, n80, n81, n82,
         n83;

  NOR2BX8 U19 ( .AN(n38), .B(n35), .Y(n34) );
  INVXL U55 ( .A(A[9]), .Y(n10) );
  XNOR2X1 U56 ( .A(n75), .B(A[11]), .Y(SUM[11]) );
  XNOR2X1 U57 ( .A(n30), .B(n29), .Y(SUM[13]) );
  NAND2X2 U58 ( .A(A[10]), .B(n34), .Y(n75) );
  INVX1 U59 ( .A(n29), .Y(net1782) );
  CLKNAND2X4 U60 ( .A(n29), .B(n79), .Y(n81) );
  CLKNAND2X2 U61 ( .A(A[13]), .B(A[14]), .Y(n80) );
  INVX3 U62 ( .A(A[13]), .Y(n29) );
  XNOR2X1 U63 ( .A(A[12]), .B(A[11]), .Y(n5) );
  NAND2X2 U64 ( .A(n81), .B(n80), .Y(n1) );
  NOR2X2 U65 ( .A(n77), .B(net2036), .Y(n27) );
  INVX2 U66 ( .A(n30), .Y(n77) );
  AND2X2 U67 ( .A(A[2]), .B(A[3]), .Y(n43) );
  MXI2XL U68 ( .A(n10), .B(n9), .S0(n38), .Y(SUM[9]) );
  AND2X2 U69 ( .A(n43), .B(n45), .Y(n42) );
  AND2X6 U70 ( .A(n31), .B(n33), .Y(n30) );
  INVXL U71 ( .A(n75), .Y(n76) );
  CLKINVX4 U72 ( .A(net2151), .Y(n33) );
  XOR2XL U73 ( .A(n34), .B(A[10]), .Y(SUM[10]) );
  NAND2X4 U74 ( .A(n36), .B(A[9]), .Y(n35) );
  BUFX6 U75 ( .A(A[14]), .Y(n78) );
  INVX3 U76 ( .A(A[14]), .Y(n79) );
  NAND2X2 U77 ( .A(net1782), .B(n78), .Y(net2036) );
  AND2X4 U78 ( .A(A[11]), .B(A[12]), .Y(n31) );
  MXI2X1 U79 ( .A(n6), .B(n5), .S0(n76), .Y(SUM[12]) );
  AND2X4 U80 ( .A(A[8]), .B(A[7]), .Y(n36) );
  MXI2X2 U81 ( .A(n2), .B(n1), .S0(n30), .Y(SUM[14]) );
  INVXL U82 ( .A(n78), .Y(n2) );
  INVXL U83 ( .A(A[12]), .Y(n6) );
  INVX2 U84 ( .A(n13), .Y(n82) );
  NAND2X4 U85 ( .A(A[10]), .B(n34), .Y(net2151) );
  XOR2XL U86 ( .A(A[1]), .B(A[0]), .Y(SUM[1]) );
  CLKINVX4 U87 ( .A(n83), .Y(n45) );
  NAND2X2 U88 ( .A(A[1]), .B(A[0]), .Y(n83) );
  INVXL U89 ( .A(A[8]), .Y(n13) );
  NOR2BX8 U90 ( .AN(n42), .B(n39), .Y(n38) );
  MXI2XL U91 ( .A(n24), .B(n23), .S0(n45), .Y(SUM[3]) );
  AND2X4 U92 ( .A(A[4]), .B(A[5]), .Y(n40) );
  XNOR2XL U93 ( .A(n82), .B(A[7]), .Y(n12) );
  XNOR2XL U94 ( .A(n40), .B(A[6]), .Y(n16) );
  XNOR2XL U95 ( .A(A[2]), .B(A[3]), .Y(n23) );
  XNOR2XL U96 ( .A(A[4]), .B(A[5]), .Y(n19) );
  INVXL U97 ( .A(A[6]), .Y(n17) );
  INVXL U98 ( .A(A[5]), .Y(n20) );
  XOR2X1 U99 ( .A(n27), .B(A[15]), .Y(SUM[15]) );
  XOR2X1 U100 ( .A(n42), .B(A[4]), .Y(SUM[4]) );
  MXI2X1 U101 ( .A(n17), .B(n16), .S0(n42), .Y(SUM[6]) );
  MXI2X1 U102 ( .A(n20), .B(n19), .S0(n42), .Y(SUM[5]) );
  NAND2X2 U103 ( .A(n40), .B(A[6]), .Y(n39) );
  INVX2 U104 ( .A(A[3]), .Y(n24) );
  XOR2XL U105 ( .A(n45), .B(A[2]), .Y(SUM[2]) );
  INVX2 U106 ( .A(A[0]), .Y(SUM[0]) );
  XNOR2XL U107 ( .A(A[9]), .B(n36), .Y(n9) );
  MXI2XL U108 ( .A(n13), .B(n12), .S0(n38), .Y(SUM[8]) );
  XOR2XL U109 ( .A(n38), .B(A[7]), .Y(SUM[7]) );
endmodule


module divide_8bit ( clk, rst_n, in_valid, dividend, divisor, remainder, 
        quotient, out_valid );
  input [7:0] dividend;
  input [7:0] divisor;
  output [7:0] remainder;
  output [7:0] quotient;
  input clk, rst_n, in_valid;
  output out_valid;
  wire   N21, N22, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87,
         N88, N89, N91, N92, N93, N110, N111, N112, N113, N114, N115, N116,
         N117, N126, N127, N128, N129, N130, N131, N132, N133, N134, N135,
         N136, N137, N138, N139, N140, N141, n68, n69, n70, n71, n72, n73, n75,
         n76, n77, n780, n790, n800, n810, n820, n830, n840, n850, n860, n870,
         n880, n890, n90, n910, N45, N44, N43, N42, N41, N40, N39, N38, N37,
         N36, N35, N34, N33, N32, N31, N30, net1133, net1522, net1523, net1524,
         net1525, net1534, net1535, net1537, net1540, net1542, net1543,
         net1544, net1551, net1552, net1558, net1559, net1560, net1561,
         net1589, net1603, net1615, net1618, net1639, net1641, net1642,
         net1645, net1653, net1657, net1728, net1731, net1742, net1744,
         net1762, net1829, net1854, net1858, net2087, net2098, net2131, n920,
         n930, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n1100, n1110, n1120, n1130, n1140,
         n1150, n1160, n1170, n118, n119, n120, n121, n122, n123, n124, n125,
         n1260, n1270, n1280, n1290, n1300, n1310, n1320, n1330, n1340, n1350,
         n1360, n1370, n1380, n1390, n1400, n1410, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221;
  wire   [1:0] C_STATE;
  wire   [7:0] counter;
  wire   [15:8] remainder_state;
  wire   [15:8] divisor_state;

  divide_8bit_DW01_inc_0 add_96 ( .A(counter), .SUM({N117, N116, N115, N114, 
        N113, N112, N111, N110}) );
  DFFRHQX2 remainder_state_reg_15_ ( .D(N93), .CK(clk), .RN(rst_n), .Q(
        remainder_state[15]) );
  divide_8bit_DW01_inc_5 add_0_root_add_76 ( .A({N45, N44, N43, N42, N41, N40, 
        N39, N38, N37, N36, N35, N34, N33, N32, N31, N30}), .SUM({N61, N60, 
        N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46})
         );
  DFFRHQX4 divisor_state_reg_10_ ( .D(n860), .CK(clk), .RN(rst_n), .Q(
        divisor_state[10]) );
  DFFRHQX4 remainder_state_reg_11_ ( .D(N89), .CK(clk), .RN(rst_n), .Q(
        remainder_state[11]) );
  DFFRHQX4 divisor_state_reg_9_ ( .D(n870), .CK(clk), .RN(rst_n), .Q(
        divisor_state[9]) );
  DFFRHQX2 remainder_state_reg_7_ ( .D(N85), .CK(clk), .RN(rst_n), .Q(N37) );
  DFFRQX2 counter_reg_5_ ( .D(n76), .CK(clk), .RN(rst_n), .Q(counter[5]) );
  DFFRQX2 counter_reg_4_ ( .D(n77), .CK(clk), .RN(rst_n), .Q(counter[4]) );
  DFFRQX2 counter_reg_3_ ( .D(n780), .CK(clk), .RN(rst_n), .Q(counter[3]) );
  DFFRQX2 counter_reg_2_ ( .D(n790), .CK(clk), .RN(rst_n), .Q(counter[2]) );
  DFFRQX2 divisor_state_reg_15_ ( .D(n810), .CK(clk), .RN(rst_n), .Q(
        divisor_state[15]) );
  DFFRQX2 remainder_reg_7_ ( .D(N133), .CK(clk), .RN(rst_n), .Q(remainder[7])
         );
  DFFRQX2 remainder_reg_6_ ( .D(N132), .CK(clk), .RN(rst_n), .Q(remainder[6])
         );
  DFFRQX2 quotient_reg_6_ ( .D(N140), .CK(clk), .RN(rst_n), .Q(quotient[6]) );
  DFFRQX2 quotient_reg_5_ ( .D(N139), .CK(clk), .RN(rst_n), .Q(quotient[5]) );
  DFFRQX2 quotient_reg_4_ ( .D(N138), .CK(clk), .RN(rst_n), .Q(quotient[4]) );
  DFFRQX2 quotient_reg_3_ ( .D(N137), .CK(clk), .RN(rst_n), .Q(quotient[3]) );
  DFFRQX2 quotient_reg_2_ ( .D(N136), .CK(clk), .RN(rst_n), .Q(quotient[2]) );
  DFFRQX2 out_valid_reg ( .D(n910), .CK(clk), .RN(rst_n), .Q(out_valid) );
  DFFRQX2 remainder_reg_5_ ( .D(N131), .CK(clk), .RN(rst_n), .Q(remainder[5])
         );
  DFFRQX2 remainder_reg_4_ ( .D(N130), .CK(clk), .RN(rst_n), .Q(remainder[4])
         );
  DFFRQX2 remainder_reg_2_ ( .D(N128), .CK(clk), .RN(rst_n), .Q(remainder[2])
         );
  DFFRQX2 remainder_reg_1_ ( .D(N127), .CK(clk), .RN(rst_n), .Q(remainder[1])
         );
  DFFRQX2 remainder_reg_0_ ( .D(N126), .CK(clk), .RN(rst_n), .Q(remainder[0])
         );
  DFFRQX2 quotient_reg_7_ ( .D(N141), .CK(clk), .RN(rst_n), .Q(quotient[7]) );
  DFFRQX2 quotient_reg_1_ ( .D(N135), .CK(clk), .RN(rst_n), .Q(quotient[1]) );
  DFFRQX2 quotient_reg_0_ ( .D(N134), .CK(clk), .RN(rst_n), .Q(quotient[0]) );
  DFFRQX2 remainder_reg_3_ ( .D(N129), .CK(clk), .RN(rst_n), .Q(remainder[3])
         );
  DFFRHQX2 counter_reg_1_ ( .D(n800), .CK(clk), .RN(rst_n), .Q(counter[1]) );
  DFFRHQX2 counter_reg_0_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(counter[0]) );
  DFFRQX1 counter_reg_6_ ( .D(n75), .CK(clk), .RN(rst_n), .Q(counter[6]) );
  DFFRHQX2 remainder_state_reg_2_ ( .D(N80), .CK(clk), .RN(rst_n), .Q(N32) );
  DFFRHQX2 remainder_state_reg_3_ ( .D(N81), .CK(clk), .RN(rst_n), .Q(N33) );
  DFFRQX2 C_STATE_reg_1_ ( .D(N22), .CK(clk), .RN(rst_n), .Q(C_STATE[1]) );
  DFFRHQX4 divisor_state_reg_12_ ( .D(n840), .CK(clk), .RN(rst_n), .Q(
        divisor_state[12]) );
  DFFRHQX4 divisor_state_reg_11_ ( .D(n850), .CK(clk), .RN(rst_n), .Q(
        divisor_state[11]) );
  DFFRQX4 remainder_state_reg_12_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(
        remainder_state[12]) );
  DFFRQX2 remainder_state_reg_6_ ( .D(N84), .CK(clk), .RN(rst_n), .Q(N36) );
  DFFRQX2 remainder_state_reg_5_ ( .D(N83), .CK(clk), .RN(rst_n), .Q(N35) );
  DFFRQX2 remainder_state_reg_4_ ( .D(N82), .CK(clk), .RN(rst_n), .Q(N34) );
  DFFRHQX1 remainder_state_reg_0_ ( .D(N78), .CK(clk), .RN(rst_n), .Q(N30) );
  DFFRHQX2 divisor_state_reg_13_ ( .D(n830), .CK(clk), .RN(rst_n), .Q(
        divisor_state[13]) );
  DFFRHQX4 remainder_state_reg_10_ ( .D(N88), .CK(clk), .RN(rst_n), .Q(
        remainder_state[10]) );
  DFFRHQX4 remainder_state_reg_9_ ( .D(N87), .CK(clk), .RN(rst_n), .Q(
        remainder_state[9]) );
  DFFRHQX1 remainder_state_reg_13_ ( .D(N91), .CK(clk), .RN(rst_n), .Q(
        remainder_state[13]) );
  DFFRQX4 remainder_state_reg_8_ ( .D(N86), .CK(clk), .RN(rst_n), .Q(
        remainder_state[8]) );
  DFFRQX4 divisor_state_reg_14_ ( .D(n820), .CK(clk), .RN(rst_n), .Q(
        divisor_state[14]) );
  DFFRHQX1 remainder_state_reg_14_ ( .D(N92), .CK(clk), .RN(rst_n), .Q(
        remainder_state[14]) );
  DFFRHQX1 remainder_state_reg_1_ ( .D(N79), .CK(clk), .RN(rst_n), .Q(N31) );
  DFFRQX2 C_STATE_reg_0_ ( .D(N21), .CK(clk), .RN(rst_n), .Q(C_STATE[0]) );
  DFFRHQX2 divisor_state_reg_8_ ( .D(n880), .CK(clk), .RN(rst_n), .Q(
        divisor_state[8]) );
  DFFRHQX1 counter_reg_7_ ( .D(n890), .CK(clk), .RN(rst_n), .Q(counter[7]) );
  MXI2X4 U131 ( .A(n200), .B(n201), .S0(n199), .Y(N42) );
  NAND2BX2 U132 ( .AN(remainder_state[11]), .B(divisor_state[11]), .Y(net1561)
         );
  NAND2X4 U133 ( .A(net1642), .B(n103), .Y(net1542) );
  INVX3 U134 ( .A(net1615), .Y(n106) );
  CLKINVX6 U135 ( .A(net1615), .Y(net2087) );
  AND2XL U136 ( .A(n106), .B(N52), .Y(n1290) );
  OAI21XL U137 ( .A0(net1522), .A1(net1543), .B0(n99), .Y(n98) );
  OAI21BX2 U138 ( .A0(net1829), .A1(net1524), .B0N(n164), .Y(N88) );
  NAND2BX4 U139 ( .AN(divisor_state[11]), .B(net1742), .Y(net1589) );
  INVX2 U140 ( .A(divisor_state[10]), .Y(net1618) );
  CLKINVX1 U141 ( .A(N56), .Y(n1330) );
  AND2X1 U142 ( .A(n167), .B(n168), .Y(n930) );
  AOI22X1 U143 ( .A0(N35), .A1(n1110), .B0(N51), .B1(net2087), .Y(n155) );
  AOI22X1 U144 ( .A0(N34), .A1(n1110), .B0(N50), .B1(net2087), .Y(n153) );
  OAI2BB1X1 U145 ( .A0N(n185), .A1N(n193), .B0(n167), .Y(n143) );
  NAND2X3 U146 ( .A(n125), .B(net1603), .Y(n203) );
  CLKMX2X3 U147 ( .A(n1130), .B(n1140), .S0(n1150), .Y(N41) );
  NAND2X4 U148 ( .A(net1525), .B(divisor_state[8]), .Y(n122) );
  AOI22X1 U149 ( .A0(remainder_state[14]), .A1(net1762), .B0(N60), .B1(net2087), .Y(n920) );
  CLKINVX3 U150 ( .A(remainder_state[8]), .Y(n101) );
  MXI2X1 U151 ( .A(n930), .B(n94), .S0(n176), .Y(N45) );
  CLKXOR2X4 U152 ( .A(remainder_state[15]), .B(divisor_state[15]), .Y(n94) );
  CLKINVX4 U153 ( .A(net1645), .Y(net1642) );
  MX2X4 U154 ( .A(n205), .B(n204), .S0(n120), .Y(N40) );
  OAI2BB1X2 U155 ( .A0N(net1544), .A1N(remainder_state[8]), .B0(n1120), .Y(N38) );
  AO2B2X4 U156 ( .B0(n219), .B1(counter[7]), .A0(N117), .A1N(net1639), .Y(n890) );
  INVX2 U157 ( .A(net1618), .Y(net1731) );
  NAND2BX4 U158 ( .AN(remainder_state[10]), .B(net1731), .Y(net1552) );
  CLKINVX2 U159 ( .A(n181), .Y(n188) );
  OAI2BB1X2 U160 ( .A0N(net1558), .A1N(net1552), .B0(n119), .Y(n1160) );
  OAI21X1 U161 ( .A0(n216), .A1(net1543), .B0(n97), .Y(N91) );
  XOR2X1 U162 ( .A(net1524), .B(net1854), .Y(n95) );
  INVX2 U163 ( .A(remainder_state[12]), .Y(n107) );
  INVX2 U164 ( .A(divisor_state[9]), .Y(net1854) );
  XOR2XL U165 ( .A(remainder_state[14]), .B(divisor_state[14]), .Y(n96) );
  INVX2 U166 ( .A(net1603), .Y(net1558) );
  INVX2 U167 ( .A(net1543), .Y(net1537) );
  INVX2 U168 ( .A(remainder_state[9]), .Y(net1524) );
  AOI2BB2X4 U169 ( .B0(N59), .B1(net2087), .A0N(n109), .A1N(net1535), .Y(n97)
         );
  AOI22X2 U170 ( .A0(net1762), .A1(n121), .B0(N58), .B1(net2087), .Y(n99) );
  CLKNAND2X4 U171 ( .A(net1645), .B(n103), .Y(net1615) );
  CLKINVX3 U172 ( .A(n102), .Y(n176) );
  OAI21X4 U173 ( .A0(n100), .A1(net1589), .B0(n1260), .Y(n187) );
  CLKINVX4 U174 ( .A(n194), .Y(n100) );
  NAND2X4 U175 ( .A(n101), .B(divisor_state[8]), .Y(n1120) );
  OAI2BB1X2 U176 ( .A0N(n177), .A1N(n182), .B0(n175), .Y(n102) );
  INVX2 U177 ( .A(net1641), .Y(n103) );
  OAI2BB1X2 U178 ( .A0N(remainder_state[13]), .A1N(net1537), .B0(n920), .Y(N92) );
  NAND2XL U179 ( .A(n104), .B(remainder_state[12]), .Y(n1260) );
  INVXL U180 ( .A(divisor_state[12]), .Y(n104) );
  NAND2BX2 U181 ( .AN(n104), .B(n107), .Y(n105) );
  INVX2 U182 ( .A(n105), .Y(n195) );
  OAI2BB1X4 U183 ( .A0N(net2087), .A1N(N61), .B0(n206), .Y(N93) );
  OAI2B11X4 U184 ( .A1N(n1390), .A0(n143), .B0(n142), .C0(n168), .Y(net1645)
         );
  NAND2BX4 U185 ( .AN(n186), .B(n177), .Y(n144) );
  XNOR2X1 U186 ( .A(n104), .B(n108), .Y(n201) );
  INVX1 U187 ( .A(net1762), .Y(n109) );
  AND2X2 U188 ( .A(net1762), .B(N36), .Y(n1280) );
  INVX2 U189 ( .A(n107), .Y(n108) );
  NOR2XL U190 ( .A(n218), .B(n216), .Y(N130) );
  INVXL U191 ( .A(n216), .Y(n121) );
  INVX1 U192 ( .A(n172), .Y(n183) );
  NOR2X6 U193 ( .A(n196), .B(n124), .Y(n200) );
  NOR4XL U194 ( .A(n71), .B(counter[5]), .C(counter[7]), .D(counter[6]), .Y(
        n68) );
  OR3XL U195 ( .A(counter[6]), .B(counter[7]), .C(counter[5]), .Y(n73) );
  NAND2X4 U196 ( .A(n180), .B(n179), .Y(n189) );
  NAND2X4 U197 ( .A(n1360), .B(n1370), .Y(n1100) );
  CLKINVX2 U198 ( .A(divisor_state[8]), .Y(net1544) );
  AO21X4 U199 ( .A0(net1537), .A1(N37), .B0(n162), .Y(N86) );
  NAND3X4 U200 ( .A(n180), .B(net1589), .C(n179), .Y(n197) );
  MXI2X6 U201 ( .A(n96), .B(n1350), .S0(n1100), .Y(N44) );
  CLKINVX4 U202 ( .A(net1542), .Y(net1762) );
  CLKINVX2 U203 ( .A(net1542), .Y(n1110) );
  OAI2BB1X4 U204 ( .A0N(divisor_state[8]), .A1N(net1525), .B0(n202), .Y(n180)
         );
  AOI31X1 U205 ( .A0(n174), .A1(n177), .A2(n183), .B0(n178), .Y(n175) );
  NOR2X2 U206 ( .A(n1280), .B(n1290), .Y(n157) );
  INVXL U207 ( .A(net1542), .Y(net1540) );
  NAND2BX2 U208 ( .AN(in_valid), .B(net1133), .Y(net1543) );
  CLKINVX2 U209 ( .A(net1535), .Y(net1858) );
  NAND2BX2 U210 ( .AN(net1560), .B(n1170), .Y(n1130) );
  INVXL U211 ( .A(net1589), .Y(net1560) );
  INVXL U212 ( .A(net1653), .Y(n1170) );
  INVX4 U213 ( .A(net1561), .Y(net1653) );
  XNOR2XL U214 ( .A(divisor_state[11]), .B(net1742), .Y(n1140) );
  BUFX3 U215 ( .A(remainder_state[11]), .Y(net1742) );
  AOI31X2 U216 ( .A0(n1120), .A1(net1552), .A2(n118), .B0(n1160), .Y(n1150) );
  NAND2BX1 U217 ( .AN(remainder_state[9]), .B(net1744), .Y(n118) );
  BUFX2 U218 ( .A(divisor_state[9]), .Y(net1744) );
  INVXL U219 ( .A(net1551), .Y(n119) );
  CLKINVX4 U220 ( .A(net1559), .Y(net1551) );
  XNOR2X2 U221 ( .A(n1120), .B(n95), .Y(N39) );
  CLKINVX2 U222 ( .A(n173), .Y(n178) );
  AND2X2 U223 ( .A(n125), .B(net1603), .Y(n120) );
  OAI21BX4 U224 ( .A0(net1829), .A1(net1523), .B0N(n165), .Y(N89) );
  NAND2BX4 U225 ( .AN(remainder_state[12]), .B(divisor_state[12]), .Y(n1300)
         );
  NAND2BX8 U226 ( .AN(divisor_state[10]), .B(remainder_state[10]), .Y(net1559)
         );
  CLKNAND2X4 U227 ( .A(n197), .B(n198), .Y(n199) );
  INVX2 U228 ( .A(remainder_state[13]), .Y(net1535) );
  OR2X1 U229 ( .A(remainder_state[9]), .B(net1854), .Y(n202) );
  NAND2BX4 U230 ( .AN(remainder_state[12]), .B(divisor_state[12]), .Y(n194) );
  NAND2BX1 U231 ( .AN(divisor_state[12]), .B(remainder_state[12]), .Y(n193) );
  AO2B2X4 U232 ( .B0(n106), .B1(N55), .A0(net1540), .A1N(net1524), .Y(n163) );
  AO2B2X4 U233 ( .B0(N54), .B1(net2087), .A0(net1762), .A1N(net2098), .Y(n162)
         );
  CLKNAND2X4 U234 ( .A(net1534), .B(divisor_state[14]), .Y(n177) );
  INVX1 U235 ( .A(remainder_state[14]), .Y(net1534) );
  CLKINVX4 U236 ( .A(remainder_state[8]), .Y(net1525) );
  CLKINVX4 U237 ( .A(n144), .Y(n1390) );
  CLKMX2X3 U238 ( .A(n192), .B(n191), .S0(n190), .Y(N43) );
  OAI2BB1X2 U239 ( .A0N(n170), .A1N(n169), .B0(n185), .Y(n182) );
  AO2B2X4 U240 ( .B0(n106), .B1(N57), .A0(net1540), .A1N(net1522), .Y(n165) );
  NAND2BXL U241 ( .AN(n178), .B(n177), .Y(n184) );
  NAND2X2 U242 ( .A(net1524), .B(net1744), .Y(n123) );
  CLKNAND2X4 U243 ( .A(n122), .B(n123), .Y(n125) );
  INVXL U244 ( .A(n101), .Y(net2131) );
  CLKINVX2 U245 ( .A(n1300), .Y(n124) );
  NAND2BX1 U246 ( .AN(remainder_state[13]), .B(divisor_state[13]), .Y(n169) );
  OAI2BB1X2 U247 ( .A0N(n1320), .A1N(n189), .B0(net1589), .Y(n174) );
  INVX2 U248 ( .A(N46), .Y(n1270) );
  OAI21BX1 U249 ( .A0(n1340), .A1(n159), .B0N(n146), .Y(N78) );
  INVXL U250 ( .A(N30), .Y(n208) );
  OAI2B2XL U251 ( .A1N(N30), .A0(net1542), .B0(n1270), .B1(net1615), .Y(n146)
         );
  INVXL U252 ( .A(net2131), .Y(net2098) );
  OAI2BB1X4 U253 ( .A0N(n173), .A1N(n1410), .B0(n167), .Y(n142) );
  AO2B2X1 U254 ( .B0(net1537), .B1(N32), .A0(dividend[3]), .A1N(n159), .Y(n152) );
  INVX2 U255 ( .A(n145), .Y(n219) );
  AOI22XL U256 ( .A0(n1110), .A1(N32), .B0(N48), .B1(net2087), .Y(n149) );
  NAND2BX1 U257 ( .AN(C_STATE[1]), .B(C_STATE[0]), .Y(net1639) );
  AO22XL U258 ( .A0(N112), .A1(net1133), .B0(counter[2]), .B1(n219), .Y(n790)
         );
  AO22XL U259 ( .A0(N110), .A1(net1133), .B0(counter[0]), .B1(n219), .Y(n90)
         );
  OAI211X2 U260 ( .A0(n203), .A1(n1400), .B0(n1380), .C0(n1390), .Y(n1410) );
  AOI2BB1X4 U261 ( .A0N(n188), .A1N(n1400), .B0(n195), .Y(n1380) );
  NAND2BX1 U262 ( .AN(n186), .B(n1300), .Y(n172) );
  AOI21BX1 U263 ( .A0(n145), .A1(net1639), .B0N(net1657), .Y(n1310) );
  NOR2XL U264 ( .A(n218), .B(net2098), .Y(N126) );
  NOR2XL U265 ( .A(n218), .B(net1524), .Y(N127) );
  AO2B2X1 U266 ( .B0(net1537), .B1(N36), .A0(dividend[7]), .A1N(n159), .Y(n161) );
  NAND2BX1 U267 ( .AN(n186), .B(n185), .Y(n192) );
  AO22XL U268 ( .A0(n219), .A1(counter[6]), .B0(N116), .B1(net1133), .Y(n75)
         );
  NAND2BX1 U269 ( .AN(divisor_state[15]), .B(remainder_state[15]), .Y(n168) );
  AO22XL U270 ( .A0(n219), .A1(counter[5]), .B0(N115), .B1(net1133), .Y(n76)
         );
  AO22XL U271 ( .A0(n219), .A1(counter[4]), .B0(N114), .B1(net1133), .Y(n77)
         );
  NAND2BX1 U272 ( .AN(C_STATE[1]), .B(n221), .Y(n207) );
  INVXL U273 ( .A(C_STATE[0]), .Y(n221) );
  AO22X1 U274 ( .A0(divisor[5]), .A1(n166), .B0(n1310), .B1(divisor_state[13]), 
        .Y(n830) );
  AO22X1 U275 ( .A0(divisor[3]), .A1(n166), .B0(n1310), .B1(divisor_state[11]), 
        .Y(n850) );
  AO22X1 U276 ( .A0(divisor[4]), .A1(n166), .B0(n1310), .B1(divisor_state[12]), 
        .Y(n840) );
  AO22X1 U277 ( .A0(divisor[6]), .A1(n166), .B0(n1310), .B1(divisor_state[14]), 
        .Y(n820) );
  AO22X1 U278 ( .A0(divisor[7]), .A1(n166), .B0(n1310), .B1(divisor_state[15]), 
        .Y(n810) );
  AO2B2XL U279 ( .B0(divisor[0]), .B1(n166), .A0(n1310), .A1N(net1544), .Y(
        n880) );
  AO22XL U280 ( .A0(n219), .A1(counter[3]), .B0(N113), .B1(net1133), .Y(n780)
         );
  AO22X1 U281 ( .A0(N111), .A1(net1133), .B0(counter[1]), .B1(n219), .Y(n800)
         );
  INVXL U282 ( .A(N32), .Y(n210) );
  INVXL U283 ( .A(N34), .Y(n212) );
  INVXL U284 ( .A(N35), .Y(n213) );
  INVXL U285 ( .A(N36), .Y(n214) );
  INVXL U286 ( .A(remainder_state[15]), .Y(n217) );
  OAI31XL U287 ( .A0(n73), .A1(counter[4]), .A2(counter[3]), .B0(n70), .Y(n72)
         );
  NOR2XL U288 ( .A(n221), .B(C_STATE[1]), .Y(n70) );
  OR2XL U289 ( .A(counter[3]), .B(counter[4]), .Y(n71) );
  NAND2XL U290 ( .A(C_STATE[1]), .B(n221), .Y(n69) );
  INVXL U291 ( .A(n108), .Y(n216) );
  INVXL U292 ( .A(C_STATE[1]), .Y(n220) );
  INVX2 U293 ( .A(net1537), .Y(net1829) );
  NOR2X2 U294 ( .A(n218), .B(net1522), .Y(N129) );
  OAI2BB1X2 U295 ( .A0N(net1551), .A1N(net1561), .B0(net1589), .Y(n1400) );
  INVX2 U296 ( .A(n184), .Y(n1350) );
  INVX2 U297 ( .A(n169), .Y(n186) );
  INVX2 U298 ( .A(n193), .Y(n170) );
  INVX2 U299 ( .A(n166), .Y(n159) );
  INVX2 U300 ( .A(n1260), .Y(n196) );
  INVX2 U301 ( .A(net1639), .Y(net1133) );
  INVX2 U302 ( .A(n207), .Y(n218) );
  NOR2X2 U303 ( .A(n218), .B(net1523), .Y(N128) );
  NOR2X2 U304 ( .A(n218), .B(n209), .Y(N135) );
  NOR2X2 U305 ( .A(n218), .B(n208), .Y(N134) );
  NOR2X2 U306 ( .A(n218), .B(n215), .Y(N141) );
  NOR2X2 U307 ( .A(n218), .B(net1535), .Y(N131) );
  INVX2 U308 ( .A(dividend[0]), .Y(n1340) );
  AO2B2X2 U309 ( .B0(net1537), .B1(N31), .A0(dividend[2]), .A1N(n159), .Y(n150) );
  AO2B2X2 U310 ( .B0(net1537), .B1(N35), .A0(dividend[6]), .A1N(n159), .Y(n158) );
  AO2B2X2 U311 ( .B0(net1537), .B1(N34), .A0(dividend[5]), .A1N(n159), .Y(n156) );
  AOI22XL U312 ( .A0(n1110), .A1(N31), .B0(N47), .B1(net2087), .Y(n147) );
  NAND2BX2 U313 ( .AN(remainder_state[15]), .B(divisor_state[15]), .Y(n167) );
  NAND2BX2 U314 ( .AN(in_valid), .B(n219), .Y(net1641) );
  NAND2BX2 U315 ( .AN(C_STATE[0]), .B(C_STATE[1]), .Y(n145) );
  OAI211XL U316 ( .A0(C_STATE[0]), .A1(net1657), .B0(n72), .C0(n69), .Y(N21)
         );
  NOR2X2 U317 ( .A(n218), .B(n210), .Y(N136) );
  NOR2X2 U318 ( .A(n218), .B(n211), .Y(N137) );
  NOR2X2 U319 ( .A(n218), .B(n212), .Y(N138) );
  NOR2X2 U320 ( .A(n218), .B(n213), .Y(N139) );
  NOR2X2 U321 ( .A(n218), .B(n214), .Y(N140) );
  NOR2X2 U322 ( .A(n218), .B(net1534), .Y(N132) );
  NOR2X2 U323 ( .A(n218), .B(n217), .Y(N133) );
  INVX2 U324 ( .A(N37), .Y(n215) );
  OAI21BX1 U325 ( .A0(n68), .A1(n69), .B0N(n70), .Y(N22) );
  NOR2X2 U326 ( .A(n221), .B(n220), .Y(n910) );
  INVX2 U327 ( .A(in_valid), .Y(net1657) );
  NAND2BX1 U328 ( .AN(net1551), .B(net1552), .Y(n205) );
  AO2B2XL U329 ( .B0(divisor[2]), .B1(n166), .A0(n1310), .A1N(net1618), .Y(
        n860) );
  INVXL U330 ( .A(n181), .Y(n1320) );
  NAND2BX4 U331 ( .AN(divisor_state[9]), .B(remainder_state[9]), .Y(net1603)
         );
  NAND2BX2 U332 ( .AN(divisor_state[14]), .B(remainder_state[14]), .Y(n173) );
  AOI22XL U333 ( .A0(remainder_state[15]), .A1(n1110), .B0(remainder_state[14]), .B1(net1537), .Y(n206) );
  OAI2B2XL U334 ( .A1N(net1728), .A0(net1542), .B0(n1330), .B1(net1615), .Y(
        n164) );
  NAND2BX2 U335 ( .AN(in_valid), .B(n207), .Y(n166) );
  OAI21BX4 U336 ( .A0(net1829), .A1(net2098), .B0N(n163), .Y(N87) );
  NAND2BX2 U337 ( .AN(net1560), .B(n181), .Y(n198) );
  AO2B2XL U338 ( .B0(divisor[1]), .B1(n166), .A0(n1310), .A1N(net1854), .Y(
        n870) );
  AO2B2X2 U339 ( .B0(net1537), .B1(N33), .A0(dividend[4]), .A1N(n159), .Y(n154) );
  INVX2 U340 ( .A(N33), .Y(n211) );
  INVXL U341 ( .A(N31), .Y(n209) );
  NAND2BX1 U342 ( .AN(n161), .B(n160), .Y(N85) );
  NAND2BX1 U343 ( .AN(n158), .B(n157), .Y(N84) );
  NAND2BX1 U344 ( .AN(n156), .B(n155), .Y(N83) );
  NAND2BX1 U345 ( .AN(n154), .B(n153), .Y(N82) );
  NAND2BX1 U346 ( .AN(n152), .B(n151), .Y(N81) );
  NAND2BX1 U347 ( .AN(n150), .B(n149), .Y(N80) );
  NAND2BX1 U348 ( .AN(n148), .B(n147), .Y(N79) );
  NAND2BX2 U349 ( .AN(divisor_state[13]), .B(net1858), .Y(n185) );
  XNOR2XL U350 ( .A(divisor_state[13]), .B(net1858), .Y(n191) );
  NAND3X2 U351 ( .A(n197), .B(n183), .C(n198), .Y(n1360) );
  INVX2 U352 ( .A(net1523), .Y(net1728) );
  INVXL U353 ( .A(remainder_state[10]), .Y(net1523) );
  AO2B2X2 U354 ( .B0(net1537), .B1(N30), .A0(dividend[1]), .A1N(n159), .Y(n148) );
  CLKINVX6 U355 ( .A(n171), .Y(n179) );
  INVX2 U356 ( .A(n182), .Y(n1370) );
  AOI22XL U357 ( .A0(net1540), .A1(N37), .B0(N53), .B1(net2087), .Y(n160) );
  AOI22XL U358 ( .A0(n1110), .A1(N33), .B0(N49), .B1(net2087), .Y(n151) );
  XNOR2XL U359 ( .A(net1731), .B(remainder_state[10]), .Y(n204) );
  INVXL U360 ( .A(net1742), .Y(net1522) );
  NAND2BX4 U361 ( .AN(net1653), .B(net1552), .Y(n181) );
  NAND2BX4 U362 ( .AN(net1558), .B(net1559), .Y(n171) );
  AOI31X4 U363 ( .A0(n189), .A1(n1300), .A2(n1320), .B0(n187), .Y(n190) );
endmodule

