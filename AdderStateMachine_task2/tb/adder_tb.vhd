library ieee;
use ieee.std_logic_1164.all;

entity adder_clk_tb is
 
end adder_clk_tb;

architecture arch of adder_clk_tb is

component adder_clk is

port (
		in_1: in std_logic_vector (7  downto 0); 
		in_2: in std_logic_vector (7  downto 0);
        clk: in std_logic;
        invs : in std_logic;
        out_0: out std_logic_vector (7 downto 0)
		);
end component;

SIGNAL in_1_s, in_2_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL out_0_s : STD_LOGIC_VECTOR (7 DOWNTO  0);
SIGNAl clk_s : STD_LOGIC ;
SIGNAl invs_s : STD_LOGIC ;
                

begin

dut: entity work.adder_clk

port map (clk => clk_s, in_1 => in_1_s, in_2 => in_2_s,
                    out_0=>out_0_s, invs => invs_s);
                                        
                clocked : PROCESS
                BEGIN
                        clk_s <= '1';
                        WAIT For 10 ns;
                        clk_s <= '0';
                        WAIT For 10 ns;
                END PROCESS clocked;
                                        
        stimuli: process 
                begin
                        invs_s <='0';
                        in_1_s <= "00000001";
                        in_2_s <= "00000001";
                        wait until rising_edge(clk_s);
                        invs_s <='1';
                        in_1_s <= "00000001";
                        in_2_s <= "00000001";
                        
                        WAIT;
                end process stimuli;
                        
end arch;