library verilog;
use verilog.vl_types.all;
entity tb is
    generic(
        IMAGE_N_PAT     : integer := 108;
        CMD_N_PAT       : integer := 22;
        OUT_LENGTH      : integer := 352;
        t_reset         : integer := 200
    );
end tb;
