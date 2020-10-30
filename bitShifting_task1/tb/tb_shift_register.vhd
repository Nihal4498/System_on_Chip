-- tb_shift_register.vhd

-- created by   :   Meher Krishna Patel
-- date                 :   22-Dec-16

-- Modified by M.Pfeil 25.10.19

library ieee;
use ieee.std_logic_1164.all;

entity shift_register_clk_tb is
end shift_register_clk_tb;

architecture arch of shift_register_clk_tb is
   
   component shift_register_clk is
    port(
        clock : in std_logic; 
		B1, B2 : in std_logic;
        LEDR : out std_logic_vector (7 downto 0)
    );
	end component;
	
	for dut: shift_register_clk use entity work.shift_register_clk(arch);
	
	SIGNAL button1, button2 : STD_LOGIC;
	SIGNAL clk	:	STD_LOGIC;
	SIGNAL q_reg 	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
begin
    
    -- shift_register testing with clock pulse
    port map (clk => clock, button1=>B1,button2=>B2,
                    q_reg=>LEDR);
					
	stimuli: process begin
	wait for 10 ns;
	button1 <= '1';
	end process;
	
end arch;

USE work.all;

configuration cfg_shift_register_clk_tb of shift_register_clk_tb is
	for arch
		for dut : shift_register_clk
			use entity work.shift_register_clk(arch);
		end for;
	end for;
end cfg_shift_register_clk_tb;






















