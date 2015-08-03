library ieee;
use ieee.std_logic_1164.all;

entity XOR_gate is
  port ( a: in std_logic;
         b: in std_logic;
         c: out std_logic
       );
  end XOR_gate;
  
  architecture struct of XOR_gate is
    
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
      
    component NOT_gate is
      port ( a: in std_logic;
             b: out std_logic
           );
      end component;
      
      signal temp1: std_logic;
      signal temp2: std_logic;
      signal temp3: std_logic;
      signal temp4: std_logic;
      
    begin
      
      --map signals
      map_NOT_gate: NOT_gate port map (b, temp1);
      map_AND_gate: AND_gate port map (a, temp1, temp2);
      map_NOT_gate2: NOT_gate port map (a, temp3);
      map_AND_gate2: AND_gate port map (temp3, b, temp4);
      map_OR_gate: OR_gate port map (temp2, temp4, c);
        
    end struct;