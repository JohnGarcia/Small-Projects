library ieee;
use ieee.std_logic_1164.all;

entity MUX_2x1_TB is
end MUX_2x1_TB;

architecture TB of MUX_2x1_TB is
  
  component MUX_2x1 is
  port ( a: in std_logic;
         b: in std_logic;
         c: in std_logic;
         d: out std_logic
        );
  end component;
  
  signal a, b, c, d: std_logic;
  
begin 
  test_MUX_2x1: MUX_2x1 port map (a, b, c, d);
    
process
  begin
    --case 1
    a <= '0';
    b <= '0';
    c <= '0';
    wait for 10 ns;
    
    --case 2
    a <= '0';
    b <= '0';
    c <= '1';
    wait for 10 ns;
    
    --case 3
    a <= '0';
    b <= '1';
    c <= '0';    
    wait for 10 ns;
    
    --case 4
    a <= '0';
    b <= '1';
    c <= '1';
    wait for 10 ns;
    
    --case 5
    a <= '1';
    b <= '0';
    c <= '0';
    wait for 10 ns;
    
    --case 6
    a <= '1';
    b <= '0';
    c <= '1';
    wait for 10 ns;
    
    --case 7
    a <= '1';
    b <= '1';
    c <= '0';
    wait for 10 ns;
    
    --case 8
    a <= '1';
    b <= '1';
    c <= '1';
    wait for 10 ns;
    
    wait;
  end process;
  
end TB;

configuration CFG_TB of MUX_2x1_TB is
  for TB
end for;
end CFG_TB;