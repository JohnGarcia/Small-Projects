library ieee;
use ieee.std_logic_1164.all;

entity ALU_8bit_TB is
end ALU_8bit_TB;

architecture TB of ALU_8bit_TB is
  
  component ALU_8bit is 
    port ( a: in std_logic_vector (7 downto 0);
           b: in std_logic_vector (7 downto 0);
           binv: in std_logic;
           op: in std_logic_vector (1 downto 0);
           cout: out std_logic;
           over: out std_logic;
           r: out std_logic_vector (7 downto 0)
         );
       end component;
       
       signal binv, cout, over: std_logic;
       signal a, b, r: std_logic_vector (7 downto 0);
       signal op: std_logic_vector (1 downto 0);
       
     begin
       test_ALU_8bit: ALU_8bit port map (a, b, binv, op, cout, over, r);
         
         process
           begin
             --case 1
             a <= "11111111";
             b <= "11111111";
             binv <= '0';
             op <= "00";
             wait for 10 ns;
             
             --case 2
             a <= "11111111";
             b <= "11111111";
             binv <= '0';
             op <= "01";
             wait for 10 ns;
             
             --case 3
             a <= "11111111";
             b <= "11111111";
             binv <= '0';
             op <= "10";
             wait for 10 ns;
                          
             --case 4
             a <= "11111111";
             b <= "11111111";
             binv <= '1';
             op <= "10";
             wait for 10 ns;
             
             --case 5
             a <= "01111111";
             b <= "10000000";
             binv <= '0';
             op <= "00";
             wait for 10 ns;
             
             --case 6
             a <= "01111111";
             b <= "10000000";
             binv <= '0';
             op <= "01";
             wait for 10 ns;
             
             --case 7
             a <= "01111111";
             b <= "10000000";
             binv <= '0';
             op <= "10";
             wait for 10 ns;
             
             --case 8
             a <= "01111111";
             b <= "10000000";
             binv <= '1';
             op <= "10";
             wait for 10 ns;
             
             --case 9
             a <= "10000000";
             b <= "01111111";
             binv <= '0';
             op <= "00";
             wait for 10 ns;
             
             --case 10
             a <= "10000000";
             b <= "01111111";
             binv <= '0';
             op <= "01";
             wait for 10 ns;
             
             --case 11
             a <= "10000000";
             b <= "01111111";
             binv <= '0';
             op <= "10";
             wait for 10 ns;
             
             --case 12
             a <= "10000000";
             b <= "01111111";
             binv <= '1';
             op <= "10";
             wait for 10 ns;
             
             --case 13
             a <= "01010101";
             b <= "10101010";
             binv <= '0';
             op <= "00";
             wait for 10 ns;
             
             --case 14
             a <= "01010101";
             b <= "10101010";
             binv <= '0';
             op <= "01";
             wait for 10 ns;
             
             --case 15
             a <= "01010101";
             b <= "10101010";
             binv <= '0';
             op <= "10";
             wait for 10 ns;
             
             --case 16
             a <= "01010101";
             b <= "10101010";
             binv <= '1';
             op <= "10";
             wait for 10 ns;
             
             --case 17
             a <= "11011011";
             b <= "10101010";
             binv <= '0';
             op <= "00";
             wait for 10 ns;
             
             --case 18
             a <= "11011011";
             b <= "10101010";
             binv <= '0';
             op <= "01";
             wait for 10 ns;
             
             --case 19
             a <= "11011011";
             b <= "10101010";
             binv <= '0';
             op <= "10";
             wait for 10 ns;
             
             --case 20
             a <= "11011011";
             b <= "10101010";
             binv <= '1';
             op <= "10";
             wait for 10 ns;
             
             wait;
           end process;
         
       end TB;
       
       configuration CFG_TB of ALU_8bit_TB is
         for TB
       end for;
     end CFG_TB;