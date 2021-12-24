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
-- Filename     DDRTest.vhd
-- Title        Top
--
-- Company      Design Gateway Co., Ltd.
-- Project      DDCamp DDR-IP
-- PJ No.       
-- Syntax       VHDL
-- Note         

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

Entity DDRTest Is
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
		
		-- Basic IO Interface
		ReqBTN			: in	std_logic;							-- use push button Key1 (active low)
		CmdSW			: in	std_logic;							-- use slide switch SW0 (down low)
																	-- '0':write, '1':Read
		PattSW			: in	std_logic;							-- use slide switch SW1 (down low)
																	-- '0':Inc  , '1':Dec
		LED				: out	std_logic_vector( 7 downto 0 )		-- active low LED
	);
End Entity DDRTest;

Architecture rtl Of DDRTest Is

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
	
	Component TestPatt Is
	Port 
	(
		RstB			: in	std_logic;
		Clk				: in	std_logic;
		
		-- TestPatt Command I/F
		PattSel			: in	std_logic;	-- '0':Inc  , '1':Dec
		PattCmd			: in	std_logic;	-- '0':write, '1':Read
		PattReq			: in	std_logic;
		PattBusy		: out	std_logic;
		PattFail		: out	std_logic;
		
		-- MtDdr Interface
		-- Command Write I/F
		MtDdrWrReq		: out	std_logic;
		MtDdrWrBusy		: in	std_logic;
		MtDdrWrAddr		: out	std_logic_vector( 28 downto 7 );
		-- Write Fifo interface
		WrFfWrCnt		: in	std_logic_vector( 15 downto 0 );	-- Fifo write counter
		WrFfWrEn		: out	std_logic;							-- Fifo write enable
		WrFfWrData		: out	std_logic_vector( 31 downto 0 );	-- Fifo write data
		
		-- Command Read I/F
		MtDdrRdReq		: out	std_logic;
		MtDdrRdBusy		: in	std_logic;
		MtDdrRdAddr		: out	std_logic_vector( 28 downto 7 );
		-- Read Fifo interface
		RdFfRdCnt		: in	std_logic_vector( 15 downto 0 );	-- Fifo read counter
		RdFfRdData		: in	std_logic_vector( 31 downto 0 );	-- Fifo read data
		RdFfRdEn		: out	std_logic							-- Fifo read enable
	);
	End Component TestPatt;
	
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

	Component MtDdr Is
	Port 
	(	
		UserRstB		: in	std_logic;						-- Reset (Active low) (125MHz)
		UserClk			: in	std_logic;						-- User Clock (125MHz)
		
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

	-- Debounce Button
	signal	rDebCnt			: std_logic_vector( 15 downto 0 );
	signal	rReqBTN			: std_logic;
	signal	rReqBTNLat		: std_logic_vector( 1 downto 0 );
	
	-- User Control Interface
	signal	rPattSW			: std_logic;
	signal	rCmdSW			: std_logic;
	signal	rPattReq		: std_logic;
	signal	PattBusy		: std_logic;
	signal	PattFail		: std_logic;
	signal	MemInitDone		: std_logic;
	
	-- FIFO
	signal	U2DdrFfWrEn		: std_logic;
	signal	U2DdrFfWrData	: std_logic_vector( 31 downto 0 );
	signal	U2DdrFfWrCnt	: std_logic_vector( 15 downto 0 );
	signal	U2DdrFfRdEn		: std_logic;
	signal	U2DdrFfRdData	: std_logic_vector( 63 downto 0 );
	signal	U2DdrFfRdCnt	: std_logic_vector( 15 downto 0 );
	
	signal	Ddr2UFfWrEn		: std_logic;
	signal	Ddr2UFfWrData	: std_logic_vector( 63 downto 0 );
	signal	Ddr2UFfWrCnt	: std_logic_vector( 15 downto 0 );
	signal	Ddr2UFfRdEn		: std_logic;
	signal	Ddr2UFfRdData	: std_logic_vector( 31 downto 0 );
	signal	Ddr2UFfRdCnt	: std_logic_vector( 15 downto 0 );
	
	-- MtDdr Interface
	signal	MtDdrWrReq		: std_logic;
	signal	MtDdrWrBusy		: std_logic;
	signal	MtDdrWrAddr		: std_logic_vector( 28 downto 7 );
	signal	MtDdrRdReq		: std_logic;
	signal	MtDdrRdBusy		: std_logic;
	signal	MtDdrRdAddr		: std_logic_vector( 28 downto 7 );
	
Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

	-- LED Status
	LED(0)			<= not PattBusy;	-- Busy Flag
	LED(1)			<= not PattFail;	-- Fail to verify data Flag
	LED(2)			<= not MemInitDone;
	LED(3)			<= not rPattReq;
	LED(4)			<= not MtDdrWrReq;
	LED(5)			<= not MtDdrWrBusy;
	LED(6)			<= not rCmdSW;	-- '0':write, '1':Read
	LED(7)			<= not rPattSW;	-- '0':Inc  , '1':Dec
	
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
-- Debounce Button

	-- Add input FF before using
	u_rReqBTN : Process (UserClk) Is
	Begin
		if ( rising_edge(UserClk) ) then
			rReqBTN		<= ReqBTN;
		end if;
	End Process u_rReqBTN;

	u_rDeCnt : Process (UserClk) Is
	Begin
		if ( rising_edge(UserClk) ) then
			if ( rSysRstB='0' ) then
				rDebCnt	<= x"0000";
			else
				-- Button is pressed or released 
				-- (Not equal to latch value)
				if ( rReqBTNLat(0)/=rReqBTN ) then
					rDebCnt	<= rDebCnt + 1;
				else
					rDebCnt	<= x"0000";
				end if;
			end if;
		end if;
	End Process u_rDeCnt;
	
	u_rReqBTNLat : Process (UserClk) Is
	Begin
		if ( rising_edge(UserClk) ) then
			if ( rSysRstB='0' ) then
				rReqBTNLat	<= "11";
			else
				-- Add FF to detect edge for counting rRdAddr
				rReqBTNLat(1)	<= rReqBTNLat(0);
				if ( rDebCnt=x"FFFF" ) then
					rReqBTNLat(0)	<= rReqBTN;
				else
					rReqBTNLat(0)	<= rReqBTNLat(0);
				end if;
			end if;
		end if;
	End Process u_rReqBTNLat;
	
-----------------------------------------------------
-- User Control Interface

	u_rPattReq : Process (UserClk) Is
	Begin
		if ( rising_edge(UserClk) ) then
			if ( rSysRstB='0' ) then
				rPattReq	<= '0';
			else
				-- when press the request button
				if ( rReqBTNLat="10" and PattBusy='0' ) then
					rPattReq	<= '1';
				elsif ( PattBusy='1' ) then
					rPattReq	<= '0';
				else
					rPattReq	<= rPattReq;
				end if;
			end if;
		end if;
	End Process u_rPattReq;
	
-----------------------------------------------------
-- DDR Interface
	
	-- Input FF
	u_rCmdSW : Process (UserClk) Is
	Begin
		if ( rising_edge(UserClk) ) then
			rPattSW		<= PattSW;
			rCmdSW		<= CmdSW;
		end if;
	End Process u_rCmdSW;
	
	-- DDR test pattern generator	
	u_TestPatt : TestPatt
	Port map
	(
		RstB			=> rSysRstB			,
		Clk				=> UserClk			,

		PattSel			=> rPattSW			,
		PattCmd			=> rCmdSW			,
		PattReq			=> rPattReq			,
		PattBusy		=> PattBusy			,
		PattFail		=> PattFail			,

		MtDdrWrReq		=> MtDdrWrReq		,
		MtDdrWrBusy		=> MtDdrWrBusy		,
		MtDdrWrAddr		=> MtDdrWrAddr		,
		WrFfWrCnt		=> U2DdrFfWrCnt		,
		WrFfWrEn		=> U2DdrFfWrEn		,
		WrFfWrData		=> U2DdrFfWrData	,

		MtDdrRdReq		=> MtDdrRdReq		,
		MtDdrRdBusy		=> MtDdrRdBusy		,
		MtDdrRdAddr		=> MtDdrRdAddr		,
		RdFfRdCnt		=> Ddr2UFfRdCnt		,
		RdFfRdData		=> Ddr2UFfRdData	,
		RdFfRdEn		=> Ddr2UFfRdEn
	);
	
--	-- Almost Full condition for user logic
--	U2DdrFfAFull		<= '1' when U2DdrFfWrCnt(7 downto 5)="111" else '0';
	
	-- Fill Fifo count 
	Ddr2UFfWrCnt(15 downto 7)	<= (others=>'1');
	U2DdrFfWrCnt(15 downto 8)	<= (others=>'1');
	Ddr2UFfRdCnt(15 downto 8)	<= (others=>'0');
	U2DdrFfRdCnt(15 downto 7)	<= (others=>'0');
	
	-- Fifo UserData -> DDR
	u_U2DdrFf : fifo256x32to64
	Port map
	(
		aclr			=> SysRst			,
		
		wrclk			=> UserClk			,
		wrreq			=> U2DdrFfWrEn		,
		data			=> U2DdrFfWrData	,
		wrfull			=> open				,
		wrusedw			=> U2DdrFfWrCnt(7 downto 0),
		
		rdclk			=> UserClk			,
		rdreq			=> U2DdrFfRdEn		,
		q				=> U2DdrFfRdData	,
		rdempty			=> open				,
		rdusedw			=> U2DdrFfRdCnt(6 downto 0)
	);
	
	-- Fifo UserData <- DDR
	u_Ddr2UFf : fifo256x64to32
	Port map
	(
		aclr			=> SysRst			,
		
		wrclk			=> UserClk			,
		wrreq			=> Ddr2UFfWrEn		,
		data			=> Ddr2UFfWrData	,
		wrfull			=> open				,
		wrusedw			=> Ddr2UFfWrCnt(6 downto 0),
		
		rdclk			=> UserClk			,
		rdreq			=> Ddr2UFfRdEn		,
		q				=> Ddr2UFfRdData	,
		rdempty			=> open				,
		rdusedw			=> Ddr2UFfRdCnt(7 downto 0)
	);
	
	-- DDR interface
	u_MtDdr : MtDdr
    Port map
	(
		UserRstB		=> rSysRstB			,
		UserClk			=> UserClk			,
		
		MemInitDone		=> MemInitDone		,
		
		MtDdrWrReq		=> MtDdrWrReq		,
		MtDdrWrBusy		=> MtDdrWrBusy		,
		MtDdrWrAddr		=> MtDdrWrAddr		,
		WrFfRdEn		=> U2DdrFfRdEn		,
		WrFfRdData		=> U2DdrFfRdData	,
		WrFfRdCnt		=> U2DdrFfRdCnt		,
		
		MtDdrRdReq		=> MtDdrRdReq		,
		MtDdrRdBusy		=> MtDdrRdBusy		,
		MtDdrRdAddr		=> MtDdrRdAddr		,
		RdFfWrEn		=> Ddr2UFfWrEn		,
		RdFfWrData		=> Ddr2UFfWrData	,
		RdFfWrCnt		=> Ddr2UFfWrCnt		,
		
		DDR3_A			=> DDR3_A			,
		DDR3_BA			=> DDR3_BA			,
		DDR3_CAS_n		=> DDR3_CAS_n		,
		DDR3_CK_n		=> DDR3_CK_n		,
		DDR3_CK_p		=> DDR3_CK_p		,
		DDR3_CKE		=> DDR3_CKE			,
		DDR3_CLK_50		=> DDR3_CLK_50		,
		DDR3_CS_n		=> DDR3_CS_n		,
		DDR3_DM			=> DDR3_DM			,
		DDR3_DQ			=> DDR3_DQ			,
		DDR3_DQS_n		=> DDR3_DQS_n		,
		DDR3_DQS_p		=> DDR3_DQS_p		,
		DDR3_ODT		=> DDR3_ODT			,
		DDR3_RAS_n		=> DDR3_RAS_n		,
		DDR3_RESET_n	=> DDR3_RESET_n		,
		DDR3_WE_n		=> DDR3_WE_n		
	);

End Architecture rtl;