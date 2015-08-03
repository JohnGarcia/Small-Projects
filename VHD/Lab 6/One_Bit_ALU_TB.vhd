library ieee;
use ieee.std_logic_1164.all;

entity One_Bit_ALU_TB is
end One_Bit_ALU_TB;

architecture TB of One_Bit_ALU_TB is
  
  component One_Bit_ALU is
    port ( a: in std_logic;
           b: in std_logic;
           cin: in std_logic;
           sel: in std_logic_vector (1 downto 0);
           cout: out std_logic;
           result: out std_logic
         );
       end component;
       
       signal a, b, cin, cout, result: std_logic;
       signal sel: std_logic_vector (1 downto 0);
       
       begin
         test_One_Bit_ALU: One_Bit_ALU port map (a, b, cin, sel, cout, result);
           
           process
             begin
               --case 1
               a <= '0';
               b <= '0';
               cin <= '0';
               sel <= "00";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 1 failed" severity error;
               
               --case 2
               a <= '0';
               b <= '0';
               cin <= '0';
               sel <= "01";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 2 failed" severity error;
               
               --case 3
               a <= '0';
               b <= '0';
               cin <= '0';
               sel <= "10";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 3 failed" severity error;
               
               --case 4
               a <= '0';
               b <= '0';
               cin <= '1';
               sel <= "00";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 4 failed" severity error;
               
               --case 5
               a <= '0';
               b <= '0';
               cin <= '1';
               sel <= "01";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 5 failed" severity error;
               
               --case 6
               a <= '0';
               b <= '0';
               cin <= '1';
               sel <= "10";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 6 failed" severity error;
               
               --case 7
               a <= '0';
               b <= '1';
               cin <= '0';
               sel <= "00";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 7 failed" severity error;
               
               --case 8
               a <= '0';
               b <= '1';
               cin <= '0';
               sel <= "01";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 8 failed" severity error;
               
               --case 9
               a <= '0';
               b <= '1';
               cin <= '0';
               sel <= "10";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 9 failed" severity error;
               
               --case 10
               a <= '0';
               b <= '1';
               cin <= '1';
               sel <= "00";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 10 failed" severity error;
               
               --case 11
               a <= '0';
               b <= '1';
               cin <= '1';
               sel <= "01";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 11 failed" severity error;
               
               --case 12
               a <= '0';
               b <= '1';
               cin <= '1';
               sel <= "10";
               wait for 10 ns;
               assert (cout = '1' and result = '0')
               report "case 12 failed" severity error;
               
               --case 13
               a <= '1';
               b <= '0';
               cin <= '0';
               sel <= "00";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 13 failed" severity error;
               
               --case 14
               a <= '1';
               b <= '0';
               cin <= '0';
               sel <= "01";
               wait for 10 ns;
               assert (cout ='0' and result = '1')
               report "case 14 failed" severity error;
               
               --case 15
               a <= '1';
               b <= '0';
               cin <= '0';
               sel <= "10";
               wait for 10 ns;
               assert (cout = '0' and result = '1')             
               report "case 15 failed" severity error;
               
               --case 16
               a <= '1';
               b <= '0';
               cin <= '1';
               sel <= "00";
               wait for 10 ns;
               assert (cout = '0' and result = '0')
               report "case 16 failed" severity error;
               
               --case 17
               a <= '1';
               b <= '0';
               cin <= '1';
               sel <= "01";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 17 failed" severity error;
               
               --case 18
               a <= '1';
               b <= '0';
               cin <= '1';
               sel <= "10";
               wait for 10 ns;
               assert (cout = '1' and result = '0')
               report "case 18 failed" severity error;
               
               --case 19
               a <= '1';
               b <= '1';
               cin <= '0';
               sel <= "00";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 19 failed" severity error;
               
               --case 20
               a <= '1';
               b <= '1';
               cin <= '0';
               sel <= "01";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 20 failed" severity error;
               
               --case 21
               a <= '1';
               b <= '1';
               cin <= '0';
               sel <= "10";
               wait for 10 ns;
               assert (cout = '1' and result = '0')
               report "case 21 failed" severity error;
               
               --case 22
               a <= '1';
               b <= '1';
               cin <= '1';
               sel <= "00";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 22 failed" severity error;
               
               --case 23
               a <= '1';
               b <= '1';
               cin <= '1';
               sel <= "01";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 23 failed" severity error;
               
               --case 24
               a <= '1';
               b <= '1';
               cin <= '1';
               sel <= "10";
               wait for 10 ns;
               assert (cout = '0' and result = '1')
               report "case 24 failed" severity error;
               
               wait;
             end process;
             
           end TB;
           
           configuration CFG_TB of One_Bit_ALU_TB is
             for TB
           end for;
         end CFG_TB;