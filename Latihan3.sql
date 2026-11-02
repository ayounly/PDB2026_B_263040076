CREATE TABLE Pelanggan (
    PelangganID INT IDENTITY(1,1) PRIMARY KEY,
    NamaPelanggan VARCHAR(100) NOT NULL
);

CREATE TABLE PesananHeader (
    PesananID INT IDENTITY(1,1) PRIMARY KEY,
    TanggalPesanan DATETIME2 NOT NULL,
    StatusPesanan VARCHAR(20) NOT NULL DEFAULT 'Baru',
    PelangganID INT NOT NULL,
    CONSTRAINT FK_Pesanan_Pelanggan
        FOREIGN KEY (PelangganID)
        REFERENCES Pelanggan(PelangganID),
    CONSTRAINT CHK_StatusPesanan
        CHECK (StatusPesanan IN ('Baru', 'Proses', 'Selesai'))
);