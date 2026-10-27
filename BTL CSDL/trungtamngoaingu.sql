CREATE DATABASE trungtamngoaingu;

USE trungtamngoaingu;

CREATE TABLE hoc_vien (
    ma_hv VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100),
    ngay_sinh DATE,
    sdt VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE giao_vien (
    ma_gv VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100),
    sdt VARCHAR(20),
    email VARCHAR(100)
);

SHOW TABLES;

CREATE TABLE khoa_hoc (
    ma_kh VARCHAR(10) PRIMARY KEY,
    ten_khoa_hoc VARCHAR(100),
    hoc_phi DECIMAL(10,2)
);


CREATE TABLE lop_hoc (
    ma_lop VARCHAR(10) PRIMARY KEY,
    ten_lop VARCHAR(100),
    ma_gv VARCHAR(10),
    ma_kh VARCHAR(10),
    FOREIGN KEY (ma_gv) REFERENCES giao_vien(ma_gv),
    FOREIGN KEY (ma_kh) REFERENCES khoa_hoc(ma_kh)
);


CREATE TABLE ghi_danh (
    ma_hv VARCHAR(10),
    ma_lop VARCHAR(10),
    trang_thai VARCHAR(30),
    PRIMARY KEY (ma_hv, ma_lop),
    FOREIGN KEY (ma_hv) REFERENCES hoc_vien(ma_hv),
    FOREIGN KEY (ma_lop) REFERENCES lop_hoc(ma_lop)
);


CREATE TABLE hoc_phi (
    ma_hp VARCHAR(10) PRIMARY KEY,
    ma_hv VARCHAR(10),
    so_tien DECIMAL(10,2),
    con_no DECIMAL(10,2),
    FOREIGN KEY (ma_hv) REFERENCES hoc_vien(ma_hv)
);


CREATE TABLE diem_danh (
    ma_dd VARCHAR(10) PRIMARY KEY,
    ma_hv VARCHAR(10),
    ma_lop VARCHAR(10),
    trang_thai VARCHAR(20),
    FOREIGN KEY (ma_hv) REFERENCES hoc_vien(ma_hv),
    FOREIGN KEY (ma_lop) REFERENCES lop_hoc(ma_lop)
);


CREATE TABLE diem_so (
    ma_diem VARCHAR(10) PRIMARY KEY,
    ma_hv VARCHAR(10),
    ma_lop VARCHAR(10),
    diem_giua_ky FLOAT,
    diem_cuoi_ky FLOAT,
    FOREIGN KEY (ma_hv) REFERENCES hoc_vien(ma_hv),
    FOREIGN KEY (ma_lop) REFERENCES lop_hoc(ma_lop)
);


CREATE TABLE tai_khoan (
    ten_dang_nhap VARCHAR(50) PRIMARY KEY,
    mat_khau VARCHAR(100),
    vai_tro VARCHAR(30)
);

SHOW TABLES;


INSERT INTO hoc_vien
VALUES
('HV01','Nguyen Van A','2005-01-01','0911111111','a@gmail.com'),
('HV02','Tran Thi B','2005-03-15','0922222222','b@gmail.com'),
('HV03','Le Van C','2004-07-20','0933333333','c@gmail.com');

SELECT * FROM hoc_vien;

INSERT INTO giao_vien
VALUES
('GV01','Nguyen Van Teacher','0900000001','teacher1@gmail.com'),
('GV02','Tran Teacher','0900000002','teacher2@gmail.com');

SELECT * FROM giao_vien;

INSERT INTO khoa_hoc
VALUES
('KH01','IELTS 6.5',5000000),
('KH02','TOEIC 700+',4000000);


INSERT INTO lop_hoc
VALUES
('LP01','IELTS-01','GV01','KH01'),
('LP02','TOEIC-01','GV02','KH02');



INSERT INTO ghi_danh
VALUES
('HV01','LP01','Dang hoc'),
('HV02','LP01','Dang hoc'),
('HV03','LP02','Dang hoc');

INSERT INTO hoc_phi
VALUES
('HP01','HV01',5000000,0),
('HP02','HV02',5000000,1000000),
('HP03','HV03',4000000,500000);

SELECT hv.ma_hv,
       hv.ho_ten,
       lh.ten_lop
FROM hoc_vien hv
JOIN ghi_danh gd
ON hv.ma_hv = gd.ma_hv
JOIN lop_hoc lh
ON gd.ma_lop = lh.ma_lop;


SELECT hv.ho_ten,
       hp.con_no
FROM hoc_vien hv
JOIN hoc_phi hp
ON hv.ma_hv = hp.ma_hv
WHERE hp.con_no > 0;

SELECT *
FROM hoc_vien
WHERE ho_ten LIKE '%Nguyen%';


SELECT *
FROM giao_vien
WHERE ho_ten LIKE '%Tran%';