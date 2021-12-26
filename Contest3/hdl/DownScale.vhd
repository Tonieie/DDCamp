library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DownScale is
    port (
        Clk             : in std_logic;
        RstB            : in std_logic;

        Bm2DsData       : in std_logic_vector(23 downto 0);
        Bm2DsEn         : in std_logic;

        Ds2DsFfData     : out std_logic_vector(23 downto 0);
        Ds2DsFfEn       : out std_logic
    );
end entity DownScale;

architecture rtl of DownScale is
----------------------------------------------------------------------------------
-- Constant Declaration
----------------------------------------------------------------------------------
	
----------------------------------------------------------------------------------
-- Signal declaration
----------------------------------------------------------------------------------
    type    DSStateType is
        (
            stIdle          ,
            stRecv          ,
            stIgnorePix     ,
            stIgnoreRow
        );
    signal  rState      : DSStateType;


    signal  rDs2DsFfEn      : std_logic;
    signal  rPixCnt         : std_logic_vector(9 downto 0);
    signal  rRowCnt         : std_logic_vector(1 downto 0);
    signal  rIgnorePixCnt   : std_logic_vector(1 downto 0);

begin

----------------------------------------------------------------------------------
-- Output Assignment
----------------------------------------------------------------------------------

    --Bypass
    Ds2DsFfData(23 downto 0)    <=  Bm2DsData(23 downto 0);
    Ds2DsFfEn   <=  rDs2DsFfEn;

----------------------------------------------------------------------------------
-- DFF
----------------------------------------------------------------------------------

    u_rPixCnt: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rPixCnt  <= (others => '0');
            else
                if Bm2DsEn = '1' then
                    rPixCnt <=  rPixCnt + 1;
                else
                    rPixCnt <=  rPixCnt;
                end if ;           
            end if;
        end if;
    end process u_rPixCnt;

    u_rIgnorePixCnt: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rIgnorePixCnt  <= (others => '0');
            else
                if ( ( rState = stIgnorePix ) and ( Bm2DsEn = '1' ) ) then
                    rIgnorePixCnt <=  rIgnorePixCnt + 1;
                else
                    rIgnorePixCnt <=  rIgnorePixCnt;
                end if ;           
            end if;
        end if;
    end process u_rIgnorePixCnt;

    u_rRowCnt: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB  = '0' then
                rRowCnt  <=  (others => '0');
            else
                if ( (rPixCnt = 1023 ) and ( Bm2DsEn = '1' ) ) then
                    rRowCnt <= rRowCnt + 1;
                else
                    rRowCnt <= rRowCnt;
                end if ;               
            end if;
        end if;
    end process u_rRowCnt;

    u_rDs2DsFfEn: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rDs2DsFfEn   <=  '0';
            else
                if rState = stRecv then
                    rDs2DsFfEn   <=  '1';
                else
                    rDs2DsFfEn   <=  '0';
                end if ;
            end if;
        end if;
    end process u_rDs2DsFfEn;
    ----------------------------------------------------------------------------------
-- State Machine 
----------------------------------------------------------------------------------

    u_rState: process(Clk)
    begin
        if rising_edge(Clk) then
            if RstB = '0' then
                rState  <=  stIdle;
            else
                case( rState ) is

                    when stIdle =>
                        if Bm2DsEn = '1' then
                            rState <= stRecv;
                        else
                            rState <= stIdle;
                        end if;

                    when stRecv =>
                        if rRowCnt /= 0 then
                            rState  <=  stIgnoreRow;
                        else
                            rState  <=  stIgnorePix;
                        end if ;

                    when stIgnorePix =>
                        if rRowCnt /= 0 then
                            rState  <= stIgnoreRow;
                        elsif ( ( rIgnorePixCnt = 3 ) and ( Bm2DsEn = '1') ) then
                            rState  <=  stRecv;
                        else
                            rState  <=  stIgnorePix;
                        end if ;
                        
                    when stIgnoreRow =>
                        if rRowCnt = 0 then
                            rState  <=  stRecv;
                        else
                            rState  <=  stIgnoreRow;
                        end if ;
                
                end case ;
            end if;
        end if;
    end process u_rState;
    

end architecture rtl;