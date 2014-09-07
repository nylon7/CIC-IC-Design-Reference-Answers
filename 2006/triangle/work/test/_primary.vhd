library verilog;
use verilog.vl_types.all;
entity test is
    generic(
        INPUT_DATA      : string  := "input.dat";
        EXPECT_DATA     : string  := "expect.dat";
        period          : integer := 1000
    );
end test;
