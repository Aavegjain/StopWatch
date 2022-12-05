----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2022 17:32:30
-- Design Name: 
-- Module Name: stopwatch_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stopwatch_tb is
--  Port ( );
end stopwatch_tb;

architecture Behavioral of stopwatch_tb is
component stopwatch is 
port (
clk: in std_logic ; 
start: in std_logic ; 
continue: in std_logic ; 
pause : in std_logic ; 
reset : in std_logic ; 

a1m: out std_logic;
        a2m: out std_logic;
        a3m: out std_logic;
        a4m: out std_logic;
        
        aam : out std_logic ;
        bbm: out std_logic ;
        ccm : out std_logic ;
        ddm : out std_logic ;
        eem : out std_logic ;
        ffm : out std_logic ;
        ggm : out std_logic; 
        dp_out :out  std_logic 
        


 );
end component ;
signal clk : std_logic := '1' ; 
signal start, pause, reset, continue: std_logic := '0';
signal a1m,a2m,a3m,a4m,aam,bbm,ccm,ddm,eem,ffm,ggm,dp_out : std_logic    ;
begin


stp : stopwatch port map(clk=>clk ,start => start, continue => continue, pause => pause, reset => reset
,a1m => a1m,a2m => a2m , a3m => a3m, a4m => a4m, aam => aam, bbm=> bbm, ccm => ccm, ddm => ddm,eem=> eem,ffm => ffm,ggm => ggm,dp_out => dp_out ) ;
clk <= not clk after 5 ns ;
start <= '1' after 50ns , '0' after 99500ns , '1' after 150000ns , '0' after 199500ns, '1' after 400000 ns , '0' after 499500ns;
pause <= '1' after 100000ns, '0' after 199500 ns, '1' after 500000ns, '0' after 599500ns ;
continue <= '1' after 200000ns, '0' after 299500ns , '1' after 600000 ns;
reset <= '1' after 300000ns, '0' after 399500 ns ;

 
--process
--begin 
--if (clk = '0') then clk <= '1' ; wait for 5 ns ; 
--else clk <= '0' ; wait for 5 ns ;
--end if ;
--end process ; 
--process
--begin 
--m <= "0000" ;
--s1 <= "0000" ;
--s2 <= "0000" ;
--t <= "0000" ; 
--end process ;


--enable <= '0' after 5 min ;


end Behavioral;
