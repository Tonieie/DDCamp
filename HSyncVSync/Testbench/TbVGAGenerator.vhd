library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
USE STD.TEXTIO.ALL;

Entity TbVGAGenerator Is
End Entity TbVGAGenerator;

Architecture HTWTestBench Of TbVGAGenerator Is

--------------------------------------------------------------------------------------------
-- Constant Declaration
--------------------------------------------------------------------------------------------

	constant	tClk			: time := 10 ns;
	
-------------------------------------------------------------------------
-- Component Declaration
-------------------------------------------------------------------------
	
	Component VGAGenerator Is
	Port (
        VGAClk			: in	std_logic;
		VGARstB			: in	std_logic;
		
		-- VGA Output Interface
		VGAClkB			: out	std_logic;
		VGADe			: out	std_logic;
		VGAHSync		: out	std_logic;
		VGAVSync		: out	std_logic;
		VGAData			: out	std_logic_vector( 23 downto 0 )
    );
	End Component VGAGenerator;
	
-------------------------------------------------------------------------
-- Signal Declaration
-------------------------------------------------------------------------
	
	signal	TM			: integer	range 0 to 65535;
	
	signal	Clk			: std_logic;		
	signal	RstB		: std_logic;
	
Begin

----------------------------------------------------------------------------------
-- Concurrent signal
----------------------------------------------------------------------------------
	
	u_Clk : Process
	Begin
		Clk		<= '1';
		wait for tClk/2;
		Clk		<= '0';
		wait for tClk/2;
	End Process u_Clk;
	
	u_VGAGenerator : VGAGenerator
	Port map
	( 
		RstB		=> RstB		,		
		Clk			=> Clk		,	

	);
	
-------------------------------------------------------------------------
-- Testbench
-------------------------------------------------------------------------

	u_Test : Process
	Begin
		-------------------------------------------
		-- TM=0 : Reset
		-------------------------------------------
		TM <= 0; wait for 1 ns;
		Report "TM=" & integer'image(TM); 
		RstB		<= '0';
		wait for 10*tClk;

		-------------------------------------------
		-- TM=1 : Check counter value
		-------------------------------------------	
		TM <= 1; wait for 1 ns;
		Report "TM=" & integer'image(TM); 

		RstB		<= '1';		
		
		--------------------------------------------------------
		TM <= 255; wait for 1 ns;
		wait for 20*tClk;
		Report "##### End Simulation #####" Severity Failure;		
		wait;
		
	End Process u_Test;

End Architecture HTWTestBench;