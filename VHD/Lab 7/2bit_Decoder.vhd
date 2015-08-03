library ieee;
use ieee.std_logic_1164.all;

entity Decoder_2bit is
  port ( a: in std_logic;
         b: in std_logic;
         c: out std_logic;
         d: out std_logic;
         e: out std_logic
       );
     end Decoder_2bit;
     
     architecture struct of Decoder_2bit is
       
       component AND_gate is
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
            
    signal tempNa: std_logic;
    signal tempNb: std_logic;
    
  begin
    
    --map signals
    map_NOT_gatea: NOT_gate port map (a, tempNa);
    map_NOT_gateb: NOT_gate port map (b, tempNb);
    map_AND_gate1: AND_gate port map (tempNa, tempNb, c);
    map_AND_gate2: AND_gate port map (tempNa, b, d);
    map_AND_gate3: AND_gate port map (a, tempNb, e);
      
  end struct;