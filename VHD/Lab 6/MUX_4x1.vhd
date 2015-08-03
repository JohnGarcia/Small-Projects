library ieee;
use ieee.std_logic_1164.all;

entity MUX_4x1 is
  port ( sel: in std_logic_vector (1 downto 0);
         r1: in std_logic;
         r2: in std_logic;
         r3: in std_logic;
         rout: out std_logic
       );
     end MUX_4x1;
     
     architecture struct of MUX_4x1 is
       
       component Decoder_2bit is
         port ( a: in std_logic;
                b: in std_logic;
                c: out std_logic;
                d: out std_logic;
                e: out std_logic;
                f: out std_logic
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
      signal temp4: std_logic;
      signal temp5: std_logic;
      signal temp6: std_logic;
      signal temp7: std_logic;
      
      begin
        
        --map signals
        map_Decoder_2bit: Decoder_2bit port map (sel(0), sel(1), temp1, temp2, temp3, temp4);
        map_AND_gate1: AND_gate port map (r1, temp1, temp5);
        map_AND_gate2: AND_gate port map (r2, temp2, temp6);
        map_AND_gate3: AND_gate port map (r3, temp3, temp7);
        map_OR_gate1: OR_gate port map (temp5, temp6, temp1);
        map_OR_gate2: OR_gate port map (temp7, temp1, rout);
          
        end struct;