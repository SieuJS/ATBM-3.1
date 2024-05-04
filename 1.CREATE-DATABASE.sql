-- DANG NHAP VAO QLTHUVIEN_21120344/123456


-- Xoa cac bang
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE THUVIEN';
    EXECUTE IMMEDIATE 'DROP TABLE LOAINHANVIEN';
    EXECUTE IMMEDIATE 'DROP TABLE NHANVIEN';
    EXECUTE IMMEDIATE 'DROP TABLE LOAISACH';
    EXECUTE IMMEDIATE 'DROP TABLE SACH';
    EXECUTE IMMEDIATE 'DROP TABLE DOCGIA';
    EXECUTE IMMEDIATE 'DROP TABLE PHIEUMUONSACH';
    EXECUTE IMMEDIATE 'DROP TABLE CHITIETPHIEUMUON';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/


-- Tao cau truc bang
-- THUVIEN
CREATE TABLE THUVIEN (
    MaThuVien VARCHAR2(10) PRIMARY KEY,
    TenThuVien VARCHAR2(100)
);


-- LOAINHANVIEN
CREATE TABLE LOAINHANVIEN (
    MaLoaiNhanVien VARCHAR2(10) PRIMARY KEY,
    TenLoaiNhanVien VARCHAR2(100)
);


-- NHANVIEN
CREATE TABLE NHANVIEN (
    MaNhanVien VARCHAR2(10) PRIMARY KEY,
    MaThuVien VARCHAR2(10),
    LoaiNhanVien VARCHAR2(10),
    HoTen VARCHAR2(100),
    NgaySinh DATE,
    SoDienThoai VARCHAR2(20),
    Email VARCHAR2(100),
    Luong NUMBER(10,2)
);


-- LOAISACH
CREATE TABLE LOAISACH (
    MaLoaiSach VARCHAR2(10) PRIMARY KEY,
    TenLoaiSach VARCHAR2(100)
);


-- SACH
CREATE TABLE SACH (
    MaSach VARCHAR2(10) PRIMARY KEY,
    MaThuVien VARCHAR2(10),
    TenSach VARCHAR2(100),
    LoaiSach VARCHAR2(10)
);


-- DOCGIA
CREATE TABLE DOCGIA (
    MaDocGia VARCHAR2(10) PRIMARY KEY,
    HoTen VARCHAR2(100),
    CMND VARCHAR2(20),
    SoDienThoai VARCHAR2(20),
    NgaySinh DATE
);


-- PHIEUMUONSACH
CREATE TABLE PHIEUMUONSACH (
    MaPhieuMuonSach VARCHAR2(10) PRIMARY KEY,
    MaThuVien VARCHAR2(10),
    MaDocGia VARCHAR2(10),
    Thoigian DATE,
    SoLuong NUMBER,
    MaThuThuKyMuon VARCHAR2(10)
);


-- CHITIETPHIEUMUON
CREATE TABLE CHITIETPHIEUMUON (
    MaPhieuMuonSacH VARCHAR2(10),
    MaSach VARCHAR2(10),
    SoLuong NUMBER,
    PRIMARY KEY (MaPhieuMuonSach, MaSach)
);



-- Rang buoc khoa ngoai
-- NHANVIEN 
ALTER TABLE NHANVIEN ADD (
    CONSTRAINT FK_NV1 FOREIGN KEY (MaThuVien) REFERENCES THUVIEN(MaThuVien),
    CONSTRAINT FK_NV2 FOREIGN KEY (LoaiNhanVien) REFERENCES LOAINHANVIEN(MaLoaiNhanVien)
);


-- SACH
ALTER TABLE SACH ADD( 
    CONSTRAINT FK_S1 FOREIGN KEY (MaThuVien) REFERENCES THUVIEN(MaThuVien),
    CONSTRAINT FK_S2 FOREIGN KEY (LoaiSach) REFERENCES LOAISACH(MaLoaiSach)
);


-- PHIEUMUONSACH
ALTER TABLE PHIEUMUONSACH ADD (
    CONSTRAINT FK_PMS1 FOREIGN KEY (MaThuVien) REFERENCES THUVIEN(MaThuVien),
    CONSTRAINT FK_PMS2 FOREIGN KEY (MaDocGia) REFERENCES DOCGIA(MaDocGia),
    CONSTRAINT FK_PMS3 FOREIGN KEY (MaThuThuKyMuon) REFERENCES NHANVIEN(MaNhanVien)
);


-- CHITIETPHIEUMUON
ALTER TABLE CHITIETPHIEUMUON ADD (
    CONSTRAINT FK_CTPM1 FOREIGN KEY (MaPhieuMuonSach) REFERENCES PHIEUMUONSACH(MaPhieuMuonSach),
    CONSTRAINT FK_CTPM2 FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)
);



-- Nhap du lieu
-- THUVIEN
INSERT ALL 
    INTO THUVIEN VALUES ('TV001', 'Th? vi?n A')
    INTO THUVIEN VALUES ('TV002', 'Th? vi?n B')
    INTO THUVIEN VALUES ('TV003', 'Th? vi?n C')
SELECT * FROM DUAL;


-- LOAINHANVIEN
INSERT ALL 
    INTO LOAINHANVIEN VALUES ('TT', 'TH? TH?')
    INTO LOAINHANVIEN VALUES ('QL', 'NH�N VI�N QU?N L�')
SELECT * FROM DUAL;


-- NHANVIEN
INSERT ALL 
    INTO NHANVIEN VALUES ('NV001', 'TV001', 'TT', 'Nguy?n V?n A', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '123456789', 'nvA@example.com', 5000000)
    INTO NHANVIEN VALUES ('NV002', 'TV001', 'TT', 'Nguy?n Th? B', TO_DATE('1995-05-05', 'YYYY-MM-DD'), '987654321', 'ntB@example.com', 4500000)
    INTO NHANVIEN VALUES ('NV003', 'TV001', 'QL', 'Tr?n V?n C', TO_DATE('1985-10-10', 'YYYY-MM-DD'), '456123789', 'tvC@example.com', 7000000)
    INTO NHANVIEN VALUES ('NV004', 'TV002', 'TT', 'Ph?m V?n D', TO_DATE('1992-03-15', 'YYYY-MM-DD'), '321654987', 'pvD@example.com', 4800000)
    INTO NHANVIEN VALUES ('NV005', 'TV002', 'TT', 'L� Th? E', TO_DATE('1998-07-20', 'YYYY-MM-DD'), '654987321', 'ltE@example.com', 4700000)
    INTO NHANVIEN VALUES ('NV006', 'TV002', 'QL', 'Ho�ng V?n F', TO_DATE('1988-12-25', 'YYYY-MM-DD'), '789456123', 'hvF@example.com', 7500000)
    INTO NHANVIEN VALUES ('NV007', 'TV003', 'TT', 'Tr?n Th? G', TO_DATE('1993-04-30', 'YYYY-MM-DD'), '987123654', 'ttG@example.com', 4900000)
    INTO NHANVIEN VALUES ('NV008', 'TV003', 'TT', 'L� V?n H', TO_DATE('1996-08-10', 'YYYY-MM-DD'), '321789654', 'lvH@example.com', 4600000)
    INTO NHANVIEN VALUES ('NV009', 'TV003', 'QL', 'Nguy?n Th? I', TO_DATE('1983-09-05', 'YYYY-MM-DD'), '654321987', 'ntI@example.com', 7200000)
SELECT * FROM DUAL;


-- LOAISACH
INSERT ALL 
    INTO LOAISACH VALUES ('LS001', 'Ti?u thuy?t')
    INTO LOAISACH VALUES ('LS002', 'Khoa h?c')
    INTO LOAISACH VALUES ('LS003', 'S�ch tham kh?o')
SELECT * FROM DUAL;


-- SACH
INSERT ALL 
    INTO SACH VALUES ('S001', 'TV001', 'Ng??i M? T?t', 'LS001')
    INTO SACH VALUES ('S002', 'TV001', 'Thi�n Nga ?en', 'LS001')
    INTO SACH VALUES ('S003', 'TV001', 'V? Tr? ?ang N�i Chuy?n V?i T�i', 'LS002')
    INTO SACH VALUES ('S004', 'TV002', 'Cu?c Chi?n 1000 N?m', 'LS002')
    INTO SACH VALUES ('S005', 'TV002', 'L?p Tr�nh Python', 'LS003')
    INTO SACH VALUES ('S006', 'TV003', 'Ch�n Kinh V?t L�', 'LS003')
SELECT * FROM DUAL;


-- DOCGIA
INSERT ALL 
    INTO DOCGIA VALUES ('DG001', 'Tr?n V?n An', '123456789', '0987654321', TO_DATE('1990-02-02', 'YYYY-MM-DD'))
    INTO DOCGIA VALUES ('DG002', 'Nguy?n Th? B�nh', '987654321', '0123456789', TO_DATE('1995-06-06', 'YYYY-MM-DD'))
    INTO DOCGIA VALUES ('DG003', 'L� V?n C??ng', '456123789', '0912345678', TO_DATE('1988-11-11', 'YYYY-MM-DD'))
SELECT * FROM DUAL;


-- PHIEUMUONSACH
INSERT ALL 
    INTO PHIEUMUONSACH VALUES ('PMS001', 'TV001', 'DG001', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 2, 'NV001')
    INTO PHIEUMUONSACH VALUES ('PMS002', 'TV002', 'DG002', TO_DATE('2024-03-25', 'YYYY-MM-DD'), 3, 'NV004')
    INTO PHIEUMUONSACH VALUES ('PMS003', 'TV003', 'DG003', TO_DATE('2024-07-12', 'YYYY-MM-DD'), 1, 'NV007')  
SELECT * FROM DUAL;


-- CHITIETPHIEUMUON
INSERT ALL 
    INTO CHITIETPHIEUMUON VALUES ('PMS001', 'S001', 1)
    INTO CHITIETPHIEUMUON VALUES ('PMS001', 'S002', 1)
    INTO CHITIETPHIEUMUON VALUES ('PMS002', 'S003', 2)
    INTO CHITIETPHIEUMUON VALUES ('PMS002', 'S004', 1)
    INTO CHITIETPHIEUMUON VALUES ('PMS003', 'S005', 1)
    INTO CHITIETPHIEUMUON VALUES ('PMS003', 'S006', 1)
SELECT * FROM DUAL;



-- Kiem tra du lieu
SELECT * FROM QLThuVien_21120344.THUVIEN;
SELECT * FROM QLThuVien_21120344.LOAINHANVIEN;
SELECT * FROM QLThuVien_21120344.NHANVIEN;
SELECT * FROM QLThuVien_21120344.LOAISACH;
SELECT * FROM QLThuVien_21120344.SACH;
SELECT * FROM QLThuVien_21120344.DOCGIA;
SELECT * FROM QLThuVien_21120344.PHIEUMUONSACH;
SELECT * FROM QLThuVien_21120344.CHITIETPHIEUMUON;



