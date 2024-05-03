ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
ALTER SESSION SET CURRENT_SCHEMA = QLTHUVIEN_21120344;

CREATE ROLE RL_QLTV_DOCGIA ; 
CREATE ROLE RL_QLTV_NVQL;
CREATE ROLE RL_QLTV_THUTHU; 


GRANT SELECT ON UV_QLTV_XEMPHIEUMUONSACH_DOCGIA TO RL_QLTV_DOCGIA; 
GRANT SELECT ON UV_QLTV_XEMTK_DOCGIA TO RL_QLTV_DOCGIA; 

GRANT SELECT ON UV_QLTV_XEMTK_NHANVIEN TO RL_QLTV_THUTHU;
GRANT SELECT ON UV_QLTV_XEMPHIEUMUON_THUTHU TO RL_QLTV_THUTHU;
GRANT SELECT ON UV_QLTV_XEMTT_PHIEUMUON_THUTHU TO RL_QLTV_THUTHU ;

GRANT SELECT ON UV_QLTV_XEMTK_NHANVIEN TO RL_QLTV_NVQL ; 
GRANT SELECT ON UV_QLTV_XEMTT_THUTHU TO RL_QLTV_NVQL;