CREATE DATABASE LatihanFK;
GO

USE LatihanFK;
GO

SELECT DB_NAME() AS DatabaseAktif;
GO

USE LatihanFK;
GO

-- 1. Membuat tabel Pelanggan
CREATE TABLE Pelanggan (
    PelangganID INT IDENTITY(1,1) PRIMARY KEY,
    NamaPelanggan VARCHAR(100) NOT NULL
);
GO

-- 2. Membuat tabel Produk
CREATE TABLE Produk (
    ProdukID INT IDENTITY(1,1) PRIMARY KEY,
    NamaProduk VARCHAR(100) NOT NULL
);
GO

-- 3. Membuat tabel PesananHeader
CREATE TABLE PesananHeader (
    PesananID INT IDENTITY(1,1) PRIMARY KEY,
    PelangganID INT NOT NULL,

    CONSTRAINT FK_Header_Pelanggan
    FOREIGN KEY (PelangganID)
    REFERENCES Pelanggan(PelangganID)
);
GO

-- 4. Membuat tabel PesananDetail
CREATE TABLE PesananDetail (
    PesananDetailID INT IDENTITY(1,1) PRIMARY KEY,
    PesananID INT NOT NULL,
    ProdukID INT NOT NULL,
    Jumlah INT NOT NULL,

    CONSTRAINT FK_Detail_Header
    FOREIGN KEY (PesananID)
    REFERENCES PesananHeader(PesananID),

    CONSTRAINT FK_Detail_Produk
    FOREIGN KEY (ProdukID)
    REFERENCES Produk(ProdukID)
);
GO

-- 5. Menguji penghapusan Pelanggan
PRINT 'Mencoba menghapus Pelanggan...';

BEGIN TRY
    DROP TABLE Pelanggan;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- 6. Menguji penghapusan PesananHeader
PRINT 'Mencoba menghapus PesananHeader...';

BEGIN TRY
    DROP TABLE PesananHeader;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- 7. Menghapus tabel anak
DROP TABLE PesananDetail;
GO

-- 8. Menghapus tabel PesananHeader
DROP TABLE PesananHeader;
GO

-- 9. Menghapus tabel Pelanggan
DROP TABLE Pelanggan;
GO

PRINT 'Proses selesai!';
GO