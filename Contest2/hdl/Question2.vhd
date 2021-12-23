----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     Question2.vhd
-- Title        Top
--
-- Company      Design Gateway Co., Ltd.
-- Project      DDCamp
-- PJ No.       
-- Syntax       VHDL
-- Note         

-- Version      1.01
-- Author       J.Natthapat
-- Date         2020/12/18
-- Remark       Add Push Button

-- Version      1.00
-- Author       B.Attapon
-- Date         2017/11/17
-- Remark       New Creation
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

Entity Question2 Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk50			: in	std_logic;							-- clock input 50 MHz
		
		-- DDR3 Interface
		DDR3_A			: out	std_logic_vector( 14 downto 0 );
		DDR3_BA			: out	std_logic_vector( 2 downto 0 );
		DDR3_CAS_n		: out	std_logic_vector( 0 downto 0 );
		DDR3_CK_n		: inout	std_logic_vector( 0 downto 0 );
		DDR3_CK_p		: inout	std_logic_vector( 0 downto 0 );
		DDR3_CKE		: out	std_logic_vector( 0 downto 0 );
		DDR3_CLK_50		: in	std_logic;
		DDR3_CS_n		: out	std_logic_vector( 0 downto 0 );
		DDR3_DM			: out	std_logic_vector( 1 downto 0 );
		DDR3_DQ			: inout	std_logic_vector( 15 downto 0 );
		DDR3_DQS_n		: inout	std_logic_vector( 1 downto 0 );
		DDR3_DQS_p		: inout	std_logic_vector( 1 downto 0 );
		DDR3_ODT		: out	std_logic_vector( 0 downto 0 );
		DDR3_RAS_n		: out	std_logic_vector( 0 downto 0 );
		DDR3_RESET_n	: out	std_logic;
		DDR3_WE_n		: out	std_logic_vector( 0 downto 0 );
		
		-- HDMI Interface
		HDMI_TX_INT		: in	std_logic;
		HDMI_I2C_SCL	: out	std_logic;
		HDMI_I2C_SDA	: inout	std_logic;
		HDMI_TX_CLK		: out	std_logic;
		HDMI_TX_D		: out	std_logic_vector(23 downto 0);
		HDMI_TX_DE		: out	std_logic;
		HDMI_TX_HS		: out	std_logic;
		HDMI_TX_VS		: out	std_logic;
		
		-- UART RX
		RxSerData		: in	std_logic;
		RESERVED		: in	std_logic_vector( 1 downto 0 );
		
		-- Basic IO Interface
		Button			: in	std_logic;							-- active low 
		LED				: out	std_logic_vector( 7 downto 0 );		-- active low LED (show status)
		DipSwitch		: in 	std_logic_vector( 1 downto 0 )		-- DipSwitch select TestPatt
	);
End Entity Question2;

Architecture rtl Of Question2 Is

----------------------------------------------------------------------------------
-- Component declaration
----------------------------------------------------------------------------------
	
	Component PLL50 Is
	Port 
	(
		areset			: in	std_logic  := '0';
		inclk0			: in	std_logic  := '0';
		c0				: out	std_logic;
		locked			: out	std_logic 
	);
	End Component PLL50;
	
	Component fifo256x32to64
	Port
	(
		aclr			: in	std_logic  := '0';
		
		wrclk			: in	std_logic;
		wrreq			: in	std_logic;
		data			: in	std_logic_vector(31 downto 0);
		wrfull			: out	std_logic;
		wrusedw			: out	std_logic_vector(7 downto 0);
		
		rdclk			: in	std_logic;
		rdreq			: in	std_logic;
		q				: out	std_logic_vector(63 downto 0);
		rdempty			: out	std_logic;
		rdusedw			: out	std_logic_vector(6 downto 0)
	);
	End Component fifo256x32to64;
	
	Component fifo256x64to32
	Port
	(
		aclr			: in	std_logic  := '0';
		
		wrclk			: in	std_logic;
		wrreq			: in	std_logic;
		data			: in	std_logic_vector(63 downto 0);
		wrfull			: out	std_logic;
		wrusedw			: out	std_logic_vector(6 downto 0);
		
		rdclk			: in	std_logic;
		rdreq			: in	std_logic;
		q				: out	std_logic_vector(31 downto 0);
		rdempty			: out	std_logic;
		rdusedw			: out	std_logic_vector(7 downto 0)
	);
	End Component fifo256x64to32;
	
	Component RxSerial Is
	Port(
		RstB		: in	std_logic;
		Clk			: in	std_logic;
		
		SerDataIn	: in	std_logic;
		
		RxFfFull	: in	std_logic;
		RxFfWrData	: out	std_logic_vector( 7 downto 0 );
		RxFfWrEn	: out	std_logic
	);
	End Component RxSerial;
	
	Component UserWrDdr Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk				: in	std_logic;							-- clock input 100 MHz
		
		-- WrCtrl I/F
		MemInitDone		: in	std_logic;
		MtDdrWrReq		: out	std_logic;
		MtDdrWrBusy		: in	std_logic;
		MtDdrWrAddr		: out	std_logic_vector( 28 downto 7 );
		
		-- T2UWrFf I/F
		T2UWrFfRdEn		: out	std_logic;
		T2UWrFfRdData	: in	std_logic_vector( 63 downto 0 );
		T2UWrFfRdCnt	: in	std_logic_vector( 15 downto 0 );
		
		-- UWr2DFf I/F
		UWr2DFfRdEn		: in	std_logic;
		UWr2DFfRdData	: out	std_logic_vector( 63 downto 0 );
		UWr2DFfRdCnt	: out	std_logic_vector( 15 downto 0 )
	);
	End Component UserWrDdr;

	Component UserRdDdr Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk				: in	std_logic;							-- clock input 100 MHz
		
		DipSwitch		: in	std_logic_vector( 1 downto 0 );
		
		-- HDMICtrl I/F
		HDMIReq			: out	std_logic;
		HDMIBusy		: in	std_logic;
		
		-- RdCtrl I/F
		MemInitDone		: in	std_logic;
		MtDdrRdReq		: out	std_logic;
		MtDdrRdBusy		: in	std_logic;
		MtDdrRdAddr		: out	std_logic_vector( 28 downto 7 );
		
		-- D2URdFf I/F
		D2URdFfWrEn		: in	std_logic;
		D2URdFfWrData	: in	std_logic_vector( 63 downto 0 );
		D2URdFfWrCnt	: out	std_logic_vector( 15 downto 0 );
		
		-- URd2HFf I/F
		URd2HFfWrEn		: out	std_logic;
		URd2HFfWrData	: out	std_logic_vector( 63 downto 0 );
		URd2HFfWrCnt	: in	std_logic_vector( 15 downto 0 )
	);
	End Component UserRdDdr;
	
	Component MtDdr Is
	Port 
	(	
		UserRstB		: in	std_logic;						-- Reset (Active low) (100MHz)
		UserClk			: in	std_logic;						-- User Clock (100MHz)
		
		-- DDR Controller Status
		MemInitDone		: out	std_logic;
		
		-- Command Write I/F
		MtDdrWrReq		: in	std_logic;
		MtDdrWrBusy		: out	std_logic;
		MtDdrWrAddr		: in	std_logic_vector( 28 downto 7 );
		-- User Write Fifo 
		WrFfRdEn		: out	std_logic;
		WrFfRdData		: in	std_logic_vector( 63 downto 0 );
		WrFfRdCnt		: in	std_logic_vector( 15 downto 0 );
		
		-- Command Read I/F
		MtDdrRdReq		: in	std_logic;
		MtDdrRdBusy		: out	std_logic;
		MtDdrRdAddr		: in	std_logic_vector( 28 downto 7 );
		-- User Read Fifo
		RdFfWrEn		: out	std_logic;
		RdFfWrData		: out	std_logic_vector( 63 downto 0 );
		RdFfWrCnt		: in	std_logic_vector( 15 downto 0 );
		
		-- DDR3 Interface
		DDR3_A			: out	std_logic_vector( 14 downto 0 );
		DDR3_BA			: out	std_logic_vector( 2 downto 0 );
		DDR3_CAS_n		: out	std_logic_vector( 0 downto 0 );
		DDR3_CK_n		: inout	std_logic_vector( 0 downto 0 );
		DDR3_CK_p		: inout	std_logic_vector( 0 downto 0 );
		DDR3_CKE		: out	std_logic_vector( 0 downto 0 );
		DDR3_CLK_50		: in	std_logic;
		DDR3_CS_n		: out	std_logic_vector( 0 downto 0 );
		DDR3_DM			: out	std_logic_vector( 1 downto 0 );
		DDR3_DQ			: inout	std_logic_vector( 15 downto 0 );
		DDR3_DQS_n		: inout	std_logic_vector( 1 downto 0 );
		DDR3_DQS_p		: inout	std_logic_vector( 1 downto 0 );
		DDR3_ODT		: out	std_logic_vector( 0 downto 0 );
		DDR3_RAS_n		: out	std_logic_vector( 0 downto 0 );
		DDR3_RESET_n	: out	std_logic;
		DDR3_WE_n		: out	std_logic_vector( 0 downto 0 )
	);						
	End Component MtDdr;
	
	Component HDMI Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk				: in	std_logic;							-- clock input 100 MHz
		
		-- User Control Interface
		HDMIReq			: in	std_logic;
		HDMIBusy		: out	std_logic;							-- HDMI Busy
		HDMIStatus		: out	std_logic_vector( 1 downto 0 );		-- [1] Error Flag for HDMI Data path
																	-- [0] Busy Flag for HDMI I2C Config
		HDMIUserClk		: out	std_logic;
		
		-- User Data Interface
		HDMIFfRdEn		: out	std_logic;
		HDMIFfRdData	: in	std_logic_vector( 23 downto 0 );
		HDMIFfEmpty		: in	std_logic;
		HDMIFfRdCnt		: in	std_logic_vector( 15 downto 0 );
		
		-- HDMI Control Interface
		HDMI_TX_INT		: in	std_logic;
		HDMI_I2C_SCL	: out	std_logic;
		HDMI_I2C_SDA	: inout	std_logic;
		
		-- HDMI Data Interface
		HDMI_TX_CLK		: out	std_logic;
		HDMI_TX_D		: out	std_logic_vector( 23 downto 0 );
		HDMI_TX_DE		: out	std_logic;
		HDMI_TX_HS		: out	std_logic;
		HDMI_TX_VS		: out	std_logic
	);
	End Component HDMI;
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	
	-- Reset System
	-- Clk50
	signal	rPLL50RstBCnt	: std_logic_vector( 3 downto 0 ) := "0000";
	signal	PLL50Rst		: std_logic;
	signal	PLLLock			: std_logic;
	
	-- UserClk
	signal	UserClk			: std_logic;
	signal	rPLLLockUser	: std_logic_vector( 1 downto 0 );
	signal	rRstBUser		: std_logic;
	signal	rSysRstB		: std_logic;
	signal	SysRst			: std_logic;
	
Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------
	
----------------------------------------------------------------------------------
-- DFF 
----------------------------------------------------------------------------------

-----------------------------------------------------
-- Power on Reset
	u_rPLL50RstBCnt : Process (Clk50) Is
	Begin
		if ( rising_edge(Clk50) ) then
			rPLL50RstBCnt	<= rPLL50RstBCnt(2 downto 0) & '1';
		end if;
	End Process u_rPLL50RstBCnt;
	
	PLL50Rst	<= not rPLL50RstBCnt(3);

	u_PLL50 : PLL50
	Port map
	(
		areset		=> PLL50Rst			,
		inclk0		=> Clk50			,
		c0			=> UserClk			, -- UserClk: 100 MHz	
		locked		=> PLLLock
	);
	
	u_rSysRstB : Process (UserClk) Is
	Begin
		if ( rising_edge(UserClk) ) then
			-- Sync clock for PLLLock signal
			rPLLLockUser	<= rPLLLockUser(0) & PLLLock;
			-- Input FF before using
			rRstBUser		<= RstB;	
			rSysRstB		<= rPLLLockUser(1) and rRstBUser;
		end if;
	End Process u_rSysRstB;
	
	SysRst		<= not rSysRstB;
	
-----------------------------------------------------
-- Behavior



	
End Architecture rtl;