library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity adder_clk is 
port (in_1, in_2: in std_logic_vector (7  downto 0);
		clk:in std_logic;
		invs : in std_logic;
		out_0:out std_logic_vector (7 downto 0));
end adder_clk;

architecture arch of adder_clk is
		
		begin 
			process(clk)
				begin
					if(rising_edge(clk)) then
					if ( invs = '1') then
					out_0 <= std_logic_vector (unsigned(in_1) + unsigned(in_2));
					end if;
					end if;
			end process;
end arch;