library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity adder_clk is 
port (in_1, in_2: in std_logic_vector (7  downto 0);
		clk:in std_logic;
		rb_i: IN Std_logic;
		inv_s : in std_logic;
		out_o:out std_logic_vector (7 downto 0));
end adder_clk;

architecture arch of adder_clk is
		
		begin 
			process(clk)
				begin
					if(rb_i = '0') THEN
						out_o <= (OTHERS => '0');
					elsif(rising_edge(clk)) then
						if ( inv_s = '1') then
							out_o <= std_logic_vector (unsigned(in_1) + unsigned(in_2));
						end if;
					end if;
			end process;
end arch;