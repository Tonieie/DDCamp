-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "12/22/2021 17:07:36"

-- 
-- Device: Altera 10M50DAF484C6GES Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	UARTFIFO IS
    PORT (
	RstB : IN std_logic;
	Button : IN std_logic;
	Clk50 : IN std_logic;
	TxSerData : OUT std_logic;
	RxSerData : IN std_logic;
	RESERVED : IN std_logic_vector(1 DOWNTO 0)
	);
END UARTFIFO;

-- Design Ports Information
-- TxSerData	=>  Location: PIN_W18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- RESERVED[0]	=>  Location: PIN_AA20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESERVED[1]	=>  Location: PIN_AA19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Clk50	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RstB	=>  Location: PIN_H21,	 I/O Standard: 1.5 V Schmitt Trigger,	 Current Strength: Default
-- RxSerData	=>  Location: PIN_AA17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Button	=>  Location: PIN_H22,	 I/O Standard: 1.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF UARTFIFO IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_RstB : std_logic;
SIGNAL ww_Button : std_logic;
SIGNAL ww_Clk50 : std_logic;
SIGNAL ww_TxSerData : std_logic;
SIGNAL ww_RxSerData : std_logic;
SIGNAL ww_RESERVED : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_PLL50|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_PLL50|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \rPLL50RstBCnt[3]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clk50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RESERVED[0]~input_o\ : std_logic;
SIGNAL \RESERVED[1]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_TDO~~padout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \~ALTERA_TDO~~obuf_o\ : std_logic;
SIGNAL \Clk50~input_o\ : std_logic;
SIGNAL \Clk50~inputclkctrl_outclk\ : std_logic;
SIGNAL \rPLL50RstBCnt[0]~feeder_combout\ : std_logic;
SIGNAL \rPLL50RstBCnt[1]~feeder_combout\ : std_logic;
SIGNAL \rPLL50RstBCnt[2]~feeder_combout\ : std_logic;
SIGNAL \rPLL50RstBCnt[3]~feeder_combout\ : std_logic;
SIGNAL \rPLL50RstBCnt[3]~clkctrl_outclk\ : std_logic;
SIGNAL \u_PLL50|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[0]~10_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \RstB~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \rRstBCnt~23_combout\ : std_logic;
SIGNAL \rRstBCnt[6]~2_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \rRstBCnt~22_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \rRstBCnt~21_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \rRstBCnt~20_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \rRstBCnt~19_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \rRstBCnt~18_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \rRstBCnt~17_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \rRstBCnt~16_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \rRstBCnt~15_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \rRstBCnt~14_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \rRstBCnt~13_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \rRstBCnt~12_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \rRstBCnt~11_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \rRstBCnt~10_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \rRstBCnt~9_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \rRstBCnt~8_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \rRstBCnt~7_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \rRstBCnt~6_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \rRstBCnt~5_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \rRstBCnt~4_combout\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \rRstBCnt~3_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \rRstBCnt~1_combout\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \rRstBCnt~0_combout\ : std_logic;
SIGNAL \rRstBUser~feeder_combout\ : std_logic;
SIGNAL \rRstBUser~q\ : std_logic;
SIGNAL \u_PLL50|altpll_component|auto_generated|wire_pll1_locked\ : std_logic;
SIGNAL \u_PLL50|altpll_component|auto_generated|pll_lock_sync~feeder_combout\ : std_logic;
SIGNAL \u_PLL50|altpll_component|auto_generated|pll_lock_sync~q\ : std_logic;
SIGNAL \u_PLL50|altpll_component|auto_generated|locked~combout\ : std_logic;
SIGNAL \rPLLLockUser[1]~feeder_combout\ : std_logic;
SIGNAL \rSysRstB~0_combout\ : std_logic;
SIGNAL \rSysRstB~q\ : std_logic;
SIGNAL \Button~input_o\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \rButtonCnt~23_combout\ : std_logic;
SIGNAL \rButtonCnt[3]~2_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \rButtonCnt~22_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \rButtonCnt~21_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \rButtonCnt~20_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \rButtonCnt~19_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \rButtonCnt~18_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \rButtonCnt~17_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \rButtonCnt~16_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \rButtonCnt~15_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \rButtonCnt~14_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \rButtonCnt~13_combout\ : std_logic;
SIGNAL \Add1~21\ : std_logic;
SIGNAL \Add1~22_combout\ : std_logic;
SIGNAL \rButtonCnt~12_combout\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~24_combout\ : std_logic;
SIGNAL \rButtonCnt~11_combout\ : std_logic;
SIGNAL \Add1~25\ : std_logic;
SIGNAL \Add1~26_combout\ : std_logic;
SIGNAL \rButtonCnt~10_combout\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~28_combout\ : std_logic;
SIGNAL \rButtonCnt~9_combout\ : std_logic;
SIGNAL \Add1~29\ : std_logic;
SIGNAL \Add1~30_combout\ : std_logic;
SIGNAL \rButtonCnt~8_combout\ : std_logic;
SIGNAL \Add1~31\ : std_logic;
SIGNAL \Add1~32_combout\ : std_logic;
SIGNAL \rButtonCnt~7_combout\ : std_logic;
SIGNAL \Add1~33\ : std_logic;
SIGNAL \Add1~34_combout\ : std_logic;
SIGNAL \rButtonCnt~6_combout\ : std_logic;
SIGNAL \Add1~35\ : std_logic;
SIGNAL \Add1~36_combout\ : std_logic;
SIGNAL \rButtonCnt~5_combout\ : std_logic;
SIGNAL \Add1~37\ : std_logic;
SIGNAL \Add1~38_combout\ : std_logic;
SIGNAL \rButtonCnt~4_combout\ : std_logic;
SIGNAL \Add1~39\ : std_logic;
SIGNAL \Add1~40_combout\ : std_logic;
SIGNAL \rButtonCnt~3_combout\ : std_logic;
SIGNAL \Add1~41\ : std_logic;
SIGNAL \Add1~42_combout\ : std_logic;
SIGNAL \rButtonCnt~1_combout\ : std_logic;
SIGNAL \Add1~43\ : std_logic;
SIGNAL \Add1~44_combout\ : std_logic;
SIGNAL \rButtonCnt~0_combout\ : std_logic;
SIGNAL \RxSerData~input_o\ : std_logic;
SIGNAL \u_RxSerial|rSerDataIn~feeder_combout\ : std_logic;
SIGNAL \u_RxSerial|rSerDataIn~q\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[0]~10_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[4]~21\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[5]~22_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[5]~23\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[6]~24_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[6]~25\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[7]~26_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[7]~27\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[8]~28_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[8]~29\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[9]~30_combout\ : std_logic;
SIGNAL \u_RxSerial|Equal0~0_combout\ : std_logic;
SIGNAL \u_RxSerial|Equal1~0_combout\ : std_logic;
SIGNAL \u_RxSerial|Equal1~1_combout\ : std_logic;
SIGNAL \u_RxSerial|Selector1~0_combout\ : std_logic;
SIGNAL \u_RxSerial|rState.stStart~q\ : std_logic;
SIGNAL \u_RxSerial|rDataCnt~4_combout\ : std_logic;
SIGNAL \u_RxSerial|rDataCnt[1]~3_combout\ : std_logic;
SIGNAL \u_RxSerial|rDataCnt~5_combout\ : std_logic;
SIGNAL \u_RxSerial|rState~9_combout\ : std_logic;
SIGNAL \u_RxSerial|rDataCnt~2_combout\ : std_logic;
SIGNAL \u_RxSerial|Selector3~0_combout\ : std_logic;
SIGNAL \u_RxSerial|Selector2~0_combout\ : std_logic;
SIGNAL \u_RxSerial|rState.stData~q\ : std_logic;
SIGNAL \u_RxSerial|Selector3~1_combout\ : std_logic;
SIGNAL \u_RxSerial|rState.stStop~q\ : std_logic;
SIGNAL \u_RxSerial|rState~10_combout\ : std_logic;
SIGNAL \u_RxSerial|rState~11_combout\ : std_logic;
SIGNAL \u_RxSerial|rState.stIdle~q\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[0]~16_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[0]~17_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[0]~11\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[1]~12_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[1]~13\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[2]~14_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[2]~15\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[3]~18_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[3]~19\ : std_logic;
SIGNAL \u_RxSerial|rBaudCnt[4]~20_combout\ : std_logic;
SIGNAL \u_RxSerial|Equal0~1_combout\ : std_logic;
SIGNAL \u_RxSerial|Equal0~2_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudEnd~0_combout\ : std_logic;
SIGNAL \u_RxSerial|rBaudEnd~q\ : std_logic;
SIGNAL \u_RxSerial|rState~8_combout\ : std_logic;
SIGNAL \u_RxSerial|rState.stLoad~q\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ : std_logic;
SIGNAL \u_RxSerial|u_rRxFfWrEn~1_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrEn~q\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ : std_logic;
SIGNAL \rState~0_combout\ : std_logic;
SIGNAL \rState~q\ : std_logic;
SIGNAL \rTxFfEmpty~0_combout\ : std_logic;
SIGNAL \rTxFfEmpty~q\ : std_logic;
SIGNAL \u_TxSerial|rState~8_combout\ : std_logic;
SIGNAL \u_TxSerial|rDataCnt~2_combout\ : std_logic;
SIGNAL \u_TxSerial|rDataCnt~4_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut[2]~2_combout\ : std_logic;
SIGNAL \u_TxSerial|rDataCnt~3_combout\ : std_logic;
SIGNAL \u_TxSerial|rDataCnt~6_combout\ : std_logic;
SIGNAL \u_TxSerial|Add1~0_combout\ : std_logic;
SIGNAL \u_TxSerial|rDataCnt~5_combout\ : std_logic;
SIGNAL \u_TxSerial|Equal1~0_combout\ : std_logic;
SIGNAL \u_TxSerial|Selector1~0_combout\ : std_logic;
SIGNAL \u_TxSerial|rState.stWtData~q\ : std_logic;
SIGNAL \u_TxSerial|Selector2~0_combout\ : std_logic;
SIGNAL \u_TxSerial|Selector2~1_combout\ : std_logic;
SIGNAL \u_TxSerial|rState.stWtEnd~q\ : std_logic;
SIGNAL \u_TxSerial|rState~9_combout\ : std_logic;
SIGNAL \u_TxSerial|rState.stIdle~q\ : std_logic;
SIGNAL \u_TxSerial|rState~7_combout\ : std_logic;
SIGNAL \u_TxSerial|rState.stRdReq~q\ : std_logic;
SIGNAL \u_TxSerial|rTxFfRdEn~2_combout\ : std_logic;
SIGNAL \u_TxSerial|rTxFfRdEn~1_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[4]~12_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[0]~11\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[1]~13_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[1]~14\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[2]~15_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[2]~16\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[3]~17_combout\ : std_logic;
SIGNAL \u_TxSerial|Equal0~0_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[3]~18\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[4]~19_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[4]~20\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[5]~21_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[5]~22\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[6]~23_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[6]~24\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[7]~25_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[7]~26\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[8]~27_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[8]~28\ : std_logic;
SIGNAL \u_TxSerial|rBaudCnt[9]~29_combout\ : std_logic;
SIGNAL \u_TxSerial|Equal0~1_combout\ : std_logic;
SIGNAL \u_TxSerial|Equal0~2_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudEnd~0_combout\ : std_logic;
SIGNAL \u_TxSerial|rBaudEnd~q\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData~8_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData[0]~1_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData~7_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData~6_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData~5_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData~4_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData~3_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData~2_combout\ : std_logic;
SIGNAL \u_RxSerial|rRxFfWrData~0_combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~combout\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\ : std_logic;
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11~combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~9_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~8_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~7_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~6_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~5_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~4_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~3_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~1_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut~0_combout\ : std_logic;
SIGNAL \u_TxSerial|rSerDataOut\ : std_logic_vector(9 DOWNTO 0);
SIGNAL rPLL50RstBCnt : std_logic_vector(3 DOWNTO 0);
SIGNAL \u_PLL50|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\ : std_logic_vector(7 DOWNTO 0);
SIGNAL rButtonCnt : std_logic_vector(22 DOWNTO 0);
SIGNAL \u_RxSerial|rDataCnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL rRstBCnt : std_logic_vector(22 DOWNTO 0);
SIGNAL \u_TxSerial|rBaudCnt\ : std_logic_vector(9 DOWNTO 0);
SIGNAL rPLLLockUser : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_RxSerial|rBaudCnt\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \u_TxSerial|rTxFfRdEn\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_RxSerial|rRxFfWrData\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \u_TxSerial|rDataCnt\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_rPLL50RstBCnt[3]~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_RstB~input_o\ : std_logic;
SIGNAL \ALT_INV_rSysRstB~q\ : std_logic;

BEGIN

ww_RstB <= RstB;
ww_Button <= Button;
ww_Clk50 <= Clk50;
TxSerData <= ww_TxSerData;
ww_RxSerData <= RxSerData;
ww_RESERVED <= RESERVED;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\u_PLL50|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \Clk50~input_o\);

\u_PLL50|altpll_component|auto_generated|wire_pll1_clk\(0) <= \u_PLL50|altpll_component|auto_generated|pll1_CLK_bus\(0);
\u_PLL50|altpll_component|auto_generated|wire_pll1_clk\(1) <= \u_PLL50|altpll_component|auto_generated|pll1_CLK_bus\(1);
\u_PLL50|altpll_component|auto_generated|wire_pll1_clk\(2) <= \u_PLL50|altpll_component|auto_generated|pll1_CLK_bus\(2);
\u_PLL50|altpll_component|auto_generated|wire_pll1_clk\(3) <= \u_PLL50|altpll_component|auto_generated|pll1_CLK_bus\(3);
\u_PLL50|altpll_component|auto_generated|wire_pll1_clk\(4) <= \u_PLL50|altpll_component|auto_generated|pll1_CLK_bus\(4);

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ <= (\u_RxSerial|rRxFfWrData\(1) & \u_RxSerial|rRxFfWrData\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ <= (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ <= (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(0) <= \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(0);
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(1) <= \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(1);

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTADATAIN_bus\ <= (\u_RxSerial|rRxFfWrData\(3) & \u_RxSerial|rRxFfWrData\(2));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTAADDR_bus\ <= (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBADDR_bus\ <= (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(2) <= \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBDATAOUT_bus\(0);
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(3) <= \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBDATAOUT_bus\(1);

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTADATAIN_bus\ <= (\u_RxSerial|rRxFfWrData\(5) & \u_RxSerial|rRxFfWrData\(4));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTAADDR_bus\ <= (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBADDR_bus\ <= (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(4) <= \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBDATAOUT_bus\(0);
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(5) <= \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBDATAOUT_bus\(1);

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTADATAIN_bus\ <= (\u_RxSerial|rRxFfWrData\(7) & \u_RxSerial|rRxFfWrData\(6));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTAADDR_bus\ <= (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBADDR_bus\ <= (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(6) <= \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBDATAOUT_bus\(0);
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(7) <= \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBDATAOUT_bus\(1);

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\rPLL50RstBCnt[3]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & rPLL50RstBCnt(3));

\Clk50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clk50~input_o\);

\u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \u_PLL50|altpll_component|auto_generated|wire_pll1_clk\(0));
\ALT_INV_rPLL50RstBCnt[3]~clkctrl_outclk\ <= NOT \rPLL50RstBCnt[3]~clkctrl_outclk\;
\ALT_INV_RstB~input_o\ <= NOT \RstB~input_o\;
\ALT_INV_rSysRstB~q\ <= NOT \rSysRstB~q\;

-- Location: IOOBUF_X62_Y0_N9
\TxSerData~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_TxSerial|rSerDataOut\(0),
	devoe => ww_devoe,
	o => ww_TxSerData);

-- Location: IOIBUF_X0_Y18_N15
\Clk50~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk50,
	o => \Clk50~input_o\);

-- Location: CLKCTRL_G3
\Clk50~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk50~inputclkctrl_outclk\);

-- Location: LCCOMB_X45_Y2_N6
\rPLL50RstBCnt[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rPLL50RstBCnt[0]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \rPLL50RstBCnt[0]~feeder_combout\);

-- Location: FF_X45_Y2_N7
\rPLL50RstBCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rPLL50RstBCnt[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rPLL50RstBCnt(0));

-- Location: LCCOMB_X45_Y2_N12
\rPLL50RstBCnt[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rPLL50RstBCnt[1]~feeder_combout\ = rPLL50RstBCnt(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rPLL50RstBCnt(0),
	combout => \rPLL50RstBCnt[1]~feeder_combout\);

-- Location: FF_X45_Y2_N13
\rPLL50RstBCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rPLL50RstBCnt[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rPLL50RstBCnt(1));

-- Location: LCCOMB_X45_Y2_N10
\rPLL50RstBCnt[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rPLL50RstBCnt[2]~feeder_combout\ = rPLL50RstBCnt(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rPLL50RstBCnt(1),
	combout => \rPLL50RstBCnt[2]~feeder_combout\);

-- Location: FF_X45_Y2_N11
\rPLL50RstBCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rPLL50RstBCnt[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rPLL50RstBCnt(2));

-- Location: LCCOMB_X45_Y2_N16
\rPLL50RstBCnt[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rPLL50RstBCnt[3]~feeder_combout\ = rPLL50RstBCnt(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rPLL50RstBCnt(2),
	combout => \rPLL50RstBCnt[3]~feeder_combout\);

-- Location: FF_X45_Y2_N17
\rPLL50RstBCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rPLL50RstBCnt[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rPLL50RstBCnt(3));

-- Location: CLKCTRL_G15
\rPLL50RstBCnt[3]~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rPLL50RstBCnt[3]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rPLL50RstBCnt[3]~clkctrl_outclk\);

-- Location: PLL_1
\u_PLL50|altpll_component|auto_generated|pll1\ : fiftyfivenm_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 3,
	c0_initial => 1,
	c0_low => 3,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 1,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 2,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 12,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "functional",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 208,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => \ALT_INV_rPLL50RstBCnt[3]~clkctrl_outclk\,
	fbin => \u_PLL50|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \u_PLL50|altpll_component|auto_generated|pll1_INCLK_bus\,
	locked => \u_PLL50|altpll_component|auto_generated|wire_pll1_locked\,
	fbout => \u_PLL50|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \u_PLL50|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G18
\u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X55_Y31_N6
\u_TxSerial|rBaudCnt[0]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[0]~10_combout\ = \u_TxSerial|rBaudCnt\(0) $ (VCC)
-- \u_TxSerial|rBaudCnt[0]~11\ = CARRY(\u_TxSerial|rBaudCnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudCnt\(0),
	datad => VCC,
	combout => \u_TxSerial|rBaudCnt[0]~10_combout\,
	cout => \u_TxSerial|rBaudCnt[0]~11\);

-- Location: LCCOMB_X55_Y31_N30
\~GND\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: IOIBUF_X78_Y29_N1
\RstB~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RstB,
	o => \RstB~input_o\);

-- Location: LCCOMB_X77_Y27_N10
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = rRstBCnt(0) $ (VCC)
-- \Add0~1\ = CARRY(rRstBCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X77_Y27_N0
\rRstBCnt~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~23_combout\ = (\Add0~0_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~23_combout\);

-- Location: LCCOMB_X76_Y27_N8
\rRstBCnt[6]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt[6]~2_combout\ = (!rRstBCnt(22)) # (!\RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RstB~input_o\,
	datad => rRstBCnt(22),
	combout => \rRstBCnt[6]~2_combout\);

-- Location: FF_X77_Y27_N1
\rRstBCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~23_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(0));

-- Location: LCCOMB_X77_Y27_N12
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (rRstBCnt(1) & (!\Add0~1\)) # (!rRstBCnt(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!rRstBCnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X76_Y27_N6
\rRstBCnt~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~22_combout\ = (\Add0~2_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~2_combout\,
	datac => \RstB~input_o\,
	combout => \rRstBCnt~22_combout\);

-- Location: FF_X76_Y27_N7
\rRstBCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~22_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(1));

-- Location: LCCOMB_X77_Y27_N14
\Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (rRstBCnt(2) & (\Add0~3\ $ (GND))) # (!rRstBCnt(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((rRstBCnt(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X76_Y27_N12
\rRstBCnt~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~21_combout\ = (\Add0~4_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~4_combout\,
	datac => \RstB~input_o\,
	combout => \rRstBCnt~21_combout\);

-- Location: FF_X76_Y27_N13
\rRstBCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~21_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(2));

-- Location: LCCOMB_X77_Y27_N16
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (rRstBCnt(3) & (!\Add0~5\)) # (!rRstBCnt(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!rRstBCnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X77_Y27_N6
\rRstBCnt~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~20_combout\ = (\Add0~6_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~6_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~20_combout\);

-- Location: FF_X77_Y27_N7
\rRstBCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~20_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(3));

-- Location: LCCOMB_X77_Y27_N18
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (rRstBCnt(4) & (\Add0~7\ $ (GND))) # (!rRstBCnt(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((rRstBCnt(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X76_Y27_N10
\rRstBCnt~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~19_combout\ = (\RstB~input_o\ & \Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RstB~input_o\,
	datad => \Add0~8_combout\,
	combout => \rRstBCnt~19_combout\);

-- Location: FF_X76_Y27_N11
\rRstBCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~19_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(4));

-- Location: LCCOMB_X77_Y27_N20
\Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (rRstBCnt(5) & (!\Add0~9\)) # (!rRstBCnt(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!rRstBCnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X76_Y27_N0
\rRstBCnt~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~18_combout\ = (\Add0~10_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datac => \RstB~input_o\,
	combout => \rRstBCnt~18_combout\);

-- Location: FF_X76_Y27_N1
\rRstBCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~18_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(5));

-- Location: LCCOMB_X77_Y27_N22
\Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (rRstBCnt(6) & (\Add0~11\ $ (GND))) # (!rRstBCnt(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((rRstBCnt(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X76_Y27_N14
\rRstBCnt~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~17_combout\ = (\RstB~input_o\ & \Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RstB~input_o\,
	datad => \Add0~12_combout\,
	combout => \rRstBCnt~17_combout\);

-- Location: FF_X76_Y27_N15
\rRstBCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~17_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(6));

-- Location: LCCOMB_X77_Y27_N24
\Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (rRstBCnt(7) & (!\Add0~13\)) # (!rRstBCnt(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!rRstBCnt(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X76_Y27_N28
\rRstBCnt~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~16_combout\ = (\RstB~input_o\ & \Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RstB~input_o\,
	datad => \Add0~14_combout\,
	combout => \rRstBCnt~16_combout\);

-- Location: FF_X76_Y27_N29
\rRstBCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~16_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(7));

-- Location: LCCOMB_X77_Y27_N26
\Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (rRstBCnt(8) & (\Add0~15\ $ (GND))) # (!rRstBCnt(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((rRstBCnt(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X76_Y27_N26
\rRstBCnt~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~15_combout\ = (\Add0~16_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~16_combout\,
	datac => \RstB~input_o\,
	combout => \rRstBCnt~15_combout\);

-- Location: FF_X76_Y27_N27
\rRstBCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~15_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(8));

-- Location: LCCOMB_X77_Y27_N28
\Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (rRstBCnt(9) & (!\Add0~17\)) # (!rRstBCnt(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!rRstBCnt(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X76_Y27_N16
\rRstBCnt~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~14_combout\ = (\RstB~input_o\ & \Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RstB~input_o\,
	datad => \Add0~18_combout\,
	combout => \rRstBCnt~14_combout\);

-- Location: FF_X76_Y27_N17
\rRstBCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~14_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(9));

-- Location: LCCOMB_X77_Y27_N30
\Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (rRstBCnt(10) & (\Add0~19\ $ (GND))) # (!rRstBCnt(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((rRstBCnt(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X76_Y27_N22
\rRstBCnt~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~13_combout\ = (\Add0~20_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~20_combout\,
	datac => \RstB~input_o\,
	combout => \rRstBCnt~13_combout\);

-- Location: FF_X76_Y27_N23
\rRstBCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~13_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(10));

-- Location: LCCOMB_X77_Y26_N0
\Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (rRstBCnt(11) & (!\Add0~21\)) # (!rRstBCnt(11) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!rRstBCnt(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X77_Y26_N30
\rRstBCnt~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~12_combout\ = (\Add0~22_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~22_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~12_combout\);

-- Location: FF_X77_Y26_N31
\rRstBCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~12_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(11));

-- Location: LCCOMB_X77_Y26_N2
\Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (rRstBCnt(12) & (\Add0~23\ $ (GND))) # (!rRstBCnt(12) & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((rRstBCnt(12) & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X76_Y27_N20
\rRstBCnt~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~11_combout\ = (\RstB~input_o\ & \Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RstB~input_o\,
	datad => \Add0~24_combout\,
	combout => \rRstBCnt~11_combout\);

-- Location: FF_X76_Y27_N21
\rRstBCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~11_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(12));

-- Location: LCCOMB_X77_Y26_N4
\Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (rRstBCnt(13) & (!\Add0~25\)) # (!rRstBCnt(13) & ((\Add0~25\) # (GND)))
-- \Add0~27\ = CARRY((!\Add0~25\) # (!rRstBCnt(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(13),
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X77_Y27_N4
\rRstBCnt~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~10_combout\ = (\Add0~26_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~26_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~10_combout\);

-- Location: FF_X77_Y27_N5
\rRstBCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~10_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(13));

-- Location: LCCOMB_X77_Y26_N6
\Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (rRstBCnt(14) & (\Add0~27\ $ (GND))) # (!rRstBCnt(14) & (!\Add0~27\ & VCC))
-- \Add0~29\ = CARRY((rRstBCnt(14) & !\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X77_Y26_N28
\rRstBCnt~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~9_combout\ = (\Add0~28_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~28_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~9_combout\);

-- Location: FF_X77_Y26_N29
\rRstBCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~9_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(14));

-- Location: LCCOMB_X77_Y26_N8
\Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (rRstBCnt(15) & (!\Add0~29\)) # (!rRstBCnt(15) & ((\Add0~29\) # (GND)))
-- \Add0~31\ = CARRY((!\Add0~29\) # (!rRstBCnt(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X77_Y26_N26
\rRstBCnt~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~8_combout\ = (\Add0~30_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~30_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~8_combout\);

-- Location: FF_X77_Y26_N27
\rRstBCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~8_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(15));

-- Location: LCCOMB_X77_Y26_N10
\Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (rRstBCnt(16) & (\Add0~31\ $ (GND))) # (!rRstBCnt(16) & (!\Add0~31\ & VCC))
-- \Add0~33\ = CARRY((rRstBCnt(16) & !\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X76_Y27_N2
\rRstBCnt~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~7_combout\ = (\Add0~32_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~32_combout\,
	datac => \RstB~input_o\,
	combout => \rRstBCnt~7_combout\);

-- Location: FF_X76_Y27_N3
\rRstBCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~7_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(16));

-- Location: LCCOMB_X77_Y26_N12
\Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (rRstBCnt(17) & (!\Add0~33\)) # (!rRstBCnt(17) & ((\Add0~33\) # (GND)))
-- \Add0~35\ = CARRY((!\Add0~33\) # (!rRstBCnt(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(17),
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X77_Y27_N2
\rRstBCnt~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~6_combout\ = (\Add0~34_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~34_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~6_combout\);

-- Location: FF_X77_Y27_N3
\rRstBCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~6_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(17));

-- Location: LCCOMB_X77_Y26_N14
\Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (rRstBCnt(18) & (\Add0~35\ $ (GND))) # (!rRstBCnt(18) & (!\Add0~35\ & VCC))
-- \Add0~37\ = CARRY((rRstBCnt(18) & !\Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(18),
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: LCCOMB_X76_Y27_N24
\rRstBCnt~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~5_combout\ = (\RstB~input_o\ & \Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RstB~input_o\,
	datad => \Add0~36_combout\,
	combout => \rRstBCnt~5_combout\);

-- Location: FF_X76_Y27_N25
\rRstBCnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~5_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(18));

-- Location: LCCOMB_X77_Y26_N16
\Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (rRstBCnt(19) & (!\Add0~37\)) # (!rRstBCnt(19) & ((\Add0~37\) # (GND)))
-- \Add0~39\ = CARRY((!\Add0~37\) # (!rRstBCnt(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(19),
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: LCCOMB_X77_Y27_N8
\rRstBCnt~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~4_combout\ = (\Add0~38_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~38_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~4_combout\);

-- Location: FF_X77_Y27_N9
\rRstBCnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~4_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(19));

-- Location: LCCOMB_X77_Y26_N18
\Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = (rRstBCnt(20) & (\Add0~39\ $ (GND))) # (!rRstBCnt(20) & (!\Add0~39\ & VCC))
-- \Add0~41\ = CARRY((rRstBCnt(20) & !\Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(20),
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: LCCOMB_X77_Y26_N24
\rRstBCnt~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~3_combout\ = (\Add0~40_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~40_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~3_combout\);

-- Location: FF_X77_Y26_N25
\rRstBCnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~3_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(20));

-- Location: LCCOMB_X77_Y26_N20
\Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (rRstBCnt(21) & (!\Add0~41\)) # (!rRstBCnt(21) & ((\Add0~41\) # (GND)))
-- \Add0~43\ = CARRY((!\Add0~41\) # (!rRstBCnt(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(21),
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: LCCOMB_X76_Y26_N10
\rRstBCnt~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~1_combout\ = (\Add0~42_combout\ & \RstB~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~42_combout\,
	datad => \RstB~input_o\,
	combout => \rRstBCnt~1_combout\);

-- Location: FF_X76_Y26_N11
\rRstBCnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	d => \rRstBCnt~1_combout\,
	ena => \rRstBCnt[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(21));

-- Location: LCCOMB_X77_Y26_N22
\Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = rRstBCnt(22) $ (!\Add0~43\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rRstBCnt(22),
	cin => \Add0~43\,
	combout => \Add0~44_combout\);

-- Location: LCCOMB_X76_Y26_N4
\rRstBCnt~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBCnt~0_combout\ = (rRstBCnt(22)) # (\Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rRstBCnt(22),
	datad => \Add0~44_combout\,
	combout => \rRstBCnt~0_combout\);

-- Location: FF_X76_Y26_N1
\rRstBCnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk50~inputclkctrl_outclk\,
	asdata => \rRstBCnt~0_combout\,
	sclr => \ALT_INV_RstB~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rRstBCnt(22));

-- Location: LCCOMB_X75_Y27_N10
\rRstBUser~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rRstBUser~feeder_combout\ = rRstBCnt(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rRstBCnt(22),
	combout => \rRstBUser~feeder_combout\);

-- Location: FF_X75_Y27_N11
rRstBUser : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rRstBUser~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rRstBUser~q\);

-- Location: LCCOMB_X75_Y27_N24
\u_PLL50|altpll_component|auto_generated|pll_lock_sync~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_PLL50|altpll_component|auto_generated|pll_lock_sync~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \u_PLL50|altpll_component|auto_generated|pll_lock_sync~feeder_combout\);

-- Location: FF_X75_Y27_N25
\u_PLL50|altpll_component|auto_generated|pll_lock_sync\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_locked\,
	d => \u_PLL50|altpll_component|auto_generated|pll_lock_sync~feeder_combout\,
	clrn => \rPLL50RstBCnt[3]~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_PLL50|altpll_component|auto_generated|pll_lock_sync~q\);

-- Location: LCCOMB_X75_Y27_N6
\u_PLL50|altpll_component|auto_generated|locked\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_PLL50|altpll_component|auto_generated|locked~combout\ = (\u_PLL50|altpll_component|auto_generated|wire_pll1_locked\ & \u_PLL50|altpll_component|auto_generated|pll_lock_sync~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_PLL50|altpll_component|auto_generated|wire_pll1_locked\,
	datad => \u_PLL50|altpll_component|auto_generated|pll_lock_sync~q\,
	combout => \u_PLL50|altpll_component|auto_generated|locked~combout\);

-- Location: FF_X75_Y27_N7
\rPLLLockUser[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_PLL50|altpll_component|auto_generated|locked~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rPLLLockUser(0));

-- Location: LCCOMB_X75_Y27_N12
\rPLLLockUser[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rPLLLockUser[1]~feeder_combout\ = rPLLLockUser(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => rPLLLockUser(0),
	combout => \rPLLLockUser[1]~feeder_combout\);

-- Location: FF_X75_Y27_N13
\rPLLLockUser[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rPLLLockUser[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rPLLLockUser(1));

-- Location: LCCOMB_X75_Y27_N16
\rSysRstB~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rSysRstB~0_combout\ = (\rRstBUser~q\ & rPLLLockUser(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rRstBUser~q\,
	datad => rPLLLockUser(1),
	combout => \rSysRstB~0_combout\);

-- Location: FF_X75_Y27_N17
rSysRstB : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rSysRstB~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rSysRstB~q\);

-- Location: IOIBUF_X78_Y29_N8
\Button~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Button,
	o => \Button~input_o\);

-- Location: LCCOMB_X71_Y30_N10
\Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = rButtonCnt(0) $ (VCC)
-- \Add1~1\ = CARRY(rButtonCnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X71_Y30_N8
\rButtonCnt~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~23_combout\ = (\Add1~0_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~23_combout\);

-- Location: LCCOMB_X72_Y29_N4
\rButtonCnt[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt[3]~2_combout\ = ((\Button~input_o\) # (!\rSysRstB~q\)) # (!rButtonCnt(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(22),
	datac => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt[3]~2_combout\);

-- Location: FF_X71_Y30_N9
\rButtonCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~23_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(0));

-- Location: LCCOMB_X71_Y30_N12
\Add1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (rButtonCnt(1) & (!\Add1~1\)) # (!rButtonCnt(1) & ((\Add1~1\) # (GND)))
-- \Add1~3\ = CARRY((!\Add1~1\) # (!rButtonCnt(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X71_Y30_N6
\rButtonCnt~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~22_combout\ = (\Add1~2_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~22_combout\);

-- Location: FF_X71_Y30_N7
\rButtonCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~22_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(1));

-- Location: LCCOMB_X71_Y30_N14
\Add1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (rButtonCnt(2) & (\Add1~3\ $ (GND))) # (!rButtonCnt(2) & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((rButtonCnt(2) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(2),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X71_Y30_N4
\rButtonCnt~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~21_combout\ = (\rSysRstB~q\ & (\Add1~4_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rSysRstB~q\,
	datac => \Add1~4_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~21_combout\);

-- Location: FF_X71_Y30_N5
\rButtonCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~21_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(2));

-- Location: LCCOMB_X71_Y30_N16
\Add1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (rButtonCnt(3) & (!\Add1~5\)) # (!rButtonCnt(3) & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!rButtonCnt(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X72_Y30_N6
\rButtonCnt~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~20_combout\ = (\rSysRstB~q\ & (\Add1~6_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rSysRstB~q\,
	datac => \Add1~6_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~20_combout\);

-- Location: FF_X72_Y30_N7
\rButtonCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~20_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(3));

-- Location: LCCOMB_X71_Y30_N18
\Add1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (rButtonCnt(4) & (\Add1~7\ $ (GND))) # (!rButtonCnt(4) & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((rButtonCnt(4) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X72_Y29_N18
\rButtonCnt~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~19_combout\ = (\rSysRstB~q\ & (\Add1~8_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rSysRstB~q\,
	datac => \Add1~8_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~19_combout\);

-- Location: FF_X72_Y29_N19
\rButtonCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~19_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(4));

-- Location: LCCOMB_X71_Y30_N20
\Add1~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (rButtonCnt(5) & (!\Add1~9\)) # (!rButtonCnt(5) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!rButtonCnt(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X71_Y30_N2
\rButtonCnt~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~18_combout\ = (!\Button~input_o\ & (\Add1~10_combout\ & \rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Button~input_o\,
	datab => \Add1~10_combout\,
	datad => \rSysRstB~q\,
	combout => \rButtonCnt~18_combout\);

-- Location: FF_X71_Y30_N3
\rButtonCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~18_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(5));

-- Location: LCCOMB_X71_Y30_N22
\Add1~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (rButtonCnt(6) & (\Add1~11\ $ (GND))) # (!rButtonCnt(6) & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((rButtonCnt(6) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(6),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X72_Y30_N20
\rButtonCnt~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~17_combout\ = (\Add1~12_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~12_combout\,
	datac => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~17_combout\);

-- Location: FF_X72_Y30_N21
\rButtonCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~17_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(6));

-- Location: LCCOMB_X71_Y30_N24
\Add1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (rButtonCnt(7) & (!\Add1~13\)) # (!rButtonCnt(7) & ((\Add1~13\) # (GND)))
-- \Add1~15\ = CARRY((!\Add1~13\) # (!rButtonCnt(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(7),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X72_Y30_N2
\rButtonCnt~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~16_combout\ = (\Add1~14_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~14_combout\,
	datac => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~16_combout\);

-- Location: FF_X72_Y30_N3
\rButtonCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~16_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(7));

-- Location: LCCOMB_X71_Y30_N26
\Add1~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (rButtonCnt(8) & (\Add1~15\ $ (GND))) # (!rButtonCnt(8) & (!\Add1~15\ & VCC))
-- \Add1~17\ = CARRY((rButtonCnt(8) & !\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(8),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X71_Y30_N0
\rButtonCnt~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~15_combout\ = (\rSysRstB~q\ & (\Add1~16_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rSysRstB~q\,
	datac => \Add1~16_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~15_combout\);

-- Location: FF_X71_Y30_N1
\rButtonCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~15_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(8));

-- Location: LCCOMB_X71_Y30_N28
\Add1~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (rButtonCnt(9) & (!\Add1~17\)) # (!rButtonCnt(9) & ((\Add1~17\) # (GND)))
-- \Add1~19\ = CARRY((!\Add1~17\) # (!rButtonCnt(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(9),
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: LCCOMB_X72_Y30_N0
\rButtonCnt~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~14_combout\ = (\Add1~18_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~18_combout\,
	datac => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~14_combout\);

-- Location: FF_X72_Y30_N1
\rButtonCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~14_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(9));

-- Location: LCCOMB_X71_Y30_N30
\Add1~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (rButtonCnt(10) & (\Add1~19\ $ (GND))) # (!rButtonCnt(10) & (!\Add1~19\ & VCC))
-- \Add1~21\ = CARRY((rButtonCnt(10) & !\Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(10),
	datad => VCC,
	cin => \Add1~19\,
	combout => \Add1~20_combout\,
	cout => \Add1~21\);

-- Location: LCCOMB_X71_Y29_N30
\rButtonCnt~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~13_combout\ = (\rSysRstB~q\ & (\Add1~20_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rSysRstB~q\,
	datac => \Add1~20_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~13_combout\);

-- Location: FF_X71_Y29_N31
\rButtonCnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~13_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(10));

-- Location: LCCOMB_X71_Y29_N0
\Add1~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~22_combout\ = (rButtonCnt(11) & (!\Add1~21\)) # (!rButtonCnt(11) & ((\Add1~21\) # (GND)))
-- \Add1~23\ = CARRY((!\Add1~21\) # (!rButtonCnt(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(11),
	datad => VCC,
	cin => \Add1~21\,
	combout => \Add1~22_combout\,
	cout => \Add1~23\);

-- Location: LCCOMB_X72_Y29_N8
\rButtonCnt~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~12_combout\ = (\rSysRstB~q\ & (\Add1~22_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rSysRstB~q\,
	datac => \Add1~22_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~12_combout\);

-- Location: FF_X72_Y29_N9
\rButtonCnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~12_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(11));

-- Location: LCCOMB_X71_Y29_N2
\Add1~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~24_combout\ = (rButtonCnt(12) & (\Add1~23\ $ (GND))) # (!rButtonCnt(12) & (!\Add1~23\ & VCC))
-- \Add1~25\ = CARRY((rButtonCnt(12) & !\Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(12),
	datad => VCC,
	cin => \Add1~23\,
	combout => \Add1~24_combout\,
	cout => \Add1~25\);

-- Location: LCCOMB_X71_Y29_N28
\rButtonCnt~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~11_combout\ = (!\Button~input_o\ & (\Add1~24_combout\ & \rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Button~input_o\,
	datab => \Add1~24_combout\,
	datad => \rSysRstB~q\,
	combout => \rButtonCnt~11_combout\);

-- Location: FF_X71_Y29_N29
\rButtonCnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~11_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(12));

-- Location: LCCOMB_X71_Y29_N4
\Add1~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~26_combout\ = (rButtonCnt(13) & (!\Add1~25\)) # (!rButtonCnt(13) & ((\Add1~25\) # (GND)))
-- \Add1~27\ = CARRY((!\Add1~25\) # (!rButtonCnt(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(13),
	datad => VCC,
	cin => \Add1~25\,
	combout => \Add1~26_combout\,
	cout => \Add1~27\);

-- Location: LCCOMB_X72_Y29_N22
\rButtonCnt~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~10_combout\ = (\rSysRstB~q\ & (\Add1~26_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rSysRstB~q\,
	datac => \Add1~26_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~10_combout\);

-- Location: FF_X72_Y29_N23
\rButtonCnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~10_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(13));

-- Location: LCCOMB_X71_Y29_N6
\Add1~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~28_combout\ = (rButtonCnt(14) & (\Add1~27\ $ (GND))) # (!rButtonCnt(14) & (!\Add1~27\ & VCC))
-- \Add1~29\ = CARRY((rButtonCnt(14) & !\Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(14),
	datad => VCC,
	cin => \Add1~27\,
	combout => \Add1~28_combout\,
	cout => \Add1~29\);

-- Location: LCCOMB_X72_Y29_N12
\rButtonCnt~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~9_combout\ = (\rSysRstB~q\ & (\Add1~28_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rSysRstB~q\,
	datac => \Add1~28_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~9_combout\);

-- Location: FF_X72_Y29_N13
\rButtonCnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~9_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(14));

-- Location: LCCOMB_X71_Y29_N8
\Add1~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~30_combout\ = (rButtonCnt(15) & (!\Add1~29\)) # (!rButtonCnt(15) & ((\Add1~29\) # (GND)))
-- \Add1~31\ = CARRY((!\Add1~29\) # (!rButtonCnt(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(15),
	datad => VCC,
	cin => \Add1~29\,
	combout => \Add1~30_combout\,
	cout => \Add1~31\);

-- Location: LCCOMB_X72_Y29_N2
\rButtonCnt~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~8_combout\ = (\Add1~30_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~30_combout\,
	datac => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~8_combout\);

-- Location: FF_X72_Y29_N3
\rButtonCnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~8_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(15));

-- Location: LCCOMB_X71_Y29_N10
\Add1~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~32_combout\ = (rButtonCnt(16) & (\Add1~31\ $ (GND))) # (!rButtonCnt(16) & (!\Add1~31\ & VCC))
-- \Add1~33\ = CARRY((rButtonCnt(16) & !\Add1~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(16),
	datad => VCC,
	cin => \Add1~31\,
	combout => \Add1~32_combout\,
	cout => \Add1~33\);

-- Location: LCCOMB_X72_Y29_N0
\rButtonCnt~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~7_combout\ = (\Add1~32_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~32_combout\,
	datac => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~7_combout\);

-- Location: FF_X72_Y29_N1
\rButtonCnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~7_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(16));

-- Location: LCCOMB_X71_Y29_N12
\Add1~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~34_combout\ = (rButtonCnt(17) & (!\Add1~33\)) # (!rButtonCnt(17) & ((\Add1~33\) # (GND)))
-- \Add1~35\ = CARRY((!\Add1~33\) # (!rButtonCnt(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(17),
	datad => VCC,
	cin => \Add1~33\,
	combout => \Add1~34_combout\,
	cout => \Add1~35\);

-- Location: LCCOMB_X72_Y29_N6
\rButtonCnt~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~6_combout\ = (\Add1~34_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~34_combout\,
	datac => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~6_combout\);

-- Location: FF_X72_Y29_N7
\rButtonCnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~6_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(17));

-- Location: LCCOMB_X71_Y29_N14
\Add1~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~36_combout\ = (rButtonCnt(18) & (\Add1~35\ $ (GND))) # (!rButtonCnt(18) & (!\Add1~35\ & VCC))
-- \Add1~37\ = CARRY((rButtonCnt(18) & !\Add1~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(18),
	datad => VCC,
	cin => \Add1~35\,
	combout => \Add1~36_combout\,
	cout => \Add1~37\);

-- Location: LCCOMB_X72_Y29_N20
\rButtonCnt~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~5_combout\ = (\Add1~36_combout\ & (\rSysRstB~q\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~36_combout\,
	datac => \rSysRstB~q\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~5_combout\);

-- Location: FF_X72_Y29_N21
\rButtonCnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~5_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(18));

-- Location: LCCOMB_X71_Y29_N16
\Add1~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~38_combout\ = (rButtonCnt(19) & (!\Add1~37\)) # (!rButtonCnt(19) & ((\Add1~37\) # (GND)))
-- \Add1~39\ = CARRY((!\Add1~37\) # (!rButtonCnt(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(19),
	datad => VCC,
	cin => \Add1~37\,
	combout => \Add1~38_combout\,
	cout => \Add1~39\);

-- Location: LCCOMB_X72_Y29_N10
\rButtonCnt~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~4_combout\ = (\rSysRstB~q\ & (\Add1~38_combout\ & !\Button~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rSysRstB~q\,
	datac => \Add1~38_combout\,
	datad => \Button~input_o\,
	combout => \rButtonCnt~4_combout\);

-- Location: FF_X72_Y29_N11
\rButtonCnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~4_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(19));

-- Location: LCCOMB_X71_Y29_N18
\Add1~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~40_combout\ = (rButtonCnt(20) & (\Add1~39\ $ (GND))) # (!rButtonCnt(20) & (!\Add1~39\ & VCC))
-- \Add1~41\ = CARRY((rButtonCnt(20) & !\Add1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(20),
	datad => VCC,
	cin => \Add1~39\,
	combout => \Add1~40_combout\,
	cout => \Add1~41\);

-- Location: LCCOMB_X71_Y29_N26
\rButtonCnt~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~3_combout\ = (!\Button~input_o\ & (\Add1~40_combout\ & \rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Button~input_o\,
	datab => \Add1~40_combout\,
	datad => \rSysRstB~q\,
	combout => \rButtonCnt~3_combout\);

-- Location: FF_X71_Y29_N27
\rButtonCnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~3_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(20));

-- Location: LCCOMB_X71_Y29_N20
\Add1~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~42_combout\ = (rButtonCnt(21) & (!\Add1~41\)) # (!rButtonCnt(21) & ((\Add1~41\) # (GND)))
-- \Add1~43\ = CARRY((!\Add1~41\) # (!rButtonCnt(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => rButtonCnt(21),
	datad => VCC,
	cin => \Add1~41\,
	combout => \Add1~42_combout\,
	cout => \Add1~43\);

-- Location: LCCOMB_X71_Y29_N24
\rButtonCnt~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~1_combout\ = (!\Button~input_o\ & (\Add1~42_combout\ & \rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Button~input_o\,
	datab => \Add1~42_combout\,
	datad => \rSysRstB~q\,
	combout => \rButtonCnt~1_combout\);

-- Location: FF_X71_Y29_N25
\rButtonCnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~1_combout\,
	ena => \rButtonCnt[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(21));

-- Location: LCCOMB_X71_Y29_N22
\Add1~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~44_combout\ = \Add1~43\ $ (!rButtonCnt(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => rButtonCnt(22),
	cin => \Add1~43\,
	combout => \Add1~44_combout\);

-- Location: LCCOMB_X72_Y29_N24
\rButtonCnt~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rButtonCnt~0_combout\ = (!\Button~input_o\ & ((\Add1~44_combout\) # (rButtonCnt(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~44_combout\,
	datac => rButtonCnt(22),
	datad => \Button~input_o\,
	combout => \rButtonCnt~0_combout\);

-- Location: FF_X72_Y29_N25
\rButtonCnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rButtonCnt~0_combout\,
	sclr => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rButtonCnt(22));

-- Location: IOIBUF_X58_Y0_N29
\RxSerData~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RxSerData,
	o => \RxSerData~input_o\);

-- Location: LCCOMB_X52_Y32_N22
\u_RxSerial|rSerDataIn~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rSerDataIn~feeder_combout\ = \RxSerData~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RxSerData~input_o\,
	combout => \u_RxSerial|rSerDataIn~feeder_combout\);

-- Location: FF_X52_Y32_N23
\u_RxSerial|rSerDataIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rSerDataIn~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rSerDataIn~q\);

-- Location: LCCOMB_X55_Y32_N4
\u_RxSerial|rBaudCnt[0]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[0]~10_combout\ = \u_RxSerial|rBaudCnt\(0) $ (VCC)
-- \u_RxSerial|rBaudCnt[0]~11\ = CARRY(\u_RxSerial|rBaudCnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rBaudCnt\(0),
	datad => VCC,
	combout => \u_RxSerial|rBaudCnt[0]~10_combout\,
	cout => \u_RxSerial|rBaudCnt[0]~11\);

-- Location: LCCOMB_X55_Y32_N12
\u_RxSerial|rBaudCnt[4]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[4]~20_combout\ = (\u_RxSerial|rBaudCnt\(4) & ((GND) # (!\u_RxSerial|rBaudCnt[3]~19\))) # (!\u_RxSerial|rBaudCnt\(4) & (\u_RxSerial|rBaudCnt[3]~19\ $ (GND)))
-- \u_RxSerial|rBaudCnt[4]~21\ = CARRY((\u_RxSerial|rBaudCnt\(4)) # (!\u_RxSerial|rBaudCnt[3]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt\(4),
	datad => VCC,
	cin => \u_RxSerial|rBaudCnt[3]~19\,
	combout => \u_RxSerial|rBaudCnt[4]~20_combout\,
	cout => \u_RxSerial|rBaudCnt[4]~21\);

-- Location: LCCOMB_X55_Y32_N14
\u_RxSerial|rBaudCnt[5]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[5]~22_combout\ = (\u_RxSerial|rBaudCnt\(5) & (\u_RxSerial|rBaudCnt[4]~21\ & VCC)) # (!\u_RxSerial|rBaudCnt\(5) & (!\u_RxSerial|rBaudCnt[4]~21\))
-- \u_RxSerial|rBaudCnt[5]~23\ = CARRY((!\u_RxSerial|rBaudCnt\(5) & !\u_RxSerial|rBaudCnt[4]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rBaudCnt\(5),
	datad => VCC,
	cin => \u_RxSerial|rBaudCnt[4]~21\,
	combout => \u_RxSerial|rBaudCnt[5]~22_combout\,
	cout => \u_RxSerial|rBaudCnt[5]~23\);

-- Location: FF_X55_Y32_N15
\u_RxSerial|rBaudCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[5]~22_combout\,
	asdata => VCC,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(5));

-- Location: LCCOMB_X55_Y32_N16
\u_RxSerial|rBaudCnt[6]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[6]~24_combout\ = (\u_RxSerial|rBaudCnt\(6) & ((GND) # (!\u_RxSerial|rBaudCnt[5]~23\))) # (!\u_RxSerial|rBaudCnt\(6) & (\u_RxSerial|rBaudCnt[5]~23\ $ (GND)))
-- \u_RxSerial|rBaudCnt[6]~25\ = CARRY((\u_RxSerial|rBaudCnt\(6)) # (!\u_RxSerial|rBaudCnt[5]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rBaudCnt\(6),
	datad => VCC,
	cin => \u_RxSerial|rBaudCnt[5]~23\,
	combout => \u_RxSerial|rBaudCnt[6]~24_combout\,
	cout => \u_RxSerial|rBaudCnt[6]~25\);

-- Location: FF_X55_Y32_N17
\u_RxSerial|rBaudCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[6]~24_combout\,
	asdata => VCC,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(6));

-- Location: LCCOMB_X55_Y32_N18
\u_RxSerial|rBaudCnt[7]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[7]~26_combout\ = (\u_RxSerial|rBaudCnt\(7) & (\u_RxSerial|rBaudCnt[6]~25\ & VCC)) # (!\u_RxSerial|rBaudCnt\(7) & (!\u_RxSerial|rBaudCnt[6]~25\))
-- \u_RxSerial|rBaudCnt[7]~27\ = CARRY((!\u_RxSerial|rBaudCnt\(7) & !\u_RxSerial|rBaudCnt[6]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rBaudCnt\(7),
	datad => VCC,
	cin => \u_RxSerial|rBaudCnt[6]~25\,
	combout => \u_RxSerial|rBaudCnt[7]~26_combout\,
	cout => \u_RxSerial|rBaudCnt[7]~27\);

-- Location: FF_X55_Y32_N19
\u_RxSerial|rBaudCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[7]~26_combout\,
	asdata => \~GND~combout\,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(7));

-- Location: LCCOMB_X55_Y32_N20
\u_RxSerial|rBaudCnt[8]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[8]~28_combout\ = (\u_RxSerial|rBaudCnt\(8) & ((GND) # (!\u_RxSerial|rBaudCnt[7]~27\))) # (!\u_RxSerial|rBaudCnt\(8) & (\u_RxSerial|rBaudCnt[7]~27\ $ (GND)))
-- \u_RxSerial|rBaudCnt[8]~29\ = CARRY((\u_RxSerial|rBaudCnt\(8)) # (!\u_RxSerial|rBaudCnt[7]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rBaudCnt\(8),
	datad => VCC,
	cin => \u_RxSerial|rBaudCnt[7]~27\,
	combout => \u_RxSerial|rBaudCnt[8]~28_combout\,
	cout => \u_RxSerial|rBaudCnt[8]~29\);

-- Location: FF_X55_Y32_N21
\u_RxSerial|rBaudCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[8]~28_combout\,
	asdata => VCC,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(8));

-- Location: LCCOMB_X55_Y32_N22
\u_RxSerial|rBaudCnt[9]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[9]~30_combout\ = \u_RxSerial|rBaudCnt\(9) $ (!\u_RxSerial|rBaudCnt[8]~29\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt\(9),
	cin => \u_RxSerial|rBaudCnt[8]~29\,
	combout => \u_RxSerial|rBaudCnt[9]~30_combout\);

-- Location: FF_X55_Y32_N23
\u_RxSerial|rBaudCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[9]~30_combout\,
	asdata => VCC,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(9));

-- Location: LCCOMB_X55_Y32_N24
\u_RxSerial|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Equal0~0_combout\ = (!\u_RxSerial|rBaudCnt\(3) & (!\u_RxSerial|rBaudCnt\(2) & (!\u_RxSerial|rBaudCnt\(9) & !\u_RxSerial|rBaudCnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt\(3),
	datab => \u_RxSerial|rBaudCnt\(2),
	datac => \u_RxSerial|rBaudCnt\(9),
	datad => \u_RxSerial|rBaudCnt\(6),
	combout => \u_RxSerial|Equal0~0_combout\);

-- Location: LCCOMB_X55_Y32_N26
\u_RxSerial|Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Equal1~0_combout\ = (\u_RxSerial|rBaudCnt\(4) & (\u_RxSerial|rBaudCnt\(5) & (!\u_RxSerial|rBaudCnt\(0) & \u_RxSerial|rBaudCnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt\(4),
	datab => \u_RxSerial|rBaudCnt\(5),
	datac => \u_RxSerial|rBaudCnt\(0),
	datad => \u_RxSerial|rBaudCnt\(1),
	combout => \u_RxSerial|Equal1~0_combout\);

-- Location: LCCOMB_X55_Y32_N28
\u_RxSerial|Equal1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Equal1~1_combout\ = (\u_RxSerial|rBaudCnt\(8) & (\u_RxSerial|Equal0~0_combout\ & (\u_RxSerial|Equal1~0_combout\ & \u_RxSerial|rBaudCnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt\(8),
	datab => \u_RxSerial|Equal0~0_combout\,
	datac => \u_RxSerial|Equal1~0_combout\,
	datad => \u_RxSerial|rBaudCnt\(7),
	combout => \u_RxSerial|Equal1~1_combout\);

-- Location: LCCOMB_X57_Y33_N22
\u_RxSerial|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Selector1~0_combout\ = (\u_RxSerial|rSerDataIn~q\ & (!\u_RxSerial|Equal1~1_combout\ & (\u_RxSerial|rState.stStart~q\))) # (!\u_RxSerial|rSerDataIn~q\ & (((!\u_RxSerial|Equal1~1_combout\ & \u_RxSerial|rState.stStart~q\)) # 
-- (!\u_RxSerial|rState.stIdle~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rSerDataIn~q\,
	datab => \u_RxSerial|Equal1~1_combout\,
	datac => \u_RxSerial|rState.stStart~q\,
	datad => \u_RxSerial|rState.stIdle~q\,
	combout => \u_RxSerial|Selector1~0_combout\);

-- Location: FF_X57_Y33_N23
\u_RxSerial|rState.stStart\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|Selector1~0_combout\,
	sclr => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rState.stStart~q\);

-- Location: LCCOMB_X57_Y33_N6
\u_RxSerial|rDataCnt~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rDataCnt~4_combout\ = (\rSysRstB~q\ & (!\u_RxSerial|rDataCnt\(0) & \u_RxSerial|rBaudEnd~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rSysRstB~q\,
	datac => \u_RxSerial|rDataCnt\(0),
	datad => \u_RxSerial|rBaudEnd~q\,
	combout => \u_RxSerial|rDataCnt~4_combout\);

-- Location: LCCOMB_X57_Y33_N30
\u_RxSerial|rDataCnt[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rDataCnt[1]~3_combout\ = (\u_RxSerial|rState.stStart~q\) # ((\u_RxSerial|rBaudEnd~q\) # (!\rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rState.stStart~q\,
	datac => \rSysRstB~q\,
	datad => \u_RxSerial|rBaudEnd~q\,
	combout => \u_RxSerial|rDataCnt[1]~3_combout\);

-- Location: FF_X57_Y33_N7
\u_RxSerial|rDataCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rDataCnt~4_combout\,
	ena => \u_RxSerial|rDataCnt[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rDataCnt\(0));

-- Location: LCCOMB_X57_Y33_N0
\u_RxSerial|rDataCnt~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rDataCnt~5_combout\ = (\rSysRstB~q\ & (\u_RxSerial|rBaudEnd~q\ & (\u_RxSerial|rDataCnt\(1) $ (\u_RxSerial|rDataCnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rSysRstB~q\,
	datab => \u_RxSerial|rBaudEnd~q\,
	datac => \u_RxSerial|rDataCnt\(1),
	datad => \u_RxSerial|rDataCnt\(0),
	combout => \u_RxSerial|rDataCnt~5_combout\);

-- Location: FF_X57_Y33_N1
\u_RxSerial|rDataCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rDataCnt~5_combout\,
	ena => \u_RxSerial|rDataCnt[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rDataCnt\(1));

-- Location: LCCOMB_X57_Y33_N20
\u_RxSerial|rState~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rState~9_combout\ = (\rSysRstB~q\ & \u_RxSerial|rBaudEnd~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rSysRstB~q\,
	datad => \u_RxSerial|rBaudEnd~q\,
	combout => \u_RxSerial|rState~9_combout\);

-- Location: LCCOMB_X57_Y33_N28
\u_RxSerial|rDataCnt~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rDataCnt~2_combout\ = (\u_RxSerial|rState~9_combout\ & (\u_RxSerial|rDataCnt\(2) $ (((\u_RxSerial|rDataCnt\(0) & \u_RxSerial|rDataCnt\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rDataCnt\(0),
	datab => \u_RxSerial|rDataCnt\(1),
	datac => \u_RxSerial|rDataCnt\(2),
	datad => \u_RxSerial|rState~9_combout\,
	combout => \u_RxSerial|rDataCnt~2_combout\);

-- Location: FF_X57_Y33_N29
\u_RxSerial|rDataCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rDataCnt~2_combout\,
	ena => \u_RxSerial|rDataCnt[1]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rDataCnt\(2));

-- Location: LCCOMB_X57_Y33_N26
\u_RxSerial|Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Selector3~0_combout\ = (\u_RxSerial|rDataCnt\(0) & (\u_RxSerial|rDataCnt\(2) & (\u_RxSerial|rDataCnt\(1) & \u_RxSerial|rBaudEnd~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rDataCnt\(0),
	datab => \u_RxSerial|rDataCnt\(2),
	datac => \u_RxSerial|rDataCnt\(1),
	datad => \u_RxSerial|rBaudEnd~q\,
	combout => \u_RxSerial|Selector3~0_combout\);

-- Location: LCCOMB_X57_Y33_N12
\u_RxSerial|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Selector2~0_combout\ = (\u_RxSerial|rState.stStart~q\ & ((\u_RxSerial|Equal1~1_combout\) # ((\u_RxSerial|rState.stData~q\ & !\u_RxSerial|Selector3~0_combout\)))) # (!\u_RxSerial|rState.stStart~q\ & (((\u_RxSerial|rState.stData~q\ & 
-- !\u_RxSerial|Selector3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rState.stStart~q\,
	datab => \u_RxSerial|Equal1~1_combout\,
	datac => \u_RxSerial|rState.stData~q\,
	datad => \u_RxSerial|Selector3~0_combout\,
	combout => \u_RxSerial|Selector2~0_combout\);

-- Location: FF_X57_Y33_N13
\u_RxSerial|rState.stData\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|Selector2~0_combout\,
	sclr => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rState.stData~q\);

-- Location: LCCOMB_X57_Y33_N18
\u_RxSerial|Selector3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Selector3~1_combout\ = (\u_RxSerial|rState.stData~q\ & ((\u_RxSerial|Selector3~0_combout\) # ((\u_RxSerial|rState.stStop~q\ & !\u_RxSerial|rBaudEnd~q\)))) # (!\u_RxSerial|rState.stData~q\ & (((\u_RxSerial|rState.stStop~q\ & 
-- !\u_RxSerial|rBaudEnd~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rState.stData~q\,
	datab => \u_RxSerial|Selector3~0_combout\,
	datac => \u_RxSerial|rState.stStop~q\,
	datad => \u_RxSerial|rBaudEnd~q\,
	combout => \u_RxSerial|Selector3~1_combout\);

-- Location: FF_X57_Y33_N19
\u_RxSerial|rState.stStop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|Selector3~1_combout\,
	sclr => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rState.stStop~q\);

-- Location: LCCOMB_X57_Y33_N14
\u_RxSerial|rState~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rState~10_combout\ = ((!\u_RxSerial|rSerDataIn~q\ & (\u_RxSerial|rBaudEnd~q\ & \u_RxSerial|rState.stStop~q\))) # (!\rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rSerDataIn~q\,
	datab => \u_RxSerial|rBaudEnd~q\,
	datac => \rSysRstB~q\,
	datad => \u_RxSerial|rState.stStop~q\,
	combout => \u_RxSerial|rState~10_combout\);

-- Location: LCCOMB_X57_Y33_N24
\u_RxSerial|rState~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rState~11_combout\ = (!\u_RxSerial|rState~10_combout\ & (!\u_RxSerial|rState.stLoad~q\ & ((\u_RxSerial|rState.stIdle~q\) # (!\u_RxSerial|rSerDataIn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rSerDataIn~q\,
	datab => \u_RxSerial|rState~10_combout\,
	datac => \u_RxSerial|rState.stIdle~q\,
	datad => \u_RxSerial|rState.stLoad~q\,
	combout => \u_RxSerial|rState~11_combout\);

-- Location: FF_X57_Y33_N25
\u_RxSerial|rState.stIdle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rState~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rState.stIdle~q\);

-- Location: LCCOMB_X57_Y33_N10
\u_RxSerial|rBaudCnt[0]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[0]~16_combout\ = (\rSysRstB~q\ & \u_RxSerial|rState.stIdle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rSysRstB~q\,
	datad => \u_RxSerial|rState.stIdle~q\,
	combout => \u_RxSerial|rBaudCnt[0]~16_combout\);

-- Location: LCCOMB_X57_Y33_N4
\u_RxSerial|rBaudCnt[0]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[0]~17_combout\ = ((\u_RxSerial|Equal0~2_combout\) # ((\u_RxSerial|Equal1~1_combout\ & \u_RxSerial|rState.stStart~q\))) # (!\u_RxSerial|rBaudCnt[0]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt[0]~16_combout\,
	datab => \u_RxSerial|Equal1~1_combout\,
	datac => \u_RxSerial|rState.stStart~q\,
	datad => \u_RxSerial|Equal0~2_combout\,
	combout => \u_RxSerial|rBaudCnt[0]~17_combout\);

-- Location: FF_X55_Y32_N5
\u_RxSerial|rBaudCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[0]~10_combout\,
	asdata => \~GND~combout\,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(0));

-- Location: LCCOMB_X55_Y32_N6
\u_RxSerial|rBaudCnt[1]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[1]~12_combout\ = (\u_RxSerial|rBaudCnt\(1) & (\u_RxSerial|rBaudCnt[0]~11\ & VCC)) # (!\u_RxSerial|rBaudCnt\(1) & (!\u_RxSerial|rBaudCnt[0]~11\))
-- \u_RxSerial|rBaudCnt[1]~13\ = CARRY((!\u_RxSerial|rBaudCnt\(1) & !\u_RxSerial|rBaudCnt[0]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt\(1),
	datad => VCC,
	cin => \u_RxSerial|rBaudCnt[0]~11\,
	combout => \u_RxSerial|rBaudCnt[1]~12_combout\,
	cout => \u_RxSerial|rBaudCnt[1]~13\);

-- Location: FF_X55_Y32_N7
\u_RxSerial|rBaudCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[1]~12_combout\,
	asdata => \~GND~combout\,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(1));

-- Location: LCCOMB_X55_Y32_N8
\u_RxSerial|rBaudCnt[2]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[2]~14_combout\ = (\u_RxSerial|rBaudCnt\(2) & ((GND) # (!\u_RxSerial|rBaudCnt[1]~13\))) # (!\u_RxSerial|rBaudCnt\(2) & (\u_RxSerial|rBaudCnt[1]~13\ $ (GND)))
-- \u_RxSerial|rBaudCnt[2]~15\ = CARRY((\u_RxSerial|rBaudCnt\(2)) # (!\u_RxSerial|rBaudCnt[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rBaudCnt\(2),
	datad => VCC,
	cin => \u_RxSerial|rBaudCnt[1]~13\,
	combout => \u_RxSerial|rBaudCnt[2]~14_combout\,
	cout => \u_RxSerial|rBaudCnt[2]~15\);

-- Location: FF_X55_Y32_N9
\u_RxSerial|rBaudCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[2]~14_combout\,
	asdata => VCC,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(2));

-- Location: LCCOMB_X55_Y32_N10
\u_RxSerial|rBaudCnt[3]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudCnt[3]~18_combout\ = (\u_RxSerial|rBaudCnt\(3) & (\u_RxSerial|rBaudCnt[2]~15\ & VCC)) # (!\u_RxSerial|rBaudCnt\(3) & (!\u_RxSerial|rBaudCnt[2]~15\))
-- \u_RxSerial|rBaudCnt[3]~19\ = CARRY((!\u_RxSerial|rBaudCnt\(3) & !\u_RxSerial|rBaudCnt[2]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt\(3),
	datad => VCC,
	cin => \u_RxSerial|rBaudCnt[2]~15\,
	combout => \u_RxSerial|rBaudCnt[3]~18_combout\,
	cout => \u_RxSerial|rBaudCnt[3]~19\);

-- Location: FF_X55_Y32_N11
\u_RxSerial|rBaudCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[3]~18_combout\,
	asdata => \~GND~combout\,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(3));

-- Location: FF_X55_Y32_N13
\u_RxSerial|rBaudCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudCnt[4]~20_combout\,
	asdata => \~GND~combout\,
	sload => \u_RxSerial|rBaudCnt[0]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudCnt\(4));

-- Location: LCCOMB_X55_Y32_N2
\u_RxSerial|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Equal0~1_combout\ = (!\u_RxSerial|rBaudCnt\(4) & (!\u_RxSerial|rBaudCnt\(5) & (\u_RxSerial|rBaudCnt\(0) & !\u_RxSerial|rBaudCnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rBaudCnt\(4),
	datab => \u_RxSerial|rBaudCnt\(5),
	datac => \u_RxSerial|rBaudCnt\(0),
	datad => \u_RxSerial|rBaudCnt\(1),
	combout => \u_RxSerial|Equal0~1_combout\);

-- Location: LCCOMB_X55_Y32_N0
\u_RxSerial|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|Equal0~2_combout\ = (\u_RxSerial|Equal0~1_combout\ & (\u_RxSerial|Equal0~0_combout\ & (!\u_RxSerial|rBaudCnt\(8) & !\u_RxSerial|rBaudCnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|Equal0~1_combout\,
	datab => \u_RxSerial|Equal0~0_combout\,
	datac => \u_RxSerial|rBaudCnt\(8),
	datad => \u_RxSerial|rBaudCnt\(7),
	combout => \u_RxSerial|Equal0~2_combout\);

-- Location: LCCOMB_X57_Y33_N2
\u_RxSerial|rBaudEnd~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rBaudEnd~0_combout\ = (\u_RxSerial|Equal0~2_combout\ & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|Equal0~2_combout\,
	datac => \rSysRstB~q\,
	combout => \u_RxSerial|rBaudEnd~0_combout\);

-- Location: FF_X57_Y33_N3
\u_RxSerial|rBaudEnd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rBaudEnd~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rBaudEnd~q\);

-- Location: LCCOMB_X57_Y33_N16
\u_RxSerial|rState~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rState~8_combout\ = (\u_RxSerial|rSerDataIn~q\ & (\u_RxSerial|rBaudEnd~q\ & (\rSysRstB~q\ & \u_RxSerial|rState.stStop~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rSerDataIn~q\,
	datab => \u_RxSerial|rBaudEnd~q\,
	datac => \rSysRstB~q\,
	datad => \u_RxSerial|rState.stStop~q\,
	combout => \u_RxSerial|rState~8_combout\);

-- Location: FF_X57_Y33_N17
\u_RxSerial|rState.stLoad\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rState~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rState.stLoad~q\);

-- Location: LCCOMB_X63_Y33_N2
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\ = \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0) $ (((VCC) # (!\u_RxSerial|rRxFfWrEn~q\)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ = CARRY(\u_RxSerial|rRxFfWrEn~q\ $ (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110011001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrEn~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0),
	datad => VCC,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\);

-- Location: LCCOMB_X62_Y33_N4
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\ = \u_RxSerial|rRxFfWrEn~q\ $ (\u_TxSerial|rTxFfRdEn\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rRxFfWrEn~q\,
	datac => \u_TxSerial|rTxFfRdEn\(0),
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\);

-- Location: FF_X63_Y33_N3
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0));

-- Location: LCCOMB_X63_Y33_N4
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1) $ (((\u_RxSerial|rRxFfWrEn~q\) # (VCC))))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ & 
-- (((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1)) # (GND))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ = CARRY((\u_RxSerial|rRxFfWrEn~q\ $ (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1))) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrEn~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\);

-- Location: FF_X63_Y33_N5
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1));

-- Location: LCCOMB_X63_Y33_N6
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) & ((VCC)))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) $ (((VCC) # (!\u_RxSerial|rRxFfWrEn~q\)))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) $ (!\u_RxSerial|rRxFfWrEn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2),
	datab => \u_RxSerial|rRxFfWrEn~q\,
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\);

-- Location: LCCOMB_X63_Y33_N8
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3) $ (((\u_RxSerial|rRxFfWrEn~q\) # (VCC))))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ & 
-- (((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3)) # (GND))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ = CARRY((\u_RxSerial|rRxFfWrEn~q\ $ (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3))) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrEn~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\);

-- Location: FF_X63_Y33_N9
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3));

-- Location: LCCOMB_X63_Y33_N10
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) & ((VCC)))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) $ (((VCC) # (!\u_RxSerial|rRxFfWrEn~q\)))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) $ (!\u_RxSerial|rRxFfWrEn~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4),
	datab => \u_RxSerial|rRxFfWrEn~q\,
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\);

-- Location: FF_X63_Y33_N11
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4));

-- Location: LCCOMB_X63_Y33_N26
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1) & 
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3),
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1),
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4),
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\);

-- Location: LCCOMB_X62_Y33_N6
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\ & (\u_RxSerial|rRxFfWrEn~q\ & 
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\,
	datac => \u_RxSerial|rRxFfWrEn~q\,
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0),
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\);

-- Location: LCCOMB_X63_Y33_N12
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5) $ (((\u_RxSerial|rRxFfWrEn~q\) # (VCC))))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ & 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5)) # ((GND))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5) $ (\u_RxSerial|rRxFfWrEn~q\)) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5),
	datab => \u_RxSerial|rRxFfWrEn~q\,
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\);

-- Location: FF_X63_Y33_N13
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5));

-- Location: LCCOMB_X63_Y33_N14
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & 
-- (((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) & VCC)))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) $ (((VCC) # (!\u_RxSerial|rRxFfWrEn~q\)))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ & (\u_RxSerial|rRxFfWrEn~q\ $ 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrEn~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\);

-- Location: FF_X63_Y33_N15
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6));

-- Location: LCCOMB_X63_Y33_N16
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7) $ (((\u_RxSerial|rRxFfWrEn~q\) # (VCC))))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\ & 
-- (((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7)) # (GND))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ = CARRY((\u_RxSerial|rRxFfWrEn~q\ $ (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7))) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrEn~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\);

-- Location: FF_X63_Y33_N17
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7));

-- Location: LCCOMB_X63_Y33_N18
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & 
-- (((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8) & VCC)))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8) $ (((VCC) # (!\u_RxSerial|rRxFfWrEn~q\)))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\ & (\u_RxSerial|rRxFfWrEn~q\ $ 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrEn~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita7~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\);

-- Location: FF_X63_Y33_N19
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8));

-- Location: LCCOMB_X63_Y33_N0
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5) & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) & 
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7),
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6),
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8),
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\);

-- Location: LCCOMB_X63_Y33_N20
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9) $ (((\u_RxSerial|rRxFfWrEn~q\) # (VCC))))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\ & 
-- (((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9)) # (GND))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ = CARRY((\u_RxSerial|rRxFfWrEn~q\ $ (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9))) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrEn~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita8~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\);

-- Location: FF_X63_Y33_N21
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9));

-- Location: LCCOMB_X63_Y33_N22
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ & 
-- (((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10) & VCC)))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10) $ (((VCC) # (!\u_RxSerial|rRxFfWrEn~q\)))))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\ & (\u_RxSerial|rRxFfWrEn~q\ $ 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrEn~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita9~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\);

-- Location: FF_X63_Y33_N23
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10));

-- Location: LCCOMB_X63_Y33_N24
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11~combout\ = \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11) $ 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11),
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita10~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11~combout\);

-- Location: FF_X63_Y33_N25
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita11~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11));

-- Location: LCCOMB_X62_Y33_N12
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9) & 
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10),
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9),
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11),
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\);

-- Location: LCCOMB_X62_Y33_N24
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\) # ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\ & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~3_combout\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\,
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\,
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4_combout\);

-- Location: FF_X62_Y33_N25
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~4_combout\,
	clrn => \rSysRstB~q\,
	sclr => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\);

-- Location: LCCOMB_X57_Y33_N8
\u_RxSerial|u_rRxFfWrEn~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|u_rRxFfWrEn~1_combout\ = (\u_RxSerial|rState.stLoad~q\ & !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rState.stLoad~q\,
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\,
	combout => \u_RxSerial|u_rRxFfWrEn~1_combout\);

-- Location: FF_X57_Y33_N9
\u_RxSerial|rRxFfWrEn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|u_rRxFfWrEn~1_combout\,
	sclr => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrEn~q\);

-- Location: FF_X63_Y33_N7
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2));

-- Location: LCCOMB_X63_Y33_N30
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2)) # 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3)) # ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1)) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3),
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1),
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0),
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\);

-- Location: LCCOMB_X62_Y33_N0
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8)) # 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10)) # ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9)) # 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(8),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(10),
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(9),
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(11),
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\);

-- Location: LCCOMB_X63_Y33_N28
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5)) # 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7)) # ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6)) # 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(7),
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6),
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4),
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\);

-- Location: LCCOMB_X62_Y33_N10
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\) # 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\) # ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\) # (!\u_TxSerial|rTxFfRdEn\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~2_combout\,
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\,
	datac => \u_TxSerial|rTxFfRdEn\(0),
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\);

-- Location: LCCOMB_X62_Y33_N18
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4_combout\ = (\u_RxSerial|rRxFfWrEn~q\) # ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\) # 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\ & \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~3_combout\,
	datab => \u_RxSerial|rRxFfWrEn~q\,
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	datad => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4_combout\);

-- Location: FF_X62_Y33_N19
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~4_combout\,
	clrn => \rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\);

-- Location: LCCOMB_X64_Y30_N0
\rState~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rState~0_combout\ = (\rState~q\ & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\))) # (!\rState~q\ & (rButtonCnt(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => rButtonCnt(22),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	datac => \rState~q\,
	combout => \rState~0_combout\);

-- Location: FF_X64_Y30_N1
rState : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rState~0_combout\,
	sclr => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rState~q\);

-- Location: LCCOMB_X59_Y30_N18
\rTxFfEmpty~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rTxFfEmpty~0_combout\ = (!\rSysRstB~q\) # (!\rState~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rState~q\,
	datad => \rSysRstB~q\,
	combout => \rTxFfEmpty~0_combout\);

-- Location: FF_X59_Y30_N19
rTxFfEmpty : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \rTxFfEmpty~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rTxFfEmpty~q\);

-- Location: LCCOMB_X59_Y30_N22
\u_TxSerial|rState~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rState~8_combout\ = ((!\u_TxSerial|rState.stIdle~q\ & ((\rTxFfEmpty~q\) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\)))) # (!\rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rState.stIdle~q\,
	datab => \rTxFfEmpty~q\,
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	datad => \rSysRstB~q\,
	combout => \u_TxSerial|rState~8_combout\);

-- Location: LCCOMB_X59_Y30_N20
\u_TxSerial|rDataCnt~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rDataCnt~2_combout\ = (\u_TxSerial|Equal1~0_combout\ & (\u_TxSerial|rBaudEnd~q\ & \rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|Equal1~0_combout\,
	datac => \u_TxSerial|rBaudEnd~q\,
	datad => \rSysRstB~q\,
	combout => \u_TxSerial|rDataCnt~2_combout\);

-- Location: LCCOMB_X59_Y30_N4
\u_TxSerial|rDataCnt~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rDataCnt~4_combout\ = (\u_TxSerial|rBaudEnd~q\ & (!\u_TxSerial|rDataCnt\(0) & \rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudEnd~q\,
	datac => \u_TxSerial|rDataCnt\(0),
	datad => \rSysRstB~q\,
	combout => \u_TxSerial|rDataCnt~4_combout\);

-- Location: LCCOMB_X54_Y30_N2
\u_TxSerial|rSerDataOut[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut[2]~2_combout\ = (\u_TxSerial|rBaudEnd~q\) # ((\u_TxSerial|rTxFfRdEn\(1)) # (!\rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudEnd~q\,
	datab => \rSysRstB~q\,
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rSerDataOut[2]~2_combout\);

-- Location: FF_X59_Y30_N5
\u_TxSerial|rDataCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rDataCnt~4_combout\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rDataCnt\(0));

-- Location: LCCOMB_X59_Y30_N16
\u_TxSerial|rDataCnt~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rDataCnt~3_combout\ = (\u_TxSerial|rDataCnt~2_combout\ & (\u_TxSerial|rDataCnt\(0) $ (\u_TxSerial|rDataCnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rDataCnt\(0),
	datac => \u_TxSerial|rDataCnt\(1),
	datad => \u_TxSerial|rDataCnt~2_combout\,
	combout => \u_TxSerial|rDataCnt~3_combout\);

-- Location: FF_X59_Y30_N17
\u_TxSerial|rDataCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rDataCnt~3_combout\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rDataCnt\(1));

-- Location: LCCOMB_X59_Y30_N26
\u_TxSerial|rDataCnt~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rDataCnt~6_combout\ = (\u_TxSerial|rDataCnt~2_combout\ & (\u_TxSerial|rDataCnt\(2) $ (((\u_TxSerial|rDataCnt\(0) & \u_TxSerial|rDataCnt\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rDataCnt~2_combout\,
	datab => \u_TxSerial|rDataCnt\(0),
	datac => \u_TxSerial|rDataCnt\(2),
	datad => \u_TxSerial|rDataCnt\(1),
	combout => \u_TxSerial|rDataCnt~6_combout\);

-- Location: FF_X59_Y30_N27
\u_TxSerial|rDataCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rDataCnt~6_combout\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rDataCnt\(2));

-- Location: LCCOMB_X59_Y30_N30
\u_TxSerial|Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|Add1~0_combout\ = (\u_TxSerial|rDataCnt\(0) & \u_TxSerial|rDataCnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_TxSerial|rDataCnt\(0),
	datad => \u_TxSerial|rDataCnt\(1),
	combout => \u_TxSerial|Add1~0_combout\);

-- Location: LCCOMB_X59_Y30_N14
\u_TxSerial|rDataCnt~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rDataCnt~5_combout\ = (\u_TxSerial|rDataCnt~2_combout\ & (\u_TxSerial|rDataCnt\(3) $ (((\u_TxSerial|rDataCnt\(2) & \u_TxSerial|Add1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rDataCnt\(2),
	datab => \u_TxSerial|rDataCnt~2_combout\,
	datac => \u_TxSerial|rDataCnt\(3),
	datad => \u_TxSerial|Add1~0_combout\,
	combout => \u_TxSerial|rDataCnt~5_combout\);

-- Location: FF_X59_Y30_N15
\u_TxSerial|rDataCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rDataCnt~5_combout\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rDataCnt\(3));

-- Location: LCCOMB_X59_Y30_N24
\u_TxSerial|Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|Equal1~0_combout\ = (\u_TxSerial|rDataCnt\(2)) # (((\u_TxSerial|rDataCnt\(1)) # (!\u_TxSerial|rDataCnt\(3))) # (!\u_TxSerial|rDataCnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rDataCnt\(2),
	datab => \u_TxSerial|rDataCnt\(0),
	datac => \u_TxSerial|rDataCnt\(3),
	datad => \u_TxSerial|rDataCnt\(1),
	combout => \u_TxSerial|Equal1~0_combout\);

-- Location: LCCOMB_X59_Y30_N2
\u_TxSerial|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|Selector1~0_combout\ = (\u_TxSerial|rState.stRdReq~q\) # ((\u_TxSerial|rState.stWtData~q\ & !\u_TxSerial|rTxFfRdEn\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rState.stRdReq~q\,
	datac => \u_TxSerial|rState.stWtData~q\,
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|Selector1~0_combout\);

-- Location: FF_X59_Y30_N3
\u_TxSerial|rState.stWtData\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|Selector1~0_combout\,
	sclr => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rState.stWtData~q\);

-- Location: LCCOMB_X59_Y30_N10
\u_TxSerial|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|Selector2~0_combout\ = (\u_TxSerial|rState.stWtData~q\ & \u_TxSerial|rTxFfRdEn\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rState.stWtData~q\,
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|Selector2~0_combout\);

-- Location: LCCOMB_X59_Y30_N0
\u_TxSerial|Selector2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|Selector2~1_combout\ = (\u_TxSerial|Selector2~0_combout\) # ((\u_TxSerial|rState.stWtEnd~q\ & ((\u_TxSerial|Equal1~0_combout\) # (!\u_TxSerial|rBaudEnd~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudEnd~q\,
	datab => \u_TxSerial|Equal1~0_combout\,
	datac => \u_TxSerial|rState.stWtEnd~q\,
	datad => \u_TxSerial|Selector2~0_combout\,
	combout => \u_TxSerial|Selector2~1_combout\);

-- Location: FF_X59_Y30_N1
\u_TxSerial|rState.stWtEnd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|Selector2~1_combout\,
	sclr => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rState.stWtEnd~q\);

-- Location: LCCOMB_X59_Y30_N12
\u_TxSerial|rState~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rState~9_combout\ = (!\u_TxSerial|rState~8_combout\ & (((\u_TxSerial|Equal1~0_combout\) # (!\u_TxSerial|rBaudEnd~q\)) # (!\u_TxSerial|rState.stWtEnd~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rState~8_combout\,
	datab => \u_TxSerial|rState.stWtEnd~q\,
	datac => \u_TxSerial|rBaudEnd~q\,
	datad => \u_TxSerial|Equal1~0_combout\,
	combout => \u_TxSerial|rState~9_combout\);

-- Location: FF_X59_Y30_N13
\u_TxSerial|rState.stIdle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rState~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rState.stIdle~q\);

-- Location: LCCOMB_X59_Y30_N8
\u_TxSerial|rState~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rState~7_combout\ = (!\u_TxSerial|rState.stIdle~q\ & (!\rTxFfEmpty~q\ & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & \rSysRstB~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rState.stIdle~q\,
	datab => \rTxFfEmpty~q\,
	datac => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\,
	datad => \rSysRstB~q\,
	combout => \u_TxSerial|rState~7_combout\);

-- Location: FF_X59_Y30_N9
\u_TxSerial|rState.stRdReq\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rState~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rState.stRdReq~q\);

-- Location: LCCOMB_X59_Y30_N6
\u_TxSerial|rTxFfRdEn~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rTxFfRdEn~2_combout\ = (\u_TxSerial|rState.stRdReq~q\ & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_TxSerial|rState.stRdReq~q\,
	datad => \rSysRstB~q\,
	combout => \u_TxSerial|rTxFfRdEn~2_combout\);

-- Location: FF_X59_Y30_N7
\u_TxSerial|rTxFfRdEn[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rTxFfRdEn~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rTxFfRdEn\(0));

-- Location: LCCOMB_X59_Y30_N28
\u_TxSerial|rTxFfRdEn~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rTxFfRdEn~1_combout\ = (\u_TxSerial|rTxFfRdEn\(0) & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rTxFfRdEn\(0),
	datad => \rSysRstB~q\,
	combout => \u_TxSerial|rTxFfRdEn~1_combout\);

-- Location: FF_X59_Y30_N29
\u_TxSerial|rTxFfRdEn[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rTxFfRdEn~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rTxFfRdEn\(1));

-- Location: LCCOMB_X55_Y31_N4
\u_TxSerial|rBaudCnt[4]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[4]~12_combout\ = (\u_TxSerial|Equal0~2_combout\) # ((\u_TxSerial|rTxFfRdEn\(1)) # (!\rSysRstB~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|Equal0~2_combout\,
	datac => \rSysRstB~q\,
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rBaudCnt[4]~12_combout\);

-- Location: FF_X55_Y31_N7
\u_TxSerial|rBaudCnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[0]~10_combout\,
	asdata => \~GND~combout\,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(0));

-- Location: LCCOMB_X55_Y31_N8
\u_TxSerial|rBaudCnt[1]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[1]~13_combout\ = (\u_TxSerial|rBaudCnt\(1) & (\u_TxSerial|rBaudCnt[0]~11\ & VCC)) # (!\u_TxSerial|rBaudCnt\(1) & (!\u_TxSerial|rBaudCnt[0]~11\))
-- \u_TxSerial|rBaudCnt[1]~14\ = CARRY((!\u_TxSerial|rBaudCnt\(1) & !\u_TxSerial|rBaudCnt[0]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rBaudCnt\(1),
	datad => VCC,
	cin => \u_TxSerial|rBaudCnt[0]~11\,
	combout => \u_TxSerial|rBaudCnt[1]~13_combout\,
	cout => \u_TxSerial|rBaudCnt[1]~14\);

-- Location: FF_X55_Y31_N9
\u_TxSerial|rBaudCnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[1]~13_combout\,
	asdata => \~GND~combout\,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(1));

-- Location: LCCOMB_X55_Y31_N10
\u_TxSerial|rBaudCnt[2]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[2]~15_combout\ = (\u_TxSerial|rBaudCnt\(2) & ((GND) # (!\u_TxSerial|rBaudCnt[1]~14\))) # (!\u_TxSerial|rBaudCnt\(2) & (\u_TxSerial|rBaudCnt[1]~14\ $ (GND)))
-- \u_TxSerial|rBaudCnt[2]~16\ = CARRY((\u_TxSerial|rBaudCnt\(2)) # (!\u_TxSerial|rBaudCnt[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudCnt\(2),
	datad => VCC,
	cin => \u_TxSerial|rBaudCnt[1]~14\,
	combout => \u_TxSerial|rBaudCnt[2]~15_combout\,
	cout => \u_TxSerial|rBaudCnt[2]~16\);

-- Location: FF_X55_Y31_N11
\u_TxSerial|rBaudCnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[2]~15_combout\,
	asdata => VCC,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(2));

-- Location: LCCOMB_X55_Y31_N12
\u_TxSerial|rBaudCnt[3]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[3]~17_combout\ = (\u_TxSerial|rBaudCnt\(3) & (\u_TxSerial|rBaudCnt[2]~16\ & VCC)) # (!\u_TxSerial|rBaudCnt\(3) & (!\u_TxSerial|rBaudCnt[2]~16\))
-- \u_TxSerial|rBaudCnt[3]~18\ = CARRY((!\u_TxSerial|rBaudCnt\(3) & !\u_TxSerial|rBaudCnt[2]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudCnt\(3),
	datad => VCC,
	cin => \u_TxSerial|rBaudCnt[2]~16\,
	combout => \u_TxSerial|rBaudCnt[3]~17_combout\,
	cout => \u_TxSerial|rBaudCnt[3]~18\);

-- Location: FF_X55_Y31_N13
\u_TxSerial|rBaudCnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[3]~17_combout\,
	asdata => \~GND~combout\,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(3));

-- Location: LCCOMB_X55_Y31_N2
\u_TxSerial|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|Equal0~0_combout\ = (!\u_TxSerial|rBaudCnt\(2) & (!\u_TxSerial|rBaudCnt\(3) & (!\u_TxSerial|rBaudCnt\(1) & \u_TxSerial|rBaudCnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudCnt\(2),
	datab => \u_TxSerial|rBaudCnt\(3),
	datac => \u_TxSerial|rBaudCnt\(1),
	datad => \u_TxSerial|rBaudCnt\(0),
	combout => \u_TxSerial|Equal0~0_combout\);

-- Location: LCCOMB_X55_Y31_N14
\u_TxSerial|rBaudCnt[4]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[4]~19_combout\ = (\u_TxSerial|rBaudCnt\(4) & ((GND) # (!\u_TxSerial|rBaudCnt[3]~18\))) # (!\u_TxSerial|rBaudCnt\(4) & (\u_TxSerial|rBaudCnt[3]~18\ $ (GND)))
-- \u_TxSerial|rBaudCnt[4]~20\ = CARRY((\u_TxSerial|rBaudCnt\(4)) # (!\u_TxSerial|rBaudCnt[3]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rBaudCnt\(4),
	datad => VCC,
	cin => \u_TxSerial|rBaudCnt[3]~18\,
	combout => \u_TxSerial|rBaudCnt[4]~19_combout\,
	cout => \u_TxSerial|rBaudCnt[4]~20\);

-- Location: FF_X55_Y31_N15
\u_TxSerial|rBaudCnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[4]~19_combout\,
	asdata => \~GND~combout\,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(4));

-- Location: LCCOMB_X55_Y31_N16
\u_TxSerial|rBaudCnt[5]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[5]~21_combout\ = (\u_TxSerial|rBaudCnt\(5) & (\u_TxSerial|rBaudCnt[4]~20\ & VCC)) # (!\u_TxSerial|rBaudCnt\(5) & (!\u_TxSerial|rBaudCnt[4]~20\))
-- \u_TxSerial|rBaudCnt[5]~22\ = CARRY((!\u_TxSerial|rBaudCnt\(5) & !\u_TxSerial|rBaudCnt[4]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rBaudCnt\(5),
	datad => VCC,
	cin => \u_TxSerial|rBaudCnt[4]~20\,
	combout => \u_TxSerial|rBaudCnt[5]~21_combout\,
	cout => \u_TxSerial|rBaudCnt[5]~22\);

-- Location: FF_X55_Y31_N17
\u_TxSerial|rBaudCnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[5]~21_combout\,
	asdata => VCC,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(5));

-- Location: LCCOMB_X55_Y31_N18
\u_TxSerial|rBaudCnt[6]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[6]~23_combout\ = (\u_TxSerial|rBaudCnt\(6) & ((GND) # (!\u_TxSerial|rBaudCnt[5]~22\))) # (!\u_TxSerial|rBaudCnt\(6) & (\u_TxSerial|rBaudCnt[5]~22\ $ (GND)))
-- \u_TxSerial|rBaudCnt[6]~24\ = CARRY((\u_TxSerial|rBaudCnt\(6)) # (!\u_TxSerial|rBaudCnt[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rBaudCnt\(6),
	datad => VCC,
	cin => \u_TxSerial|rBaudCnt[5]~22\,
	combout => \u_TxSerial|rBaudCnt[6]~23_combout\,
	cout => \u_TxSerial|rBaudCnt[6]~24\);

-- Location: FF_X55_Y31_N19
\u_TxSerial|rBaudCnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[6]~23_combout\,
	asdata => VCC,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(6));

-- Location: LCCOMB_X55_Y31_N20
\u_TxSerial|rBaudCnt[7]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[7]~25_combout\ = (\u_TxSerial|rBaudCnt\(7) & (\u_TxSerial|rBaudCnt[6]~24\ & VCC)) # (!\u_TxSerial|rBaudCnt\(7) & (!\u_TxSerial|rBaudCnt[6]~24\))
-- \u_TxSerial|rBaudCnt[7]~26\ = CARRY((!\u_TxSerial|rBaudCnt\(7) & !\u_TxSerial|rBaudCnt[6]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rBaudCnt\(7),
	datad => VCC,
	cin => \u_TxSerial|rBaudCnt[6]~24\,
	combout => \u_TxSerial|rBaudCnt[7]~25_combout\,
	cout => \u_TxSerial|rBaudCnt[7]~26\);

-- Location: FF_X55_Y31_N21
\u_TxSerial|rBaudCnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[7]~25_combout\,
	asdata => \~GND~combout\,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(7));

-- Location: LCCOMB_X55_Y31_N22
\u_TxSerial|rBaudCnt[8]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[8]~27_combout\ = (\u_TxSerial|rBaudCnt\(8) & ((GND) # (!\u_TxSerial|rBaudCnt[7]~26\))) # (!\u_TxSerial|rBaudCnt\(8) & (\u_TxSerial|rBaudCnt[7]~26\ $ (GND)))
-- \u_TxSerial|rBaudCnt[8]~28\ = CARRY((\u_TxSerial|rBaudCnt\(8)) # (!\u_TxSerial|rBaudCnt[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudCnt\(8),
	datad => VCC,
	cin => \u_TxSerial|rBaudCnt[7]~26\,
	combout => \u_TxSerial|rBaudCnt[8]~27_combout\,
	cout => \u_TxSerial|rBaudCnt[8]~28\);

-- Location: FF_X55_Y31_N23
\u_TxSerial|rBaudCnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[8]~27_combout\,
	asdata => VCC,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(8));

-- Location: LCCOMB_X55_Y31_N24
\u_TxSerial|rBaudCnt[9]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudCnt[9]~29_combout\ = \u_TxSerial|rBaudCnt\(9) $ (!\u_TxSerial|rBaudCnt[8]~28\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_TxSerial|rBaudCnt\(9),
	cin => \u_TxSerial|rBaudCnt[8]~28\,
	combout => \u_TxSerial|rBaudCnt[9]~29_combout\);

-- Location: FF_X55_Y31_N25
\u_TxSerial|rBaudCnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudCnt[9]~29_combout\,
	asdata => VCC,
	sload => \u_TxSerial|rBaudCnt[4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudCnt\(9));

-- Location: LCCOMB_X55_Y31_N28
\u_TxSerial|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|Equal0~1_combout\ = (!\u_TxSerial|rBaudCnt\(6) & (!\u_TxSerial|rBaudCnt\(5) & (!\u_TxSerial|rBaudCnt\(4) & !\u_TxSerial|rBaudCnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudCnt\(6),
	datab => \u_TxSerial|rBaudCnt\(5),
	datac => \u_TxSerial|rBaudCnt\(4),
	datad => \u_TxSerial|rBaudCnt\(7),
	combout => \u_TxSerial|Equal0~1_combout\);

-- Location: LCCOMB_X55_Y31_N26
\u_TxSerial|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|Equal0~2_combout\ = (\u_TxSerial|Equal0~0_combout\ & (!\u_TxSerial|rBaudCnt\(9) & (!\u_TxSerial|rBaudCnt\(8) & \u_TxSerial|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|Equal0~0_combout\,
	datab => \u_TxSerial|rBaudCnt\(9),
	datac => \u_TxSerial|rBaudCnt\(8),
	datad => \u_TxSerial|Equal0~1_combout\,
	combout => \u_TxSerial|Equal0~2_combout\);

-- Location: LCCOMB_X55_Y31_N0
\u_TxSerial|rBaudEnd~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rBaudEnd~0_combout\ = (\u_TxSerial|Equal0~2_combout\ & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|Equal0~2_combout\,
	datac => \rSysRstB~q\,
	combout => \u_TxSerial|rBaudEnd~0_combout\);

-- Location: FF_X55_Y31_N1
\u_TxSerial|rBaudEnd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rBaudEnd~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rBaudEnd~q\);

-- Location: LCCOMB_X52_Y32_N2
\u_RxSerial|rRxFfWrData~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData~8_combout\ = (\u_RxSerial|rSerDataIn~q\ & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_RxSerial|rSerDataIn~q\,
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData~8_combout\);

-- Location: LCCOMB_X52_Y32_N12
\u_RxSerial|rRxFfWrData[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData[0]~1_combout\ = ((!\u_RxSerial|rState.stStop~q\ & \u_RxSerial|rBaudEnd~q\)) # (!\rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rState.stStop~q\,
	datac => \u_RxSerial|rBaudEnd~q\,
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData[0]~1_combout\);

-- Location: FF_X52_Y32_N3
\u_RxSerial|rRxFfWrData[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rRxFfWrData~8_combout\,
	ena => \u_RxSerial|rRxFfWrData[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrData\(7));

-- Location: LCCOMB_X52_Y32_N16
\u_RxSerial|rRxFfWrData~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData~7_combout\ = (\u_RxSerial|rRxFfWrData\(7) & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rRxFfWrData\(7),
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData~7_combout\);

-- Location: FF_X52_Y32_N17
\u_RxSerial|rRxFfWrData[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rRxFfWrData~7_combout\,
	ena => \u_RxSerial|rRxFfWrData[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrData\(6));

-- Location: LCCOMB_X52_Y32_N6
\u_RxSerial|rRxFfWrData~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData~6_combout\ = (\u_RxSerial|rRxFfWrData\(6) & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_RxSerial|rRxFfWrData\(6),
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData~6_combout\);

-- Location: FF_X52_Y32_N7
\u_RxSerial|rRxFfWrData[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rRxFfWrData~6_combout\,
	ena => \u_RxSerial|rRxFfWrData[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrData\(5));

-- Location: LCCOMB_X52_Y32_N20
\u_RxSerial|rRxFfWrData~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData~5_combout\ = (\u_RxSerial|rRxFfWrData\(5) & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_RxSerial|rRxFfWrData\(5),
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData~5_combout\);

-- Location: FF_X52_Y32_N21
\u_RxSerial|rRxFfWrData[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rRxFfWrData~5_combout\,
	ena => \u_RxSerial|rRxFfWrData[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrData\(4));

-- Location: LCCOMB_X52_Y32_N18
\u_RxSerial|rRxFfWrData~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData~4_combout\ = (\u_RxSerial|rRxFfWrData\(4) & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rRxFfWrData\(4),
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData~4_combout\);

-- Location: FF_X52_Y32_N19
\u_RxSerial|rRxFfWrData[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rRxFfWrData~4_combout\,
	ena => \u_RxSerial|rRxFfWrData[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrData\(3));

-- Location: LCCOMB_X52_Y32_N8
\u_RxSerial|rRxFfWrData~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData~3_combout\ = (\u_RxSerial|rRxFfWrData\(3) & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_RxSerial|rRxFfWrData\(3),
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData~3_combout\);

-- Location: FF_X52_Y32_N9
\u_RxSerial|rRxFfWrData[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rRxFfWrData~3_combout\,
	ena => \u_RxSerial|rRxFfWrData[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrData\(2));

-- Location: LCCOMB_X52_Y32_N26
\u_RxSerial|rRxFfWrData~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData~2_combout\ = (\u_RxSerial|rRxFfWrData\(2) & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_RxSerial|rRxFfWrData\(2),
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData~2_combout\);

-- Location: FF_X52_Y32_N27
\u_RxSerial|rRxFfWrData[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rRxFfWrData~2_combout\,
	ena => \u_RxSerial|rRxFfWrData[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrData\(1));

-- Location: LCCOMB_X52_Y32_N24
\u_RxSerial|rRxFfWrData~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_RxSerial|rRxFfWrData~0_combout\ = (\u_RxSerial|rRxFfWrData\(1) & \rSysRstB~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_RxSerial|rRxFfWrData\(1),
	datad => \rSysRstB~q\,
	combout => \u_RxSerial|rRxFfWrData~0_combout\);

-- Location: FF_X52_Y32_N25
\u_RxSerial|rRxFfWrData[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_RxSerial|rRxFfWrData~0_combout\,
	ena => \u_RxSerial|rRxFfWrData[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_RxSerial|rRxFfWrData\(0));

-- Location: LCCOMB_X52_Y31_N6
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\ = \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0) $ (VCC)
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ = CARRY(\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0),
	datad => VCC,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\);

-- Location: FF_X52_Y31_N7
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

-- Location: LCCOMB_X52_Y31_N8
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\)) 
-- # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\);

-- Location: FF_X52_Y31_N9
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1));

-- Location: LCCOMB_X52_Y31_N10
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ $ 
-- (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\);

-- Location: FF_X52_Y31_N11
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2));

-- Location: LCCOMB_X52_Y31_N12
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\)) 
-- # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\);

-- Location: FF_X52_Y31_N13
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3));

-- Location: LCCOMB_X52_Y31_N14
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ $ 
-- (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\);

-- Location: FF_X52_Y31_N15
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4));

-- Location: LCCOMB_X52_Y31_N16
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\)) 
-- # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\);

-- Location: FF_X52_Y31_N17
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5));

-- Location: LCCOMB_X52_Y31_N18
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ $ 
-- (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\);

-- Location: FF_X52_Y31_N19
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6));

-- Location: LCCOMB_X52_Y31_N20
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\)) 
-- # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\);

-- Location: FF_X52_Y31_N21
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(7));

-- Location: LCCOMB_X52_Y31_N22
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ $ 
-- (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita7~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\);

-- Location: FF_X52_Y31_N23
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(8));

-- Location: LCCOMB_X52_Y31_N24
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\)) 
-- # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita8~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\);

-- Location: FF_X52_Y31_N25
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(9));

-- Location: LCCOMB_X52_Y31_N26
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\ 
-- $ (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita9~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\);

-- Location: FF_X52_Y31_N27
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(10));

-- Location: LCCOMB_X52_Y31_N28
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11~combout\ = \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11) $ (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11),
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita10~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11~combout\);

-- Location: FF_X52_Y31_N29
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita11~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_RxSerial|rRxFfWrEn~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(11));

-- Location: LCCOMB_X54_Y31_N4
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\ = \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0) $ (VCC)
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ = CARRY(\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0),
	datad => VCC,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\);

-- Location: FF_X54_Y31_N5
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

-- Location: LCCOMB_X54_Y31_N6
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\)) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\);

-- Location: FF_X54_Y31_N7
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1));

-- Location: LCCOMB_X54_Y31_N8
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ $ (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\);

-- Location: FF_X54_Y31_N9
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2));

-- Location: LCCOMB_X54_Y31_N10
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\)) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\);

-- Location: FF_X54_Y31_N11
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3));

-- Location: LCCOMB_X54_Y31_N12
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ $ (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\);

-- Location: FF_X54_Y31_N13
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4));

-- Location: LCCOMB_X54_Y31_N14
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\)) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\);

-- Location: FF_X54_Y31_N15
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5));

-- Location: LCCOMB_X54_Y31_N16
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ $ (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\);

-- Location: FF_X54_Y31_N17
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6));

-- Location: LCCOMB_X54_Y31_N18
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\)) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7) & 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\);

-- Location: FF_X54_Y31_N19
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(7));

-- Location: LCCOMB_X54_Y31_N20
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ $ (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita7~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\);

-- Location: FF_X54_Y31_N21
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(8));

-- Location: LCCOMB_X54_Y31_N22
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\)) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9) & 
-- ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\) # (GND)))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\ = CARRY((!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\) # 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita8~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\);

-- Location: FF_X54_Y31_N23
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(9));

-- Location: LCCOMB_X54_Y31_N24
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\ $ (GND))) # (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
-- (!\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\ & VCC))
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\ = CARRY((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10) & 
-- !\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10),
	datad => VCC,
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita9~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~combout\,
	cout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\);

-- Location: FF_X54_Y31_N25
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(10));

-- Location: LCCOMB_X54_Y31_N26
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11~combout\ = \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11) $ 
-- (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11),
	cin => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita10~COUT\,
	combout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11~combout\);

-- Location: FF_X54_Y31_N27
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita11~combout\,
	clrn => \rSysRstB~q\,
	ena => \u_TxSerial|rTxFfRdEn\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(11));

-- Location: M9K_X53_Y29_N0
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "Fifo4kx8:u_Fifo4kx8|scfifo:scfifo_component|scfifo_an71:auto_generated|a_dpfifo_k161:dpfifo|altsyncram_h1o1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \u_RxSerial|rRxFfWrEn~q\,
	portbre => VCC,
	clk0 => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	ena0 => \u_RxSerial|rRxFfWrEn~q\,
	ena1 => \u_TxSerial|rTxFfRdEn\(0),
	portadatain => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: M9K_X53_Y31_N0
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "Fifo4kx8:u_Fifo4kx8|scfifo:scfifo_component|scfifo_an71:auto_generated|a_dpfifo_k161:dpfifo|altsyncram_h1o1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \u_RxSerial|rRxFfWrEn~q\,
	portbre => VCC,
	clk0 => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	ena0 => \u_RxSerial|rRxFfWrEn~q\,
	ena1 => \u_TxSerial|rTxFfRdEn\(0),
	portadatain => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a2_PORTBDATAOUT_bus\);

-- Location: M9K_X53_Y32_N0
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "Fifo4kx8:u_Fifo4kx8|scfifo:scfifo_component|scfifo_an71:auto_generated|a_dpfifo_k161:dpfifo|altsyncram_h1o1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \u_RxSerial|rRxFfWrEn~q\,
	portbre => VCC,
	clk0 => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	ena0 => \u_RxSerial|rRxFfWrEn~q\,
	ena1 => \u_TxSerial|rTxFfRdEn\(0),
	portadatain => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a6_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X54_Y30_N24
\u_TxSerial|rSerDataOut~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~9_combout\ = (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(7)) # (!\u_TxSerial|rTxFfRdEn\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(7),
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rSerDataOut~9_combout\);

-- Location: FF_X54_Y30_N25
\u_TxSerial|rSerDataOut[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~9_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(8));

-- Location: LCCOMB_X54_Y30_N22
\u_TxSerial|rSerDataOut~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~8_combout\ = (\u_TxSerial|rTxFfRdEn\(1) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(6))) # (!\u_TxSerial|rTxFfRdEn\(1) & ((\u_TxSerial|rSerDataOut\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(6),
	datab => \u_TxSerial|rSerDataOut\(8),
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rSerDataOut~8_combout\);

-- Location: FF_X54_Y30_N23
\u_TxSerial|rSerDataOut[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~8_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(7));

-- Location: M9K_X53_Y30_N0
\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "Fifo4kx8:u_Fifo4kx8|scfifo:scfifo_component|scfifo_an71:auto_generated|a_dpfifo_k161:dpfifo|altsyncram_h1o1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 12,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 2,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 4095,
	port_b_logical_ram_depth => 4096,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \u_RxSerial|rRxFfWrEn~q\,
	portbre => VCC,
	clk0 => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	clk1 => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	ena0 => \u_RxSerial|rRxFfWrEn~q\,
	ena1 => \u_TxSerial|rTxFfRdEn\(0),
	portadatain => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a4_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X54_Y30_N12
\u_TxSerial|rSerDataOut~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~7_combout\ = (\u_TxSerial|rTxFfRdEn\(1) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(5)))) # (!\u_TxSerial|rTxFfRdEn\(1) & (\u_TxSerial|rSerDataOut\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rSerDataOut\(7),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(5),
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rSerDataOut~7_combout\);

-- Location: FF_X54_Y30_N13
\u_TxSerial|rSerDataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~7_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(6));

-- Location: LCCOMB_X54_Y30_N26
\u_TxSerial|rSerDataOut~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~6_combout\ = (\u_TxSerial|rTxFfRdEn\(1) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(4)))) # (!\u_TxSerial|rTxFfRdEn\(1) & (\u_TxSerial|rSerDataOut\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rSerDataOut\(6),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(4),
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rSerDataOut~6_combout\);

-- Location: FF_X54_Y30_N27
\u_TxSerial|rSerDataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~6_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(5));

-- Location: LCCOMB_X54_Y30_N8
\u_TxSerial|rSerDataOut~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~5_combout\ = (\u_TxSerial|rTxFfRdEn\(1) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(3)))) # (!\u_TxSerial|rTxFfRdEn\(1) & (\u_TxSerial|rSerDataOut\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rSerDataOut\(5),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(3),
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rSerDataOut~5_combout\);

-- Location: FF_X54_Y30_N9
\u_TxSerial|rSerDataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~5_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(4));

-- Location: LCCOMB_X54_Y30_N6
\u_TxSerial|rSerDataOut~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~4_combout\ = (\u_TxSerial|rTxFfRdEn\(1) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(2))) # (!\u_TxSerial|rTxFfRdEn\(1) & ((\u_TxSerial|rSerDataOut\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(2),
	datab => \u_TxSerial|rSerDataOut\(4),
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rSerDataOut~4_combout\);

-- Location: FF_X54_Y30_N7
\u_TxSerial|rSerDataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~4_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(3));

-- Location: LCCOMB_X54_Y30_N4
\u_TxSerial|rSerDataOut~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~3_combout\ = (\u_TxSerial|rTxFfRdEn\(1) & (\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(1))) # (!\u_TxSerial|rTxFfRdEn\(1) & ((\u_TxSerial|rSerDataOut\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(1),
	datab => \u_TxSerial|rTxFfRdEn\(1),
	datad => \u_TxSerial|rSerDataOut\(3),
	combout => \u_TxSerial|rSerDataOut~3_combout\);

-- Location: FF_X54_Y30_N5
\u_TxSerial|rSerDataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~3_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(2));

-- Location: LCCOMB_X54_Y30_N10
\u_TxSerial|rSerDataOut~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~1_combout\ = (\u_TxSerial|rTxFfRdEn\(1) & ((\u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(0)))) # (!\u_TxSerial|rTxFfRdEn\(1) & (\u_TxSerial|rSerDataOut\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rSerDataOut\(2),
	datab => \u_Fifo4kx8|scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(0),
	datad => \u_TxSerial|rTxFfRdEn\(1),
	combout => \u_TxSerial|rSerDataOut~1_combout\);

-- Location: FF_X54_Y30_N11
\u_TxSerial|rSerDataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~1_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	ena => \u_TxSerial|rSerDataOut[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(1));

-- Location: LCCOMB_X54_Y30_N16
\u_TxSerial|rSerDataOut~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \u_TxSerial|rSerDataOut~0_combout\ = (!\u_TxSerial|rTxFfRdEn\(1) & ((\u_TxSerial|rBaudEnd~q\ & ((\u_TxSerial|rSerDataOut\(1)))) # (!\u_TxSerial|rBaudEnd~q\ & (\u_TxSerial|rSerDataOut\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_TxSerial|rBaudEnd~q\,
	datab => \u_TxSerial|rTxFfRdEn\(1),
	datac => \u_TxSerial|rSerDataOut\(0),
	datad => \u_TxSerial|rSerDataOut\(1),
	combout => \u_TxSerial|rSerDataOut~0_combout\);

-- Location: FF_X54_Y30_N17
\u_TxSerial|rSerDataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \u_PLL50|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \u_TxSerial|rSerDataOut~0_combout\,
	asdata => VCC,
	sload => \ALT_INV_rSysRstB~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_TxSerial|rSerDataOut\(0));

-- Location: IOIBUF_X62_Y0_N22
\RESERVED[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESERVED(0),
	o => \RESERVED[0]~input_o\);

-- Location: IOIBUF_X58_Y0_N15
\RESERVED[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESERVED(1),
	o => \RESERVED[1]~input_o\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~GND~combout\,
	xe_ye => \~GND~combout\,
	se => \~GND~combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~GND~combout\,
	usr_pwd => VCC,
	tsen => \~GND~combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~GND~combout\,
	usr_pwd => VCC,
	tsen => \~GND~combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);
END structure;


