-------------------------------------------------------------------------------------------------------
-- Copyright (c) 2017, Design Gateway Co., Ltd.
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without modification,
-- are permitted provided that the following conditions are met:
-- 1. Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright notice,
-- this list of conditions and the following disclaimer in the documentation
-- and/or other materials provided with the distribution.
--
-- 3. Neither the name of the copyright holder nor the names of its contributors
-- may be used to endorse or promote products derived from this software
-- without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
-- IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-- INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-- OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
-- EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     HDMITest.vhd
-- Title        Top
--
-- Company      Design Gateway Co., Ltd.
-- Project      DDCamp HDMI-IP
-- PJ No.       
-- Syntax       VHDL
-- Note         

-- Version      2.00
-- Author       J.Natthapat
-- Date         2018/12/1
-- Remark       Add DipSwitch to select pattern (Vertical Color Bar, Horizontal Color Bar, Red Screen, and Blue Screen)

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

Entity HDMITest Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk50			: in	std_logic;							-- clock input 50 MHz
		
		-- HDMI Interface
		HDMI_TX_INT		: in	std_logic;
		HDMI_I2C_SCL	: out	std_logic;
		HDMI_I2C_SDA	: inout	std_logic;
		HDMI_TX_CLK		: out	std_logic;
		HDMI_TX_D		: out	std_logic_vector( 23 downto 0 );
		HDMI_TX_DE		: out	std_logic;
		HDMI_TX_HS		: out	std_logic;
		HDMI_TX_VS		: out	std_logic;
		
		-- Basic IO Interface
		LED				: out	std_logic_vector( 7 downto 0 );		-- active low LED
		DipSwitch		: in 	std_logic_vector( 1 downto 0 )		-- DipSwitch select TestPatt
	);
End Entity HDMITest;

Architecture rtl Of HDMITest Is

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
	
	Component TestPatt Is
	Port
	(
		RstB			: in	std_logic;
		Clk				: in	std_logic;
		
		--DipSwitch
		DipSwitch		: in 	std_logic_vector( 1 downto 0 );
		
		-- HDMI Control Interface
		HDMIReq			: out	std_logic;
		HDMIBusy		: in	std_logic;
		
		-- HDMI Data Interface
		HDMIFfWrEn		: out	std_logic;
		HDMIFfWrData	: out	std_logic_vector( 23 downto 0 );
		HDMIFfWrCnt		: in	std_logic_vector( 15 downto 0 )
	);
	End Component TestPatt;
	
	Component asyncfifo256x24
	Port
	(
		aclr			: in	std_logic  := '0';
		
		wrclk			: in	std_logic;
		wrreq			: in	std_logic;
		data			: in	std_logic_vector(23 downto 0);
		wrfull			: out	std_logic;
		wrusedw			: out	std_logic_vector(7 downto 0);
		
		rdclk			: in	std_logic;
		rdreq			: in	std_logic;
		q				: out	std_logic_vector(23 downto 0);
		rdempty			: out	std_logic;
		rdusedw			: out	std_logic_vector(7 downto 0)
	);
	End Component asyncfifo256x24;

----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	
	-- Reset System
	-- Clk50
	signal	rPLL50RstBCnt	: std_logic_vector( 3 downto 0 ) := "0000";
	signal	PLL50Rst		: std_logic;
	signal	PLLLock			: std_logic;
	
	-- Clk100
	signal	UserClk			: std_logic;
	signal	rPLLLockUser	: std_logic_vector( 1 downto 0 );
	signal	rRstBUser		: std_logic;
	signal	rSysRstB		: std_logic;
	signal	SysRst			: std_logic;
	
	-- HDMI Interface
	signal	HDMIReq			: std_logic;
	signal	HDMIBusy		: std_logic;
	signal	HDMIStatus		: std_logic_vector( 1 downto 0 );
	signal	HDMIUserClk		: std_logic;
	
	-- FIFO Bridge
	signal	HDMIFfWrEn		: std_logic;
	signal	HDMIFfWrData	: std_logic_vector( 23 downto 0 );
	signal	HDMIFfWrCnt		: std_logic_vector( 15 downto 0 );
	signal	HDMIFfRdEn		: std_logic;
	signal	HDMIFfRdData	: std_logic_vector( 23 downto 0 );
	signal	HDMIFfEmpty		: std_logic;
	signal	HDMIFfRdCnt		: std_logic_vector( 15 downto 0 );
	
Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

	-- LED Status
	LED(0)			<= not HDMIStatus(0);	-- Busy Flag for HDMI I2C Config
	LED(1)			<= not HDMIStatus(1);	-- Error Flag for HDMI Data path
	LED(2)			<= not HDMIBusy;
	LED(3)			<= not HDMIReq;
	LED(5 downto 4)	<= (others=>'1');
	LED(6)			<= not HDMI_TX_INT;
	LED(7)			<= '1';					-- not use
						   
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
			rPLLLockUser	<= rPLLLockUser(0) & PLLLock;
			rRstBUser		<= RstB;	
			rSysRstB		<= rPLLLockUser(1) and rRstBUser;
		end if;
	End Process u_rSysRstB;
	
	SysRst		<= not rSysRstB;
	
-----------------------------------------------------
-- HDMI Map
	
	-- HDMI test pattern generator
	u_TestPatt : TestPatt
	Port map
	(
		RstB			=> rSysRstB		,
		Clk				=> UserClk		,
		
		DipSwitch		=> DipSwitch	,
		
		HDMIReq			=> HDMIReq		,
		HDMIBusy		=> HDMIBusy		,
		
		HDMIFfWrEn		=> HDMIFfWrEn	,
		HDMIFfWrData	=> HDMIFfWrData	,
		HDMIFfWrCnt		=> HDMIFfWrCnt
	);
	
	-- Fill zeros 
	HDMIFfWrCnt(15 downto 8)	<= (others=>'1');
	HDMIFfRdCnt(15 downto 8)	<= (others=>'0');
	
	-- AsyncFifo TestPatt -> HDMI
	u_asyncfifo256x24 : asyncfifo256x24
	Port map
	(
		aclr			=> SysRst			,
		
		wrclk			=> UserClk			,
		wrreq			=> HDMIFfWrEn		,
		data			=> HDMIFfWrData		,
		wrfull			=> open				,
		wrusedw			=> HDMIFfWrCnt(7 downto 0),
		
		rdclk			=> HDMIUserClk		,
		rdreq			=> HDMIFfRdEn		,
		q				=> HDMIFfRdData		,
		rdempty			=> HDMIFfEmpty		,
		rdusedw			=> HDMIFfRdCnt(7 downto 0)
	);
	
	-- HDMI Display interface
	u_HDMI : HDMI
	Port map
	(
		RstB			=> rSysRstB			,
		Clk				=> UserClk			,
		
		HDMIReq			=> HDMIReq			,
		HDMIBusy		=> HDMIBusy			,
		HDMIStatus		=> HDMIStatus		,
		HDMIUserClk		=> HDMIUserClk		,
		
		HDMIFfRdEn		=> HDMIFfRdEn		,
		HDMIFfRdData	=> HDMIFfRdData		,
		HDMIFfEmpty		=> HDMIFfEmpty		,
		HDMIFfRdCnt		=> HDMIFfRdCnt		,
		
		HDMI_TX_INT		=> HDMI_TX_INT		,
		HDMI_I2C_SCL	=> HDMI_I2C_SCL		,
		HDMI_I2C_SDA	=> HDMI_I2C_SDA		,
		
		HDMI_TX_CLK		=> HDMI_TX_CLK		,
		HDMI_TX_D		=> HDMI_TX_D		,
		HDMI_TX_DE		=> HDMI_TX_DE		,
		HDMI_TX_HS		=> HDMI_TX_HS		,
		HDMI_TX_VS		=> HDMI_TX_VS
	);

End Architecture rtl;