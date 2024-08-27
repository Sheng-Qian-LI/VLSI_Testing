/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Tue May 30 21:32:58 2023
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

  DFFQXL data_out_reg_1_ ( .D(N53), .CK(clk), .Q(data_out[1]) );
  DFFQXL data_out_reg_0_ ( .D(N48), .CK(clk), .Q(data_out[0]) );
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
  INVX2 U8 ( .A(address[2]), .Y(n83) );
  AND2X2 U9 ( .A(address[3]), .B(n21), .Y(n32) );
  NAND2X2 U10 ( .A(n32), .B(address[0]), .Y(n31) );
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


module cb_mux_data ( normal_inputs_data, test_pattren_data, test_bist, 
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


module cb_mux_addr ( normal_inputs_addr, test_pattren_addr, test_bist, addr );
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


module cb_mux_cs ( normal_inputs_cs, test_pattren_cs, test_bist, cs );
  input normal_inputs_cs, test_pattren_cs, test_bist;
  output cs;


  AO2B2X2 U1 ( .B0(test_bist), .B1(normal_inputs_cs), .A0(test_pattren_cs), 
        .A1N(test_bist), .Y(cs) );
endmodule


module cb_mux_we ( normal_inputs_we, test_pattren_we, test_bist, we );
  input normal_inputs_we, test_pattren_we, test_bist;
  output we;


  AO2B2X2 U1 ( .B0(test_bist), .B1(normal_inputs_we), .A0(test_pattren_we), 
        .A1N(test_bist), .Y(we) );
endmodule


module BIST_checkerboard ( clk, rst_n, memory, tester, we_n_cb, cs_n_cb, aa, 
        test_pattren, pass_or_fail, test_down );
  input [1:0] memory;
  output [3:0] aa;
  output [1:0] test_pattren;
  input clk, rst_n, tester;
  output we_n_cb, cs_n_cb, pass_or_fail, test_down;
  wire   N33, N85, N86, N87, N88, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N150, N151, N231, N241, n15, n16, n18, n20, n24, n25, n37,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n850, n860, n870, n880, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n1060,
         n1070, n1080, n1090, n1100, n1110, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n17, n19, n21, n22, n23, n26, n27, n28;
  wire   [2:0] C_STATE;
  wire   [4:0] b;
  wire   [1:0] c;
  wire   [1:0] d;
  wire   [3:0] address_compare;
  wire   [3:0] address_compare_2;
  wire   [4:2] add_125_S2_carry;

  DFFQXL address_compare_reg_3_ ( .D(n103), .CK(clk), .Q(address_compare[3])
         );
  DFFQXL address_compare_reg_2_ ( .D(n104), .CK(clk), .Q(address_compare[2])
         );
  DFFQXL address_compare_reg_1_ ( .D(n105), .CK(clk), .Q(address_compare[1])
         );
  DFFQXL address_compare_reg_0_ ( .D(n1060), .CK(clk), .Q(address_compare[0])
         );
  DFFQXL address_compare_2_reg_2_ ( .D(address_compare[2]), .CK(clk), .Q(
        address_compare_2[2]) );
  DFFQXL address_compare_2_reg_0_ ( .D(address_compare[0]), .CK(clk), .Q(
        address_compare_2[0]) );
  DFFQXL address_compare_2_reg_1_ ( .D(address_compare[1]), .CK(clk), .Q(
        address_compare_2[1]) );
  DFFQXL address_compare_2_reg_3_ ( .D(address_compare[3]), .CK(clk), .Q(
        address_compare_2[3]) );
  DFFQXL d_reg_1_ ( .D(n1070), .CK(clk), .Q(d[1]) );
  DFFQXL d_reg_0_ ( .D(n1080), .CK(clk), .Q(d[0]) );
  DFFQXL test_pattren_reg_1_ ( .D(N151), .CK(clk), .Q(test_pattren[1]) );
  DFFQXL test_pattren_reg_0_ ( .D(N150), .CK(clk), .Q(test_pattren[0]) );
  DFFQXL c_reg_0_ ( .D(n1100), .CK(clk), .Q(c[0]) );
  DFFQXL we_n_cb_reg ( .D(n1110), .CK(clk), .Q(we_n_cb) );
  DFFTRXL C_STATE_reg_1_ ( .D(n7), .RN(rst_n), .CK(clk), .Q(C_STATE[1]), .QN(
        n24) );
  DFFQXL b_reg_4_ ( .D(N114), .CK(clk), .Q(b[4]) );
  DFFQXL a_reg_3_ ( .D(N88), .CK(clk), .Q(aa[3]) );
  DFFQXL pass_or_fail_reg ( .D(N231), .CK(clk), .Q(pass_or_fail) );
  DFFQXL test_down_reg ( .D(N241), .CK(clk), .Q(test_down) );
  DFFQXL b_reg_0_ ( .D(N110), .CK(clk), .Q(b[0]) );
  DFFQXL a_reg_2_ ( .D(N87), .CK(clk), .Q(aa[2]) );
  DFFQXL a_reg_0_ ( .D(N85), .CK(clk), .Q(aa[0]) );
  DFFQXL a_reg_1_ ( .D(N86), .CK(clk), .Q(aa[1]) );
  DFFQXL c_reg_1_ ( .D(n1090), .CK(clk), .Q(c[1]) );
  DFFQXL C_STATE_reg_2_ ( .D(N33), .CK(clk), .Q(C_STATE[2]) );
  DFFTRXL C_STATE_reg_0_ ( .D(n10), .RN(rst_n), .CK(clk), .Q(C_STATE[0]), .QN(
        n25) );
  DFFQXL b_reg_1_ ( .D(N111), .CK(clk), .Q(b[1]) );
  DFFQXL b_reg_2_ ( .D(N112), .CK(clk), .Q(b[2]) );
  DFFQXL b_reg_3_ ( .D(N113), .CK(clk), .Q(b[3]) );
  INVX2 U4 ( .A(1'b1), .Y(cs_n_cb) );
  INVX2 U6 ( .A(n61), .Y(n15) );
  NOR2BX1 U7 ( .AN(n93), .B(n56), .Y(n92) );
  NAND2X2 U8 ( .A(n20), .B(n49), .Y(n56) );
  NAND2X2 U9 ( .A(n860), .B(n12), .Y(n99) );
  NAND2X2 U10 ( .A(n18), .B(n55), .Y(n54) );
  INVX2 U11 ( .A(n56), .Y(n18) );
  OAI21X1 U12 ( .A0(n55), .A1(n56), .B0(n65), .Y(n61) );
  INVX2 U13 ( .A(n62), .Y(n16) );
  AOI2BB2X2 U14 ( .B0(n20), .B1(n4), .A0N(n93), .A1N(n56), .Y(n91) );
  NOR2BX1 U15 ( .AN(n860), .B(n55), .Y(n93) );
  INVX2 U16 ( .A(n49), .Y(n4) );
  NOR2BX1 U17 ( .AN(n860), .B(n49), .Y(n84) );
  NOR3X1 U18 ( .A(n19), .B(n21), .C(n59), .Y(n860) );
  NOR3X1 U19 ( .A(n52), .B(n5), .C(n53), .Y(n50) );
  OAI21X1 U20 ( .A0(n37), .A1(n64), .B0(n54), .Y(n62) );
  NAND2X2 U21 ( .A(n66), .B(n8), .Y(n49) );
  NAND2X2 U22 ( .A(n67), .B(n8), .Y(n55) );
  OAI21X1 U23 ( .A0(n27), .A1(n65), .B0(n870), .Y(n83) );
  NAND2X2 U24 ( .A(n52), .B(n20), .Y(n870) );
  OAI22X1 U25 ( .A0(n15), .A1(n57), .B0(n16), .B1(n21), .Y(N88) );
  XOR2X1 U26 ( .A(n21), .B(n58), .Y(n57) );
  NOR2X2 U27 ( .A(n19), .B(n59), .Y(n58) );
  OAI2BB2X2 U28 ( .B0(n91), .B1(n23), .A0N(N108), .A1N(n92), .Y(N113) );
  OAI2BB2X2 U29 ( .B0(n91), .B1(n22), .A0N(N107), .A1N(n92), .Y(N112) );
  OAI2BB2X2 U30 ( .B0(n91), .B1(n13), .A0N(N106), .A1N(n92), .Y(N111) );
  INVX2 U31 ( .A(n79), .Y(n12) );
  NOR2X2 U32 ( .A(n47), .B(n27), .Y(n1090) );
  AOI21X1 U33 ( .A0(n48), .A1(n49), .B0(n50), .Y(n47) );
  NAND3XL U34 ( .A(n23), .B(n26), .C(n22), .Y(n97) );
  NAND4X2 U35 ( .A(n14), .B(n17), .C(n19), .D(n21), .Y(n75) );
  INVX2 U36 ( .A(n67), .Y(n10) );
  INVX2 U37 ( .A(n53), .Y(n20) );
  INVX2 U38 ( .A(n101), .Y(n6) );
  NAND2X2 U39 ( .A(n80), .B(n20), .Y(n65) );
  INVX2 U40 ( .A(n66), .Y(n7) );
  INVX2 U41 ( .A(n40), .Y(n5) );
  NOR3BX1 U42 ( .AN(n70), .B(n41), .C(n78), .Y(n77) );
  INVX2 U43 ( .A(n80), .Y(n9) );
  OA21X1 U44 ( .A0(n12), .A1(n9), .B0(n41), .Y(n39) );
  NOR2X2 U45 ( .A(n37), .B(n40), .Y(n48) );
  NOR4X2 U46 ( .A(n9), .B(n37), .C(n79), .D(n75), .Y(n76) );
  AOI2BB2X2 U47 ( .B0(n19), .B1(n90), .A0N(n19), .A1N(n78), .Y(n46) );
  NOR2X2 U48 ( .A(n37), .B(n8), .Y(N33) );
  AOI2BB2X2 U49 ( .B0(C_STATE[0]), .B1(C_STATE[2]), .A0N(C_STATE[2]), .A1N(n94), .Y(n67) );
  AOI22XL U50 ( .A0(n95), .A1(n24), .B0(C_STATE[1]), .B1(n96), .Y(n94) );
  OAI21X1 U51 ( .A0(n860), .A1(n25), .B0(n75), .Y(n95) );
  OAI211XL U52 ( .A0(n97), .A1(n98), .B0(n99), .C0(n25), .Y(n96) );
  NOR3X1 U53 ( .A(n66), .B(C_STATE[2]), .C(n67), .Y(n52) );
  NAND3XL U54 ( .A(n860), .B(n11), .C(b[1]), .Y(n98) );
  NAND2X2 U55 ( .A(aa[0]), .B(aa[1]), .Y(n59) );
  AO22X2 U56 ( .A0(n48), .A1(n4), .B0(c[0]), .B1(n3), .Y(n1100) );
  OR2X2 U57 ( .A(n48), .B(n50), .Y(n3) );
  AOI2BB2X2 U58 ( .B0(n860), .B1(n80), .A0N(n100), .A1N(n24), .Y(n66) );
  NOR2X2 U59 ( .A(n101), .B(n99), .Y(n100) );
  OAI32XL U60 ( .A0(n59), .A1(aa[2]), .A2(n15), .B0(n60), .B1(n19), .Y(N87) );
  AOI21X1 U61 ( .A0(n61), .A1(n59), .B0(n62), .Y(n60) );
  OAI32XL U62 ( .A0(n14), .A1(aa[1]), .A2(n15), .B0(n63), .B1(n17), .Y(N86) );
  AOI21X1 U63 ( .A0(n61), .A1(n14), .B0(n62), .Y(n63) );
  OAI21X1 U64 ( .A0(n81), .A1(n65), .B0(n850), .Y(N150) );
  AOI22XL U65 ( .A0(test_pattren[0]), .A1(n83), .B0(n84), .B1(n20), .Y(n850)
         );
  OAI21X1 U66 ( .A0(n81), .A1(n65), .B0(n82), .Y(N151) );
  AOI22XL U67 ( .A0(test_pattren[1]), .A1(n83), .B0(n84), .B1(n20), .Y(n82) );
  OAI22X1 U68 ( .A0(aa[0]), .A1(n15), .B0(n16), .B1(n14), .Y(N85) );
  INVX2 U69 ( .A(aa[3]), .Y(n21) );
  INVX2 U70 ( .A(aa[2]), .Y(n19) );
  OAI2BB2X2 U71 ( .B0(n91), .B1(n26), .A0N(N109), .A1N(n92), .Y(N114) );
  OAI2B2X1 U72 ( .A1N(n92), .A0(b[0]), .B0(n91), .B1(n11), .Y(N110) );
  NAND3XL U73 ( .A(b[0]), .B(n13), .C(n102), .Y(n79) );
  NOR3X1 U74 ( .A(b[2]), .B(b[4]), .C(b[3]), .Y(n102) );
  INVX2 U75 ( .A(b[1]), .Y(n13) );
  NOR3X1 U76 ( .A(C_STATE[1]), .B(C_STATE[2]), .C(n25), .Y(n80) );
  OAI2B2X1 U77 ( .A1N(we_n_cb), .A0(n54), .B0(n55), .B1(n56), .Y(n1110) );
  INVX2 U78 ( .A(b[2]), .Y(n22) );
  INVX2 U79 ( .A(b[0]), .Y(n11) );
  INVX2 U80 ( .A(b[3]), .Y(n23) );
  INVX2 U81 ( .A(aa[0]), .Y(n14) );
  INVX2 U82 ( .A(b[4]), .Y(n26) );
  INVX2 U83 ( .A(aa[1]), .Y(n17) );
  NAND2X2 U84 ( .A(n8), .B(n25), .Y(n101) );
  INVX2 U85 ( .A(C_STATE[2]), .Y(n8) );
  NAND2X2 U86 ( .A(rst_n), .B(n64), .Y(n53) );
  NAND2X2 U87 ( .A(n6), .B(n24), .Y(n64) );
  NAND2X2 U88 ( .A(C_STATE[1]), .B(n6), .Y(n40) );
  NAND3XL U89 ( .A(n40), .B(n9), .C(rst_n), .Y(n41) );
  OAI21X1 U90 ( .A0(n71), .A1(n72), .B0(n28), .Y(N231) );
  NOR2X2 U91 ( .A(n73), .B(n74), .Y(n72) );
  AOI211X2 U92 ( .A0(n48), .A1(n75), .B0(n76), .C0(n77), .Y(n71) );
  XOR2X1 U93 ( .A(memory[1]), .B(d[1]), .Y(n73) );
  OAI2B2X1 U94 ( .A1N(address_compare[0]), .A0(n39), .B0(n40), .B1(n14), .Y(
        n1060) );
  OAI2B2X1 U95 ( .A1N(address_compare[1]), .A0(n39), .B0(n40), .B1(n17), .Y(
        n105) );
  OAI2B2X1 U96 ( .A1N(address_compare[2]), .A0(n39), .B0(n40), .B1(n19), .Y(
        n104) );
  OAI2B2X1 U97 ( .A1N(address_compare[3]), .A0(n39), .B0(n40), .B1(n21), .Y(
        n103) );
  AOI22XL U98 ( .A0(n20), .A1(c[1]), .B0(n40), .B1(n20), .Y(n42) );
  OAI2B1X1 U99 ( .A1N(d[0]), .A0(n42), .B0(n43), .Y(n1080) );
  OAI2B1X1 U100 ( .A1N(d[1]), .A0(n42), .B0(n43), .Y(n1070) );
  OAI2B2X1 U101 ( .A1N(n90), .A0(n19), .B0(aa[2]), .B1(n78), .Y(n45) );
  OA22X2 U102 ( .A0(n880), .A1(n14), .B0(n46), .B1(n89), .Y(n81) );
  NOR2X2 U103 ( .A(aa[1]), .B(n14), .Y(n89) );
  AOI32XL U104 ( .A0(aa[2]), .A1(aa[3]), .A2(n90), .B0(n45), .B1(n17), .Y(n880) );
  NOR2X2 U105 ( .A(c[1]), .B(c[0]), .Y(n90) );
  NAND2X2 U106 ( .A(c[0]), .B(n27), .Y(n78) );
  INVX2 U107 ( .A(c[1]), .Y(n27) );
  NAND3XL U108 ( .A(n5), .B(n44), .C(n20), .Y(n43) );
  OAI2B2X1 U109 ( .A1N(n45), .A0(aa[0]), .B0(n46), .B1(n14), .Y(n44) );
  NOR3X1 U110 ( .A(n24), .B(C_STATE[2]), .C(n25), .Y(n70) );
  ADDHX1 U111 ( .A(b[1]), .B(b[0]), .CO(add_125_S2_carry[2]), .S(N106) );
  ADDHX1 U112 ( .A(b[2]), .B(add_125_S2_carry[2]), .CO(add_125_S2_carry[3]), 
        .S(N107) );
  ADDHX1 U113 ( .A(b[3]), .B(add_125_S2_carry[3]), .CO(add_125_S2_carry[4]), 
        .S(N108) );
  OAI21X1 U114 ( .A0(n68), .A1(n69), .B0(n28), .Y(N241) );
  NAND3XL U115 ( .A(address_compare_2[2]), .B(address_compare_2[1]), .C(
        address_compare_2[3]), .Y(n69) );
  NAND3XL U116 ( .A(n70), .B(rst_n), .C(address_compare_2[0]), .Y(n68) );
  XOR2X1 U117 ( .A(memory[0]), .B(d[0]), .Y(n74) );
  INVX2 U118 ( .A(rst_n), .Y(n37) );
  INVX2 U119 ( .A(tester), .Y(n28) );
  XOR2X1 U120 ( .A(add_125_S2_carry[4]), .B(b[4]), .Y(N109) );
endmodule


module cb_mux_top ( clk, rst_n, normal_inputs_data, normal_inputs_addr, 
        normal_inputs_cs, normal_inputs_we, tester, pass_or_fail, test_down );
  input [1:0] normal_inputs_data;
  input [3:0] normal_inputs_addr;
  input clk, rst_n, normal_inputs_cs, normal_inputs_we, tester;
  output pass_or_fail, test_down;
  wire   we, cs, we_n_cb;
  wire   [3:0] address;
  wire   [1:0] outdata_data;
  wire   [1:0] memory_mux;
  wire   [1:0] test_pattren;
  wire   [3:0] aa;

  sram sram ( .clk(clk), .rst_n(rst_n), .address(address), .data_in(
        outdata_data), .data_out(memory_mux), .we_n(we), .cs_n(cs) );
  cb_mux_data cb_mux_data ( .normal_inputs_data(normal_inputs_data), 
        .test_pattren_data(test_pattren), .test_bist(tester), .outdata_data(
        outdata_data) );
  cb_mux_addr cb_mux_addr ( .normal_inputs_addr(normal_inputs_addr), 
        .test_pattren_addr(aa), .test_bist(tester), .addr(address) );
  cb_mux_cs cb_mux_cs ( .normal_inputs_cs(normal_inputs_cs), .test_pattren_cs(
        1'b0), .test_bist(tester), .cs(cs) );
  cb_mux_we cb_mux_we ( .normal_inputs_we(normal_inputs_we), .test_pattren_we(
        we_n_cb), .test_bist(tester), .we(we) );
  BIST_checkerboard BIST_checkerboard ( .clk(clk), .rst_n(rst_n), .memory(
        memory_mux), .tester(tester), .we_n_cb(we_n_cb), .cs_n_cb(), .aa(aa), 
        .test_pattren(test_pattren), .pass_or_fail(pass_or_fail), .test_down(
        test_down) );
endmodule

