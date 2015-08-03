library ieee;
use ieee.std_logic_1164.all;

entity One_Bit_ALU_Sub is
  port ( a: in std_logic;
         b: in std_logic;
         binv: in std_logic;
         cin: in std_logic;
         sel: in std_logic_vector (1 downto 0);
         cout: out std_logic;
         result: out std_logic
       );
     end One_Bit_ALU_Sub;
     
    architecture struct of One_Bit_ALU_Sub is
      
      component AND_gate is
        port ( x: in std_logic;
               y: in std_logic;
               z: out std_logic
             );
           end component;
           
      component OR_gate is
        port ( x: in std_logic;
               y: in std_logic;
               z: out std_logic
             );
           end component;
           
      component One_Bit_Adder is
        port ( a: in std_logic;
               b: in std_logic;
               c: in std_logic;
               d: out std_logic;
               e: out std_logic
             );
           end component;
           
      component MUX_4x1 is
        port ( selec: in std_logic_vector (1 downto 0);
               r1: in std_logic;
               r2: in std_logic;
               r3: in std_logic;
               rout: out std_logic
             );
           end component;
           
      component MUX_2x1 is
        port ( a: in std_logic;
               b: in std_logic;
               binv: in std_logic;
               rout: out std_logic
             );
           end component;
           
      component NOT_gate is
        port ( a: in std_logic;
               b: out std_logic
             );
           end component;
           
      signal temp1: std_logic;
      signal temp2: std_logic;
      signal temp3: std_logic;
      signal tempb: std_logic;
      signal tempnb: std_logic;
      
    begin
      
      --map signals
      map_NOT_gate: NOT_gate port map (b, tempnb); --negates b input
      map_MUX_2x1: MUX_2x1 port map (b, tempnb, binv, tempb); --checks for add or sub
      map_AND_gate: AND_gate port map (a, tempb, temp1); --AND result is stored in temp1
      map_OR_gate: OR_gate port map (a, tempb, temp2); --OR result is stored in temp2
      map_One_Bit_Adder: One_Bit_Adder port map (a, tempb, cin, temp3, cout); --Sum is stored in temp3
      map_MUX_4x1: MUX_4x1 port map (sel, temp1, temp2, temp3, result); --Final answer is stored into result
      
    end struct;  