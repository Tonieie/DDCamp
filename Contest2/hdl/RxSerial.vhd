library IEEE;
use IEEE.STD_LOGIC_1164.all;
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

Architecture RxSerialBehavior Of RxSerial Is

----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------



Begin

----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------



----------------------------------------------------------------------------------
-- DFF 
----------------------------------------------------------------------------------



End Architecture RxSerialBehavior;