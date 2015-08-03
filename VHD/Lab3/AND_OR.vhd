library ieee;
use ieee.std_logic_1164.all;

entity AND_OR is
port( a: in std_logic;
      b: in std_logic;
      c: in std_logic;
      d:  out std_logic
      );
end AND_OR;

architecture struct of AND_OR is

   component AND_gate is
   port( x: in std_logic;
         y: in std_logic;
         z: out std_logic
        );
   end component;
   
   component OR_gate is
   port( x: in std_logic;
         y: in std_logic;
         z: out std_logic
       );
   end component;

   signal temp1: std_logic; --to store the output of the first AND gate

begin
   
   --map signals of the outer component to subcomponents - idea of parameter passing
   map_AND_gate: AND_gate port map (a, b, temp1); --now, temp1 holds the output of AND
   map_OR_gate: OR_gate port map (temp1, c, d); --then, temp1 is passed to the OR operation as an input
                                             --output of the OR gate becomes the output(d) of AND_OR

end struct;