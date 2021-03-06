USE [BTL]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/10/2021 5:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Slug] [nchar](100) NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name_product] [nvarchar](100) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[total] [float] NULL,
	[image] [varchar](200) NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name_customer] [nvarchar](100) NULL,
	[email_customer] [nvarchar](100) NULL,
	[phone_customer] [nvarchar](100) NULL,
	[address_customer] [nvarchar](100) NULL,
	[id_customer] [int] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Slug] [nvarchar](100) NULL,
	[Desciption] [nvarchar](max) NULL,
	[Originalprice] [float] NULL,
	[Price] [float] NULL,
	[Image] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[created_at] [datetime] NULL,
	[Hot] [int] NULL,
	[Cate_id] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](100) NULL,
	[diachi] [nvarchar](100) NULL,
	[gioitinh] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[taikhoan] [nvarchar](100) NULL,
	[matkhau] [nvarchar](100) NULL,
	[role] [int] NULL,
	[token] [nvarchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Slug], [ParentId]) VALUES (1, N'Đồ Nam', N'do-nam                                                                                              ', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Slug], [ParentId]) VALUES (2, N'Đồ Nữ                                                                                               ', N'do-nu                                                                                               ', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Slug], [ParentId]) VALUES (3, N'Áo Khoác                                                                                            ', N'ao-khoac                                                                                            ', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Slug], [ParentId]) VALUES (4, N'Fashion                                                                                             ', N'fashion                                                                                             ', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Slug], [ParentId]) VALUES (5, N'Đồ Đôi                                                                                              ', N'do-doi                                                                                              ', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password]) VALUES (1, N'Chien', N'chienymhy@gmail.com', N'123456')
INSERT [dbo].[Customer] ([Id], [Name], [UserName], [Password]) VALUES (2, N'chienoke', N'chienymhy@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (5, N'áo thun mùa hè', 1, 200000, 200000, N'upload/alcHAiRqQAO20NaWV6iK.jpg', 31, 16)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (6, N'áo mới', 1, 200000, 200000, N'upload/9qUP9FY3iTnBMedOy6bp.jpg', 31, 15)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (7, N'áo thun mùa hè', 2, 200000, 400000, N'upload/alcHAiRqQAO20NaWV6iK.jpg', 32, 16)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (8, N'áo mới', 1, 200000, 200000, N'upload/9qUP9FY3iTnBMedOy6bp.jpg', 32, 15)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (9, N'ao bo da', 1, 200000, 200000, N'upload/3xmC8HQbzCX5m3HBLYzc.jpg', 32, 13)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (10, N'áo bò da', 1, 200000, 200000, N'upload/2uOfR418GmEfeoC24BRS.jpg', 32, 12)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (11, N'áo bò da', 3, 200000, 600000, N'upload/2uOfR418GmEfeoC24BRS.jpg', 33, 9)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (12, N'áo mới', 2, 200000, 400000, N'upload/9qUP9FY3iTnBMedOy6bp.jpg', 33, 15)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (13, N'áo bò da', 1, 200000, 200000, N'upload/1Zkoy1fOQN8xDnRg2s9L.png', 33, 11)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (14, N'áo thun mùa hè', 1, 200000, 200000, N'upload/alcHAiRqQAO20NaWV6iK.jpg', 33, 16)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (15, N'áo thun mùa hè', 1, 200000, 200000, N'upload/alcHAiRqQAO20NaWV6iK.jpg', 34, 16)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (16, N'áo mới', 1, 200000, 200000, N'upload/9qUP9FY3iTnBMedOy6bp.jpg', 34, 15)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (17, N'áo bò da', 1, 200000, 200000, N'upload/1Zkoy1fOQN8xDnRg2s9L.png', 35, 11)
INSERT [dbo].[OrderDetail] ([Id], [name_product], [quantity], [price], [total], [image], [order_id], [product_id]) VALUES (18, N'áo bò da', 1, 200000, 200000, N'upload/2uOfR418GmEfeoC24BRS.jpg', 35, 9)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [name_customer], [email_customer], [phone_customer], [address_customer], [id_customer], [status], [created_at]) VALUES (31, N'Chiến', N'chien1642000@gmail.com', N'0965842998', N'My xa - viet cuong-yên mỹ-hưng yên', 1, 1, CAST(N'2021-06-09T18:03:03.580' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name_customer], [email_customer], [phone_customer], [address_customer], [id_customer], [status], [created_at]) VALUES (32, N'Chiến', N'chien1642000@gmail.com', N'0965842998', N'My xa - viet cuong-yên mỹ-hưng yên', 1, 1, CAST(N'2021-06-09T18:10:25.517' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name_customer], [email_customer], [phone_customer], [address_customer], [id_customer], [status], [created_at]) VALUES (33, N'Chiến', N'chien1642000@gmail.com', N'0965842998', N'My xa - viet cuong-yên mỹ-hưng yên', 1, 1, CAST(N'2021-06-10T13:10:18.673' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name_customer], [email_customer], [phone_customer], [address_customer], [id_customer], [status], [created_at]) VALUES (34, N'Chiến', N'chien1642000@gmail.com', N'0965842998', N'My xa - viet cuong-yên mỹ-hưng yên', 1, 1, CAST(N'2021-06-10T13:52:44.190' AS DateTime))
INSERT [dbo].[Orders] ([Id], [name_customer], [email_customer], [phone_customer], [address_customer], [id_customer], [status], [created_at]) VALUES (35, N'Chiến', N'chien1642000@gmail.com', N'0965842998', N'My xa - viet cuong-yên mỹ-hưng yên', 1, 1, CAST(N'2021-06-10T16:32:32.367' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Slug], [Desciption], [Originalprice], [Price], [Image], [Quantity], [created_at], [Hot], [Cate_id]) VALUES (9, N'áo bò da', N'ao-bo-da', NULL, 100000, 200000, N'upload/2uOfR418GmEfeoC24BRS.jpg', 100, CAST(N'2021-06-02T13:34:39.913' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Desciption], [Originalprice], [Price], [Image], [Quantity], [created_at], [Hot], [Cate_id]) VALUES (11, N'áo bò da', N'ao-bo-da', NULL, 100000, 200000, N'upload/1Zkoy1fOQN8xDnRg2s9L.png', 20, CAST(N'2021-06-02T13:34:39.913' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Desciption], [Originalprice], [Price], [Image], [Quantity], [created_at], [Hot], [Cate_id]) VALUES (12, N'áo bò da', N'ao-bo-da', NULL, 100000, 200000, N'upload/2uOfR418GmEfeoC24BRS.jpg', 100, CAST(N'2021-06-02T13:34:39.913' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Desciption], [Originalprice], [Price], [Image], [Quantity], [created_at], [Hot], [Cate_id]) VALUES (13, N'ao bo da', N'ao-bo-da', NULL, 100000, 200000, N'upload/3xmC8HQbzCX5m3HBLYzc.jpg', 100, CAST(N'2021-06-02T13:34:39.913' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Desciption], [Originalprice], [Price], [Image], [Quantity], [created_at], [Hot], [Cate_id]) VALUES (15, N'áo mới', N'ao-moi', NULL, 150000, 200000, N'upload/9qUP9FY3iTnBMedOy6bp.jpg', 100, CAST(N'2021-06-02T19:59:53.587' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Slug], [Desciption], [Originalprice], [Price], [Image], [Quantity], [created_at], [Hot], [Cate_id]) VALUES (16, N'áo thun mùa hè', N'ao-thun-mua-he', NULL, 100000, 200000, N'upload/alcHAiRqQAO20NaWV6iK.jpg', 100, CAST(N'2021-06-02T20:02:32.910' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [hoten], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token]) VALUES (1, N'Nguyễn văn chiến', N'Mỹ xá', N'nam', N'chienymhy@gmail.com', N'chienymhy@gmail.com', N'123456', 1, N'oke')
INSERT [dbo].[Users] ([Id], [hoten], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token]) VALUES (4, N'Nguyen chien', N'viet cuong', N'nam', N'chien1642000@gmail.com', N'chien1642000@gmail.com', N'123456', 2, N'oke')
INSERT [dbo].[Users] ([Id], [hoten], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token]) VALUES (7, N'chienoke', N'hưng yên', N'nam', N'chien@gmail.com', N'chien2@gmail.com', N'123456', 2, NULL)
INSERT [dbo].[Users] ([Id], [hoten], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token]) VALUES (8, N'Chiến', N'hưng yên', N'nam', N'chien@gmail.com', N'chien3@gmail.com', N'123456', 2, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_customer]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_1] FOREIGN KEY([Cate_id])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_role_id] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_role_id]
GO
/****** Object:  StoredProcedure [dbo].[category_get_by_id]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[category_get_by_id](@category_id int)
AS
    BEGIN
        SELECT *                         
        FROM Categories as cate
      where  cate.Id = @category_id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[create_customer]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[create_customer]
@customer_name nvarchar(100),
@customer_username nvarchar(100),
@customer_password nvarchar(100)
as
begin
insert into Customer(Name,UserName,Password)
values(@customer_name,@customer_username,@customer_password)
end
GO
/****** Object:  StoredProcedure [dbo].[create_order]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[create_order]
@name_customer nvarchar(100),
@email_customer nvarchar(100),
@phone_customer nvarchar(100),
@address_customer nvarchar(100),
@id_customer int,
@status int
as
begin
insert into Orders(name_customer,email_customer,phone_customer,address_customer,id_customer,status)
values(@name_customer,@email_customer,@phone_customer,@address_customer,@id_customer,@status);
  SELECT SCOPE_IDENTITY();
end
GO
/****** Object:  StoredProcedure [dbo].[create_orderdetail]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[create_orderdetail]
@name_product nvarchar(100),
@quantity int,
@price float,
@total float,
@image varchar(200),
@order_id int,
@product_id int
as 
begin
insert into OrderDetail(name_product,quantity,price,total,image,order_id,product_id)
values(@name_product,@quantity,@price,@total,@image,@order_id,@product_id);
select ''
end
GO
/****** Object:  StoredProcedure [dbo].[delete_category]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[delete_category]
@Id int
as
begin
	delete from Categories where Id=@Id;
	SELECT '';
end
GO
/****** Object:  StoredProcedure [dbo].[delete_product]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[delete_product] 
@id int 
as
begin
	delete from Products where Id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[get_all_category]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[get_all_category]
as
begin
	select*from Categories
end
GO
/****** Object:  StoredProcedure [dbo].[get_all_product]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_all_product]
as
begin
	select p.Id,p.Slug,p.Name,p.Image,p.Price,p.Desciption,p.Hot,p.Price,p.Quantity,p.Cate_id, c.Name as 'name_cate' from Products as p inner join Categories as c on p.Cate_id=c.Id
end
GO
/****** Object:  StoredProcedure [dbo].[get_all_user]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_all_user] 
	as
	begin
		select*from Users
	end
GO
/****** Object:  StoredProcedure [dbo].[get_customer]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_customer]
@UserName nvarchar(100),
@Password nvarchar(100)
as
begin
select*from Customer
where UserName = @UserName and Password = @Password
end
GO
/****** Object:  StoredProcedure [dbo].[get_order]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_order]
as begin
select*from Orders where status = 0
end
GO
/****** Object:  StoredProcedure [dbo].[get_order_detail]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_order_detail] 
@id int
as
begin
select*from orderDetail where order_id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[get_order_success]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_order_success]
as
begin
select*from orders where status = 1 order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[get_order_Unconfirm]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_order_Unconfirm]
as
begin
select*from orders where status = 0 order by Id desc
end
GO
/****** Object:  StoredProcedure [dbo].[get_product_by_category]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_product_by_category]
@id int 
as
begin
select*from products where Cate_id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[get_product_by_id]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_product_by_id]
@id int
as
begin
	select*from Products where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[get_product_new_hot]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  proc [dbo].[get_product_new_hot]
as
begin
	select top 6 * 
	from products as p 
	where p.hot = 1 
	ORDER BY p.created_at desc
end
GO
/****** Object:  StoredProcedure [dbo].[get_product_relationship]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[get_product_relationship] 
@id int,
@cate_id int
as
begin
select top 4 * from Products where Cate_id = @cate_id and Id!=@id
end
GO
/****** Object:  StoredProcedure [dbo].[get_revenues_by_date]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_revenues_by_date]
@datefrom [nvarchar](max),
@dateto [nvarchar](max)
as 
begin
select sum(dt.total) as 'total',sum((dt.price*dt.quantity)-(p.Originalprice*dt.quantity)) as 'revenues' from OrderDetail as dt inner join Orders as o on dt.order_id=o.Id 
inner join Products as p on dt.product_id=p.Id
where  o.status = 1 and CONVERT(date,o.created_at) >= cast(@datefrom as date) and CONVERT(date,o.created_at)<=cast(@dateto as date);
end
GO
/****** Object:  StoredProcedure [dbo].[get_revenues_by_day]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_revenues_by_day]
as
begin
select sum(dt.total) as 'total',sum((dt.price*dt.quantity)-(p.Originalprice*dt.quantity)) as 'revenues' from OrderDetail as dt inner join Orders as o on dt.order_id=o.Id 
inner join Products as p on dt.product_id=p.Id
where  o.status = 1 and CONVERT(date,o.created_at) = CONVERT(date,GETDATE())

end
GO
/****** Object:  StoredProcedure [dbo].[get_revenues_by_month]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_revenues_by_month]
as
begin
select sum(dt.total) as 'total',sum((dt.price*dt.quantity)-(p.Originalprice*dt.quantity)) as 'revenues' from OrderDetail as dt inner join Orders as o on dt.order_id=o.Id 
inner join Products as p on dt.product_id=p.Id
where  o.status = 1 and Month(o.created_at) = Month(GETDATE());

end
GO
/****** Object:  StoredProcedure [dbo].[get_revenues_by_year]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_revenues_by_year]
as
begin
select sum(dt.total) as 'total',sum((dt.price*dt.quantity)-(p.Originalprice*dt.quantity)) as 'revenues' from OrderDetail as dt inner join Orders as o on dt.order_id=o.Id 
inner join Products as p on dt.product_id=p.Id
where  o.status = 1 and YEAR(o.created_at) = YEAR(GETDATE());

end
GO
/****** Object:  StoredProcedure [dbo].[order_succes]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[order_succes]
@id int
as 
begin
update Orders set status = 1 where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[orderview_revenue]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[orderview_revenue]
as
begin
select o.Id,o.name_customer,o.email_customer,sum((dt.quantity*p.Originalprice)) as 'originalPrice',sum(dt.quantity*dt.price) as  'Total',sum((dt.quantity*dt.price)-(dt.quantity*p.Originalprice)) as 'interest',o.created_at from orders  as o inner join  orderdetail as dt on o.Id=dt.order_id inner join Products as p on dt.product_id=p.Id
where o.status = 1
group by o.Id,o.name_customer,o.email_customer,o.created_at

end
GO
/****** Object:  StoredProcedure [dbo].[sp_category_create]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_category_create]
(
 @category_name       NVARCHAR(100), 
 @category_slug          VARCHAR(250), 
 @ParentId           int 
)
AS
    BEGIN
      INSERT INTO Categories(Name,Slug,ParentId)
                VALUES
                (
                 @category_name, 
                 @category_slug, 
                 @ParentId
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_category_edit]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_category_edit]
(
 @Id int,
 @category_name       NVARCHAR(100), 
 @category_slug          VARCHAR(250)
)
as
begin
	update Categories set Slug = @category_slug,Name=@category_name where Id = @Id;
	SELECT '';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_product_create]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_product_create]
@prod_name NVARCHAR(100),
@prod_slug Nvarchar(100),
@prod_description nvarchar(max),
@prod_originalprice float,
@prod_price float,
@prod_image nvarchar(max),
@prod_quantity int,
@prod_hot int,
@prod_cateid int
as
begin
	insert Products(Name,Slug,Desciption,Originalprice,Price,Image,Quantity,Hot,Cate_id)
	values(@prod_name,@prod_slug,@prod_description,@prod_originalprice,@prod_price,@prod_image,@prod_quantity,@prod_hot,@prod_cateid);
	SELECT '';
end
GO
/****** Object:  StoredProcedure [dbo].[sp_product_search]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_product_search] (@page_index  INT, 
                                       @page_size   INT,
									   @name nvarchar(150)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.name ASC)) AS RowNumber, 
                             u.Id             , 
							 u.Name           ,
							 u.Slug          ,
							 u.Desciption           ,
							 u.Originalprice           ,
							 u.Price           ,
							 u.Image         ,
							 u.Quantity           ,
							 u.Hot  ,
							 u.Cate_id  
                        INTO #Results1
                        FROM products AS u
						WHERE ((@name = '') OR (u.Name LIKE '%' + @name + '%')) ;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.name ASC)) AS RowNumber, 
                             u.Id              , 
							 u.Name           ,
							 u.Slug          ,
							 u.Desciption           ,
							 u.Originalprice           ,
							 u.Price           ,
							 u.Image         ,
							 u.Quantity           ,
							 u.Hot     ,
							 u.Cate_id  
                        INTO #Results2
                        FROM Products AS u
						WHERE  ((@name = '') OR (u.Name LIKE '%' + @name + '%'));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_product_update]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_product_update]
@id int,
@prod_name NVARCHAR(100),
@prod_slug Nvarchar(100),
@prod_desciption nvarchar(max),
@prod_originalprice float,
@prod_price float,
@prod_image nvarchar(max),
@prod_quantity int,
@prod_hot int,
@prod_cateid int
as
begin
	update Products set  Name = @prod_name,Slug=@prod_slug,Desciption=@prod_desciption,Originalprice=@prod_originalprice,Price=@prod_price,Image=@prod_image,Quantity=@prod_quantity,Hot=@prod_hot,Cate_id=@prod_cateid where Id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_user_create]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[sp_user_create]
( @hoten          nvarchar(150) ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @role          int
)
AS
    BEGIN
      INSERT INTO Users
                (
				 	
					 hoten           ,
				
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 role    
				)
                VALUES
                (
				 @hoten           ,
			
				 @diachi           ,
				 @gioitinh           ,
				 @email           ,
				 @taikhoan         ,
				 @matkhau           ,
				 @role 
				);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_delete]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[sp_user_delete]
(@id              int 
)
AS
    BEGIN
		delete from [users] where Id = @id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_id]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_user_get_by_id](@id int)
AS
    BEGIN
        SELECT       Id               , 
					 hoten           ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 role      ,
					 token
        FROM Users
      where  Id = @id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_username_password]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_user_get_by_username_password](@taikhoan varchar(30), @matkhau varchar(60))
AS
    BEGIN
        SELECT  Id               , 
					 hoten           ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 role      
        FROM [Users]
      where  taikhoan = @taikhoan and matkhau = @matkhau and role=1 ;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_update]    Script Date: 6/10/2021 5:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_user_update]
(@id              int, 
 @hoten          nvarchar(150),
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @role          int,
 @token nvarchar(100)
)
AS
    BEGIN
   update Users set 
				hoten= @hoten           ,
				diachi= @diachi           ,
				gioitinh= @gioitinh           ,
				email= @email           ,
				taikhoan=@taikhoan,
				matkhau = @matkhau           ,
				role= @role 
				where Id = @id;
			 
        SELECT '';
    END;

	select*from Users
GO
