library ieee;
use ieee.std_logic_1164.all;

entity OF_check is
  port ( a: in std_logic;
         b: in std_logic;
         sum: in std_logic;
         ofout: out std_logic
       );
     end OF_check;
     
     architecture struct of OF_check is
       
       component NOT_gate is
         port ( a: in std_logic;
                b: out std_logic
              );
            end component;
            
        component AND_gate is
          port ( x: in std_logic;
                 y: in std_logic;
                 z: out std_logic
               );
             end component;
             
        component XOR_gate is
          port ( a: in std_logic;
                 b: in std_logic;
                 c: out std_logic
               );
             end component;
             
        signal temp1: std_logic;
        signal temp2: std_logic;
        signal temp3: std_logic;
        
        begin
          
          --map signals
          map_XOR_gate1: XOR_gate port map (a, b, temp1);
          map_XOR_gate2: XOR_gate port map (a, sum, temp2);
          map_NOT_gate: NOT_gate port map (temp1, temp3);
          map_AND_gate: AND_gate port map (temp2, temp3, ofout);
            
          end struct;