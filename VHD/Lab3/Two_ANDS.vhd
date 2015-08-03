library ieee;
use ieee.std_logic_1164.all;

entity Two_ANDS is
port( x1: in std_logic;
      x2: in std_logic;
      x3: in std_logic;
      y:  out std_logic
      );
end Two_ANDS;

architecture struct of Two_ANDS is

   --use previously designed subcomponent
   component AND_gate is
   port( x: in std_logic;
         y: in std_logic;
         z: out std_logic
        );
   end component;

   signal temp1: std_logic; --to store the output of the first AND gate

begin
   
   --map signals of the outer component to subcomponents - idea of parameter passing
   map_AND_gate1: AND_gate port map (x1, x2, temp1); --now, temp1 holds the output of the first AND
   map_AND_gate2: AND_gate port map (temp1, x3, y); --then, temp1 is passed to the 2nd AND as an input
                                             --output of the 2nd AND becomes the output(y) of Two_ANDS

end struct;
