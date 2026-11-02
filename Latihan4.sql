-- 1. Menambahkan Primary Key ke tabel Produk
-- (Kita asumsikan ProdukID sudah diisi data unik dan NOT NULL,
-- tapi karena tabel kita masih kosong, kita tambahkan NOT NULL dulu)
ALTER TABLE Produk
ALTER COLUMN ProdukID INT NOT NULL;
GO
ALTER TABLE Produk
ADD CONSTRAINT PK_Produk PRIMARY KEY (ProdukID);
GO
-- 2. Menambahkan kolom NoTelepon ke tabel Pelanggan
ALTER TABLE Pelanggan
ADD NoTelepon VARCHAR(20) NULL;
GO
-- 3. Mengubah kolom Harga di Produk agar wajib diisi
ALTER TABLE Produk
ALTER COLUMN Harga DECIMAL(10, 2) NOT NULL;
GO
-- Cek struktur kedua tabel untuk melihat perubahan
EXEC sp_help 'Produk';
EXEC sp_help 'Pelanggan';