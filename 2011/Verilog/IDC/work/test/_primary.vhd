library verilog;
use verilog.vl_types.all;
entity test is
    generic(
        IMAGE_N_PAT     : integer := 64;
        CMD_N_PAT       : integer := 45;
        t_reset         : integer := 200
    );
end test;
