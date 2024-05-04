-- ATBM-CQ-14
-- 21120344 - Nguyen Trong Tri
-- 21120321 - Nguyen Van Sieu
-- 21120565 - Tran Van Thong
-- 21120416 - Vo Quoc Bao


-- Phan cong cong viec:
-- Tri: 
--    a. Tao co so du lieu, nhap du lieu mau: 100%
--    b. Nhap du lieu mau: 100%
-- Sieu: c. Tao tai khoan cho nguoi dung, nhom nguoi dung: 100%
-- Thong: d. Phan quyen cho doc gia va xem tai khoan nhan vien 100%
-- Bao: e. phan quyen cho thu thu va nhan vien quan ly 100%

-- CACH CHAY : 
-- CHAY THEO THU TU, CHINH SUA THEO COMMENT CUA MOI FILE 


-- Tao co so du lieu
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
DROP USER QLThuVien_21120344 CASCADE;
/
CREATE USER QLThuVien_21120344 IDENTIFIED BY 123456 QUOTA 20M ON USERS;
GRANT ALL PRIVILEGES TO QLThuVien_21120344;
/
