library verilog;
use verilog.vl_types.all;
entity test is
    generic(
        INPUT_DATA      : string  := "in.dat";
        GOLDEN          : string  := "out_golden.dat";
        N_PAT           : integer := 2000;
        t_reset         : integer := 20
    );
end test;
