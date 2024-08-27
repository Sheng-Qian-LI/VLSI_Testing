/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Tue May 30 21:00:14 2023
/////////////////////////////////////////////////////////////


module sram ( clk, rst_n, address, data_in, data_out, we_n, cs_n );
  input [3:0] address;
  input [1:0] data_in;
  output [1:0] data_out;
  input clk, rst_n, we_n, cs_n;
  wire   N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n440, n450, n460, n470, n480, n490,
         n500, n510, n520, n530, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n1, n2, n3, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89;
  wire   [15:0] space0;
  wire   [15:0] space1;

  DFFQXL data_out_reg_0_ ( .D(N48), .CK(clk), .Q(data_out[0]) );
  DFFQXL data_out_reg_1_ ( .D(N53), .CK(clk), .Q(data_out[1]) );
  DFFQXL space0_reg_0__2_ ( .D(n35), .CK(clk), .Q(space0[2]) );
  DFFQXL space0_reg_2__2_ ( .D(n43), .CK(clk), .Q(space0[10]) );
  DFFQXL space1_reg_0__2_ ( .D(n510), .CK(clk), .Q(space1[2]) );
  DFFQXL space1_reg_2__2_ ( .D(n59), .CK(clk), .Q(space1[10]) );
  DFFQXL space1_reg_0__0_ ( .D(n490), .CK(clk), .Q(space1[0]) );
  DFFQXL space0_reg_0__0_ ( .D(n33), .CK(clk), .Q(space0[0]) );
  DFFQXL space1_reg_2__0_ ( .D(n57), .CK(clk), .Q(space1[8]) );
  DFFQXL space0_reg_2__0_ ( .D(n41), .CK(clk), .Q(space0[8]) );
  DFFQXL space0_reg_1__2_ ( .D(n39), .CK(clk), .Q(space0[6]) );
  DFFQXL space0_reg_0__3_ ( .D(n36), .CK(clk), .Q(space0[3]) );
  DFFQXL space0_reg_3__2_ ( .D(n470), .CK(clk), .Q(space0[14]) );
  DFFQXL space0_reg_2__3_ ( .D(n440), .CK(clk), .Q(space0[11]) );
  DFFQXL space1_reg_1__2_ ( .D(n55), .CK(clk), .Q(space1[6]) );
  DFFQXL space1_reg_0__3_ ( .D(n520), .CK(clk), .Q(space1[3]) );
  DFFQXL space1_reg_3__2_ ( .D(n63), .CK(clk), .Q(space1[14]) );
  DFFQXL space1_reg_2__3_ ( .D(n60), .CK(clk), .Q(space1[11]) );
  DFFQXL space1_reg_1__0_ ( .D(n530), .CK(clk), .Q(space1[4]) );
  DFFQXL space0_reg_1__0_ ( .D(n37), .CK(clk), .Q(space0[4]) );
  DFFQXL space1_reg_0__1_ ( .D(n500), .CK(clk), .Q(space1[1]) );
  DFFQXL space0_reg_0__1_ ( .D(n34), .CK(clk), .Q(space0[1]) );
  DFFQXL space1_reg_3__0_ ( .D(n61), .CK(clk), .Q(space1[12]) );
  DFFQXL space0_reg_3__0_ ( .D(n450), .CK(clk), .Q(space0[12]) );
  DFFQXL space1_reg_2__1_ ( .D(n58), .CK(clk), .Q(space1[9]) );
  DFFQXL space0_reg_2__1_ ( .D(n42), .CK(clk), .Q(space0[9]) );
  DFFQXL space0_reg_1__3_ ( .D(n40), .CK(clk), .Q(space0[7]) );
  DFFQXL space0_reg_3__3_ ( .D(n480), .CK(clk), .Q(space0[15]) );
  DFFQXL space1_reg_1__3_ ( .D(n56), .CK(clk), .Q(space1[7]) );
  DFFQXL space1_reg_3__3_ ( .D(n64), .CK(clk), .Q(space1[15]) );
  DFFQXL space1_reg_1__1_ ( .D(n54), .CK(clk), .Q(space1[5]) );
  DFFQXL space0_reg_1__1_ ( .D(n38), .CK(clk), .Q(space0[5]) );
  DFFQXL space1_reg_3__1_ ( .D(n62), .CK(clk), .Q(space1[13]) );
  DFFQXL space0_reg_3__1_ ( .D(n460), .CK(clk), .Q(space0[13]) );
  NAND2X2 U3 ( .A(n29), .B(n88), .Y(n23) );
  NAND2X2 U4 ( .A(n32), .B(n88), .Y(n30) );
  NAND2X2 U5 ( .A(n89), .B(n83), .Y(n24) );
  NOR2BX1 U6 ( .AN(n21), .B(address[3]), .Y(n29) );
  NAND2X2 U7 ( .A(address[0]), .B(n29), .Y(n25) );
  AND2X2 U8 ( .A(address[3]), .B(n21), .Y(n32) );
  NAND2X2 U9 ( .A(n32), .B(address[0]), .Y(n31) );
  INVX2 U10 ( .A(address[2]), .Y(n83) );
  INVX2 U11 ( .A(address[3]), .Y(n82) );
  NAND2X2 U12 ( .A(address[2]), .B(n89), .Y(n27) );
  INVX2 U13 ( .A(address[1]), .Y(n89) );
  INVX2 U14 ( .A(address[0]), .Y(n88) );
  NAND2X2 U15 ( .A(address[1]), .B(n83), .Y(n26) );
  NAND2X2 U16 ( .A(address[2]), .B(address[1]), .Y(n28) );
  NOR3BX1 U17 ( .AN(rst_n), .B(we_n), .C(cs_n), .Y(n21) );
  OAI2BB2X2 U18 ( .B0(n6), .B1(n5), .A0N(space0[1]), .A1N(n6), .Y(n34) );
  OAI2BB2X2 U19 ( .B0(n6), .B1(n22), .A0N(space1[1]), .A1N(n6), .Y(n500) );
  OA21X1 U20 ( .A0(n24), .A1(n25), .B0(rst_n), .Y(n6) );
  OAI2BB2X2 U21 ( .B0(n8), .B1(n5), .A0N(space0[3]), .A1N(n8), .Y(n36) );
  OAI2BB2X2 U22 ( .B0(n10), .B1(n5), .A0N(space0[5]), .A1N(n10), .Y(n38) );
  OAI2BB2X2 U23 ( .B0(n12), .B1(n5), .A0N(space0[7]), .A1N(n12), .Y(n40) );
  OAI2BB2X2 U24 ( .B0(n8), .B1(n22), .A0N(space1[3]), .A1N(n8), .Y(n520) );
  OAI2BB2X2 U25 ( .B0(n10), .B1(n22), .A0N(space1[5]), .A1N(n10), .Y(n54) );
  OAI2BB2X2 U26 ( .B0(n12), .B1(n22), .A0N(space1[7]), .A1N(n12), .Y(n56) );
  OA21X1 U27 ( .A0(n25), .A1(n26), .B0(rst_n), .Y(n8) );
  OA21X1 U28 ( .A0(n25), .A1(n27), .B0(rst_n), .Y(n10) );
  OA21X1 U29 ( .A0(n25), .A1(n28), .B0(rst_n), .Y(n12) );
  OAI2BB2X2 U30 ( .B0(n4), .B1(n5), .A0N(space0[0]), .A1N(n4), .Y(n33) );
  OAI2BB2X2 U31 ( .B0(n7), .B1(n5), .A0N(space0[2]), .A1N(n7), .Y(n35) );
  OAI2BB2X2 U32 ( .B0(n9), .B1(n5), .A0N(space0[4]), .A1N(n9), .Y(n37) );
  OAI2BB2X2 U33 ( .B0(n11), .B1(n5), .A0N(space0[6]), .A1N(n11), .Y(n39) );
  OAI2BB2X2 U34 ( .B0(n4), .B1(n22), .A0N(space1[0]), .A1N(n4), .Y(n490) );
  OAI2BB2X2 U35 ( .B0(n7), .B1(n22), .A0N(space1[2]), .A1N(n7), .Y(n510) );
  OAI2BB2X2 U36 ( .B0(n9), .B1(n22), .A0N(space1[4]), .A1N(n9), .Y(n530) );
  OAI2BB2X2 U37 ( .B0(n11), .B1(n22), .A0N(space1[6]), .A1N(n11), .Y(n55) );
  OA21X1 U38 ( .A0(n23), .A1(n26), .B0(rst_n), .Y(n7) );
  OA21X1 U39 ( .A0(n23), .A1(n27), .B0(rst_n), .Y(n9) );
  OA21X1 U40 ( .A0(n23), .A1(n28), .B0(rst_n), .Y(n11) );
  OA21X1 U41 ( .A0(n23), .A1(n24), .B0(rst_n), .Y(n4) );
  OAI2BB2X2 U42 ( .B0(n14), .B1(n5), .A0N(space0[9]), .A1N(n14), .Y(n42) );
  OAI2BB2X2 U43 ( .B0(n16), .B1(n5), .A0N(space0[11]), .A1N(n16), .Y(n440) );
  OAI2BB2X2 U44 ( .B0(n18), .B1(n5), .A0N(space0[13]), .A1N(n18), .Y(n460) );
  OAI2BB2X2 U45 ( .B0(n20), .B1(n5), .A0N(space0[15]), .A1N(n20), .Y(n480) );
  OAI2BB2X2 U46 ( .B0(n14), .B1(n22), .A0N(space1[9]), .A1N(n14), .Y(n58) );
  OAI2BB2X2 U47 ( .B0(n16), .B1(n22), .A0N(space1[11]), .A1N(n16), .Y(n60) );
  OAI2BB2X2 U48 ( .B0(n18), .B1(n22), .A0N(space1[13]), .A1N(n18), .Y(n62) );
  OAI2BB2X2 U49 ( .B0(n20), .B1(n22), .A0N(space1[15]), .A1N(n20), .Y(n64) );
  OA21X1 U50 ( .A0(n24), .A1(n31), .B0(rst_n), .Y(n14) );
  OA21X1 U51 ( .A0(n26), .A1(n31), .B0(rst_n), .Y(n16) );
  OA21X1 U52 ( .A0(n27), .A1(n31), .B0(rst_n), .Y(n18) );
  OA21X1 U53 ( .A0(n28), .A1(n31), .B0(rst_n), .Y(n20) );
  OAI2BB2X2 U54 ( .B0(n13), .B1(n5), .A0N(space0[8]), .A1N(n13), .Y(n41) );
  OAI2BB2X2 U55 ( .B0(n15), .B1(n5), .A0N(space0[10]), .A1N(n15), .Y(n43) );
  OAI2BB2X2 U56 ( .B0(n17), .B1(n5), .A0N(space0[12]), .A1N(n17), .Y(n450) );
  OAI2BB2X2 U57 ( .B0(n19), .B1(n5), .A0N(space0[14]), .A1N(n19), .Y(n470) );
  OAI2BB2X2 U58 ( .B0(n13), .B1(n22), .A0N(space1[8]), .A1N(n13), .Y(n57) );
  OAI2BB2X2 U59 ( .B0(n15), .B1(n22), .A0N(space1[10]), .A1N(n15), .Y(n59) );
  OAI2BB2X2 U60 ( .B0(n17), .B1(n22), .A0N(space1[12]), .A1N(n17), .Y(n61) );
  OAI2BB2X2 U61 ( .B0(n19), .B1(n22), .A0N(space1[14]), .A1N(n19), .Y(n63) );
  OA21X1 U62 ( .A0(n26), .A1(n30), .B0(rst_n), .Y(n15) );
  OA21X1 U63 ( .A0(n27), .A1(n30), .B0(rst_n), .Y(n17) );
  OA21X1 U64 ( .A0(n28), .A1(n30), .B0(rst_n), .Y(n19) );
  OA21X1 U65 ( .A0(n24), .A1(n30), .B0(rst_n), .Y(n13) );
  NAND2X2 U66 ( .A(data_in[0]), .B(n21), .Y(n5) );
  NAND2X2 U67 ( .A(data_in[1]), .B(n21), .Y(n22) );
  NOR2X1 U68 ( .A(n82), .B(address[2]), .Y(n77) );
  NOR2X1 U69 ( .A(n82), .B(n83), .Y(n76) );
  AOI22XL U70 ( .A0(space1[8]), .A1(n77), .B0(space1[12]), .B1(n76), .Y(n2) );
  NOR2X1 U71 ( .A(address[2]), .B(address[3]), .Y(n79) );
  NOR2X1 U72 ( .A(n83), .B(address[3]), .Y(n78) );
  AOI22XL U73 ( .A0(space1[0]), .A1(n79), .B0(space1[4]), .B1(n78), .Y(n1) );
  CLKNAND2X2 U74 ( .A(n2), .B(n1), .Y(N52) );
  AOI22XL U75 ( .A0(space1[9]), .A1(n77), .B0(space1[13]), .B1(n76), .Y(n65)
         );
  AOI22XL U76 ( .A0(space1[1]), .A1(n79), .B0(space1[5]), .B1(n78), .Y(n3) );
  CLKNAND2X2 U77 ( .A(n65), .B(n3), .Y(N51) );
  AOI22XL U78 ( .A0(space1[10]), .A1(n77), .B0(space1[14]), .B1(n76), .Y(n67)
         );
  AOI22XL U79 ( .A0(space1[2]), .A1(n79), .B0(space1[6]), .B1(n78), .Y(n66) );
  CLKNAND2X2 U80 ( .A(n67), .B(n66), .Y(N50) );
  AOI22XL U81 ( .A0(space1[11]), .A1(n77), .B0(space1[15]), .B1(n76), .Y(n69)
         );
  AOI22XL U82 ( .A0(space1[3]), .A1(n79), .B0(space1[7]), .B1(n78), .Y(n68) );
  CLKNAND2X2 U83 ( .A(n69), .B(n68), .Y(N49) );
  AOI22XL U84 ( .A0(space0[8]), .A1(n77), .B0(space0[12]), .B1(n76), .Y(n71)
         );
  AOI22XL U85 ( .A0(space0[0]), .A1(n79), .B0(space0[4]), .B1(n78), .Y(n70) );
  CLKNAND2X2 U86 ( .A(n71), .B(n70), .Y(N47) );
  AOI22XL U87 ( .A0(space0[9]), .A1(n77), .B0(space0[13]), .B1(n76), .Y(n73)
         );
  AOI22XL U88 ( .A0(space0[1]), .A1(n79), .B0(space0[5]), .B1(n78), .Y(n72) );
  CLKNAND2X2 U89 ( .A(n73), .B(n72), .Y(N46) );
  AOI22XL U90 ( .A0(space0[10]), .A1(n77), .B0(space0[14]), .B1(n76), .Y(n75)
         );
  AOI22XL U91 ( .A0(space0[2]), .A1(n79), .B0(space0[6]), .B1(n78), .Y(n74) );
  CLKNAND2X2 U92 ( .A(n75), .B(n74), .Y(N45) );
  AOI22XL U93 ( .A0(space0[11]), .A1(n77), .B0(space0[15]), .B1(n76), .Y(n81)
         );
  AOI22XL U94 ( .A0(space0[3]), .A1(n79), .B0(space0[7]), .B1(n78), .Y(n80) );
  CLKNAND2X2 U95 ( .A(n81), .B(n80), .Y(N44) );
  AOI22XL U96 ( .A0(N50), .A1(n88), .B0(N49), .B1(address[0]), .Y(n85) );
  AOI22XL U97 ( .A0(N52), .A1(n88), .B0(N51), .B1(address[0]), .Y(n84) );
  OAI22X1 U98 ( .A0(n89), .A1(n85), .B0(address[1]), .B1(n84), .Y(N53) );
  AOI22XL U99 ( .A0(N45), .A1(n88), .B0(N44), .B1(address[0]), .Y(n87) );
  AOI22XL U100 ( .A0(N47), .A1(n88), .B0(N46), .B1(address[0]), .Y(n86) );
  OAI22X1 U101 ( .A0(n87), .A1(n89), .B0(address[1]), .B1(n86), .Y(N48) );
endmodule


module march_mux_data ( normal_inputs_data, test_pattren_data, test_bist, 
        outdata_data );
  input [1:0] normal_inputs_data;
  input [1:0] test_pattren_data;
  output [1:0] outdata_data;
  input test_bist;
  wire   n1;

  AO22X2 U1 ( .A0(test_pattren_data[0]), .A1(n1), .B0(normal_inputs_data[0]), 
        .B1(test_bist), .Y(outdata_data[0]) );
  AO22X2 U2 ( .A0(test_pattren_data[1]), .A1(n1), .B0(test_bist), .B1(
        normal_inputs_data[1]), .Y(outdata_data[1]) );
  INVX2 U3 ( .A(test_bist), .Y(n1) );
endmodule


module march_mux_addr ( normal_inputs_addr, test_pattren_addr, test_bist, addr
 );
  input [3:0] normal_inputs_addr;
  input [3:0] test_pattren_addr;
  output [3:0] addr;
  input test_bist;
  wire   n1;

  AO22X2 U1 ( .A0(test_pattren_addr[2]), .A1(n1), .B0(normal_inputs_addr[2]), 
        .B1(test_bist), .Y(addr[2]) );
  AO22X2 U2 ( .A0(test_pattren_addr[3]), .A1(n1), .B0(test_bist), .B1(
        normal_inputs_addr[3]), .Y(addr[3]) );
  AO22X2 U3 ( .A0(test_pattren_addr[1]), .A1(n1), .B0(normal_inputs_addr[1]), 
        .B1(test_bist), .Y(addr[1]) );
  AO22X2 U4 ( .A0(test_pattren_addr[0]), .A1(n1), .B0(normal_inputs_addr[0]), 
        .B1(test_bist), .Y(addr[0]) );
  INVX2 U5 ( .A(test_bist), .Y(n1) );
endmodule


module march_mux_cs ( normal_inputs_cs, test_pattren_cs, test_bist, cs );
  input normal_inputs_cs, test_pattren_cs, test_bist;
  output cs;


  AO2B2X2 U1 ( .B0(test_bist), .B1(normal_inputs_cs), .A0(test_pattren_cs), 
        .A1N(test_bist), .Y(cs) );
endmodule


module march_mux_we ( normal_inputs_we, test_pattren_we, test_bist, we );
  input normal_inputs_we, test_pattren_we, test_bist;
  output we;


  AO2B2X2 U1 ( .B0(test_bist), .B1(normal_inputs_we), .A0(test_pattren_we), 
        .A1N(test_bist), .Y(we) );
endmodule


module BIST_MARCH ( clk, rst_n, memory, a, we_n_march, cs_n_march, tester, 
        test_pattren, pass_or_fail, test_down );
  input [1:0] memory;
  output [3:0] a;
  output [1:0] test_pattren;
  input clk, rst_n, tester;
  output we_n_march, cs_n_march, pass_or_fail, test_down;
  wire   N42, N43, N173, N174, N254, N310, n24, n25, n30, n31, n33, n34, n35,
         n420, n430, n44, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n1730, n1740, n175, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n26, n27, n28, n29, n32, n36, n37, n38, n39, n40, n41;
  wire   [4:0] C_STATE;
  wire   [3:0] count1;
  wire   [1:0] c;
  wire   [1:0] d;
  wire   [3:0] count;
  wire   [3:0] address_compare;

  DFFQXL address_compare_reg_0_ ( .D(n156), .CK(clk), .Q(address_compare[0])
         );
  DFFQXL count_reg_3_ ( .D(n160), .CK(clk), .Q(count[3]) );
  DFFQXL address_compare_reg_1_ ( .D(n157), .CK(clk), .Q(address_compare[1])
         );
  DFFQXL address_compare_reg_2_ ( .D(n158), .CK(clk), .Q(address_compare[2])
         );
  DFFQXL address_compare_reg_3_ ( .D(n159), .CK(clk), .Q(address_compare[3])
         );
  DFFQXL count_reg_2_ ( .D(n161), .CK(clk), .Q(count[2]) );
  DFFQXL test_pattren_reg_1_ ( .D(n164), .CK(clk), .Q(test_pattren[1]) );
  DFFTRXL d_reg_0_ ( .D(rst_n), .RN(c[0]), .CK(clk), .Q(d[0]), .QN() );
  DFFTRXL d_reg_1_ ( .D(rst_n), .RN(c[1]), .CK(clk), .Q(d[1]), .QN() );
  DFFQXL c_reg_0_ ( .D(N173), .CK(clk), .Q(c[0]) );
  DFFQXL c_reg_1_ ( .D(N174), .CK(clk), .Q(c[1]) );
  DFFQXL we_n_march_reg ( .D(n172), .CK(clk), .Q(we_n_march) );
  DFFQXL cs_n_march_reg ( .D(n1730), .CK(clk), .Q(cs_n_march) );
  DFFQXL C_STATE_reg_3_ ( .D(N42), .CK(clk), .Q(C_STATE[3]) );
  DFFQXL C_STATE_reg_4_ ( .D(N43), .CK(clk), .Q(C_STATE[4]) );
  DFFQXL pass_or_fail_reg ( .D(N254), .CK(clk), .Q(pass_or_fail) );
  DFFQXL test_down_reg ( .D(N310), .CK(clk), .Q(test_down) );
  DFFQXL count_reg_1_ ( .D(n162), .CK(clk), .Q(count[1]) );
  DFFQXL count_reg_0_ ( .D(n163), .CK(clk), .Q(count[0]) );
  DFFQXL test_pattren_reg_0_ ( .D(n165), .CK(clk), .Q(test_pattren[0]) );
  DFFTRXL C_STATE_reg_2_ ( .D(n118), .RN(rst_n), .CK(clk), .Q(C_STATE[2]), 
        .QN(n420) );
  DFFTRXL C_STATE_reg_0_ ( .D(n113), .RN(rst_n), .CK(clk), .Q(C_STATE[0]), 
        .QN(n44) );
  DFFQXL count1_reg_0_ ( .D(n175), .CK(clk), .Q(count1[0]) );
  DFFQXL count1_reg_2_ ( .D(n166), .CK(clk), .Q(count1[2]) );
  DFFQXL a_reg_3_ ( .D(n168), .CK(clk), .Q(a[3]) );
  DFFQXL count1_reg_3_ ( .D(n1740), .CK(clk), .Q(count1[3]) );
  DFFQXL a_reg_2_ ( .D(n169), .CK(clk), .Q(a[2]) );
  DFFQXL a_reg_1_ ( .D(n170), .CK(clk), .Q(a[1]) );
  DFFQXL a_reg_0_ ( .D(n171), .CK(clk), .Q(a[0]) );
  DFFTRXL C_STATE_reg_1_ ( .D(n7), .RN(rst_n), .CK(clk), .Q(C_STATE[1]), .QN(
        n430) );
  DFFQXL count1_reg_1_ ( .D(n167), .CK(clk), .Q(count1[1]) );
  NAND3XL U3 ( .A(C_STATE[1]), .B(n420), .C(n128), .Y(n74) );
  INVX2 U4 ( .A(n102), .Y(n2) );
  INVX2 U5 ( .A(n105), .Y(n4) );
  INVX2 U6 ( .A(n111), .Y(n1) );
  NOR2X2 U7 ( .A(n3), .B(n107), .Y(n102) );
  INVX2 U8 ( .A(n155), .Y(n16) );
  INVX2 U9 ( .A(n108), .Y(n3) );
  INVX2 U10 ( .A(n146), .Y(n13) );
  NAND2X2 U11 ( .A(n12), .B(n142), .Y(n105) );
  NAND2X2 U12 ( .A(n12), .B(n112), .Y(n111) );
  NAND2X2 U13 ( .A(n139), .B(n107), .Y(n135) );
  INVX2 U14 ( .A(n132), .Y(n24) );
  INVX2 U15 ( .A(n80), .Y(n31) );
  NAND2X2 U16 ( .A(n17), .B(n83), .Y(n82) );
  INVX2 U17 ( .A(n79), .Y(n35) );
  NOR2X2 U18 ( .A(n6), .B(n16), .Y(n116) );
  INVX2 U19 ( .A(n98), .Y(n34) );
  NOR3X1 U20 ( .A(n20), .B(n19), .C(n96), .Y(n155) );
  AOI21X1 U21 ( .A0(n85), .A1(n140), .B0(n16), .Y(n146) );
  NAND3XL U22 ( .A(n119), .B(n142), .C(n12), .Y(n108) );
  INVX2 U23 ( .A(n113), .Y(n12) );
  AND3X2 U24 ( .A(n142), .B(n113), .C(n119), .Y(n107) );
  AND2X2 U25 ( .A(n143), .B(n118), .Y(n142) );
  INVX2 U26 ( .A(n127), .Y(n17) );
  INVX2 U27 ( .A(n87), .Y(n25) );
  NOR3BX1 U28 ( .AN(n143), .B(n119), .C(n118), .Y(n112) );
  INVX2 U29 ( .A(n143), .Y(n11) );
  NAND2X2 U30 ( .A(n112), .B(n113), .Y(n84) );
  INVX2 U31 ( .A(n86), .Y(n14) );
  NAND2BX2 U32 ( .AN(n150), .B(n143), .Y(n100) );
  INVX2 U33 ( .A(n133), .Y(n23) );
  NOR2X2 U34 ( .A(n111), .B(n103), .Y(n132) );
  OAI31X1 U35 ( .A0(n9), .A1(n10), .A2(n69), .B0(n30), .Y(n68) );
  OAI222X1 U36 ( .A0(n5), .A1(n19), .B0(n68), .B1(n36), .C0(n30), .C1(n39), 
        .Y(n158) );
  OAI222X1 U37 ( .A0(n5), .A1(n18), .B0(n68), .B1(n32), .C0(n30), .C1(n40), 
        .Y(n157) );
  OAI222X1 U38 ( .A0(n5), .A1(n20), .B0(n68), .B1(n37), .C0(n30), .C1(n38), 
        .Y(n159) );
  INVX2 U39 ( .A(n74), .Y(n10) );
  INVX2 U40 ( .A(n73), .Y(n5) );
  OAI2B11X2 U41 ( .A1N(n126), .A0(n74), .B0(n6), .C0(n5), .Y(n72) );
  NOR3X1 U42 ( .A(n67), .B(n9), .C(n83), .Y(n80) );
  INVX2 U43 ( .A(n69), .Y(n6) );
  NAND2X2 U44 ( .A(n6), .B(n74), .Y(n83) );
  INVX2 U45 ( .A(n129), .Y(n9) );
  NOR2X2 U46 ( .A(n82), .B(n67), .Y(n79) );
  NOR2X2 U47 ( .A(n23), .B(n89), .Y(n126) );
  NOR2X2 U48 ( .A(n101), .B(n16), .Y(n117) );
  AOI21X1 U49 ( .A0(n100), .A1(n101), .B0(n67), .Y(n98) );
  OAI2B2X1 U50 ( .A1N(n91), .A0(n21), .B0(n92), .B1(n88), .Y(n167) );
  INVX2 U51 ( .A(n119), .Y(n7) );
  AOI21X1 U52 ( .A0(n127), .A1(n85), .B0(n74), .Y(n125) );
  NOR3X1 U53 ( .A(n116), .B(n117), .C(n67), .Y(n91) );
  INVX2 U54 ( .A(n93), .Y(n33) );
  NOR2X2 U55 ( .A(n23), .B(n92), .Y(n139) );
  OAI32XL U56 ( .A0(n103), .A1(n1), .A2(n130), .B0(n131), .B1(n24), .Y(N174)
         );
  AOI22XL U57 ( .A0(n126), .A1(n16), .B0(n86), .B1(n133), .Y(n131) );
  AOI21X1 U58 ( .A0(n3), .A1(test_pattren[1]), .B0(n134), .Y(n130) );
  OAI31X1 U59 ( .A0(n2), .A1(n4), .A2(n27), .B0(n135), .Y(n134) );
  OAI21X1 U60 ( .A0(n143), .A1(n44), .B0(n151), .Y(n113) );
  OAI31X1 U61 ( .A0(n152), .A1(n147), .A2(n153), .B0(n143), .Y(n151) );
  AOI211X2 U62 ( .A0(n430), .A1(n17), .B0(C_STATE[2]), .C0(C_STATE[0]), .Y(
        n153) );
  OAI32XL U63 ( .A0(n154), .A1(n420), .A2(n13), .B0(n155), .B1(n150), .Y(n152)
         );
  NAND2X2 U64 ( .A(a[1]), .B(a[0]), .Y(n96) );
  OAI31X1 U65 ( .A0(n2), .A1(n4), .A2(n28), .B0(n135), .Y(n141) );
  INVX2 U66 ( .A(c[0]), .Y(n28) );
  OAI31X1 U67 ( .A0(n103), .A1(n1), .A2(n136), .B0(n137), .Y(N173) );
  OAI31X1 U68 ( .A0(n138), .A1(n139), .A2(n126), .B0(n132), .Y(n137) );
  AOI21X1 U69 ( .A0(n3), .A1(test_pattren[0]), .B0(n141), .Y(n136) );
  OAI2BB1X1 U70 ( .A0N(n133), .A1N(n117), .B0(n140), .Y(n138) );
  INVX2 U71 ( .A(a[2]), .Y(n19) );
  NOR2X2 U72 ( .A(count1[2]), .B(count1[3]), .Y(n133) );
  NAND3XL U73 ( .A(count1[0]), .B(n21), .C(n133), .Y(n85) );
  INVX2 U74 ( .A(a[3]), .Y(n20) );
  OR4X2 U75 ( .A(count1[3]), .B(n22), .C(count1[0]), .D(count1[1]), .Y(n140)
         );
  INVX2 U76 ( .A(count1[2]), .Y(n22) );
  NAND4X2 U77 ( .A(n144), .B(n145), .C(n129), .D(n5), .Y(n118) );
  OAI31X1 U78 ( .A0(n11), .A1(n146), .A2(n147), .B0(C_STATE[2]), .Y(n145) );
  OAI31X1 U79 ( .A0(n16), .A1(n23), .A2(n14), .B0(n69), .Y(n144) );
  NOR4X2 U80 ( .A(a[0]), .B(a[1]), .C(a[2]), .D(a[3]), .Y(n127) );
  NAND3XL U81 ( .A(rst_n), .B(n108), .C(n109), .Y(n87) );
  AND3X2 U82 ( .A(n84), .B(n110), .C(n111), .Y(n109) );
  OAI21X1 U83 ( .A0(n87), .A1(n105), .B0(n106), .Y(n1730) );
  NAND3XL U84 ( .A(n107), .B(n25), .C(cs_n_march), .Y(n106) );
  OAI211XL U85 ( .A0(n102), .A1(n103), .B0(n24), .C0(n104), .Y(n172) );
  NAND2X2 U86 ( .A(we_n_march), .B(n25), .Y(n104) );
  OAI2BB2X2 U87 ( .B0(n84), .B1(n85), .A0N(test_pattren[1]), .A1N(n25), .Y(
        n164) );
  INVX2 U88 ( .A(count1[1]), .Y(n21) );
  NOR2X2 U89 ( .A(C_STATE[3]), .B(C_STATE[4]), .Y(n143) );
  NOR2X2 U90 ( .A(n11), .B(C_STATE[0]), .Y(n128) );
  OA21X1 U91 ( .A0(n16), .A1(n100), .B0(n148), .Y(n119) );
  AOI31X1 U92 ( .A0(C_STATE[2]), .A1(n13), .A2(n128), .B0(n8), .Y(n148) );
  INVX2 U93 ( .A(n149), .Y(n8) );
  OAI31X1 U94 ( .A0(n11), .A1(n147), .A2(n44), .B0(C_STATE[1]), .Y(n149) );
  OAI32XL U95 ( .A0(n84), .A1(n86), .A2(n23), .B0(n87), .B1(n26), .Y(n165) );
  INVX2 U96 ( .A(test_pattren[0]), .Y(n26) );
  NOR2X2 U97 ( .A(n21), .B(count1[0]), .Y(n86) );
  NAND2X2 U98 ( .A(C_STATE[0]), .B(n430), .Y(n150) );
  NOR3X1 U99 ( .A(n430), .B(n44), .C(n420), .Y(n147) );
  NOR4X2 U100 ( .A(n420), .B(n44), .C(n11), .D(C_STATE[1]), .Y(n69) );
  OAI222X1 U101 ( .A0(n5), .A1(n15), .B0(n68), .B1(n29), .C0(n30), .C1(n41), 
        .Y(n156) );
  INVX2 U102 ( .A(address_compare[0]), .Y(n41) );
  INVX2 U103 ( .A(n70), .Y(n30) );
  OAI32XL U104 ( .A0(n67), .A1(n71), .A2(n72), .B0(n73), .B1(n31), .Y(n70) );
  NOR4X2 U105 ( .A(count1[3]), .B(n10), .C(n14), .D(n22), .Y(n71) );
  NAND2X2 U106 ( .A(n44), .B(n430), .Y(n154) );
  NOR4X2 U107 ( .A(n430), .B(n44), .C(n11), .D(C_STATE[2]), .Y(n73) );
  NAND3XL U108 ( .A(C_STATE[2]), .B(C_STATE[1]), .C(n128), .Y(n129) );
  OAI32XL U109 ( .A0(n35), .A1(count[1]), .A2(n29), .B0(n81), .B1(n32), .Y(
        n162) );
  AOI21X1 U110 ( .A0(n79), .A1(n29), .B0(n80), .Y(n81) );
  OAI32XL U111 ( .A0(n35), .A1(count[2]), .A2(n77), .B0(n78), .B1(n36), .Y(
        n161) );
  AOI21X1 U112 ( .A0(n79), .A1(n77), .B0(n80), .Y(n78) );
  OAI22X1 U113 ( .A0(n31), .A1(n37), .B0(n75), .B1(n35), .Y(n160) );
  XNOR2X1 U114 ( .A(count[3]), .B(n76), .Y(n75) );
  NOR2X2 U115 ( .A(n36), .B(n77), .Y(n76) );
  OAI32XL U116 ( .A0(n88), .A1(count1[2]), .A2(n89), .B0(n90), .B1(n22), .Y(
        n166) );
  AOI2B1X1 U117 ( .A1N(n88), .A0(n89), .B0(n91), .Y(n90) );
  OAI21X1 U118 ( .A0(n117), .A1(n116), .B0(rst_n), .Y(n88) );
  AOI221XL U119 ( .A0(n121), .A1(n122), .B0(n123), .B1(n124), .C0(tester), .Y(
        N254) );
  XNOR2X1 U120 ( .A(memory[0]), .B(d[0]), .Y(n123) );
  XNOR2X1 U121 ( .A(memory[1]), .B(d[1]), .Y(n124) );
  OAI21X1 U122 ( .A0(n125), .A1(n72), .B0(rst_n), .Y(n122) );
  NAND2X2 U123 ( .A(count1[1]), .B(count1[0]), .Y(n89) );
  NAND3XL U124 ( .A(C_STATE[2]), .B(n430), .C(n128), .Y(n101) );
  OAI32XL U125 ( .A0(n34), .A1(a[2]), .A2(n96), .B0(n97), .B1(n19), .Y(n169)
         );
  AOI21X1 U126 ( .A0(n98), .A1(n96), .B0(n33), .Y(n97) );
  OAI32XL U127 ( .A0(n34), .A1(a[1]), .A2(n15), .B0(n99), .B1(n18), .Y(n170)
         );
  AOI21X1 U128 ( .A0(n98), .A1(n15), .B0(n33), .Y(n99) );
  OAI22X1 U129 ( .A0(n20), .A1(n93), .B0(n94), .B1(n34), .Y(n168) );
  XNOR2X1 U130 ( .A(a[3]), .B(n95), .Y(n94) );
  NOR2X2 U131 ( .A(n19), .B(n96), .Y(n95) );
  OAI22X1 U132 ( .A0(n15), .A1(n93), .B0(a[0]), .B1(n34), .Y(n171) );
  NAND3XL U133 ( .A(n430), .B(n420), .C(n128), .Y(n110) );
  OAI2BB2X2 U134 ( .B0(count1[0]), .B1(n88), .A0N(count1[0]), .A1N(n91), .Y(
        n175) );
  OAI2BB2X2 U135 ( .B0(n114), .B1(n88), .A0N(count1[3]), .A1N(n91), .Y(n1740)
         );
  XNOR2X1 U136 ( .A(count1[3]), .B(n115), .Y(n114) );
  NOR2X2 U137 ( .A(n89), .B(n22), .Y(n115) );
  OAI22X1 U138 ( .A0(n31), .A1(n29), .B0(count[0]), .B1(n82), .Y(n163) );
  NAND3XL U139 ( .A(n101), .B(n100), .C(rst_n), .Y(n93) );
  NAND2X2 U140 ( .A(n9), .B(rst_n), .Y(n121) );
  NAND2X2 U141 ( .A(rst_n), .B(n110), .Y(n103) );
  OAI21BX1 U142 ( .A0(n120), .A1(n121), .B0N(tester), .Y(N310) );
  NOR4X2 U143 ( .A(address_compare[0]), .B(n40), .C(n39), .D(n38), .Y(n120) );
  AOI21X1 U144 ( .A0(n21), .A1(count1[0]), .B0(n86), .Y(n92) );
  INVX2 U145 ( .A(c[1]), .Y(n27) );
  NAND2X2 U146 ( .A(count[1]), .B(count[0]), .Y(n77) );
  INVX2 U147 ( .A(count[2]), .Y(n36) );
  INVX2 U148 ( .A(a[0]), .Y(n15) );
  INVX2 U149 ( .A(count[0]), .Y(n29) );
  INVX2 U150 ( .A(address_compare[3]), .Y(n38) );
  INVX2 U151 ( .A(address_compare[2]), .Y(n39) );
  INVX2 U152 ( .A(count[1]), .Y(n32) );
  INVX2 U153 ( .A(address_compare[1]), .Y(n40) );
  INVX2 U154 ( .A(a[1]), .Y(n18) );
  INVX2 U155 ( .A(count[3]), .Y(n37) );
  AND2X2 U156 ( .A(C_STATE[3]), .B(rst_n), .Y(N42) );
  AND2X2 U157 ( .A(C_STATE[4]), .B(rst_n), .Y(N43) );
  INVX2 U158 ( .A(rst_n), .Y(n67) );
endmodule


module march_mux_top ( clk, rst_n, normal_inputs_data, normal_inputs_addr, 
        normal_inputs_cs, normal_inputs_we, tester, pass_or_fail, test_down );
  input [1:0] normal_inputs_data;
  input [3:0] normal_inputs_addr;
  input clk, rst_n, normal_inputs_cs, normal_inputs_we, tester;
  output pass_or_fail, test_down;
  wire   we, cs, cs_n_march, we_n_march;
  wire   [3:0] address;
  wire   [1:0] outdata_data;
  wire   [1:0] memory_mux;
  wire   [1:0] test_pattren;
  wire   [3:0] aa;

  sram sram ( .clk(clk), .rst_n(rst_n), .address(address), .data_in(
        outdata_data), .data_out(memory_mux), .we_n(we), .cs_n(cs) );
  march_mux_data march_mux_data ( .normal_inputs_data(normal_inputs_data), 
        .test_pattren_data(test_pattren), .test_bist(tester), .outdata_data(
        outdata_data) );
  march_mux_addr march_mux_addr ( .normal_inputs_addr(normal_inputs_addr), 
        .test_pattren_addr(aa), .test_bist(tester), .addr(address) );
  march_mux_cs march_mux_cs ( .normal_inputs_cs(normal_inputs_cs), 
        .test_pattren_cs(cs_n_march), .test_bist(tester), .cs(cs) );
  march_mux_we march_mux_we ( .normal_inputs_we(normal_inputs_we), 
        .test_pattren_we(we_n_march), .test_bist(tester), .we(we) );
  BIST_MARCH BIST_MARCH ( .clk(clk), .rst_n(rst_n), .memory(memory_mux), .a(aa), .we_n_march(we_n_march), .cs_n_march(cs_n_march), .tester(tester), 
        .test_pattren(test_pattren), .pass_or_fail(pass_or_fail), .test_down(
        test_down) );
endmodule

