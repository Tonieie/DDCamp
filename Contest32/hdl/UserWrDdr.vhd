----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     UserWrDdr.vhd
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

Entity UserWrDdr Is
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

		-- Dwn2UWrFf I/F
		Ds2UWrFfRdEn	: out	std_logic;
		Ds2UWrFfRdData	: in	std_logic_vector( 63 downto 0 );
		Ds2UWrFfRdCnt	: in	std_logic_vector( 15 downto 0 );
		
		-- UWr2DFf I/F
		UWr2DFfRdEn		: in	std_logic;
		UWr2DFfRdData	: out	std_logic_vector( 63 downto 0 );
		UWr2DFfRdCnt	: out	std_logic_vector( 15 downto 0 )
	);
End Entity UserWrDdr;

Architecture rtl Of UserWrDdr Is

----------------------------------------------------------------------------------
-- Component declaration
----------------------------------------------------------------------------------
	
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	
	signal	rMemInitDone	: std_logic_vector( 1 downto 0 );

	signal	rMtDdrWrReq		: std_logic;
	signal	rMtDdrWrAddr	: std_logic_vector(28 downto 7);

	signal	rMtDdrWrAddrDs	: std_logic_vector(28 downto 7);
	signal	rMtDdrWrAddrNm	: std_logic_vector(28 downto 7);

	type	UserWrStateType	is
		(
			stInit		,
			stCheckFf	,
			stReq		,
			stWtMtDone	
		);
	signal	rState			: UserWrStateType;

	signal rRowDsReqCnt		: std_logic_vector(2 downto 0);
	signal rRowNmReqCnt		: std_logic_vector(6 downto 0);

	signal rUWr2DFfRdData	: std_logic_vector(63 downto 0);
	signal rUWr2DFfRdCnt	: std_logic_vector(15 downto 0);

	signal rDs2UWrFfRdEn	: std_logic;
	signal rT2UWrFfRdEn		: std_logic;

	--Select signal for selecting between Normal ('0') or DownScale ('1')
	signal rSelIn			: std_logic;

Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

	Ds2UWrFfRdEn	<=	rDs2UWrFfRdEn;
	T2UWrFfRdEn		<=	rT2UWrFfRdEn;

	--Bypass
	UWr2DFfRdData(63 downto 0)	<=	rUWr2DFfRdData(63 downto 0);
	UWr2DFfRdCnt(15 downto 0)	<=	rUWr2DFfRdCnt(15 downto 0);
	
	MtDdrWrReq		<=	rMtDdrWrReq;
	MtDdrWrAddr(28 downto 7)		<=	rMtDdrWrAddr(28 downto 7);

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

	u_rMtDdrWrReq: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rMtDdrWrReq		<=	'0';
			else
				if rState = stReq then
					rMtDdrWrReq		<=	'1';
				else
					rMtDdrWrReq		<=	'0';
				end if ;
			end if;
		end if;
	end process u_rMtDdrWrReq;

	u_rMtDdrWrAddrNm: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				-- start at addr = 98176 (last row first col which is the first received pixcel's addr)
				rMtDdrWrAddrNm(28 downto 7)	<=	"00" & x"17F80";
			else
				if( (rSelIn = '0') and (rState = stWtMtDone) and (MtDdrWrBusy = '0') ) then
					-- if writen to the last col then go back to the upper line
					if rRowNmReqCnt = 127 then
						rMtDdrWrAddrNm(28 downto 7)	<= rMtDdrWrAddrNm(28 downto 7) - 255;
					-- else go to next collumn
					else
						rMtDdrWrAddrNm(28 downto 7)	<= rMtDdrWrAddrNm(28 downto 7) + 1;
					end if ;
				else
					rMtDdrWrAddrNm(28 downto 7)	<= rMtDdrWrAddrNm(28 downto 7);
				end if;
			end if;
		end if;
	end process u_rMtDdrWrAddrNm;
	
	u_rMtDdrWrAddrDs: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				-- start at addr = 24544 (last row first col which is the first received pixcel's addr)
				rMtDdrWrAddrDs(28 downto 7)	<=	"10" & x"05FF8";
			else
				if( (rSelIn = '1') and (rState = stWtMtDone) and (MtDdrWrBusy = '0') ) then
					-- check if reached first row last col
					if rMtDdrWrAddrDs(26 downto 7) = 18463 then
						if rMtDdrWrAddrDs(28 downto 27) = "11" then
							rMtDdrWrAddrDs(28 downto 27)	<=	"10";
						else
							rMtDdrWrAddrDs(28 downto 27)	<=	"11";
						end if ;
						rMtDdrWrAddrDs(26 downto 7)	<= x"05FF8";
					-- if writen to the last col then go back to the upper line
					elsif rRowDsReqCnt = 7 then
						rMtDdrWrAddrDs(28 downto 7)	<= rMtDdrWrAddrDs(28 downto 7) - 39;
					-- else go to next collumn
					else
						rMtDdrWrAddrDs(28 downto 7)	<= rMtDdrWrAddrDs(28 downto 7) + 1;
					end if ;
				else
					rMtDdrWrAddrDs(28 downto 7)	<= rMtDdrWrAddrDs(28 downto 7);
				end if;
			end if;
		end if;
	end process u_rMtDdrWrAddrDs;

----------------------------------------------------------------------------------
-- Multiplexer to Select between Normal Picture Fifo (rSelIn = '0') or DownScale Picture Fifo (rSelIn = '1') 
----------------------------------------------------------------------------------
	u_rSelIn: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rSelIn <= '0';
			else
				if rState = stCheckFf then
					if Ds2UWrFfRdCnt( 15 downto 4 ) /= 0 then
						rSelIn <= '1';
					elsif T2UWrFfRdCnt( 15 downto 4 ) /= 0 then
						rSelIn <= '0';
					else
						rSelIn <= rSelIn;
					end if ;
				else
					rSelIn <= rSelIn;
				end if;
			end if;
		end if;
	end process u_rSelIn;

	u_rMtDdrWrAddr: process(Clk)
	begin
			if rSelIn = '1' then
				rMtDdrWrAddr(28 downto 7)	<=	rMtDdrWrAddrDs(28 downto 7);
			else
				rMtDdrWrAddr(28 downto 7)	<=	rMtDdrWrAddrNm(28 downto 7);
			end if ;
	end process u_rMtDdrWrAddr;

	u_rUWr2DFfRdData: process(Clk)
	begin
			if rSelIn = '1' then
				rUWr2DFfRdData(63 downto 0)	<=	Ds2UWrFfRdData(63 downto 0);
			else
				rUWr2DFfRdData(63 downto 0)	<=	T2UWrFfRdData(63 downto 0);
			end if ;
	end process u_rUWr2DFfRdData;

	u_rUWr2DFfRdCnt: process(Clk)
	begin
			if rSelIn = '1' then
				rUWr2DFfRdCnt(15 downto 0)	<=	Ds2UWrFfRdCnt(15 downto 0);
			else
				rUWr2DFfRdCnt(15 downto 0)	<=	T2UWrFfRdCnt(15 downto 0);
			end if ;
	end process u_rUWr2DFfRdCnt;

	u_rDs2UWrFfRdEn: process(Clk)
	begin
			if RstB = '0' then
				rDs2UWrFfRdEn	<=	'0';
			else
				if rSelIn = '1' then
					rDs2UWrFfRdEn	<=	UWr2DFfRdEn;
				else
					rDs2UWrFfRdEn	<=	'0';
				end if ;
			end if;
	end process u_rDs2UWrFfRdEn;

	u_rT2UWrFfRdEn: process(Clk)
	begin
			if RstB = '0' then
				rT2UWrFfRdEn	<=	'0';
			else
				if rSelIn = '0' then
					rT2UWrFfRdEn	<=	UWr2DFfRdEn;
				else
					rT2UWrFfRdEn	<=	'0';
				end if ;
			end if;
	end process u_rT2UWrFfRdEn;

----------------------------------------------------------------------------------
-- Count up when Request finished (Seperate for Normal Picture fifo and DownScale Picture fifo)
----------------------------------------------------------------------------------

	u_rRowNmReqCnt: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rRowNmReqCnt	<=	(others => '0');
			else
				if( (rSelIn = '0') and (rState = stWtMtDone) and (MtDdrWrBusy = '0') ) then
					rRowNmReqCnt	<=	rRowNmReqCnt + 1;
				else
					rRowNmReqCnt	<=	rRowNmReqCnt;
				end if;
			end if;
		end if;
	end process u_rRowNmReqCnt;

	u_rRowDsReqCnt: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rRowDsReqCnt	<=	(others => '0');
			else
				if( (rSelIn = '1') and (rState = stWtMtDone) and (MtDdrWrBusy = '0') ) then
					rRowDsReqCnt	<=	rRowDsReqCnt + 1;
				else
					rRowDsReqCnt	<=	rRowDsReqCnt;
				end if;
			end if;
		end if;
	end process u_rRowDsReqCnt;


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
				
					when stInit =>
						if rMemInitDone(1) = '1' then
							rState	<=	stCheckFf;
						else
							rState	<=	stInit;
						end if ;	
					
					when stCheckFf	=>
						--if one or two fifo(s) have data then go to Request state
						if ( ( T2UWrFfRdCnt( 15 downto 4 ) /= 0 ) or ( Ds2UWrFfRdCnt( 15 downto 4 ) /= 0 ) ) then
							rState	<=	stReq;
						else
							rState	<=	stCheckFf;
						end if ;

					when stReq	=>
						if MtDdrWrBusy = '1' then
							rState	<=	stWtMtDone;
						else
							rState	<=	stReq;
						end if ;

					when stWtMtDone	=>
						if MtDdrWrBusy = '0' then
							rState	<=	stCheckFf;
						else
							rState	<=	stWtMtDone;
						end if ;
				
				end case ;
			end if;
		end if;
	end process u_rState;

End Architecture rtl;