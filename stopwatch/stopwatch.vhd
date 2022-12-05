----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2022 17:03:27
-- Design Name: 
-- Module Name: stopwatch - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.s
--library UNISIM;
--use UNISIM.VComponents.all;

entity stopwatch is
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
end stopwatch;

architecture Behavioral of stopwatch is
signal enable_watch, ispause, reset_watch, iscontinue: std_logic := '0';
--signal reset_watch, ispause : std_logic := '0';
--signal  isstarted: std_logic := '0' ;
signal c,counter, counter2,temp: integer := 0 ;  
signal m_temp,s1_temp,s2_temp,t_temp : std_logic_vector(3 downto 0) := "0000" ;
signal enable_watch_2, reset_watch_2, ispause2, isstarted2 : std_logic := '0' ;
signal m,s1,s2,t:  std_logic_vector(3 downto 0) ; 
signal temp1, temp2, temp3: integer;


component merged is 
port (
    clkm : in std_logic;
    i1m : in std_logic ; 
      i2m : in std_logic ;
      i3m : in std_logic ;
      i4m : in std_logic ;
      dp_1 : in std_logic ;
      
      i5m : in std_logic ;
      i6m : in std_logic ;
      i7m : in std_logic ;
      i8m : in std_logic ;
      dp_2 : in std_logic ;
      
        i9m : in std_logic ; 
        i10m : in std_logic ;
        i11m : in std_logic ;
        i12m : in std_logic ;
        dp_3 : in std_logic ;
        
        i13m : in std_logic ;
        i14m : in std_logic ;
        i15m : in std_logic ;
        i16m : in std_logic;
        dp_4 : in std_logic ;
        
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

signal d1 : std_logic := '0' ; 
signal d2 : std_logic := '1' ; 
signal d3 : std_logic := '0' ; 
signal d4 : std_logic := '1' ; 

begin

uut : merged port map(clkm => clk , i1m => m(3) , i2m => m(2) ,i3m => m(1) ,i4m => m(0) ,
                                    i5m => s1(3) , i6m => s1(2) ,i7m => s1(1) ,i8m => s1(0),
                                    i9m => s2(3) , i10m => s2(2) ,i11m => s2(1) ,i12m => s2(0) ,
                                    i13m => t(3) , i14m => t(2) ,i15m => t(1) ,i16m => t(0), 
                                    aam => aam, bbm => bbm, ccm=> ccm,ddm => ddm, eem => eem , ffm => ffm , ggm => ggm ,
                                    a1m => a1m , a2m => a2m , a3m => a3m , a4m => a4m , dp_1 => d1 , dp_2 => d2 , dp_3 => d3 , dp_4 => d4,dp_out => dp_out ) ;   


--process (start,pause,continue)
-- begin 

--if (start = '1' 


process(start, pause, continue,reset)

begin

          

    if (start = '1' ) then   
        enable_watch <= '1';

        
    end if ;
    
    
--    if (reset = '1') then 
--        enable_watch <= '0' ;
    
    if ( pause = '1') then
         
            ispause <= '1';

    end if;
    
    if ( continue = '1') then
            
                ispause <= '0';

    end if;
    
    if (reset = '1' and reset_watch ='1') then 
   
    enable_watch <= '0' ;
    ispause <= '0' ; 
    end if ;
    

end process;



--process(start)
--begin
--    if (start'event and start = '1') then
--        enable_watch <= '1';
--    end if;
--end process;

--process(continue)
--begin
--    if(continue'event and continue = '1') then
--        iscontinue <= '1';
--    end if;
--end process;


--process(pause)
--begin
--    if (pause'event and pause = '1') then
--        ispause <= '1';
--    end if;
--end process;

--process(continue)
--begin
--    if (continue'event and continue = '1' and ispause = '1') then
--        enable_watch <= '1';
--        ispause <= '0';
--    end if;
--end process;

--process(reset, reset_watch)
--begin
--    if (reset'event and reset = '1') then
--        reset_watch <= '1';
--    end if;
--end process;

process(clk, reset) 
begin


    if (clk'event and clk = '1' and enable_watch = '1' and ispause = '0' ) then
    counter2 <= counter2 + 1;

        
        
    if counter2 = 10000000 then
        counter <= counter + 1;
        counter2 <= 0;

    end if;
    

     
    end if;
    

                
    if (reset = '1' and reset_watch = '0') then
        counter <= 0;
        reset_watch <= '1';
        
    end if;
    if (reset = '0' and reset_watch = '1') then
        reset_watch <= '0';
    end if;
    
--    if (start <= '1') then reset_watch <= '1' ; end if ;
        
end process;

process(counter)
begin

temp <= counter mod 600;
m  <= std_logic_vector(to_unsigned(counter/600, 4));
temp1 <= counter mod 600;
t <= std_logic_vector(to_unsigned(temp1 mod 10, 4));
temp2 <= temp1/10;
s2 <= std_logic_vector(to_unsigned(temp2 mod 10, 4));
temp3 <= temp2/10;
s1 <= std_logic_vector(to_unsigned(temp3 mod 10, 4));
end process;





--process(clk) 
--begin 
--if (clk'event and clk = '1') then 
--    c1  <= c1 + 1 ; c2 <= c2 + 1 ; c3 <= c3 + 1 ; c4 <= c4 + 1 ;
--    if (c1 > 9) then c1 <= 0 ; end if ;
--    if (c2 > 99) then c2 <= 0 ; end if ;
--    if (c3 > 999) then c3 <= 0 ;  end if ;
--    if (c4 <= 5999) then c4 <= 0 ; end if ;
--end if ; 
--end process ; 



--process(clk)
--begin 
--    if (clk'event and clk = '1') then 
--        counter <= counter + 1 ;
--        if (counter > 8) then 
--            counter <= 0 ;
--            c <= c + 1 ;
--        end if ;
--    end if ;
    
    


--end process ; 

--process(c)
--begin 


--t_temp <= t_temp + "0001" ;
--if (t_temp = "1001") then 
--t_temp <= "0000" ;
--end if ;
--t <= t_temp ;




--end process ; 

--process(t_temp) begin 
--if (t_temp'event and  t_temp = "0000") then   -- check for event
--    s2_temp <= s2_temp + "0001"  ;
--    if (s2_temp = "1001") then 
--    s2_temp <= "0000" ;
--    end if ;
--end if ; 
--s2 <= s2_temp ;
--end process ; 

--process(s2_temp) begin 

--if (s2_temp'event and s2_temp = "0000") then 
--    s1_temp <= s1_temp + "0001" ; 
--    if (s1_temp = "0101") then 
--    s1_temp <= "0000"  ;
--    end if ;
--end if ;
--s1<= s1_temp ;

--end process ;

--process(s1_temp) begin 

--if (s1_temp'event and s1_temp = "0000") then 
--    m_temp <= m_temp + "0001" ; 
--end if ;
--m <= m_temp ;
--end process;


end Behavioral;
