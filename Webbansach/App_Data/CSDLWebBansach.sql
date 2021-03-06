use master
Drop Database QLBansach
----------
create database QLBANSACH
GO
use QLBANSACH
GO
CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),	
	Ngaysinh DATETIME
	CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)
GO
Create Table CHUDE
(
	MaCD int Identity(1,1),
	TenChuDe nvarchar(50) NOT NULL,
	CONSTRAINT PK_ChuDe PRIMARY KEY(MaCD)
)
GO
Create Table NHAXUATBAN
(
	MaNXB int identity(1,1),
	TenNXB nvarchar(50) NOT NULL,
	Diachi NVARCHAR(200),
	DienThoai VARCHAR(50),
	CONSTRAINT PK_NhaXuatBan PRIMARY KEY(MaNXB)
)
GO
CREATE TABLE TACGIA
(
	MaTG INT IDENTITY(1,1),
	TenTG NVARCHAR(50) NOT NULL,
	Diachi NVARCHAR(100),
	Tieusu nVarchar(Max),
	Dienthoai VARCHAR(50),
	CONSTRAINT PK_TacGia PRIMARY KEY(MaTG)
)
Go
CREATE TABLE SACH
(
	Masach INT IDENTITY(1,1),
	Tensach NVARCHAR(100) NOT NULL,
	Giaban Decimal(18,0) CHECK (Giaban>=0),
	Mota NVarchar(Max),
	Anhbia VARCHAR(50),
	Ngaycapnhat DATETIME,
	Soluongton INT,
	MaCD INT,
	MaNXB INT,
	CONSTRAINT PK_Sach PRIMARY KEY(Masach),
	CONSTRAINT FK_Chude FOREIGN KEY(MaCD) REFERENCES CHUDE(MaCD),
	CONSTRAINT FK_Nhaxuatban FOREIGN KEY(MaNXB) REFERENCES NHAXUATBAN(MANXB)
)
GO
CREATE TABLE VIETSACH
(
	MaTG INT,
	Masach INT,
	Vaitro NVARCHAR(50),
	Vitri NVarchar(50)
	CONSTRAINT FK_TG FOREIGN KEY(MaTG) REFERENCES TACGIA(MaTG),
	CONSTRAINT FK_Sach FOREIGN KEY(Masach) REFERENCES Sach(Masach),
	CONSTRAINT PK_VietSach PRIMARY KEY(MaTG,Masach)
)
GO
CREATE TABLE DONDATHANG
(
	MaDonHang INT IDENTITY(1,1),
	Dathanhtoan bit,
	Tinhtranggiaohang  bit,
	Ngaydat Datetime,
	Ngaygiao Datetime,	
	MaKH INT,
	CONSTRAINT FK_Khachhang FOREIGN KEY(MaKH) REFERENCES Khachhang(MaKH),
	CONSTRAINT PK_DonDatHang PRIMARY KEY(MaDonHang)
)
GO
CREATE TABLE CHITIETDONTHANG
(
	MaDonHang INT,
	Masach INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),	
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,Masach),
)
GO

/****** CHUDE******/
INSERT CHUDE(TenChuDe) VALUES (N'Ngo???i ng???')
INSERT CHUDE(TenChuDe) VALUES (N'C??ng ngh??? th??ng tin')
INSERT CHUDE(TenChuDe) VALUES (N'Lu???t')
INSERT CHUDE(TenChuDe) VALUES (N'V??n h???c')
INSERT CHUDE(TenChuDe) VALUES (N'Khoa h???c k??? thu???t')
INSERT CHUDE(TenChuDe) VALUES (N'N??ng nghi???p')
INSERT CHUDE(TenChuDe) VALUES (N'Tri???t h???c-Ch??nh tr???')
INSERT CHUDE(TenChuDe) VALUES (N'L???ch s???, ?????a l??')
INSERT CHUDE(TenChuDe) VALUES (N'Kinh t???')
INSERT CHUDE(TenChuDe) VALUES (N'S??ch gi??o khoa')
INSERT CHUDE(TenChuDe) VALUES (N'Ngh??? thu???t s???ng')

/****** KHACHHANG ******/
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email)
VALUES (N'D????ng Th??nh Ph???t', N'12 Tr???n Huy Li???u', N'0918062755', N'thayphet.net', N'123456', '08/20/1976', 'phetcm@hgmail.com')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'Nguy???n Ti???n Lu??n', N'21 Qu???n 6', N'0917654310', N'thang', N'123456', '10/15/1990', N'ntluan@hcmuns.edu.vn')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'?????ng Qu???c H??a', N'32 S?? V???n H???nh', N'098713245', N'dqhoa', N'hoa', '05/21/1991', N'dqhoa@hcmuns.edu.vn')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'Ng?? Ng???c Ng??n', N'12 Khu chung c??', N'0918544699', N'nnngan', N'ngan', '10/12/1986', N'nnngan@hcmuns.edu.vn')

/****** TACGIA******/
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Ph???m C??ng Anh', N'197 Tr???n H??ng ?????o','', N'98877668')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Nguy???n Th??? Giang', N'179 Ch??nh h??ng - F.4 - Q.8 Tp.HCM','', N'19001611')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'L?? Vi???t Nh??n', N'45 L?? Th??i T???-F2.Q.3 Tp.HCM','', N'19001570')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'H???ng Ph??c', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Ks.Ph???m Quang Huy', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Nguy???n B?? Ti???n', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Ph???m H???u Khang',NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Nguy???n Minh ?????c',NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Tr???n V??n L??ng', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Qu??ch Tu???n Ng???c', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Nguy???n Xu??n Huy', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'??o??n Kh???c ?????', NULL, NULL,NULL)
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES ( N'Nguy???n T???n T??n', N'179 Ch??nh H??ng F.4 Q.8 Tp.HCM', '',N'8504122')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'Ph???m Phan Trung', N'124 B???c H???i P.6 Q.TB', '',N'0918121188')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'TS. Nguy???n Ph????ng Li??n', N'','', '')
INSERT TACGIA(TenTG, Diachi, Tieusu, Dienthoai) VALUES (N'BS. V?? Th??? Uy??n Thanh', N'','', '')

/****** NHAXUATBAN    ******/

INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES (N'Nh?? xu???t b???n Tr???', N'124 Nguy???n V??n C??? Q.1 Tp.HCM', N'19001560')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'NXB Th???ng k??', N'?????ng Nai', N'19001511')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Kim ?????ng', N'Tp.HCM', N'19001570')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'?????i h???c qu???c gia', N'Tp.HCM', N'0908419981')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'V??n h??a ngh??? thu???t', N'???? N???ng', N'0903118833')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'V??n h??a', N'B??nh D????ng', N'0913336677')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Lao ?????ng - X?? h???i', N'Tp.HCM', N'0989888888')
INSERT NHAXUATBAN(TenNXB, Diachi, Dienthoai) VALUES ( N'Khoa H???c & K??? Thu???t', N'H?? N???i', N'8351056')


/******SACH ******/


INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES (N'Gi??o tr??nh Tin h???c c?? b???n', 26000, N'N???i dung c???a cu???n: Tin H???c C?? B???n Windows XP g???m c?? 7 ch????ng:
Ch????ng 1: M???t s??? v???n ????? c?? b???n. 
Ch????ng 2: S??? d???ng nhanh thanh c??ng c??? v?? thanh th???c ????n trong My Computer v?? Windows Explorer. 
Ch????ng 3: C??c thao t??c trong windows XP. 
Ch????ng 4: C??c thi???t l???p trong Windows XP. 
Ch????ng 5: B???o tr?? m??y t??nh. 
Ch????ng 6: C??c ph??m t???t 
Ch????ng 7: H???i v?? ????p c??c th???c m???c.
Xin tr??n tr???ng gi???i thi???u cu???n s??ch c??ng b???n', 
'THCB.jpg', 7, 1, '10/25/2014', 120)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES (N'Gi??o tr??nh Tin h???c v??n ph??ng', 12000,  
N'Cu???n s??ch n??y g???m 3 ph???n sau:
Ph???n 1: X??? l?? v??n b???n trong Microsoft Office Word 2007. 
Ph???n 2: X??? l?? b???ng t??nh trong Microsoft Office Excel 2007. 
Ph???n 3: Qu???n l?? c?? s??? d??? li???u trong Microsoft Office Access 2007.
Xin tr??n tr???ng gi???i thi???u c??ng c??c b???n.', 
'TH004.jpg', 3, 2, '10/23/2013', 25)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'L???p Tr??nh C?? S??? D??? Li???u V???i Visual Basic 2005 V?? ADO.NET 2.0', 11500, 
 N'L???p Tr??nh C?? S??? D??? Li???u V???i Visual Basic 2005 V?? ADO.NET 2.0" n??y gi???i thi???u c??c n???i dung sau:
Ch????ng 1: C??n b???n v??? c?? s??? d??? li???u.
Ch????ng 2: C??c b??? k???t n???i v?? t????ng t??c d??? li???u.
Ch????ng 3: B??? ch???a d??? li???u DataSet.
Ch????ng 4: B??? ??i???u h???p d??? li???u DataAdapter.
Ch????ng 5: S??? d???ng c??c ??i???u khi???n r??ng bu???c d??? li???u.
Ch????ng 6: T???o b??o c??o v???i Crystal Report.
Ch????ng 7: ADO.NET v?? XML.
Xin tr??n tr???ng gi???i thi???u c??ng c??c b???n.', 
'Gt_Thcb.jpg', 7, 3, '12/21/2014', 23)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Visual Basic 2005 T???p 3, Quy???n 2: L???p Tr??nh Web', 20000, 
 N'"Visual Basic 2005 T???p 3, Quy???n 2: L???p Tr??nh Web V???i C?? S??? D??? Li???u" s??? cung c???p k??? thu???t v?? h?????ng d???n b???n:
T??? h???c x??y d???ng ???ng d???ng Web qu???n l?? CSDL to??n di???n v???i ADO.NET 2.0 v?? ASP.NET. 
Khai th??c c??c ?????i t?????ng v?? ngu???n d??? li???u d??nh cho WebForm. 
S??? d???ng c??c ??i???u khi???n d??? li???u ?????c th?? d??nh ri??ng cho ASP.NET v?? Web. 
L??m quen v???i nh???ng kh??i ni???m x??? l?? d??? li???u ho??n to??n m???i. 
R??ng bu???c d??? li???u v???i c??c th??nh ph???n giao di???n Web Forms. 
Thi???t k??? ???ng d???ng Web "Qu???n l?? CD Shop" tr???c quan v?? th???c t???. 
Cung c???p m???t ki???n th???c ho??n ch???nh v??? Web cho c??c b???n y??u th??ch ng??n ng??? Visual Basic v?? .NET Framework.
S??ch c?? k??m theo CD-ROM b??i t???p.
Xin tr??n tr???ng gi???i thi???u c??ng c??c b???n.', 
'LTWeb2005.jpg', 8, 4, '9/15/2014', 240)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Gi??o tr??nh Tin h???c qu???n l?? 1', 21000,
N'M???ng M??y T??nh V?? H??? Th???ng B???o M???t g???m 7 ch????ng:
Ch????ng I: T???ng quan v??? c??ng ngh??? m???ng m??y t??nh v?? m???ng c???c b???.
Ch????ng II: C??c thi???t b??? m???ng th??ng d???ng v?? c??c chu???n k???t n???i v???t l??.
Ch????ng III: TCP/IP v?? m???ng Internet.
Ch????ng IV: H??? ??i???u h??nh m???ng ?????c ??i???m c???a h??? ??i???u h??nh m???ng.
Ch????ng V: M???t s??? v???n ????? an to??n v?? b???o m???t th??ng tin tr??n m???ng m??y t??nh.
Ch????ng VI: Gi???i thi???u h??? ??i???u h??nh Windows NT.
Ch????ng VII: Gi???i thi???u h??? ??i???u h??nh UNIX.
Tr??n tr???ng gi???i thi???u.', 'TH001.jpg', 3, 1, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES (N'Gi??o tr??nh Tin h???c qu???n l?? 2', 21000, 
 N'M???c ????ch c???a b??? s??ch n??y gi??p b???n tr??? n??n th??nh th???o c?? s??? d??? li???u (CSDL) Oracle9i, 
????? c???p ?????n t???t c??? nh???ng ki???n th???c c???n thi???t t??? m?? h??nh d??? li???u, qu???n tr??? CSDL, sao l??u ph???c h???i, 
m???ng v?? x??? l?? s??? c??? c??ng nh?? hi???u ch???nh hi???u su???t th???c thi..., 
v???i s??? k???t h???p l?? thuy???t v?? th???c h??nh v??? ??i???u m?? Nh?? qu???n tr??? CSDL Oracle9i c???n bi???t ????? s??? d???ng CSDL Oracle9i m???t c??ch hi???u qu???,
 t??? ch??nh b??? s??ch n??y.
B??? s??ch ???????c chia l??m 2 t???p, t???p 1 ????? c???p c??c ki???n th???c c?? b???n v??? CSDL, m?? h??nh d??? li???u. 
B???n s??? ???????c bi???t v??? h??? qu???n tr??? CSDL Oracle9i, t???o CSDL, k???t n???i v?? qu???n l?? ng?????i d??ng. 
T???p 2 h?????ng d???n b???n c??ch n???p, sao l??u v?? ph???c h???i d??? li???u, qu???n l?? ho???t ?????ng CSDL Oracle9i, 
th???c hi???n hi???u ch???nh hi???u su???t th???c thi v?? x??? l?? s??? c??? cho CSDL.
Xin tr??n tr???ng gi???i thi???u T???p 1 c??ng c??c b???n.', 
'130499.jpg', 10, 5, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Gi??o tr??nh SQL Server', 18000, 
N'H??? qu???n tr??? c?? s??? d??? li???u SQl Server 2003 Test thu', 
'Gt_Thcb.jpg', 3, 6, '10/10/2014', 6)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Phong C??ch Qu???n L?? Kinh Doanh Hi???n ?????i ', 61000, 
 N'Cu???n s??ch n??y kh??ng ??i v??o chi ti???t nh???ng ch??? ????? qu???n l?? c??? ??i???n ???? ???????c nh???c ?????n trong nhi???u cu???n s??ch kh??c,
 nh?? t??? ch???c cu???c h???p, cung c???p s??? li???u, qu???n l?? th???i gian. M???c ????ch c???a cu???n s??ch n??y l?? mang l???i cho b???n "nhi???u h??n", 
 m???t gi?? tr??? gia t??ng so v???i nh???ng g?? b???n ???? bi???t v?? ???? ??p d???ng, v?? gi??p b???n t???i ??u h??a vi???c qu???n l?? chuy??n m??n v?? qu???n l?? nh??n s???.
N???i dung s??ch bao g???m 9 ch????ng:
Ch????ng 1: B???n c??ch nh??n qu???n l?? theo s???c m??u.
Ch????ng 2: Qu???n l?? c??c s???c m??u c???a m???t c???ng t??c vi??n.
Ch????ng 3: Qu???n l?? nh??m theo m??u s???c.
Ch????ng 4: Quy???t ?????nh c??ch th??ch h???p d???a v??o b???n th??n, ng?????i kh??c v?? ho??n c???nh.
Ch????ng 5: Ph??t tri???n hi???u qu??? t???i ??u theo s???c m??u.
Ch????ng 6: Hi???u r?? nh???ng sai l???ch trong c??ch qu???n l?? c???a m??nh.
Ch????ng 7: N???n t???ng c?? s??? c???a h??? th???ng Success Insights: B???n m??u v???i t??m ki???u.
Ch????ng 8: Nh???n bi???t v?? qu???n l?? t??m ki???u c???ng t??c vi??n.
Ch????ng 9: C???i thi???n ng?????i qu???n l??.
Xin tr??n tr???ng gi???i thi???u.', 
'KT0001.jpg', 9, 8, '5/18/2015', 36)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'C??n B??? Qu???n L?? Trong S???n Xu???t C??ng Nghi???p', 25000, 
N'Cu???n s??ch n??y g???m nh???ng n???i dung ch??nh sau:
Ph???n 1: Qu???n l?? s???n xu???t c??ng nghi???p trong kinh t??? th??? tr?????ng
- Kinh doanh s???n xu???t c??ng nghi???p trong kinh t??? th??? tr?????ng
- S??? c???n thi???t v?? c??c ch???c n??ng c???a qu???n l?? nh?? n?????c ?????i v???i doanh nghi???p s???n xu???t c??ng nghi???p
- N???i dung v?? t??nh ch???t c???a nh???ng c??ng vi???c m?? c??n b??? qu???n l?? s???n xu???t c??ng nghi???p ph???i ?????m nhi???m, ho??n th??nh.
- Kinh nghi???m ????o t???o v?? ????nh gi?? c??n b??? qu???n l?? kinh doanh ??? Nh???t.
Ph???n 2: Th???c tr???ng v?? m???t s??? gi???i ph??p nh???m n??ng cao ch???t l?????ng ?????i ng?? c??n b??? qu???n l?? s???n xu???t c??ng nghi???p Vi???t Nam
- Th???c tr???ng c??n b??? qu???n l?? doanh nghi???p c??ng nghi???p c???a Vi???t Nam
- Ti??u chu???n h??a c??n b??? qu???n l?? s???n xu???t c??ng nghi???p Vi???t Nam
- ?????i m???i c??n b???n n???i dung v?? ph????ng ph??p ????o t???o c??n b??? qu???n l?? s???n xu???t c??ng nghi???p Vi???t Nam
Xin tr??n tr???ng gi???i thi???u. ', 
'KT0001.jpg', 5, 6, '10/28/2013', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'T?? Duy Chi???n L?????c (Qu???n L?? - T???i Sao? Th??? N??o?', 18000, 
N'Kh??? n??ng ho???ch ?????nh d??i h???n ?????ng th???i t???i ??u h??a t??nh h??nh ho???t ?????ng ng???n h???n,
 l?? m???t y??u c???u b???t bu???c ph???i c?? ?????i v???i c??c nh?? qu???n l??.
T?? Duy Chi???n L?????c s??? gi??p b???n v???ch ra con ???????ng ?????n th??nh c??ng ?????ng th???i gi??p h??nh th??nh c??c k??? n??ng ph??n t??ch v?? ho???ch ?????nh theo nh??m. 
T???t c??? c??c l??nh v???c then ch???t ????? h??nh th??nh v?? th???c thi m???t chi???n l?????c ?????u ???????c tr??nh b??y c???n k??? trong cu???n s??ch n??y, 
t??? vi???c nghi??n c???u v?? thu th???p th??ng tin n???n t???ng, h??nh th??nh m???t chi???n l?????c m???i ?????n vi???c xem x??t v?? ???ng d???ng chi???n l?????c ???y. 
C??? th???y c?? 101 ch??? d???n nh???m cung c???p cho c??c b???n nh???ng l???i khuy??n th???c ti???n h??n, 
?????ng th???i b??i t???p t??? ????nh gi?? s??? gi??p b???n x??c ?????nh xem m??nh l?? m???t nh?? t?? duy chi???n l?????c hi???u qu??? ?????n m???c n??o. 
Khi b???n c?? nhi???u tham v???ng h??n v??? vi???c ho???ch ?????nh cho t????ng lai, c???m nang n??y s??? l?? quy???n s??ch tham kh???o kh??ng th??? thi???u, 
gi??p suy ngh?? c???a b???n ??i ????ng h?????ng.
Xin tr??n tr???ng gi???i thi???u cu???n s??ch c??ng b???n. ',
'KT0001.jpg', 11, 3, '10/18/2015', 6)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Qu???n L?? D??? ??n (Qu???n L?? - T???i Sao? Th??? N??o?) ',61000, 
 N'????? th??nh c??ng trong m??i tr?????ng kinh doanh c???nh tranh hi???n nay, 
c??c gi??m ?????c d??? ??n ph???i ?????t ???????c k???t qu??? trong ph???m th???i gian v?? ng??n s??ch ????a ra. Bi???t c??ch ??p d???ng c??c quy tr??nh,
 ph????ng ph??p v?? k??? thu???t ch??? d???n trong cu???n Qu???n L?? D??? ??n n??y, 
 b???n s??? t??ng t???i ??a kh??? n??ng th???c hi???n c??ng vi???c v?? ?????m b???o ?????t k???t qu??? t???i ??u khi th???c hi???n d??? ??n.
???????c thi???t k??? ph?? h???p v???i t???t c??? c??c nh?? qu???n l?? ??? ????? m???i tr??nh ?????, 
c???m nang n??y s??? trang b??? cho b???n nh???ng ki???n th???c c???n thi???t trong vi???c qu???n l?? m???i d??? ??n, 
d?? l???n hay nh???, ????? ?????t ?????n th??nh c??ng. T??? vi???c kh???i x?????ng m???t d??? ??n, th??c ?????y, 
ph??t tri???n nh??m d??? ??n ?????n vi???c v?????t qua nh???ng kh?? kh??n, tr??? ng???i; 
m???i m???t kh??a c???nh c???a qu???n l?? d??? ??n chuy???n nghi???p ?????u ???????c tr??nh b??y m???t c??ch r?? n??t. 
C???m nang bao g???m c??c h?????ng d???n t???ng b?????c v??? ho???ch ?????nh d??? ??n v?? 101 m???o v???t cung c???p cho b???n nh???ng l???i khuy??n th???c t???.', 
'KT0001.jpg', 4, 8, '1/18/2014', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'??i???u Ch???nh M???t S??? Ch??nh S??ch Kinh T??? ??? Trung Qu???c (Giai ??o???n 1992 - 2010)', 21000,
N'Cu???n s??ch n??y t???p trung v??o m???t s??? n???i dung ch??nh sau ????y:
T??m hi???u v??? nh???ng nh??n t??? ????i h???i Trung Qu???c ph???i ??i???u ch???nh ch??nh s??ch kinh t???.
T??m hi???u v??? nh???ng n???i dung ch??nh trong ??i???u ch???nh kinh t??? ??? Trung Qu???c giai ??o???n t??? n??m 1992 - 2010.
T??m hi???u v??? t??c ?????ng c???a vi???c ??i???u ch???nh ch??nh s??ch kinh t??? c???a Trung Qu???c ?????i v???i th??? gi???i v?? khu v???c trong ???? c?? Vi???t Nam,
 sau ???? r??t t???a m???t s??? kinh nghi???m c???a Trung Qu???c trong qu?? tr??nh ??i???u ch???nh ch??nh s??ch kinh t??? m?? Vi???t Nam c?? th??? tham kh???o.
T???p th??? t??c gi??? tham gia c??ng tr??nh n??y ?????u l?? nh???ng ng?????i chuy??n nghi??n c???u v??? Trung Qu???c, 
hy v???ng s??? ??em l???i cho c??c b???n nhi???u th??ng tin b??? ??ch.', 
'KT0001.jpg', 1, 7,'10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'30 ph??t m???i ng??y ????? luy???n k??? n??ng vi???t c??u ti???ng Anh', 85000, 
N'30 ph??t m???i ng??y ????? luy???n k??? n??ng vi???t c??u ti???ng Anh l?? m???t cu???n s??ch b??i t???p d??nh cho nh???ng h???c sinh/sinh vi??n,
 nghi??m t??c quan t??m ?????n t???m quan tr???ng c???a vi???c n??ng cao nh???ng y???u t??? k??? thu???t cho k??? n??ng vi???t c???a m??nh. 
 R??n luy???n ????? vi???t cho t???t ch???ng kh??c g?? t??? trang b??? cho m??nh m???t s???c m???nh c???n thi???t ????? th??nh c??ng - 
 khi ??i h???c c??ng nh?? khi ra ngo??i x?? h???i. Trui r??n ???????c m???t tr??nh ????? vi???t ???c???ng??? kh??ng h??? l?? chuy???n b???ng nhi??n tr???i cho m?? c?? ???????c; 
 ???? ph???i l?? k???t qu??? c???a m???t qu?? tr??nh ph???n ?????u b???n b??? v?? r??n luy???n ch??m ch???.
?????c n??t c???a s??ch n??y l?? s??? d???ng c??ch ti???p c???n nh???ng k??? thu???t k???t h???p c??u c?? b???n, c?? ngh??a l??, 
s??ch kh??ng ch??? quan t??m ?????n vi???c tr??nh nh???ng sai l???i, m?? c??n ?????t m???c ti??u t???o d???ng ???????c nh???ng c??u hay, 
linh ho???t, v?? th??? hi???n m???t phong c??ch ri??ng. C???nh ????, s??ch c??n c?? nh???ng ??i???m ????ng l??u ?? nh??: 
- B??n th???o r?? r??ng v??? nh???ng qui t???c v?? k??? thu???t gi??p vi???t t???t.
- Gi???i th??ch s??c t??ch, h???n ch??? d??ng nh???ng thu???t ng??? ng??? ph??p.
- L????ng b??i t???p phong ph??, ??a d???ng, t??? nh???ng c??u h???i ??i???n v??o ch??? tr???ng v???i m???c ????ch x??c ?????nh c??c t??? lo???i cho ?????n nh???ng c??u h???i,
 k???t h???p nh???ng c??u ng???n th??nh nh???ng c??u v??n d??i h??n, ?? t??? ???duy??n??? h??n.
- ????p ??n cu???i s??ch nh???m gi??p h???c sinh/sinh vi??n h???c v?? nghi??n c???u nhanh ch???m theo tr??nh ????? v?? ?? th??ch c???a m??nh, 
?????ng th???i ki???m tra ???????c b??i l??m trong qu?? tr??nh h???c t???p.
H???c sinh/sinh vi??n ti???p thu t???t nh???t khi h??? tham gia t??ch c???c v?? qu?? tr??nh h???c. 
H??? r???t th??ch nh???ng b??i t???p n??o r??n cho h??? ???????c nh???ng k??? n??ng vi???t h??? c???n ?????ng th???i c?? gi?? tr??? th??ng tin n??o ???? ho???c vui vui. 
???? ch??nh l?? l?? do cu???n s??ch n??y s??? d???ng ????? lo???i ch??? ????? th?? v??? trong c??c b??i t???p. C??ng v?? l?? do t????ng t???, 
s??ch c?? ph???n tr??nh b??y v?? gi???ng gi???i r???t ng???n g???n nh???ng ????a ra r???t nhi???u nh???ng v?? d??? v?? minh h???a m??? r???ng.
S??? d???ng cu???n 30 ph??t m???i ng??y ????? luy???n k??? n??ng vi???t c??u ti???ng Anh n??y s??? gi??p h???c sinh/sinh vi??n vi???t ???c?? ngh?????? v?? t??? tin h??n".', 
'TiengAnh01.jpg', 2, 1, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Tin H???c ???ng D???ng: Th??nh Th???o Oracle 9i - Qu???n Tr??? C?? S??? D??? Li???u (T???p 1) ', 21000, 
N'M???c ????ch c???a b??? s??ch n??y gi??p b???n tr??? n??n th??nh th???o c?? s??? d??? li???u (CSDL) Oracle9i, 
????? c???p ?????n t???t c??? nh???ng ki???n th???c c???n thi???t t??? m?? h??nh d??? li???u, qu???n tr??? CSDL, sao l??u ph???c h???i, 
m???ng v?? x??? l?? s??? c??? c??ng nh?? hi???u ch???nh hi???u su???t th???c thi..., 
v???i s??? k???t h???p l?? thuy???t v?? th???c h??nh v??? ??i???u m?? Nh?? qu???n tr??? CSDL Oracle9i c???n bi???t ????? s??? d???ng CSDL Oracle9i m???t c??ch hi???u qu???,
 t??? ch??nh b??? s??ch n??y.
B??? s??ch ???????c chia l??m 2 t???p, t???p 1 ????? c???p c??c ki???n th???c c?? b???n v??? CSDL, m?? h??nh d??? li???u. 
B???n s??? ???????c bi???t v??? h??? qu???n tr??? CSDL Oracle9i, t???o CSDL, k???t n???i v?? qu???n l?? ng?????i d??ng. T???p 2 h?????ng d???n b???n c??ch n???p, 
sao l??u v?? ph???c h???i d??? li???u, qu???n l?? ho???t ?????ng CSDL Oracle9i, th???c hi???n hi???u ch???nh hi???u su???t th???c thi v?? x??? l?? s??? c??? cho CSDL.
Xin tr??n tr???ng gi???i thi???u T???p 1 c??ng c??c b???n. ', 
'TH001.jpg', 1, 2, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'M???ng M??y T??nh V?? H??? Th???ng B???o M???t ', 23000, 
N'M???ng M??y T??nh V?? H??? Th???ng B???o M???t g???m 7 ch????ng:
Ch????ng I: T???ng quan v??? c??ng ngh??? m???ng m??y t??nh v?? m???ng c???c b???.
Ch????ng II: C??c thi???t b??? m???ng th??ng d???ng v?? c??c chu???n k???t n???i v???t l??.
Ch????ng III: TCP/IP v?? m???ng Internet.
Ch????ng IV: H??? ??i???u h??nh m???ng ?????c ??i???m c???a h??? ??i???u h??nh m???ng.
Ch????ng V: M???t s??? v???n ????? an to??n v?? b???o m???t th??ng tin tr??n m???ng m??y t??nh.
Ch????ng VI: Gi???i thi???u h??? ??i???u h??nh Windows NT.
Ch????ng VII: Gi???i thi???u h??? ??i???u h??nh UNIX.
Tr??n tr???ng gi???i thi???u. ', 
'TH001.jpg',1,3, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Th??? Thu???t L???p Tr??nh Visual Basic 6 ', 18000, 
N'M???c L???c:
Ch????ng 1: Multimedia.
Ch????ng 2: String.
Ch????ng 3: Form.
Ch????ng 4:Windows Control.
Ch????ng 5: Common Control.
Ch????ng 6: System.
Ch????ng 7: Disk - File.
Ch????ng 8: Graphics.
Ch????ng 9: Internet.
Ch????ng 10: Microsoft Office.
Ch????ng 11: Database.
Ch????ng 12: Clipboard.
Ch????ng 13: C??c v???n ????? kh??c.
Ph??? l???c A: Gi???i thi???u m???t s??? ActiveX Control.
Ph??? l???c B: M???t s??? ti???n ??ch h??? tr??? l???p tr??nh Win32 API.
Ph??? l???c C: M???t s??? v???n ????? v??? ????ng g??i ph???n m???m.
Ph??? l???c D: Gi???i thi???u m???t s??? Website v??? Visual Basic.
Tr??n tr???ng gi???i thi???u. ', 
'TH001.jpg', 6, 7, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'L???p Tr??nh M???ng Tr??n Windows (???n b???n d??nh cho sinh vi??n) ', 16800, 
N'Ch??o m???ng ?????n v???i "L???p Tr??nh M???ng Tr??n Windows (???n b???n d??nh cho sinh vi??n)". 
Quy???n s??ch n??y s??? h?????ng d???n b???n s??? d???ng m???t c??ch hi???u qu??? bao g???m m???t s??? l?????ng l???n v?? ??a d???ng c??c h??m m???ng s???n c?? trong Windows 95, 
Windows 98, Windows NT 4, Windows CE, v?? Windows 2000/XP/. NET. 
S??ch ???????c ch??? ?????nh vi???t d??nh cho nh???ng l???p tr??nh vi??n t??? trung c???p ?????n cao c???p, 
tuy nhi??n nh???ng l???p tr??nh vi??n m???i b???t ?????u t??m hi???u l???p tr??nh m???ng c??ng s??? nh???n th???y ????y l?? m???t quy???n s??ch kh??ng th??? thi???u,
 cho c??c b?????c x??y d???ng ???ng d???ng m???ng sau n??y.', 
 'TH001.jpg', 5, 5, '10/18/2015', 16)
 
INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'C??n B???n V??? Photoshop CS Tinh Ch???nh V?? X??? L?? M??u ', 25000, 
N'C??n B???n V??? Photoshop CS Tinh Ch???nh V?? X??? L?? M??u" g???m 12 ch????ng:
Ch????ng 1: Nh???ng ??i???m c?? b???n.
Ch????ng 2: M??u Photoshop.
Ch????ng 3: C??c t??c v??? x??? l?? ???nh c??n b???n.
Ch????ng 4: C??c ??i???m c?? b???n v??? pixel.
Ch????ng 5: C??c ??i???m c?? b???n v??? l???p.
Ch????ng 6: L??m vi???c v???i c??c c??ng c??? ch???n.
Ch????ng 7: Gh??p ???nh.
Ch????ng 8: L??m vi???c v???i c??c palette History.
Ch????ng 9: C??c k??? thu???t ??i???u ch???nh h??nh ???nh.
Ch????ng 10: Ch???n c??c m??u.
Ch????ng 11: T?? m??u l???i.
Ch????ng 12: L??m vi???c v???i c??c c??ng c??? t?? v???.
Xin tr??n tr???ng gi???i thi???u. ', 
'TH002.jpg', 1, 6, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N' H?????ng D???n S??? D???ng Norton AntiVirus 2004 (H?????ng d???n b???ng h??nh)', 16800, 
 N'H?????ng D???n S??? D???ng Norton AntiVirus 2004 (H?????ng d???n b???ng h??nh)" bao g???m 6 ph???n, 23 ch????ng:
Ph???n I: B???t ?????u v???i Norton AntiVirus 2004.
Ch????ng 1: B???t ?????u v???i Norton AntiVirus 2004.
Ch????ng 2: C??i ?????t Norton System Works Professional.
Ch????ng 3: C??c ??i???m c?? b???n v??? Norton AntiVirus 2004.
Ch????ng 4: C??c t??y ch???n trong Norton SystemWorks.
Ch????ng 5: C???i ti???n s??? tr??nh duy???t Web v?? ph???c h???i ????a c???ng.
Ch????ng 6: Duy tr?? t??nh b???o m???t password v?? c???p nh???t v???i LiveUpdate.
Ph???n II: L??m vi???c v???i Norton AntiVirus 2004.
Ch????ng 7: B???o v??? ????a, file v?? d??? li???u ????? tr??nh b??? nhi???m Virus.
Ch????ng 8: Nh???ng ??i???u c???n l??m n???u ph??t hi???n virus.', 
'TH002.jpg', 5, 7, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Tin H???c V??n Ph??ng - Microsoft Word 2000 (T??i B???n L???n Th??? Nh???t) ', 15600, 
N'S??ch h?????ng d???n s??? d???ng tin h???c v??n ph??ng ', N'TH002.jpg', 2, 8, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Adobe Photoshop 6.0 v?? ImageReady 3.0 ', 21000, 
N'Cu???n s??ch Adobe Photoshop 6.0 v?? ImageReady 3.0 n??y s??? gi??p b???n t??m hi???u nh???ng t??nh n??ng tuy???t v???i c???a phi??n b???n 6.0, 
n?? c??ng l?? con ???????ng ng???n nh???t cho nh???ng ng?????i m???i s??? d???ng Photoshop l???n ?????u. V???i b???n ?????c ???? s??? d???ng cu???n s??ch 
"Adobe Photoshop 5.5 v?? ImageReady 2.0" do MK.PUB bi??n so???n tr?????c ????y, cu???n s??ch n??y l?? m???t c??ch c???p nh???t nhanh ch??ng nh???t.
Adobe Photoshop 6.0 v?? ImageReady 3.0 g???m hai ph???n ch??nh, ??an xen nhau: 
Adobe Photoshop 6.0: tr??nh b??y c??c k??? thu???t x??? l?? ???nh cao c???p, c??c t??nh n??ng m???i, gi??p b???n t???o ???????c c??c ???nh ?????p, 
r?? n??t v?? mang t??nh m??? thu???t cao, h??? tr??? ?????c l???c cho c??c ch????ng tr??nh d??n trang v?? t??ch m??u ??i???n t???. 
?????c bi???t trong phi??n b???n n??y, ????? ????p ???ng cho mong m???i t??? l??u c???a ng?????i d??ng, 
c??c h??nh th??? vector b???t ?????u ???????c ????a v??o s??? d???ng trong m??i tr?????ng Photoshop.', 
'TH002.jpg', 5, 5, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'H?????ng D???n T??? H???c Photoshop CS (Photoshop 8.0) ', 25000, 
N'Cu???n s??ch Adobe Photoshop g???m hai ph???n ch??nh, ??an xen nhau: 
Adobe Photoshop 6.0: tr??nh b??y c??c k??? thu???t x??? l?? ???nh cao c???p, c??c t??nh n??ng m???i, gi??p b???n t???o ???????c c??c ???nh ?????p, 
r?? n??t v?? mang t??nh m??? thu???t cao, h??? tr??? ?????c l???c cho c??c ch????ng tr??nh d??n trang v?? t??ch m??u ??i???n t???. 
?????c bi???t trong phi??n b???n n??y, ????? ????p ???ng cho mong m???i t??? l??u c???a ng?????i d??ng, 
c??c h??nh th??? vector b???t ?????u ???????c ????a v??o s??? d???ng trong m??i tr?????ng Photoshop ', 
'TH003.jpg', 8, 4, '10/18/2015', 16)

INSERT SACH(Tensach, Giaban, Mota,Anhbia, MaCD, MaNXB, Ngaycapnhat, Soluongton) 
VALUES ( N'Tin H???c V??n Ph??ng - Microsoft Excel 2000 (T??i B???n L???n Th??? Nh???t)', 16800,
N'Cu???n s??ch n??y g???m nh???ng n???i dung ch??nh sau:
Ch????ng 1: Gi???i thi???u
Ch????ng 2: So???n th???o v??n b???n
Ch????ng 3: Tr??nh b??y Font ch???
Ch????ng 4: Tr??nh b??y Paragraph
Ch????ng 5: Tr??nh b??y trang in
Ch????ng 6: B???ng bi???u - Table
Ch????ng 7: C???t ch??? - Column
Ch????ng 8: H??nh v???
Ch????ng 9: Microsoft Equation
Ch????ng 10: Tr??nh b??y v??n b???n nhanh
Ch????ng 11: B??i t???p m???u
Xin tr??n tr???ng gi???i thi???u. ', 
'TH003.jpg', 6, 5,  '10/18/2015', 16)

select * from SACH

/******		Vietsach ******/
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (1, 1,'Bi??n so???n' , N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (1, 3,'Bi??n so???n', N'?????ng t??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (1, 4, '', N'Hi???u ????nh')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (1, 10, N'Xu???t B???N',N'Ch??? bi??n')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES(2, 3,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (2, 14, '', N'?????ng t??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES(3, 5,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES(3, 6,'',  N'Hi???u ????nh')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (4, 5,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (5, 6, 'Bi??n so???n',N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (5, 12,'Bi??n so???n', N'Ch??? bi??n')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (6, 14, '', N'S??u t???m v?? bi??n so???n')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (7, 8,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (8, 7,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (10, 11,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (11, 6,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (12, 13,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (13, 16,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (14, 7,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (15, 12,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (15, 14,'',  N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (17, 14,'Ch???u tr??ch nhi???m Xu???t b???n', N'Ch??? bi??n')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (17, 15,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (18, 15,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (19, 5, '', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (20, 8,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (21, 13,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (22, 10,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (23, 11,'Bi??n so???n', N'T??c gi???')
INSERT VIETSACH(Masach, MaTG,Vitri, Vaitro) VALUES (22, 2, 'Bi??n so???n',N'T??c gi???')


/****** DONDATHANG ******/

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 1,0, '10/15/2115', '10/20/2015',0)

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 3,0, '10/05/2114', '10/20/2014',0)

/******CHITIETDONHANG ******/
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (1, 19, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (1, 15, 3, 50000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (1, 14, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (2, 5, 3, 10000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (2, 9, 1, 15000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (2, 15, 3, 150000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (3, 9, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MASACH,SOLUONG, Dongia) VALUES (3, 10, 3,70000)

