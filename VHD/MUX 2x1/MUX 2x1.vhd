library ieee;
use ieee.std_logic_1164.all;

entity MUX_2x1 is
port ( a: in std_logic;
       b: in std_logic;
       c: in std_logic;
       d: out std_logic
       );
end MUX_2x1;

architecture behav of MUX_2x1 is
begin
  
  process (a, b, c)
    begin
      if (c='0') then
        d <= a;
      else 
        d <= b;
      end if;
    end process;
  end behav;