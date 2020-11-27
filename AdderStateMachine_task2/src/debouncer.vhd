LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------

ENTITY debouncer IS
	PORT(
		cp_i 		: 	IN STD_LOGIC;
		rb_i 		: 	IN STD_LOGIC;
		clk_1m_i 	: 	IN STD_LOGIC;
		clk_2s_i_i 	: 	IN STD_LOGIC;
		rp_i 		: 	IN STD_LOGIC;
		sp_o		:	OUT STD_LOGIC;
		lp_o		:	OUT STD_LOGIC;
		dv_o		:	OUT STD_LOGIC
	);
END debouncer;

ARCHITECTURE debouncer IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18);
    SIGNAL cstate_s : state_name := idle_st;
---------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------------------------------------------------------------------
    clocked:PROCESS (cp_i, clk_1m_i, clk_2s_i, rp_i)
    BEGIN
        IF (rb_i= '0') THEN cstate_s <= wait_s;
        ELSIF (cp_i'EVENT AND cp_i='1' AND cp_i'LAST_VALUE='0') THEN
            CASE cstate_s IS
                WHEN s0 => IF(clk_1m_i='1' AND clk_2s_i='0' AND rp_i = '1') THEN state_s <= s1;END IF;
                WHEN s1 => IF((clk_1m_i='1' AND clk_2s_i='0' AND rp_i='1') THEN state_s <= s2;END IF;
                WHEN s2 => IF(clk_1m_i='1' AND clk_2s_i='0'  AND rp_i='1') THEN state_s <= s3;END IF;
                WHEN s3 => IF(clk_1m_i='1' AND clk_2s_i='0'  AND rp_i='1') THEN state_s <= s4;END IF;
                WHEN s4 => IF(clk_1m_i='1' AND clk_2s_i='0'  AND rp_i='1') THEN state_s <= s5;END IF;
				WHEN s5 => IF(clk_1m_i='1' AND clk_2s_i='0'  AND rp_i='1') THEN state_s <= s6;END IF;
                WHEN s6 => IF(clk_1m_i='1' AND clk_2s_i='0'  AND rp_i='1') THEN state_s <= s7;END IF;
                WHEN s7 => IF(clk_1m_i='1' AND clk_2s_i='0'  AND rp_i='1') THEN state_s <= s8;END IF;
                WHEN s8 => IF(clk_1m_i='1' AND clk_2s_i='0'  AND rp_i='1') THEN state_s <= s9;END IF;
                WHEN s9 => IF(clk_1m_i='1' AND clk_2s_i='0'  AND rp_i='1') THEN state_s <= s10;END IF;
				WHEN s10 => IF(clk_1m_i='1' AND clk_2s_i='0' AND rp_i='1') THEN state_s <= s11;END IF;
                WHEN s11 => IF(clk_1m_i='1' AND clk_2s_i='0' AND rp_i='1') THEN state_s <= s12;END IF;
                WHEN s12 => IF(clk_1m_i='1' AND clk_2s_i='0' AND rp_i='1') THEN state_s <= s13;END IF;
                WHEN s13 => IF(clk_1m_i='1' AND clk_2s_i='0' AND rp_i='1') THEN state_s <= s14;END IF;
                WHEN s14 => IF(clk_1m_i='1' AND clk_2s_i='0' AND rp_i='1') THEN state_s <= s15;END IF;
				WHEN s15 => IF(clk_1m_i='1' AND clk_2s_i='1' AND rp_i='1') THEN state_s <= s16;END IF;
                WHEN s16=> IF(clk_1m_i='1' AND clk_2s_i='1' AND rp_i='0') THEN state_s <= s17;END IF;
				WHEN s16> IF(clk_1m_i='1' AND clk_2s_i='1'  AND rp_i='1') THEN state_s <= s18;END IF;
				WHEN s18 => IF(clk_1m_i='1' AND clk_2s_i='0' AND dv_0='0') THEN state_s <= s0;END IF;
                    
                    
					
            END CASE;	  
        END IF;
    END PROCESS clocked;