CREATE DATABASE PetShop
GO

USE [PetShop]

CREATE TABLE[Supplier](
    [Supplier_Id] INT,
    [Name] NVARCHAR(40),
    [Address] NVARCHAR(40),
    [Phone] VARCHAR(10),
    [Fax] NVARCHAR(10),
    [Email] NVARCHAR(40),

    CONSTRAINT [PK_Aluno] PRIMARY KEY([Supplier_Id]),
)
GO

CREATE TABLE[Category](
    [Category_Id] INT,
    [Category_Name] VARCHAR(40),
    [Description] VARCHAR(40)

    CONSTRAINT [PK_Category] PRIMARY KEY ([Category_Id])
)
GO

CREATE TABLE[Product](
    [Product_Id] VARCHAR(40),
    [Product_Name] VARCHAR(40),
    [Product_Description] VARCHAR(40),
    [Product_Unit] VARCHAR(40),
    [Product_Price] FLOAT,
    [Product_Quantity] INT,
    [Product_Status] INT,
    [Other_Details] VARCHAR(40),
    [Supplier_Id] INT,
    [Category_Id] INT,

    CONSTRAINT [PK_Product] PRIMARY KEY([Product_Id]),
    CONSTRAINT [FK_Supplier_Id] FOREIGN KEY([Supplier_Id]) REFERENCES [Supplier] (Supplier_Id),
    CONSTRAINT [FK_Category_Id] FOREIGN KEY([Category_Id]) REFERENCES  [Category] (Category_Id)
)
GO

CREATE TABLE [Role](
    [Role_Id] INT,
    [Role_Name] VARCHAR(40),
    [Description] VARCHAR(40)

    CONSTRAINT [PK_Role_Id] PRIMARY KEY([Role_Id])
)
GO

CREATE TABLE [Staff]( 
    [Staff_Id] INT,
    [First_Name] VARCHAR(40),
    [Last_Name] VARCHAR(40),
    [Address] VARCHAR(40),
    [Phone] VARCHAR(10),
    [Email] VARCHAR(40),
    [UserName] VARCHAR(40),
    [Password] VARCHAR(40),
    [Role_Id] INT,

    CONSTRAINT [PK_Staff_Id] PRIMARY KEY([Staff_Id]),
    CONSTRAINT [FK_Role_Id] FOREIGN KEY([Role_Id]) REFERENCES [Role] (Role_Id)

)
GO

CREATE TABLE [Customer](
    [Customer_Id] INT,
    [First_Name] VARCHAR(40),
    [Last_Name] VARCHAR(40),
    [Address] VARCHAR(40),
    [Phone] VARCHAR(10),
    [Email] VARCHAR(40),
    [Staff_Id] INT,

    CONSTRAINT [PK_Customer_Id] PRIMARY KEY([Customer_Id]),
    CONSTRAINT [FK_Staff_Id] FOREIGN KEY([Staff_Id]) REFERENCES [Staff] (Staff_Id)

)
GO

CREATE TABLE [Order](
    [Order_Id] INT,
    [Date_of_Order] DATE,
    [Order_Details] VARCHAR(40),
    [Customer_Id] INT,

    CONSTRAINT [PK_Order_Id] PRIMARY KEY([Order_Id]),
    CONSTRAINT [FK_Customer_Id] FOREIGN KEY([Customer_Id]) REFERENCES [Customer] (Customer_Id)
)
GO

CREATE TABLE [Payment](
    [Bill_number] INT,
    [Payment_Type] VARCHAR(40),
    [Other_Details] VARCHAR(40),

    CONSTRAINT [PK_Bill_number] PRIMARY KEY([Bill_number]),
)
GO

CREATE TABLE [Order_Detail](
    [Order_Detail_Id] INT,
    [Unit_Price] FLOAT,
    [Size] INT,
    [Quantity] INT,
    [Discount] INT,
    [Total] FLOAT,
    [Date] DATE,
    [Product_Id] VARCHAR(40),
    [Order_Id] INT,
    [Bill_number] INT,

    CONSTRAINT [PK_Order_Detail_Id] PRIMARY KEY([Order_Detail_Id]),
    CONSTRAINT [FK_Product_Id] FOREIGN KEY([Product_Id]) REFERENCES [Product] (Product_Id),
    CONSTRAINT [FK_Order_Id] FOREIGN KEY([Order_Id]) REFERENCES [Order] (Order_Id),
    CONSTRAINT [FK_Bill_number] FOREIGN KEY([Bill_number]) REFERENCES [Payment] (Bill_number)
)
GO