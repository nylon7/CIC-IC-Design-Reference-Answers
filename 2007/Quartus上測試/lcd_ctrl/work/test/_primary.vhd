library verilog;
use verilog.vl_types.all;
entity test is
    generic(
        IMAGE_N_PAT     : integer := 36;
        CMD_N_PAT       : integer := 30;
        OUT_LENGTH      : integer := 270;
        t_reset         : integer := 200
    );
end test;
