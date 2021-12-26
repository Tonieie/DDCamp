library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
USE STD.TEXTIO.ALL;

Entity TbDownScale Is
End Entity TbDownScale;

Architecture HTWTestBench Of TbDownScale Is

--------------------------------------------------------------------------------------------
-- Constant Declaration
--------------------------------------------------------------------------------------------

	constant	tClk			: time := 1 ns;
	
-------------------------------------------------------------------------
-- Component Declaration
-------------------------------------------------------------------------
	
Component DownScale is
    port (
        Clk             : in std_logic;
        RstB            : in std_logic;

        Bm2DsData       : in std_logic_vector(23 downto 0);
        Bm2DsEn         : in std_logic;

        Ds2DsFfData     : out std_logic_vector(23 downto 0);
        Ds2DsFfEn       : out std_logic
    );
end Component DownScale;
	
-------------------------------------------------------------------------
-- Signal Declaration
-------------------------------------------------------------------------
	
	signal	TM			: integer	range 0 to 65535;
	
	signal	RstB		: std_logic;
	signal	Clk			: std_logic;

	signal	Bm2DsData	: std_logic_vector(23 downto 0);
	signal	Bm2DsEn		: std_logic;

	signal	Ds2DsFfData	: std_logic_vector(23 downto 0);
	signal	Ds2DsFfEn		: std_logic;

Begin

----------------------------------------------------------------------------------
-- Concurrent signal
----------------------------------------------------------------------------------
	
	u_RstB : Process
	Begin
		RstB	<= '0';
		wait for 20*tClk;
		RstB	<= '1';
		wait;
	End Process u_RstB;

	u_Clk : Process
	Begin
		Clk		<= '1';
		wait for tClk/2;
		Clk		<= '0';
		wait for tClk/2;
	End Process u_Clk;

	u_DownScale : DownScale
	Port map
	(
        Clk             => Clk	,
        RstB            => RstB	,

        Bm2DsData       => Bm2DsData(23 downto 0)	,
        Bm2DsEn         => Bm2DsEn	,
		
        Ds2DsFfData     => Ds2DsFfData(23 downto 0)	,
        Ds2DsFfEn       => Ds2DsFfEn	
	);
	
-------------------------------------------------------------------------
-- Testbench
-------------------------------------------------------------------------

	u_Test : Process
	variable	iBmData	:	std_logic_vector(23 downto 0);
	Begin
		-------------------------------------------
		-- TM=0 : Reset
		-------------------------------------------
		TM <= 0; wait for 1 ns;
		Report "TM=" & integer'image(TM); 

		wait for 30*tClk;

		-------------------------------------------
		-- TM=1 : Check counter value
		-------------------------------------------	
		TM <= 1; wait for 1 ns;
		Report "TM=" & integer'image(TM); 


		wait until rising_edge(Clk);

		for i in 0 to 4500 loop
			iBmData		:=	conv_std_logic_vector(i,24);
			Bm2DsData	<= iBmData;
			Bm2DsEn		<=	'1';
			wait until rising_edge(Clk);
			Bm2DsEn		<=	'0';
			for j in 0 to 59 loop
				wait until rising_edge(Clk);
			end loop;
		end loop;

		-------------------------------------------
		-- TM=2 : Check counter value
		-------------------------------------------	
		TM <= 2; wait for 1 ns;
		Report "TM=" & integer'image(TM); 

		--------------------------------------------------------
		TM <= 255; wait for 1 ns;
		wait for 20*tClk;
		Report "##### End Simulation #####" Severity Failure;		
		wait;
		
	End Process u_Test;

End Architecture HTWTestBench;