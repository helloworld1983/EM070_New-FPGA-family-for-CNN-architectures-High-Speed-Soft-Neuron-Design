-- hds header_start
--
-- VHDL Entity InovateFPGA_de10.UART_TX.symbol
--
-- Created:
--          by - HoA.UNKNOWN (LAPTOP-6PPNGBRG)
--          at - 17:31:23 04/25/2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY UART_TX IS
   PORT( 
      D_input      : IN     std_logic_vector (7 DOWNTO 0);
      master_clk   : IN     std_logic;
      rst          : IN     std_logic;
      tx_request   : IN     std_logic;
      Trans_Finish : OUT    std_logic;
      tx_done      : OUT    std_logic;
      uart_tx      : OUT    std_logic
   );

-- Declarations

END UART_TX ;

-- hds interface_end
--
-- VHDL Architecture InovateFPGA_de10.UART_TX.struct
--
-- Created:
--          by - HoA.UNKNOWN (LAPTOP-6PPNGBRG)
--          at - 17:31:23 04/25/2018
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


LIBRARY InovateFPGA_de10;

ARCHITECTURE struct OF UART_TX IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_in     : std_logic_vector(7 DOWNTO 0);
   SIGNAL clk_100u : std_logic;
   SIGNAL en       : std_logic;


   -- Component Declarations
   COMPONENT clk_100us
   PORT (
      rst     : IN     std_logic ;
      clk     : IN     std_logic ;
      en      : IN     std_logic ;
      clk_out : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT register_8bits_en
   PORT (
      rst      : IN     std_logic ;
      clk      : IN     std_logic ;
      en       : IN     std_logic ;
      data_in  : IN     std_logic_vector (7 DOWNTO 0);
      data_out : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT uart_tx_fsm
   PORT (
      D_in         : IN     std_logic_vector (7 DOWNTO 0);
      clk_100u     : IN     std_logic ;
      master_clk   : IN     std_logic ;
      rst          : IN     std_logic ;
      tx_request   : IN     std_logic ;
      Trans_Finish : OUT    std_logic ;
      en           : OUT    std_logic ;
      tx_done      : OUT    std_logic ;
      uart_tx      : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : clk_100us USE ENTITY InovateFPGA_de10.clk_100us;
   FOR ALL : register_8bits_en USE ENTITY InovateFPGA_de10.register_8bits_en;
   FOR ALL : uart_tx_fsm USE ENTITY InovateFPGA_de10.uart_tx_fsm;
   -- pragma synthesis_on


BEGIN
   -- Instance port mappings.
   I0 : clk_100us
      PORT MAP (
         rst     => rst,
         clk     => master_clk,
         en      => en,
         clk_out => clk_100u
      );
   I4 : register_8bits_en
      PORT MAP (
         rst      => rst,
         clk      => master_clk,
         en       => tx_request,
         data_in  => D_input,
         data_out => D_in
      );
   I1 : uart_tx_fsm
      PORT MAP (
         D_in         => D_in,
         clk_100u     => clk_100u,
         master_clk   => master_clk,
         rst          => rst,
         tx_request   => tx_request,
         Trans_Finish => Trans_Finish,
         en           => en,
         tx_done      => tx_done,
         uart_tx      => uart_tx
      );

END struct;
