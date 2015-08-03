library ieee;
use ieee.std_logic_1164.all;

entity MUX_2x1 is 
  port ( a: in std_logic;
         b: in std_logic;
         binv: in std_logic;
         rout: out std_logic
       );
     end MUX_2x1;
     
     architecture struct of MUX_2x1 is
       
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
             
        component OR_gate is
          port ( x: in std_logic;
                 y: in std_logic;
                 z: out std_logic
               );
             end component;
             
  signal temp1: std_logic;
  signal temp2: std_logic;
  signal temp3: std_logic;
  
  begin
    
    --map signals
    map_NOT_gate: NOT_gate port map (binv, temp1);
    map_AND_gate1: AND_gate port map (a, temp1, temp2);
    map_AND_gate2: AND_gate port map (b, binv, temp3);
    map_OR_gate: OR_gate port map (temp2, temp3, rout);
      
    end struct;