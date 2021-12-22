library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
USE STD.TEXTIO.ALL;

Entity TbTestPatt Is
End Entity TbTestPatt;

Architecture HTWTestBench Of TbTestPatt Is

--------------------------------------------------------------------------------------------
-- Constant Declaration
--------------------------------------------------------------------------------------------

	constant	tClk			: time := 10 ns;
	
-------------------------------------------------------------------------
-- Component Declaration
-------------------------------------------------------------------------
	
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
	
-------------------------------------------------------------------------
-- Signal Declaration
-------------------------------------------------------------------------
	
	signal	TM			: integer	range 0 to 65535;
	
	signal	RstB		: std_logic;
	signal	Clk			: std_logic;		
    signal  PattSel			: std_logic;	-- '0':Inc  , '1':Dec
    signal  PattCmd			: std_logic;	-- '0':write, '1':Read
    signal  PattReq			: std_logic;
    signal  PattBusy		: std_logic;
    signal  PattFail		: std_logic;
    
    -- MtDdr Interface
    -- Command Write I/F
    signal  MtDdrWrReq		: std_logic;
    signal  MtDdrWrBusy		: std_logic;
    signal  MtDdrWrAddr		: std_logic_vector( 28 downto 7 );
    -- Write Fifo interface
    signal  WrFfWrCnt		:	std_logic_vector( 15 downto 0 );	-- Fifo write counter
    signal  WrFfWrEn		: 	std_logic;							-- Fifo write enable
    signal  WrFfWrData		: 	std_logic_vector( 31 downto 0 );	-- Fifo write data
    
    -- Command Read I/F
    signal  MtDdrRdReq		: 	std_logic;
    signal  MtDdrRdBusy		: 	std_logic;
    signal  MtDdrRdAddr		: 	std_logic_vector( 28 downto 7 );
    -- Read Fifo interface
    signal  RdFfRdCnt		: 	std_logic_vector( 15 downto 0 );	-- Fifo read counter
    signal  RdFfRdData		: 	std_logic_vector( 31 downto 0 );	-- Fifo read data
    signal  RdFfRdEn		: 	std_logic;						-- Fifo read enable

    signal rRdFfRdEn        : std_logic;

    signal PattStartAddr    : std_logic_vector(21 downto 0);
    signal PattLength       : std_logic_vector(21 downto 0); 
	
Begin

    WrFfWrCnt <= (others => '0');
    RdFfRdCnt <= (others => '1');

	u_Clk : Process
	Begin
		Clk		<= '1';
		wait for tClk/2;
		Clk		<= '0';
		wait for tClk/2;
	End Process u_Clk;

	u_TestPatt : TestPatt
	Port map
	( 
        RstB    =>  RstB    ,
        Clk     =>  Clk     ,

        PattSel     => PattSel  ,
        PattCmd     => PattCmd  ,
        PattReq     => PattReq  ,
        PattBusy        => PattBusy ,
        PattFail        => PattFail ,

        MtDdrWrReq      => MtDdrWrReq   ,
        MtDdrWrBusy     => MtDdrWrBusy  ,
        MtDdrWrAddr     => MtDdrWrAddr  ,

        WrFfWrCnt       => WrFfWrCnt    ,
        WrFfWrEn        => WrFfWrEn     ,
        WrFfWrData      => WrFfWrData   ,

        MtDdrRdReq      => MtDdrRdReq   ,
        MtDdrRdBusy      => MtDdrRdBusy ,
        MtDdrRdAddr     => MtDdrRdAddr  ,

        RdFfRdCnt       => RdFfRdCnt    ,
        RdFfRdData      => RdFfRdData   ,
        RdFfRdEn        => RdFfRdEn
	);

   u_RdFfRdData: process(Clk)
   begin
       if rising_edge(Clk) then
           if RstB = '0' then
                rRdFfRdEn <= '0';
                RdFfRdData <= (others => '0');
           else
                rRdFfRdEn <= RdFfRdEn;
                if rRdFfRdEn = '1' then
                    RdFfRdData <= RdFfRdData + 1;
                else
                    RdFfRdData <= RdFfRdData;
                end if ;
           end if;
       end if;
   end process u_RdFfRdData;

  u_MtDdrWrBusy: process
  begin
        MtDdrWrBusy <= '0';
        Loop
            wait until rising_edge(Clk);
            if ( MtDdrWrReq = '1' ) then
                exit;
            end if ;
        End loop;
        wait until rising_edge(Clk);
        MtDdrWrBusy    <= '1';

        For i in 0 to 31 loop
            Loop
                wait until rising_edge(Clk);
                if ( WrFfWrEn = '1' ) then
                    exit;
                end if ;
            End loop;
        end loop;
  end process u_MtDdrWrBusy;

  u_MtDdrRdBusy: process
  begin
        MtDdrRdBusy <= '0';
        Loop
            wait until rising_edge(Clk);
            if ( MtDdrRdReq = '1' ) then
                exit;
            end if ;
        End loop;
        wait until rising_edge(Clk);
        MtDdrRdBusy    <= '1';

        For i in 0 to 31 loop
            Loop
                wait until rising_edge(Clk);
                if ( RdFfRdEn = '1' ) then
                    exit;
                end if ;
            End loop;
        end loop;
  end process u_MtDdrRdBusy;



   u_Test: process
   begin

    ------------------------------------
    --TM=0
    ------------------------------------

    TM <= 0; wait for 1 ns;
    Report "TM=" & integer'image(TM);


    RstB		<= '0';
    PattCmd <= '0';
    PattStartAddr   <=  (others => '0');
    PattLength      <=  (others => '0');
    PattReq         <=  '0';
    wait until rising_edge(Clk);
    RstB		<= '1';

    wait for 20*tClk;

    ------------------------------------
    --TM=1
    ------------------------------------

    TM <= 1; wait for 1 ns;
    Report "TM=" & integer'image(TM);

    PattCmd <= '0';
    PattStartAddr   <=  "00" &x"12345";
    PattLength      <=  "00" &x"00002";
    PattReq         <=  '1';
    Loop
        wait until rising_edge(Clk);
        if ( PattBusy = '1' ) then
            exit;
        end if ;
    end loop;
    wait until rising_edge(Clk);
    PattReq     <= '0';
    wait until PattBusy = '0';
    wait for 10*tClk;

    --------------------------------------------------------
    TM <= 255; wait for 1 ns;
    wait for 20*tClk;
    Report "##### End Simulation #####" Severity Failure;		
    wait;

   end process u_Test;

End Architecture HTWTestBench;