library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

Entity RxSerial Is
Port(
	RstB		: in	std_logic;
	Clk			: in	std_logic;
	
	SerDataIn	: in	std_logic;
	
	RxFfFull	: in	std_logic;
	RxFfWrData	: out	std_logic_vector( 7 downto 0 );
	RxFfWrEn	: out	std_logic
);
End Entity RxSerial;

Architecture rtl Of RxSerial Is

----------------------------------------------------------------------------------
-- Constant declaration
----------------------------------------------------------------------------------

	constant	cBaudRate	:	integer	:=	868;
	constant	cHalfBaudRate	:	integer	:=	434;

----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
	type SerStateType is
		(
			stIdle	,
			stStart	,
			stData	,
			stStop	,
			stLoad
		);
	signal rState : SerStateType;
	
	signal	rSerDataIn	: std_logic;

	signal	rBaudCnt	: std_logic_vector(9 downto 0);
	signal	rBaudEnd	: std_logic;

	signal	rDataCnt	: std_logic_vector(3 downto 0);

	signal	rRxFfWrData	: std_logic_vector(7 downto 0);
	signal	rRxFfWrEn	: std_logic;

Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------
	RxFfWrData	<=	rRxFfWrData;
	RxFfWrEn	<=	rRxFfWrEn;


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
			elsif rBaudCnt = 1 or rState = stIdle or (rState = stStart and rBaudCnt = conv_std_logic_vector(cHalfBaudRate,10)) then
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
					if rDataCnt = 7 then
						rDataCnt <= (others => '0');
					else
						rDataCnt <= rDataCnt + 1;
					end if ;
				elsif rState = stStart then
					rDataCnt <= (others => '0');
				else
					rDataCnt <=	rDataCnt;
				end if;
			end if;
		end if;
	end process u_rDataCnt;

	------------------------------
	--	Shift Register
	------------------------------

	u_rSerDataIn : Process (Clk) Is
	Begin
		if ( rising_edge(Clk) ) then
			rSerDataIn		<= SerDataIn;
		end if;
	End Process u_rSerDataIn;

	u_rRxFfWrData: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rRxFfWrData	<=	(others => '0');
			else
				if rBaudEnd = '1' and rState /= stStop then	
					rRxFfWrData(6 downto 0) <= rRxFfWrData(7 downto 1);
					rRxFfWrData(7)	<=	rSerDataIn;
				else
					rRxFfWrData(7 downto 0) <= rRxFfWrData(7 downto 0);
				end if;
			end if;
		end if;
	end process u_rRxFfWrData;

	u_rRxFfWrEn: process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rRxFfWrEn	<=	'0';
			elsif rState = stLoad and RxFfFull = '0' then
				rRxFfWrEn	<=	'1';
			else
				rRxFfWrEn	<=	'0';
			end if;
		end if;
	end process u_rRxFfWrEn;
	------------------------------
	--	State Machine
	------------------------------

	u_rState : process(Clk)
	begin
		if rising_edge(Clk) then
			if RstB = '0' then
				rState <= stIdle;
			else
				case rState is
					when stIdle =>
						if rSerDataIn = '0' then
							rState <= stStart;
						else
							rState <= stIdle;
						end if;
					
					when stStart =>
						if rBaudCnt = conv_std_logic_vector(cHalfBaudRate,10) then
							rState <= stData;
						else
							rState <= stStart;
						end if;
					
					when stData =>
						if rDataCnt = 7 and rBaudEnd = '1' then
							rState <= stStop;
						else
							rState <= stData;
						end if;
					
					when stStop =>
						if rBaudEnd = '1' then
							if rSerDataIn = '1' then
								rState <= stLoad;
							else
								rState <= stIdle;	--return to Idle if No stop bit found
							end if;
						else
							rState <= stStop;
						end if;
					
					when stLoad	=>
						rState <= stIdle;
					
				end case;
	
			end if;
		end if;
	end process u_rState;

End Architecture rtl;