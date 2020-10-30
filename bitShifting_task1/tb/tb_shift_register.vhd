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
	
	--for dut: shift_register_clk use entity work.shift_register_clk(arch);
	
	SIGNAL button1_s, button2_s : STD_LOGIC;
	SIGNAL clk_s	:	STD_LOGIC;
	SIGNAL q_reg_s 	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
begin
    
    -- shift_register testing with clock pulse
	dut: shift_register_clk
	port map (clk_s, button1_s, button2_s , q_reg_s);
	--port map (clock => clk_s, B1=>button1_s, B2=>button2_s, LEDR=>q_reg_s);
	stimuli: process begin
	wait for 10 ns;
	button1_s <= '1';
	end process;
	
end arch;

use work.all;

configuration cfg_shift_register_clk_tb of shift_register_clk_tb is
	for arch
		for dut : shift_register_clk
			use entity work.shift_register_clk(arch)
			port map (clk => clock, button1 => B1, button2 => B2, q_reg => LEDR);
			--port map (clock => clk, B1=>button1, B2=>button2, LEDR=>q_reg);
		end for;
	end for;
end cfg_shift_register_clk_tb;






















