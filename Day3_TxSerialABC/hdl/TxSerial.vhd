library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

Entity TxSerial Is
Port(
	RstB		: in	std_logic;
	Clk			: in	std_logic;
	
	TxFfEmpty	: in	std_logic;
	TxFfRdData	: in	std_logic_vector( 7 downto 0 );
	TxFfRdEn	: out	std_logic;
	
	SerDataOut	: out	std_logic
);
End Entity TxSerial;


Architecture rtl Of TxSerial Is

----------------------------------------------------------------------------------
-- Constant declaration
----------------------------------------------------------------------------------

	constant	cBaudRate	:	integer	:=	54;

----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------

	type SerStateType is
		(
			stIdle,
			stRdReq,
			stWtData,
			stWtEnd
		);
	signal rState	: SerStateType;

	signal	rBaudCnt	: std_logic_vector(9 downto 0);
	signal	rBaudEnd	: std_logic;

	signal	rSerDataOut	: std_logic_vector(9 downto 0);
	signal 	rTxFfRdEn	: std_logic_vector(1 downto 0);

	signal	rDataCnt	: std_logic_vector(3 downto 0);

Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

	TxFfRdEn	<=	rTxFfRdEn(0);
	SerDataOut	<=	rSerDataOut(0);

----------------------------------------------------------------------------------
-- DFF 
----------------------------------------------------------------------------------

	------------------------------
	--	Counter
	------------------------------

	u_rBaudCnt: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rBaudCnt	<=	conv_std_logic_vector(cBaudRate,10);
			elsif rBaudCnt = 1 or rTxFfRdEn(1) = '1' then
				rBaudCnt	<=	conv_std_logic_vector(cBaudRate,10);
			else
				rBaudCnt	<=	rBaudCnt-1;
			end if;
		end if;
	end process u_rBaudCnt;

	u_rBaudEnd: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rBaudEnd	<=	'0';
			elsif rBaudCnt = 1	then
				rBaudEnd	<=	'1';
			else 
				rBaudEnd	<= '0';
			end if;
		end if;
	end process u_rBaudEnd;

	u_rDataCnt: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rDataCnt <= (others => '0');
			else
				if rBaudEnd = '1' then
					if rDataCnt = 9 then
						rDataCnt <= (others => '0');
					else
						rDataCnt <= rDataCnt + 1;
					end if;
				elsif rTxFfRdEn(1) = '1' then
					rDataCnt <= (others => '0');
				else
					rDataCnt <= rDataCnt;
				end if ;
			end if;
		end if;
	end process u_rDataCnt;

	------------------------------
	--	Shift Register
	------------------------------
	u_rTxFfRdEn: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rTxFfRdEn	<=	"00";
			else	
				rTxFfRdEn(1)	<=	rTxFfRdEn(0);
				if rState = stRdReq then
					rTxFfRdEn(0)	<=	'1';
				else
					rTxFfRdEn(0)	<=	'0';
				end if ;
				
			end if;
		end if;
	end process u_rTxFfRdEn;

	u_rSerDataOut: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rSerDataOut	<=	(others => '1');
			elsif rTxFfRdEn(1)	= '1' then
				rSerDataOut	<=	'1' & TxFfRdData & '0';
			elsif rBaudEnd = '1' then
				rSerDataOut	<= '1'& rSerDataOut(9 downto 1);
			else
				rSerDataOut	<= rSerDataOut;
			end if;
		end if;
	end process u_rSerDataOut;

	------------------------------
	--	State Machine
	------------------------------

	u_rState: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rState	<=	stIdle;
			else
				case( rState ) is
				
					when stIdle =>
						if TxFfEmpty = '0' then
							rState	<=	stRdReq;
						else
							rState	<=	stIdle;
						end if;
					
					when stRdReq =>
						rState	<=	stWtData;

					when stWtData =>
						if rTxFfRdEn(1) = '1' then
							rState <= stWtEnd;	
						else
							rState <= stWtData;
						end if ;
					
					when stWtEnd =>
						if rDataCnt = 9 and rBaudEnd = '1' then
							rState <= stIdle;
						else
							rState <= stWtEnd;
						end if ;
				
				end case ;
			end if;
		end if;
	end process u_rState;
	
End Architecture rtl;