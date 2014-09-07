library verilog;
use verilog.vl_types.all;
entity IRB is
    generic(
        WORD_WIDTH      : integer := 8;
        WORD_DEPTH      : integer := 64;
        ADDR_WIDTH      : integer := 6
    );
    port(
        CLK             : in     vl_logic;
        WENn            : in     vl_logic;
        A               : in     vl_logic_vector;
        D               : in     vl_logic_vector
    );
end IRB;
