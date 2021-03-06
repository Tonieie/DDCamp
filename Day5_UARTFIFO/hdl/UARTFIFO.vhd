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
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     UARTFIFO.vhd
-- Title        Top
--
-- Company      Design Gateway Co., Ltd.
-- Project      RxTx
-- PJ No.       
-- Syntax       VHDL
-- Note         

-- Version      1.00
-- Author       
-- Date         
-- Remark       New Creation
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.all;
use IEEE.std_logic_UNSIGNED.all;

Entity UARTFIFO Is
	Port
	(
		RstB		: in	std_logic;			-- use push button Key0 (active low)
		Button		: in	std_logic;			-- use push button Key1 (active low)
		Clk50		: in	std_logic;
		
		TxSerData	: out	std_logic;
		RxSerData	: in	std_logic;
		RESERVED	: in	std_logic_vector( 1 downto 0 )
	);
End Entity UARTFIFO;

Architecture rtl Of UARTFIFO Is

	-- Code Rx
	Component PLL50 Is
	Port
	(
		areset		: in 	std_logic;
		inclk0		: in 	std_logic;
		c0			: out 	std_logic;
		locked		: out 	std_logic 
	);
	End Component;
	
	Component RxSerial Is
	Port
	(
		RstB		: in	std_logic;
		Clk			: in	std_logic;
		
		SerDataIn	: in	std_logic;
		
		RxFfFull	: in	std_logic;
		RxFfWrData	: out	std_logic_vector( 7 downto 0 );
		RxFfWrEn	: out	std_logic
	);
	End Component RxSerial;
	
	-- TxSerial
	Component TxSerial Is
	Port
	(
		RstB		: in	std_logic;
		Clk			: in	std_logic;
		
		TxFfEmpty	: in	std_logic;
		TxFfRdData	: in	std_logic_vector( 7 downto 0 );
		TxFfRdEn	: out	std_logic;
		
		SerDataOut	: out	std_logic
	);
	End Component TxSerial;
		
	-- Fifo
	Component Fifo4kx8 IS
	Port
	(
		aclr		: in 	std_logic;
		clock		: in	std_logic;

		wrreq		: in	std_logic;
		data		: in	std_logic_vector( 7 downto 0 );
		full		: out	std_logic;

		rdreq		: in	std_logic;
		q			: out	std_logic_vector( 7 downto 0 );
		empty		: out	std_logic;

		usedw		: out	std_logic_vector( 11 downto 0 )
	);
	End Component Fifo4kx8;
	
----------------------------------------------------------------------------------
-- Constant declaration
----------------------------------------------------------------------------------

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
	signal	rSysRstB		: std_logic;
	signal	SysRst			: std_logic;
	signal	rRstBCnt		: std_logic_vector( 22 downto 0 ) := (others=>'0');	
	signal	rRstBUser		: std_logic;

	--Fifo4kx8
	signal	wFfFull			: std_logic;
	signal	wFfEmpty		: std_logic;
	signal	rFfRdReq		: std_logic;
	signal	rFfWrReq		: std_logic;
	signal	rFfRdData		: std_logic_vector(7 downto 0);
	signal	rFfWrData		: std_logic_vector(7 downto 0);

	--Signal for Button Enable Tx
	signal	rTxFfEmpty		: std_logic;
	signal	wTxFfEmpty		: std_logic;

	-- Debounce
	signal	rButtonCnt		: std_logic_vector( 22 downto 0 );	

	type StateType	is
		(
			stIdle,
			stWaitEnd
		);
	signal rState	:	StateType;
	
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
	
	u_rRstBCnt : Process (Clk50) Is
	Begin
		if ( rising_edge(Clk50) ) then
			if ( RstB='0' ) then
				rRstBCnt	<= (others=>'0');
			else
				if ( rRstBCnt(22)='1' ) then
					rRstBCnt	<= rRstBCnt;
				else
					rRstBCnt	<= rRstBCnt + 1;
				end if;
			end if;
		end if;
	End Process u_rRstBCnt;
	
	u_rSysRstB : Process (UserClk) Is
	Begin
		if ( rising_edge(UserClk) ) then
			rPLLLockUser	<= rPLLLockUser(0) & PLLLock;
			rRstBUser		<= rRstBCnt(22);	
			rSysRstB		<= rPLLLockUser(1) and rRstBUser;
		end if;
	End Process u_rSysRstB;
	
	SysRst		<= not rSysRstB;

-----------------------------------------------------
-- Debounce Button

	u_rButtonCnt : Process (UserClk) Is
	Begin
		if ( rising_edge(UserClk) ) then
			if ( rSysRstB='0' ) then
				rButtonCnt	<= (others=>'0');
			else
				if ( Button='0' ) then
					if ( rButtonCnt(22)='1' ) then
						rButtonCnt	<= rButtonCnt;
					else
						rButtonCnt	<= rButtonCnt + 1;
					end if;
				else
					rButtonCnt	<= (others=>'0');
				end if;
			end if;
		end if;
	End Process u_rButtonCnt;
	
	u_rTxFfEmpty: process(UserClk)
	begin
		if rising_edge(UserClk) then
			if rSysRstB = '0' then
				rTxFfEmpty	<=	'1';
			else
				if rState = stWaitEnd then
					rTxFfEmpty <= '0';
				else
					rTxFfEmpty <= '1';
				end if ;
			end if;
		end if;
	end process u_rTxFfEmpty;

	wTxFfEmpty	<=	wFfEmpty or rTxFfEmpty;

	u_rState: process(UserClk)
	begin
		if rising_edge(UserClk) then
			if rSysRstB = '0' then
				rState	<=	stIdle;
			else
				case( rState ) is
				
					when stIdle =>
						if rButtonCnt(22) = '1' then
							rState	<=	stWaitEnd;
						else
							rState	<=	stIdle;
						end if;
					
					when stWaitEnd	=>
						if wFfEmpty = '1' then
							rState	<=	stIdle;
						else
							rState	<=	stWaitEnd;
						end if ;
				
				end case ;
				
			end if;
		end if;
	end process u_rState;



-----------------------------------------------------
-- RxSerial -> FIFO -> TxSerial
	
	u_RxSerial : RxSerial
	Port map
	(
		RstB		=> rSysRstB		,
		Clk			=> UserClk		,
		
		SerDataIn	=> RxSerData	,

		RxFfFull	=> wFfFull		,
		RxFfWrData	=> rFfWrData	,
		RxFfWrEn	=> rFfWrReq	
	);
	
	--FFifofF
	u_Fifo4kx8 : Fifo4kx8
	Port map
	(
		aclr		=> SysRst		,
		clock		=> UserClk		,

		wrreq		=> rFfWrReq		,
		data		=> rFfWrData	,
		full		=> wFfFull		,

		rdreq		=> rFfRdReq		,
		q			=> rFfRdData	,
		empty		=> wFfEmpty		,

		usedw		=> open
	);
	
	-- TxSerial
	u_TxSerial : TxSerial
	Port map
	(
		RstB		=> rSysRstB		,
		Clk			=> UserClk	    ,

		TxFfEmpty	=> wTxFfEmpty	,
		TxFfRdData	=> rFfRdData	,
		TxFfRdEn	=> rFfRdReq		,

		SerDataOut	=> TxSerData
	);
	
End Architecture rtl;