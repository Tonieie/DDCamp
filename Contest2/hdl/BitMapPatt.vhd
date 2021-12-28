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

        BmFfWrEn    : out   std_logic;
        BmFfWrData  : out   std_logic_vector(23 downto 0);
        BmFfWrCnt   : in    std_logic_vector(7 downto 0)
    );
end entity BitMapPatt;

architecture rtl of BitMapPatt is
    
----------------------------------------------------------------------------------
-- Constant Declaration
----------------------------------------------------------------------------------
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------

    type    BmPattStateType is
        (
            stIdle      ,
            stHeader    ,
            stRdData    ,
            stSendFf
        );
    signal  rState          : BmPattStateType;

    signal  rBmFfWrEn       : std_logic;
    signal  rBmFfWrData     : std_logic_vector(23 downto 0);

    signal  rHeaderCnt      : std_logic_vector(5 downto 0);
    signal  rRGBCnt         : std_logic_vector(1 downto 0);
    signal  rPixCnt         : std_logic_vector(19 downto 0);

begin
    
----------------------------------------------------------------------------------
-- Output assignment
----------------------------------------------------------------------------------

    BmFfWrData(23 downto 0) <=  rBmFfWrData(23 downto 0);
    BmFfWrEn                <=  rBmFfWrEn;   

----------------------------------------------------------------------------------
-- DFF
----------------------------------------------------------------------------------
    -- count to ignore 54 bytes of header
    u_rHeaderCnt: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rHeaderCnt   <=  (others => '0');
            else
                    if ( rState <= stIdle ) and ( RxBmWrEn = '1') then
                        rHeaderCnt   <=  (others => '0');
                    elsif ( ( rState = stHeader ) and ( RxBmWrEn = '1' ) ) then
                        rHeaderCnt  <=  rHeaderCnt + 1;
                    else
                        rHeaderCnt  <=  rHeaderCnt;
                    end if ;
            end if;
        end if;
    end process u_rHeaderCnt;

    -- count to check if all r g b received
    u_rRGBCnt: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rRGBCnt   <=  "11";
            else
                -- reset when send
                if rState = stSendFf then
                    rRGBCnt     <=  "11";
                elsif ( (rState = stRdData ) and (RxBmWrEn = '1') ) then
                    rRGBCnt     <=  rRGBCnt - 1;
                else
                    rRGBCnt     <=  rRGBCnt;
                end if ;
            end if;
        end if;
    end process u_rRGBCnt;

    -- count when received pixel to check if 1 picture received (1 pic = 786432 pixels)
    u_rPixCnt: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rPixCnt <=  (others => '0');
            else
                if rPixCnt = 786433 then
                    rPixCnt <=  (others => '0');
                elsif rBmFfWrEn = '1' then
                    rPixCnt <=  rPixCnt + 1;
                else
                    rPixCnt <=  rPixCnt;
                end if ;
            end if;
        end if;
    end process u_rPixCnt;

    -- Shift Right Register because bitmap send bgr but we use rgb
    u_rBmFfWrData: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rBmFfWrData  <=  (others => '0');
            else
                if ( rState = stRdData ) and ( RxBmWrEn = '1' ) then
                    rBmFfWrData(23 downto 0) <= RxBmWrData & rBmFfWrData(23 downto 8);
                else
                    rBmFfWrData(23 downto 0) <= rBmFfWrData(23 downto 0);
                end if ;
            end if;
        end if;
    end process u_rBmFfWrData;

    u_rBmFfWrEn: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rBmFfWrEn <=  '0';
            else
                if rState = stSendFf then
                    rBmFfWrEn <=  '1';
                else
                    rBmFfWrEn <=  '0';
                end if ;
            end if;
        end if;
    end process u_rBmFfWrEn;

----------------------------------------------------------------------------------
-- State Machine
----------------------------------------------------------------------------------

   u_rState: process(Clk)
   begin
       if rising_edge(Clk) then
           if RstB = '0' then
               rState   <=  stIdle;
           else
               case( rState ) is
               
                    when stIdle =>
                        if RxBmWrEn = '1' then
                            rState  <=  stHeader;
                        else
                            rState  <=  stIdle;
                        end if ;

                    -- wait until all 54 bytes of header received
                    when stHeader   =>
                        if rHeaderCnt = 53 then
                            rState  <=  stRdData;
                        else
                            rState  <=  stHeader;
                        end if ;

                    -- send when rgb received
                    when stRdData   =>
                        if rPixCnt = 786433 then
                            rState  <=  stIdle;
                        elsif rRGBCnt = 0 then
                            rState  <=  stSendFf;
                        else
                            rState  <=  stRdData;
                        end if ;
                    
                    --send 1 pixel
                    when stSendFf   =>
                        rState  <=  stRdData;

               end case ;
           end if;
       end if;
   end process u_rState;
    
end architecture rtl;