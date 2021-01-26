--create database cafe_shop_db
use cafe_shop_db

create table SizeTable(
	Stt int identity(1,1),
	Size nvarchar(5) primary key
)
insert into SizeTable values('S');
insert into SizeTable values('M');
insert into SizeTable values('L');

create table Category(
	CategoryID int identity(1,1) primary key,
	CategoryName nvarchar(200)
)

insert into Category values(N'Cà phê')	
insert into Category values(N'Nước ép')
insert into Category values(N'Trà sữa')
insert into Category values(N'Trà')
insert into Category values(N'Cookie')
insert into Category values(N'Pizza & Hamburger')
insert into Category values(N'Bánh ngọt')


create table Product(
	ProductID int identity(1,1) primary key,
	ProductName nvarchar(100),
	ProductImage nvarchar(1000),
	Description nvarchar(4000),
	CategoryID int references Category(CategoryID)
)

create table SizeOfProduct(
	ProductID int references Product(ProductID),
	Size nvarchar(5) references SizeTable(Size),
	Price int,
	Quantity int,
	primary key (Size, ProductID)
)

create table [User] (
	Name nvarchar(200),
	Username nvarchar(100) primary key,
	Password nvarchar(100),
	Address nvarchar(200),
	Phone varchar(50),
	Mail varchar(100),
	isAdmin bit
)

create table OrderStepTable (
	StepID int identity(1,1) primary key,
	OrderStep nvarchar(100)
)

insert into OrderStepTable values ('Đang chọn sản phẩm')
insert into OrderStepTable values ('Chờ lấy hàng')
insert into OrderStepTable values ('Đang giao hàng')
insert into OrderStepTable values ('Thành công')
insert into OrderStepTable values ('Đã hủy')

create table [Order] (
	OrderID int identity(1,1) primary key,
	Username nvarchar(100) references [User](Username),
	StepID int references OrderStepTable(StepID),
	CreatedDate date,
	TotalPrice int
)

create table ProductInOrder(
	OrderID int references [Order](OrderID),
	ProductID int references Product(ProductID),
	Quantity int
)

create table Combo (
	ComboID int identity(1,1) primary key,
	ComboName nvarchar(200),
	ComboPrice int
)

create table ProductInCombo(
	ComboID int references Combo(ComboID),
	ProductID int references Product(ProductID),
	Quantity int,
	Size nvarchar(5) references SizeTable(Size),
	primary key (ComboID, ProductID)
)


--select * from Product
--select * from [User]
--drop table Image
--use master
--ALTER DATABASE [cafe_shop_db] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--drop database cafe_shop_db