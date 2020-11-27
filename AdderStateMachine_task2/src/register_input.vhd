LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------
ENTITY register_input IS 
    PORT(
        rb_i     : IN STD_LOGIC;
        cp_i     : IN STD_LOGIC;
        sp_i     : IN STD_LOGIC;
		lp_i 	: IN STD_LOGIC;
        dv_i   : IN STD_LOGIC;
        in1_o     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        in2_o   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        inv_o     : OUT STD_LOGIC;
		showLed	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END shaper_fsm_e;

ARCHITECTURE arch of register_input IS
	
	TYPE state_name IS (s0, s1, s2);
    SIGNAL state_s : state_name := s0;
	
	SIGNAL count : INTEGER 0 to 15;
	
BEGIN

	clocked : PROCESS(rb_i, cp_i, sp_i, lv_i, dv_i)
	BEGIN
		
		IF(rb_i = '0') THEN state_s <= s0;
		ELSE
			IF(rising_edge(cp_i)) THEN
				CASE state_s IS
					WHEN s0 => IF(dv_i = '1') THEN state_s <= s1; END IF;
					WHEN s1 => state_s <= s2;
					WHEN s2 => state_s <= s0;
					WHEN others => state_s <= s0;
				END CASE;
			END IF;
	END PROCESS clocked;
	
	result : PROCESS(state_s)
	BEGIN
		
	END PROCESS result;
END arch;