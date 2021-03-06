library ieee;
use ieee.std_logic_1164.all;

entity ALU_8bit is
  port ( a: in std_logic_vector (7 downto 0);
         b: in std_logic_vector (7 downto 0);
         binv: in std_logic;
         op: in std_logic_vector (1 downto 0);
         cout: out std_logic;
         over: out std_logic;
         r: out std_logic_vector (7 downto 0)
       );
     end ALU_8bit;
     
     architecture struct of ALU_8bit is
            
        component One_Bit_ALU_OF is
          port ( a: in std_logic;
                 b: in std_logic;
                 binv: in std_logic;
                 cin: in std_logic;
                 sel: in std_logic_vector (1 downto 0);
                 cout: out std_logic;
                 result: out std_logic;
                 over: out std_logic
               );
             end component;
             
        component One_Bit_ALU_Sub is
          port ( a: in std_logic;
                 b: in std_logic;
                 binv: in std_logic;
                 cin: in std_logic;
                 sel: in std_logic_vector (1 downto 0);
                 cout: out std_logic;
                 result: out std_logic
               );
             end component;
         
         signal temp1: std_logic;
         signal temp2: std_logic;
         
        begin
        
          --mapsignals    
          map_One_Bit_ALU_Sub1: One_Bit_ALU_Sub port map (a(0), b(0), binv, binv, op, temp1, r(0));
          map_One_Bit_ALU_Sub2: One_Bit_ALU_Sub port map (a(1), b(1), binv, temp1, op, temp2, r(1));
          map_One_Bit_ALU_Sub3: One_Bit_ALU_Sub port map (a(2), b(2), binv, temp2, op, temp1, r(2));
          map_One_Bit_ALU_Sub4: One_Bit_ALU_Sub port map (a(3), b(3), binv, temp1, op, temp2, r(3));
          map_One_Bit_ALU_Sub5: One_Bit_ALU_Sub port map (a(4), b(4), binv, temp2, op, temp1, r(4));
          map_One_Bit_ALU_Sub6: One_Bit_ALU_Sub port map (a(5), b(5), binv, temp1, op, temp2, r(5));
          map_One_Bit_ALU_Sub7: One_Bit_ALU_Sub port map (a(6), b(6), binv, temp2, op, temp1, r(6));
          map_One_Bit_ALU_OF: One_Bit_ALU_OF port map (a(7), b(7), binv, temp1, op, cout, r(7), over);
          
        end struct;  