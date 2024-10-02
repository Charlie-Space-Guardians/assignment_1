----------------------------------------------------------------------------------
-- Company:
-- Engineer:h
--
-- Create Date: 09/25/2024 12:27:25 PM
-- Design Name:
-- Module Name: alu - Behavioral
-- Project Name:
-- Target Devices: fh
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( A : in unsigned (15 downto 0);
           B : in unsigned (15 downto 0);
           FN : in STD_LOGIC_VECTOR (1 downto 0);
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           Y : inout unsigned (15 downto 0));
end alu;

architecture Behavioral of alu is

begin process(A,B,FN,Y)
    begin
        case FN is
            when "00" =>
                Y <= A-B; -- A > B
            when "01" =>
                Y <= B-A; -- B < A
            when "10" =>
                Y <= A; -- C <- A
            when "11" =>
                Y <= B; -- C <- B
            when others =>
                Y <= A;
              
        end case;
        
        if Y(15) = '1' then -- if negative...
            N <= '1';
            Z <= '0';
        elsif Y = "00000000000000" then -- if 0...
            N <= '0';
            Z <= '1';
        else
            N <= '0';
            Z <= '0'; 
       end if;
                  
 end process;
end Behavioral;
