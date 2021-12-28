----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     UserRdDdr.vhd
-- Title        Top
--
-- Company      Design Gateway Co., Ltd.
-- Project      DDCamp
-- PJ No.       
-- Syntax       VHDL
-- Note         

-- Version      1.00
-- Author       B.Attapon
-- Date         2017/12/20
-- Remark       New Creation
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

Entity UserRdDdr Is
	Port
	(
		RstB			: in	std_logic;							-- use push button Key0 (active low)
		Clk				: in	std_logic;							-- clock input 100 MHz

		DipSwitch		: in 	std_logic_vector( 1 downto 0 );
		
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
End Entity UserRdDdr;

Architecture rtl Of UserRdDdr Is

----------------------------------------------------------------------------------
-- Component declaration
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Constant
----------------------------------------------------------------------------------
	constant	cEndPicAddrOffset	:	integer	:=	24479;
	constant	cEndColAddrOffset	:	integer	:=	31;
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	
	signal	rMemInitDone	: std_logic_vector( 1 downto 0 );
	signal	rHDMIReq		: std_logic;

	signal	rMtDdrRdReq		: std_logic;
	signal	rMtDdrRdAddr	: std_logic_vector(28 downto 7);

	type UserRdStateType is
		(
			stInit		,
			stReq		,
			stWtMtDone		
		);
	signal	rState			: UserRdStateType;

	signal	rRowCnt			: std_logic_vector(9 downto 0);
	signal	rColCnt			: std_logic_vector(9 downto 0);

	signal	rRdRowCnt		: std_logic_vector(1 downto 0);

	--DipSwitch Signal
	signal	rDipSw0Cnt		: std_logic_vector(1 downto 0);
	signal	rDipSw1Cnt		: std_logic_vector(1 downto 0);
	signal	rDipSw0			: std_logic_vector(1 downto 0);
	signal	rDipSw1			: std_logic_vector(1 downto 0);

	signal	rRowStartAddr	: std_logic_vector(23 downto 7);
	signal	rColStartAddr	: std_logic_vector(13 downto 7);
	signal	rStartAddr		: std_logic_vector(24 downto 7);
	
Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

	HDMIReq			<= rHDMIReq;

	MtDdrRdReq		<= rMtDdrRdReq;
	MtDdrRdAddr(28 downto 7)		<= rMtDdrRdAddr(28 downto 7); 

	URd2HFfWrEn	<=	D2URdFfWrEn;
	URd2HFfWrData(63 downto 0)	<=	D2URdFfWrData(63 downto 0);
	D2URdFfWrCnt(15 downto 0)	<=	URd2HFfWrCnt(15 downto 0);

	
----------------------------------------------------------------------------------
-- DFF 
----------------------------------------------------------------------------------
	
	u_rMemInitDone : Process (Clk) Is
	Begin
		if ( rising_edge(Clk) ) then
			if ( RstB='0' ) then
				rMemInitDone	<= "00";
			else
				-- Use rMemInitDone(1) in your design
				rMemInitDone	<= rMemInitDone(0) & MemInitDone;
			end if;
		end if;
	End Process u_rMemInitDone;

	u_rHDMIReq : Process (Clk) Is
	Begin
		if ( rising_edge(Clk) ) then
			if ( RstB='0' ) then
				rHDMIReq	<= '0';
			else
				if ( HDMIBusy='0' and rMemInitDone(1)='1' ) then
					rHDMIReq	<= '1';
				elsif ( HDMIBusy='1' )  then
					rHDMIReq	<= '0';
				else
					rHDMIReq	<= rHDMIReq;
				end if;
			end if;
		end if;
	End Process u_rHDMIReq;

	u_rMtDdrRdReq: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rMtDdrRdReq	<=	'0';
			else
				if (rState = stReq) then
					rMtDdrRdReq	<=	'1';
				else
					rMtDdrRdReq	<=	'0';
				end if ;
			end if;
		end if;
	end process u_rMtDdrRdReq;

	u_rMtDdrRdAddr: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rMtDdrRdAddr(28 downto 7)	<= "0000" & rStartAddr(24 downto 7);
			else
				if( (rState = stWtMtDone) and (MtDdrRdBusy = '0') ) then
					if ( rMtDdrRdAddr(26 downto 7) = (rStartAddr(24 downto 7) + cEndPicAddrOffset) ) and ( rRdRowCnt = 3 ) then
						rMtDdrRdAddr(28 downto 7)	<= "0000" & rStartAddr(24 downto 7);
					elsif rMtDdrRdAddr(13 downto 7) = ( rColStartAddr(13 downto 7) + cEndColAddrOffset ) then
						if rRdRowCnt = 3 then
                            rMtDdrRdAddr(28 downto 7)	<= rMtDdrRdAddr(28 downto 7) + 97;
						else
							rMtDdrRdAddr(28 downto 7)	<= rMtDdrRdAddr(28 downto 7) - 31;
						end if ;
					else
						rMtDdrRdAddr(28 downto 7)	<= rMtDdrRdAddr(28 downto 7) + 1;
					end if ;
				else
					rMtDdrRdAddr(28 downto 7)	<= rMtDdrRdAddr(28 downto 7);
				end if;

			end if;
		end if;
	end process u_rMtDdrRdAddr;

	u_rRdRowCnt: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rRdRowCnt	<=	"00";
			else
				if (rState = stWtMtDone) and (MtDdrRdBusy = '0') and ( rMtDdrRdAddr(13 downto 7) = rColStartAddr(13 downto 7) + cEndColAddrOffset ) then
					rRdRowCnt	<=	rRdRowCnt + 1;
				else
					rRdRowCnt	<=	rRdRowCnt;
				end if ;
			end if;
		end if;
	end process u_rRdRowCnt;

----------------------------------------------------------------------------------
-- DipSwitch Counting 
----------------------------------------------------------------------------------
	u_rDipSw0: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rDipSw0(1 downto 0)	<=	DipSwitch(0) & DipSwitch(0);
			else
				rDipSw0(1 downto 0)	<=	rDipSw0(0) & DipSwitch(0);
			end if;
		end if;
	end process u_rDipSw0;

	u_rDipSw1: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rDipSw1(1 downto 0)	<=	DipSwitch(1) & DipSwitch(1);
			else
				rDipSw1(1 downto 0) 	<=	rDipSw1(0) & DipSwitch(1);
			end if;
		end if;
	end process u_rDipSw1;

	u_rDipSw0Cnt: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rDipSw0Cnt	<=	"00";
			else
				--detect rising edge
				if rDipSw0(1 downto 0) = "01" then
					rDipSw0Cnt	<=	rDipSw0Cnt + 1;
				else
					rDipSw0Cnt	<=	rDipSw0Cnt;
				end if;
			end if;
		end if;
	end process u_rDipSw0Cnt;

	u_rDipSw1Cnt: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rDipSw1Cnt	<=	"00";
			else
				--detect rising edge
				if rDipSw1(1 downto 0) = "01" then
					rDipSw1Cnt	<=	rDipSw1Cnt + 1;
				else
					rDipSw1Cnt	<=	rDipSw1Cnt;
				end if;
			end if;
		end if;
	end process u_rDipSw1Cnt;

----------------------------------------------------------------------------------
-- Start Address Signals
----------------------------------------------------------------------------------

	u_rColStartAddr: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rColStartAddr(13 downto 7)	<=	(others => '0');
			else
				case( rDipSw0Cnt ) is
				
					when "01" =>
						rColStartAddr(13 downto 7)	<=	conv_std_logic_vector(32,7);

					when "10" =>
						rColStartAddr(13 downto 7)	<=	conv_std_logic_vector(64,7);
				
					when "11" =>
						rColStartAddr(13 downto 7)	<=	conv_std_logic_vector(96,7);

					when others =>
						rColStartAddr(13 downto 7)	<=	(others => '0');

				end case ;
			end if;
		end if;
	end process u_rColStartAddr;

	u_rRowStartAddr: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rRowStartAddr(23 downto 7)	<=	(others => '0');
			else
				case( rDipSw1Cnt ) is
				
					when "01" =>
						rRowStartAddr(23 downto 7)	<=	conv_std_logic_vector(24576,17);

					when "10" =>
						rRowStartAddr(23 downto 7)	<=	conv_std_logic_vector(49152,17);
				
					when "11" =>
						rRowStartAddr(23 downto 7)	<=	conv_std_logic_vector(73728,17);

					when others =>
						rRowStartAddr(23 downto 7)	<=	(others => '0');

				end case ;
			end if;
		end if;
	end process u_rRowStartAddr;

	u_rStartAddr: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rStartAddr(24 downto 7)	<=	(others => '0');
			else
				rStartAddr(24 downto 7)	<=	('0' & rRowStartAddr(23 downto 7)) + rColStartAddr(13 downto 7);
			end if;
		end if;
	end process u_rStartAddr;


----------------------------------------------------------------------------------
-- State Machine 
----------------------------------------------------------------------------------
	u_rState: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rState	<=	stInit;
			else
				case( rState ) is

					when stInit	=>
						if ( rMemInitDone(1) = '1' ) then
							rState	<= stReq;
						else
							rState	<= stInit;
						end if ;

					when stReq	=>
						if ( MtDdrRdBusy = '1' ) then
							rState 	<=	stWtMtDone;
						else
							rState 	<=	stReq;
						end if ;

					when stWtMtDone =>
						if ( MtDdrRdBusy = '0' ) then
							rState 	<=	stReq;
						else
							rState 	<=	stWtMtDone;
						end if;
				
				end case ;
			end if;
		end if;
	end process u_rState;
	
End Architecture rtl;