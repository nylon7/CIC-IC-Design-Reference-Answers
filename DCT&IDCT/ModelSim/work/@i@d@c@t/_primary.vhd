library verilog;
use verilog.vl_types.all;
entity IDCT is
    port(
        value_out       : out    vl_logic_vector(9 downto 0);
        value_in        : in     vl_logic_vector(9 downto 0);
        display         : in     vl_logic_vector(1 downto 0);
        Array_value     : in     vl_logic_vector(6 downto 0)
    );
end IDCT;
