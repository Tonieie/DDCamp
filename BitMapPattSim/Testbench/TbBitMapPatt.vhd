library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
USE STD.TEXTIO.ALL;

Entity TbBitMapPatt Is
End Entity TbBitMapPatt;

Architecture HTWTestBench Of TbBitMapPatt Is

--------------------------------------------------------------------------------------------
-- Constant Declaration
--------------------------------------------------------------------------------------------

	constant	tClk			: time := 1 ns;
	
-------------------------------------------------------------------------
-- Component Declaration
-------------------------------------------------------------------------
	
	Component BitMapPatt Is
    Port (
        RstB        : in    std_logic;
        Clk         : in    std_logic;

        RxBmWrEn    : in    std_logic;
        RxBmWrData  : in    std_logic_vector(7 downto 0);

        BmFfWrEn    : out   std_logic;
        BmFfWrData  : out   std_logic_vector(23 downto 0);
        BmFfWrCnt   : in    std_logic_vector(7 downto 0)
    );
	End Component BitMapPatt;
    
    Component RxSerial Is
    Port(
        RstB		: in	std_logic;
        Clk			: in	std_logic;
        
        SerDataIn	: in	std_logic;
        
        RxFfWrData	: out	std_logic_vector( 7 downto 0 );
        RxFfWrEn	: out	std_logic
    );
    End Component RxSerial;

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

    --BitMapPatt
    signal  RxBmWrEn    : std_logic;
    signal  RxBmWrData  : std_logic_vector(7 downto 0);

    signal  BmFfWrEn    : std_logic;
    signal  BmFfWrData  : std_logic_vector(23 downto 0);
    signal  BmFfWrCnt   : std_logic_vector(7 downto 0);

	signal	Ds2DsFfData	: std_logic_vector(23 downto 0);
	signal	Ds2DsFfEn	: std_logic;

    --Rxserial
	signal	SerDataIn	: std_logic;

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
	
	u_BitMapPatt : BitMapPatt 
	Port map
    (
        RstB        => RstB      ,
        Clk         => Clk       ,

        RxBmWrEn    => RxBmWrEn  ,
        RxBmWrData  => RxBmWrData    ,

        BmFfWrEn    => BmFfWrEn  ,
        BmFfWrData  => BmFfWrData ,
        BmFfWrCnt   => BmFfWrCnt 
	);

	u_RxSerial : RxSerial 
	Port map
	(
		RstB		=> RstB			,	
		Clk			=> Clk			,
		SerDataIn	=> SerDataIn	,	
		RxFfWrData	=> RxBmWrData   ,
		RxFfWrEn	=> RxBmWrEn	
	);
	
	u_DownScale : DownScale
		port map (
			Clk             => Clk			,
			RstB            => RstB			,

			Bm2DsData       => BmFfWrData	,
			Bm2DsEn         => BmFfWrEn		,

			Ds2DsFfData     => Ds2DsFfData	,
			Ds2DsFfEn       => Ds2DsFfEn		
		);

-------------------------------------------------------------------------
-- Testbench
-------------------------------------------------------------------------

	u_Test : Process
	variable	iSerData	: std_logic_vector( 9 downto 0 );
	Begin
		-------------------------------------------
		-- TM=0 : Reset
		-------------------------------------------
		TM <= 0; wait for 1 ns;
		Report "TM=" & integer'image(TM); 

		SerDataIn	<= '1';
		wait for 100*tClk;

		-------------------------------------------
		-- TM=1 : Check counter value
		-------------------------------------------	
		TM <= 1; wait for 1 ns;
		Report "TM=" & integer'image(TM); 

		wait until rising_edge(Clk);
        for data in 10 to 100 loop
            iSerData 	:= '1'& conv_std_logic_vector(data,8) &'0';
            For i in 0 to 9 loop
                SerDataIn	<= iSerData(0);
                wait for 868*tClk;
                wait until rising_edge(Clk);
                iSerData	:= '1' & iSerData(9 downto 1);
            End loop;
        end loop;
		wait for 10*tClk;

        -- for i in 0 to 59 loop
        --     for j in 0 to 10 loop
        --         wait until rising_edge(Clk);
        --     end loop;
        --     RxBmWrEn <= '1';

        --     wait until rising_edge(Clk);
        --     RxBmWrEn <= '0';
        -- end loop;
        
        -- wait for 30*tClk;
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