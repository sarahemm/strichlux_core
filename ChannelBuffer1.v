/* Verilog netlist generated by SCUBA Diamond_1.4_Production (87) */
/* Module Version: 7.1 */
/* E:\lscc\diamond\1.4\ispfpga\bin\nt\scuba.exe -w -lang verilog -synth synplify -bus_exp 7 -bb -arch mg5a00 -type bram -wp 11 -rp 1010 -data_width 8 -rdata_width 8 -num_rows 512 -writemodeA NORMAL -writemodeB NORMAL -resetmode SYNC -memfile c:/documents and settings/owner/my documents/lattice/strichluxcore/samplechanneldata1.mem -memformat bin -cascade -1 -e  */
/* Sun Aug 19 18:57:13 2012 */


`timescale 1 ns / 1 ps
module ChannelBuffer1 (DataInA, DataInB, AddressA, AddressB, ClockA, 
    ClockB, ClockEnA, ClockEnB, WrA, WrB, ResetA, ResetB, QA, QB);
    input wire [7:0] DataInA;
    input wire [7:0] DataInB;
    input wire [8:0] AddressA;
    input wire [8:0] AddressB;
    input wire ClockA;
    input wire ClockB;
    input wire ClockEnA;
    input wire ClockEnB;
    input wire WrA;
    input wire WrB;
    input wire ResetA;
    input wire ResetB;
    output wire [7:0] QA;
    output wire [7:0] QB;

    wire scuba_vhi;
    wire scuba_vlo;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    // synopsys translate_off
    defparam ChannelBuffer1_0_0_0.INITVAL_3F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_3E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_3D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_3C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_3B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_3A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_39 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_38 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_37 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_36 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_35 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_34 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_33 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_32 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_31 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_30 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_2F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_2E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_2D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_2C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_2B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_2A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_29 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_28 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_27 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_26 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_25 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_24 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_23 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_22 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_21 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_20 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_1F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_1E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_1D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_1C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_1B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_1A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_19 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_18 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_17 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_16 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_15 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_14 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_13 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_12 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_11 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_10 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_0F = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_0E = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_0D = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_0C = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_0B = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_0A = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_09 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_08 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_07 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_06 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_05 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_04 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_03 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_02 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_01 = 320'h00000000000000000000000000000000000000000000000000000000000000000000000000000000 ;
    defparam ChannelBuffer1_0_0_0.INITVAL_00 = 320'h0000000000000000000000000000000000000000000000000000000000FF00000000FF00000000FF ;
    defparam ChannelBuffer1_0_0_0.CSDECODE_B =  3'b000 ;
    defparam ChannelBuffer1_0_0_0.CSDECODE_A =  3'b000 ;
    defparam ChannelBuffer1_0_0_0.WRITEMODE_B = "NORMAL" ;
    defparam ChannelBuffer1_0_0_0.WRITEMODE_A = "NORMAL" ;
    defparam ChannelBuffer1_0_0_0.GSR = "DISABLED" ;
    defparam ChannelBuffer1_0_0_0.RESETMODE = "SYNC" ;
    defparam ChannelBuffer1_0_0_0.REGMODE_B = "NOREG" ;
    defparam ChannelBuffer1_0_0_0.REGMODE_A = "NOREG" ;
    defparam ChannelBuffer1_0_0_0.DATA_WIDTH_B = 9 ;
    defparam ChannelBuffer1_0_0_0.DATA_WIDTH_A = 9 ;
    // synopsys translate_on
    DP16KB ChannelBuffer1_0_0_0 (.DIA0(DataInA[0]), .DIA1(DataInA[1]), .DIA2(DataInA[2]), 
        .DIA3(DataInA[3]), .DIA4(DataInA[4]), .DIA5(DataInA[5]), .DIA6(DataInA[6]), 
        .DIA7(DataInA[7]), .DIA8(scuba_vlo), .DIA9(scuba_vlo), .DIA10(scuba_vlo), 
        .DIA11(scuba_vlo), .DIA12(scuba_vlo), .DIA13(scuba_vlo), .DIA14(scuba_vlo), 
        .DIA15(scuba_vlo), .DIA16(scuba_vlo), .DIA17(scuba_vlo), .ADA0(scuba_vlo), 
        .ADA1(scuba_vlo), .ADA2(scuba_vlo), .ADA3(AddressA[0]), .ADA4(AddressA[1]), 
        .ADA5(AddressA[2]), .ADA6(AddressA[3]), .ADA7(AddressA[4]), .ADA8(AddressA[5]), 
        .ADA9(AddressA[6]), .ADA10(AddressA[7]), .ADA11(AddressA[8]), .ADA12(scuba_vlo), 
        .ADA13(scuba_vlo), .CEA(ClockEnA), .CLKA(ClockA), .WEA(WrA), .CSA0(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA2(scuba_vlo), .RSTA(ResetA), .DIB0(DataInB[0]), 
        .DIB1(DataInB[1]), .DIB2(DataInB[2]), .DIB3(DataInB[3]), .DIB4(DataInB[4]), 
        .DIB5(DataInB[5]), .DIB6(DataInB[6]), .DIB7(DataInB[7]), .DIB8(scuba_vlo), 
        .DIB9(scuba_vlo), .DIB10(scuba_vlo), .DIB11(scuba_vlo), .DIB12(scuba_vlo), 
        .DIB13(scuba_vlo), .DIB14(scuba_vlo), .DIB15(scuba_vlo), .DIB16(scuba_vlo), 
        .DIB17(scuba_vlo), .ADB0(scuba_vlo), .ADB1(scuba_vlo), .ADB2(scuba_vlo), 
        .ADB3(AddressB[0]), .ADB4(AddressB[1]), .ADB5(AddressB[2]), .ADB6(AddressB[3]), 
        .ADB7(AddressB[4]), .ADB8(AddressB[5]), .ADB9(AddressB[6]), .ADB10(AddressB[7]), 
        .ADB11(AddressB[8]), .ADB12(scuba_vlo), .ADB13(scuba_vlo), .CEB(ClockEnB), 
        .CLKB(ClockB), .WEB(WrB), .CSB0(scuba_vlo), .CSB1(scuba_vlo), .CSB2(scuba_vlo), 
        .RSTB(ResetB), .DOA0(QA[0]), .DOA1(QA[1]), .DOA2(QA[2]), .DOA3(QA[3]), 
        .DOA4(QA[4]), .DOA5(QA[5]), .DOA6(QA[6]), .DOA7(QA[7]), .DOA8(), 
        .DOA9(), .DOA10(), .DOA11(), .DOA12(), .DOA13(), .DOA14(), .DOA15(), 
        .DOA16(), .DOA17(), .DOB0(QB[0]), .DOB1(QB[1]), .DOB2(QB[2]), .DOB3(QB[3]), 
        .DOB4(QB[4]), .DOB5(QB[5]), .DOB6(QB[6]), .DOB7(QB[7]), .DOB8(), 
        .DOB9(), .DOB10(), .DOB11(), .DOB12(), .DOB13(), .DOB14(), .DOB15(), 
        .DOB16(), .DOB17())
             /* synthesis MEM_LPC_FILE="ChannelBuffer1.lpc" */
             /* synthesis MEM_INIT_FILE="samplechanneldata1.mem" */
             /* synthesis INITVAL_3F="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_3E="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_3D="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_3C="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_3B="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_3A="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_39="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_38="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_37="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_36="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_35="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_34="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_33="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_32="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_31="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_30="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_2F="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_2E="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_2D="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_2C="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_2B="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_2A="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_29="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_28="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_27="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_26="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_25="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_24="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_23="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_22="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_21="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_20="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_1F="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_1E="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_1D="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_1C="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_1B="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_1A="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_19="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_18="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_17="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_16="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_15="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_14="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_13="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_12="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_11="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_10="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_0F="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_0E="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_0D="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_0C="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_0B="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_0A="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_09="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_08="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_07="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_06="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_05="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_04="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_03="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_02="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_01="0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" */
             /* synthesis INITVAL_00="0x0000000000000000000000000000000000000000000000000000000000FF00000000FF00000000FF" */
             /* synthesis CSDECODE_B="0b000" */
             /* synthesis CSDECODE_A="0b000" */
             /* synthesis WRITEMODE_B="NORMAL" */
             /* synthesis WRITEMODE_A="NORMAL" */
             /* synthesis GSR="DISABLED" */
             /* synthesis RESETMODE="SYNC" */
             /* synthesis REGMODE_B="NOREG" */
             /* synthesis REGMODE_A="NOREG" */
             /* synthesis DATA_WIDTH_B="9" */
             /* synthesis DATA_WIDTH_A="9" */;



    // exemplar begin
    // exemplar attribute ChannelBuffer1_0_0_0 MEM_LPC_FILE ChannelBuffer1.lpc
    // exemplar attribute ChannelBuffer1_0_0_0 MEM_INIT_FILE samplechanneldata1.mem
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_3F 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_3E 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_3D 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_3C 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_3B 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_3A 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_39 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_38 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_37 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_36 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_35 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_34 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_33 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_32 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_31 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_30 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_2F 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_2E 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_2D 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_2C 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_2B 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_2A 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_29 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_28 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_27 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_26 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_25 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_24 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_23 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_22 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_21 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_20 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_1F 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_1E 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_1D 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_1C 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_1B 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_1A 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_19 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_18 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_17 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_16 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_15 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_14 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_13 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_12 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_11 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_10 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_0F 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_0E 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_0D 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_0C 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_0B 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_0A 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_09 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_08 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_07 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_06 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_05 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_04 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_03 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_02 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_01 0x00000000000000000000000000000000000000000000000000000000000000000000000000000000
    // exemplar attribute ChannelBuffer1_0_0_0 INITVAL_00 0x0000000000000000000000000000000000000000000000000000000000FF00000000FF00000000FF
    // exemplar attribute ChannelBuffer1_0_0_0 CSDECODE_B 0b000
    // exemplar attribute ChannelBuffer1_0_0_0 CSDECODE_A 0b000
    // exemplar attribute ChannelBuffer1_0_0_0 WRITEMODE_B NORMAL
    // exemplar attribute ChannelBuffer1_0_0_0 WRITEMODE_A NORMAL
    // exemplar attribute ChannelBuffer1_0_0_0 GSR DISABLED
    // exemplar attribute ChannelBuffer1_0_0_0 RESETMODE SYNC
    // exemplar attribute ChannelBuffer1_0_0_0 REGMODE_B NOREG
    // exemplar attribute ChannelBuffer1_0_0_0 REGMODE_A NOREG
    // exemplar attribute ChannelBuffer1_0_0_0 DATA_WIDTH_B 9
    // exemplar attribute ChannelBuffer1_0_0_0 DATA_WIDTH_A 9
    // exemplar end

endmodule
