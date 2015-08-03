library ieee;
use ieee.std_logic_1164.all;

entity XOR_gate_TB is
end XOR_gate_TB;

architecture TB of XOR_gate_TB is
  
  component XOR_gate is 
    port ( a: in std_logic;
           b: in std_logic;
           c: out std_logic
         );
       end component;
       
       signal a, b, c: std_logic;
       
     begin
       
       test_XOR_gate: XOR_gate port map (a, b, c);
         
         process
           begin
             --case 1
             a <= '0';
             b <= '0';
             wait for 10 ns;
             
             --case 2
             a <= '0';
             b <= '1';
             wait for 10 ns;
             
             --case 3
             a <= '1';
             b <= '0';
             wait for 10 ns;
             
             --case 4
             a <= '1';
             b <= '1';
             wait for 10 ns;
             
             wait;
           end process;
           
         end TB;
         
         configuration CFG_TB of XOR_gate_TB is
           for TB
         end for;
       end CFG_TB;