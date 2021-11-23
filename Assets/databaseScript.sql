USE [PetShop]

CREATE TABLE[Supplier](
    [Supplier_Id] INT,
    [Name] NVARCHAR(40),
    [Address] NVARCHAR(40),
    [Phone] NVARCHAR(10),
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
    CONSTRAINT [FK_Supplier_Id] FOREIGN KEY([Supplier_Id]) REFERENCES Supplier (Supplier_Id),
    CONSTRAINT [FK_Category_Id] FOREIGN KEY([Category_Id]) REFERENCES  Category (Category_Id)
)
GO

CREATE TABLE ROLE (
    [Role_Id] INT,
    [Role_Name] VARCHAR(40),
    [Description] VARCHAR(40)
)
