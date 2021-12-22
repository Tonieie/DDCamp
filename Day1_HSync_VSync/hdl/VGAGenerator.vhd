----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Filename     VGAGenerator.vhd
-- Title        Top
--
-- Company      Design Gateway Co., Ltd.
-- Project      DDCamp HDMI-IP
-- PJ No.       
-- Syntax       VHDL
-- Note         

-- Version      1.00
-- Author       B.Attapon
-- Date         2017/11/14
-- Remark       New Creation
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity VGAGenerator Is
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
End Entity VGAGenerator;

Architecture rtl Of VGAGenerator Is

----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------

	signal	rHSyncCnt	: std_logic_vector( 10 downto 0 );
	signal	rHSync		: std_logic;
	
	signal	rVSyncCnt	: std_logic_vector( 9 downto 0 );
	signal	rVSync		: std_logic;
	
	signal	rDe			: std_logic;
	signal	rVGAData	: std_logic_vector( 23 downto 0 );

	constant cHSyncPeriod :		integer := 1344;
	constant cHSyncSyncPulse :	integer	:= 136;
	constant cHSyncBackPorch :	integer := 160; 
	constant cHSyncDisplay : 	integer := 1024;
	constant cHSyncFrontPorch : integer := 24;

	constant cVSyncPeriod : std_logic_vector(11 downto 0) := x"326"; --806
	constant cVSyncSyncPulse : std_logic_vector(3 downto 0) := x"6"; --6
	constant cVSyncBackPorch : std_logic_vector(7 downto 0) := x"1D"; --29
	constant cVSyncDisplay : std_logic_vector(11 downto 0) := x"300"; --768
	constant cVSyncFrontPorch : std_logic_vector(3 downto 0) := x"3"; --3
	

	
Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

	VGAClkB		<= not VGAClk;
	
	VGAHSync	<= rHSync;
	VGAVSync	<= rVSync;
	
	VGADe		<= rDe;
	VGAData		<= rVGAData;

----------------------------------------------------------------------------------
-- DFF 
----------------------------------------------------------------------------------
	
----------------------------------------------------------------------------------
-- [[ LBA 1 : CODING HSYNC(1) ]]
	
	u_rHSyncCnt : Process (VGAClk) Is
	Begin
		if ( rising_edge(VGAClk) ) then
			if ( VGARstB='0' ) then
				rHSyncCnt <= conv_std_logic_vector(cHSyncPeriod,12);
			else
				if rHSyncCnt = 1 then
					rHSyncCnt <= conv_std_logic_vector(cHSyncPeriod,12);
				else
					rHSyncCnt <= rHSyncCnt - 1;
				end if;
			end if;
		end if;
	End Process u_rHSyncCnt;
	
	u_rHSync : Process (VGAClk) Is
	Begin
		if ( rising_edge(VGAClk) ) then
			if ( VGARstB='0' ) then
				rHSync <= '0';
			else
				if (rHSyncCnt = '1') then
					rHSync <= '0';
				elsif (rHSyncCnt = cHSyncPeriod) then
					rHSync <= '0';
				else
					rHSync <= rHSync;
				end if;

			end if;
		end if;
	End Process u_rHSync;
	
----------------------------------------------------------------------------------
-- [[ LBA 2 : CODING VSYNC(1) ]]
	
	-- u_rVSyncCnt : Process (VGAClk) Is
	-- Begin
	-- 	if ( rising_edge(VGAClk) ) then
	-- 		if ( VGARstB='0' ) then
	-- 			-- coding here
	-- 			-- initial value
	-- 			rVSyncCnt <= (others => '0');
	-- 		else
	-- 			-- coding here
	-- 			-- behaviour
	-- 			if (rVSyncCnt = cVSyncPeriod) then
	-- 				rVSyncCnt <= (others => '0');
	-- 			elsif (rHSyncCnt = cHSyncPeriod) then
	-- 				rVSyncCnt <= rVSyncCnt + 1;
	-- 			end if;
	-- 		end if;
	-- 	end if;
	-- End Process u_rVSyncCnt;
	
	-- u_rVSync : Process (VGAClk) Is
	-- Begin
	-- 	if ( rising_edge(VGAClk) ) then
	-- 		if ( VGARstB='0' ) then
	-- 			-- coding here
	-- 			-- initial value
	-- 			rVSync <= '0';
	-- 		else
	-- 			-- coding here
	-- 			-- behaviour
	-- 			if (rVSyncCnt = cVSyncSyncPulse) then
	-- 				rVSync <= '1';
	-- 			elsif (rVSyncCnt = cVSyncPeriod) then
	-- 				rVSync <= '0';
	-- 			else
	-- 				rVSync <= rVSync;
	-- 			end if;
	-- 		end if;
	-- 	end if;
	-- End Process u_rVSync;
	
----------------------------------------------------------------------------------
-- [[ Challenge Exercise : CODING TEST PATTERN ]]
	 
-- 	u_rDe : Process (VGAClk) Is
-- 	Begin
-- 		if ( rising_edge(VGAClk) ) then
-- 			if ( VGARstB='0' ) then
-- 				-- coding here
-- 				-- initial value
-- 			else
-- 				-- coding here
-- 				-- behaviour
-- 			end if;
-- 		end if;
-- 	End Process u_rDe;
	
-- 	u_rVGAData : Process (VGAClk) Is
-- 	Begin
-- 		if ( rising_edge(VGAClk) ) then
-- 			-- coding here
-- 			-- behaviour
-- 		end if;
-- 	End Process u_rVGAData;
	
End Architecture rtl;
