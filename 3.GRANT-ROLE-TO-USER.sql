ALTER SESSION SET CURRENT_SCHEMA = QLTHUVIEN_21120344;
create or replace NONEDITIONABLE PROCEDURE USP_GRANT_ROLE_FOR_DOCGIA 
( USER_ROLE VARCHAR )
AS 
    CURSOR CUR IS (
        SELECT MADOCGIA FROM DOCGIA
    );
    STRSQL VARCHAR(2000) ; 
    USR VARCHAR2(50); 
BEGIN
    OPEN CUR ; 
    LOOP 
        FETCH CUR INTO USR ; 
        EXIT WHEN CUR%NOTFOUND; 

        STRSQL := 'GRANT ' || USER_ROLE || ' TO ' || USR;
        EXECUTE IMMEDIATE (STRSQL) ; 
    END LOOP ; 
    CLOSE CUR ;
END;
/

create or replace NONEDITIONABLE PROCEDURE USP_GRANT_ROLE_FOR_NV 
( USER_ROLE VARCHAR2, LOAINV VARCHAR2 )
AS 
    CURSOR CUR IS (
        SELECT MANHANVIEN FROM NHANVIEN 
        WHERE LOAINHANVIEN = LOAINV 
    );
    STRSQL VARCHAR(2000) ; 
    USR VARCHAR2(50); 
BEGIN
    OPEN CUR ; 
    LOOP 
        FETCH CUR INTO USR ; 
        EXIT WHEN CUR%NOTFOUND; 

        STRSQL := 'GRANT ' || USER_ROLE || ' TO ' || USR;
        EXECUTE IMMEDIATE (STRSQL) ; 
    END LOOP ; 
    CLOSE CUR ;
END;
/

EXEC USP_GRANT_ROLE_FOR_DOCGIA( 'RL_QLTV_DOCGIA') ; 
EXEC USP_GRANT_ROLE_FOR_NV('RL_QLTV_THUTHU', 'TT') ; 
EXEC USP_GRANT_ROLE_FOR_NV('RL_QLTV_NVQL', 'QL') ; 