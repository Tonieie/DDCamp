library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity BitMapPatt is
    port (
        RstB        : in    std_logic;
        Clk         : in    std_logic;

        RxBmWrEn    : in    std_logic;
        RxBmWrData  : in    std_logic_vector(7 downto 0);

        BmFfWrEn    : in    std_logic;
        BmFfWrData  : in    std_logic(31 downto 0);
        BmFfWrCnt   : in    std_logic_vector(7 downto 0);
    );
end entity BitMapPatt;

architecture rtl of BitMapPatt is
    
----------------------------------------------------------------------------------
-- Constant Declaration
----------------------------------------------------------------------------------
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------

begin
    
----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

    
----------------------------------------------------------------------------------
-- DFF
----------------------------------------------------------------------------------
    
end architecture rtl;