library ieee;
use ieee.std_logic_1164.all;

entity NOT_gate is
  port ( a: in std_logic;
         b: out std_logic
       );
  end NOT_gate;
  
  architecture behav of NOT_gate is
  begin
    
    process (a)
      begin
        if (a = '1') then
          b <= '0';
        else
          b <= '1';
        end if;
      end process;
    end behav;