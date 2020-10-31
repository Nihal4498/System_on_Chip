-- shift_register_visualTest.vhd

-- created by   :   Meher Krishna Patel
-- date                 :   22-Dec-16

-- Modified by M.Pfeil 25.10.19

library ieee;
use ieee.std_logic_1164.all;

entity shift_register_clk_tb is
    
end shift_register_clk_tb;

architecture arch of shift_register_clk_tb is
   
   component shift_register_clk_comp is
    port(
        clock : in std_logic; 
		B1, B2 : in std_logic;
        LEDR : out std_logic_vector (7 downto 0)
    );
	end component;
	SIGNAL clk, button1, button2 : std_logic;
	SIGNAL q_reg : std_logic_vector(7 downto 0);
begin
    
    -- shift_register testing with clock pulse
    dut: shift_register_clk_comp    
    port map (	clock => clk,
				B1 => button1,
				B2 => button2,
				LEDR => q_reg);
					
	stimuli: process begin
	wait for 10 ns;
	button1 <= '1';
	end process;
	
end arch;

configuration cfg_shift_register_clk_tb of shift_register_clk_tb is
for arch
	for dut: shift_register_clk_comp
		use entity work.shift_register_clk(arch)
		port map (clk => clock, button1=>B1,button2=>B2,
						q_reg=>LEDR);
	end for;
end for;
end cfg_shift_register_clk_tb;