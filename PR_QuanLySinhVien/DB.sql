
use master;
go
create database QuanLySinhVienThreeLayer;
go
use QuanLySinhVienThreeLayer;
go
DROP TABLE IF EXISTS tbl_quyen;
CREATE TABLE tbl_quyen(
	iMaQuyen int not null,
	sTenQuyen nvarchar(50) not null,
	CONSTRAINT pkQuyen PRIMARY KEY(iMaQuyen)
)
GO
DROP TABLE IF EXISTS tbl_taikhoan;
CREATE TABLE tbl_taikhoan(
	sMaTK nvarchar(50) not null,
	sTaiKhoan nvarchar(50) not null,
	sMatKhau nvarchar(100) null,
	FK_iMaQuyen int,
	CONSTRAINT pktblTaiKhoan PRIMARY KEY(sMaTK),
	CONSTRAINT fk_tbl_taikhoan_tbl_quyen FOREIGN KEY(FK_iMaQuyen) REFERENCES tbl_quyen (iMaQuyen)
)
GO
GO
INSERT [dbo].[tbl_quyen] ([iMaQuyen], [sTenQuyen]) VALUES (1, N'User')
INSERT [dbo].[tbl_quyen] ([iMaQuyen], [sTenQuyen]) VALUES (2, N'Admin')
INSERT [dbo].[tbl_quyen] ([iMaQuyen], [sTenQuyen]) VALUES (3, N'Quản trị viên tối cao')
GO
INSERT [dbo].[tbl_taikhoan] ([sMaTK], [sTaiKhoan], [sMatKhau], [FK_iMaQuyen]) VALUES (N'1', N'admin', N'123', 2)
INSERT [dbo].[tbl_taikhoan] ([sMaTK], [sTaiKhoan], [sMatKhau], [FK_iMaQuyen]) VALUES (N'2', N'user1', N'123', 1)
INSERT [dbo].[tbl_taikhoan] ([sMaTK], [sTaiKhoan], [sMatKhau], [FK_iMaQuyen]) VALUES (N'3', N'user2', N'123', 1)
GO
CREATE or ALTER PROC proc_logic
@user nvarchar(50),
@pass nvarchar(50)
as
BEGIN
	SELECT * FROM tbl_taikhoan WHERE sTaiKhoan = @user AND sMatKhau = @pass
END
