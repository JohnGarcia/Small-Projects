library ieee;
use ieee.std_logic_1164.all;

entity One_Bit_Adder_TB is
end One_Bit_Adder_TB;

architecture TB of One_Bit_Adder_TB is
  
  component One_Bit_Adder is
    port ( a: in std_logic;
           b: in std_logic;
           c: in std_logic;
           d: out std_logic;
           e: out std_logic
         );
       end component;
       
     signal a, b, c, d, e: std_logic;
     
     begin
       test_One_Bit_Adder: One_Bit_Adder port map (a, b, c, d, e);
         
         process
           begin
             --case 1
             a <= '0';
             b <= '0';
             c <= '0';
             wait for 10 ns;
             assert (d = '0' and e = '0')
             report "Case 1 failed!" severity error;
             
             --case 2
             a <= '0';
             b <= '0';
             c <= '1';
             wait for 10 ns;
             assert (d = '1' and e = '0')
             report "Case 2 failed!" severity error;
             
             --case 3
             a <= '0';
             b <= '1';
             c <= '0';
             wait for 10 ns;
             assert (d = '1' and e = '0')
             report "Case 3 failed!" severity error;
             
             --case 4
             a <= '0';
             b <= '1';
             c <= '1';
             wait for 10 ns;
             assert (d = '0' and e = '1')
             report "Case 4 failed!" severity error;
             
             --case 5
             a <= '1';
             b <= '0';
             c <= '0';
             wait for 10 ns;
             assert (d = '1' and e = '0')
             report "Case 5 failed!" severity error;
             
             --case 6
             a <= '1';
             b <= '0';
             c <= '1';
             wait for 10 ns;
             assert (d = '0' and e = '1')
             report "Case 6 failed!" severity error;
             
             --case 7
             a <= '1';
             b <= '1';
             c <= '0';
             wait for 10 ns;
             assert (d = '0' and e = '1')
             report "Case 7 failed!" severity error;
             
             --case 8
             a <= '1';
             b <= '1';
             c <= '1';
             wait for 10 ns;
             assert (d = '1' and e = '1')
             report "Case 8 failed!" severity error;
             
             wait;
           end process;
           
         end TB;
         
         configuration CFG_TB of One_Bit_Adder_TB is
           for TB
         end for;
       end CFG_TB;