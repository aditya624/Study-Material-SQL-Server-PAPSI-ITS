/*NRP Mhs Latihan 31-10-2019
1. 8819300037
2. 8819300056 */
/* Komentar */
/*Where digunakan untuk menampilkan data dengan kondisi 
tertentu */
/* Contoh Menampilkan data Mahasiswa yang berjenis kelamin
Perempuan*/
SELECT NRP,NamaMhs,JK 
FROM Mhs 
WHERE JK='P'
/*Contoh Menyajikan data Mahasiswa yang Sks Tempuh 
30*/
SELECT NamaMhs,SksTempuh
FROM Mhs
WHERE SksTempuh=30
/*Contoh data Mahasiswa Ipk kurang dari 3*/
SELECT NamaMhs,Ipk
FROM Mhs
WHERE Ipk<3
/* Operator AND*/
/* Menyajikan data mahasiswa Perempuan
yang Ipk lebih dari 3*/
SELECT NamaMhs,JK,Ipk 
FROM Mhs
WHERE JK='P' AND Ipk>3
/* Operator OR */
SELECT NamaMhs,JK,Ipk 
FROM Mhs
WHERE JK='P' OR Ipk>3
/* Operatir NOT */
/* Data Mahasiswa yang jenis kelamin bukan laki-laki*/
SELECT NamaMhs,JK,Ipk
FROM Mhs
WHERE NOT (JK='L' AND Ipk<3)
/*Sama Saja dengan : */
SELECT NamaMhs,JK,Ipk
FROM Mhs
WHERE JK='P' OR Ipk>=3
/* Beda dengan :*/
SELECT NamaMhs,JK,Ipk
FROM Mhs
WHERE NOT JK='L' AND Ipk<3
/* Between Untuk Menyajikan Data yang berada diantara 
kriteria tertentu*/
/* Contoh Data Mahasiswa yang memiliki Ipk
Diantara 3 dan 3.4 */
SELECT NamaMhs,Ipk
FROM Mhs
WHERE Ipk BETWEEN 3 AND 3.4
/* NOT BETWEEN Untuk menyajikan Data yang tidak berada 
dikriteria Tertentu*/
SELECT NamaMhs,Ipk
FROM Mhs
WHERE Ipk NOT BETWEEN 3 AND 3.4
/* IN untuk menampilkan data dalam suatu kelompok nilai
atau list*/
SELECT NamaMhs,SksTempuh
FROM Mhs
WHERE SksTempuh IN (30,40,36)
/*Sama Halnya dengan : */
SELECT NamaMhs,SksTempuh
FROM Mhs
WHERE SksTempuh=30 OR SksTempuh=40 OR SksTempuh=36
/* NOT IN untuk menyajikan data diluar kelompok nilai
atau list yang ditentukan */ 
SELECT NamaMhs,SksTempuh
FROM Mhs
WHERE SksTempuh NOT IN (30,40,36)
/* Sama Halnya */
SELECT NamaMhs,SksTempuh
FROM Mhs
WHERE NOT (SksTempuh=30 OR SksTempuh=40 OR SksTempuh=36)
/*LIKE*/
/* Contoh Nama Mahasiswa yang berawalan huruf F*/
SELECT NamaMhs
FROM Mhs
WHERE NamaMhs like 'F%'
/* Contoh Nama Mahasiswa yang berakhiran huruf F*/
SELECT NamaMhs
FROM Mhs
WHERE NamaMhs like '%F'
/* Contoh Nama Mahasiswa yang memiliki unsur huruf F*/
SELECT NamaMhs
FROM Mhs
WHERE NamaMhs like '%F%'
/* Sedangkan tanpa %*/
SELECT NamaMhs
FROM Mhs
WHERE NamaMhs like 'Fajar Aulia'
/* Sama saja dengan :*/
--Komentar
SELECT NamaMhs
FROM Mhs
WHERE NamaMhs='Fajar Aulia'
--ORDER BY __ ASC untuk mengurutkan dari yang terendah
--ORDER BY __ DESC untuk mengurutkan dari yang tertinggi
/* Contoh Menyajikan data diurutkan berdasarkan Nama Mhs
Dari yang terendah*/
SELECT *
FROM Mhs
ORDER BY NamaMhs ASC
/* Contoh Menyajikan data diurutkan berdasarkan Nama Mhs
Dari yang tertinggi*/
SELECT *
FROM Mhs
ORDER BY NamaMhs DESC
/*Menyajikan data mahasiswa laki-laki diurutkan berdasarkan 
NRP terendah*/
SELECT *
FROM Mhs
WHERE JK='L'
ORDER BY NRP DESC

SELECT * FROM Mhs

/*DISTINCT digunakan untuk menampilkan data yang sama hanya 1 kali */
SELECT JK FROM Mhs
SELECT DISTINCT JK FROM Mhs
SELECT SksTempuh FROM Mhs ORDER BY SksTempuh ASC
SELECT DISTINCT SksTempuh FROM Mhs ORDER BY SksTempuh ASC

/*AVG(X) untuk menentukan nilai rata-rata dari tabel */
SELECT Ipk FROM Mhs
SELECT AVG(Ipk) 'Rata-rata Ipk' FROM Mhs
/*SUM(X) untuk menjumlah nilai-nilai disatu kolom */
SELECT SUM(Ipk) 'JumlahIpk' FROM Mhs
/*MAX(X) untuk mencari nilai terbesar dari data */
SELECT MAX(Ipk) 'Ipk Tertinggi' FROM Mhs
/*Menampilkan Nama Mhs dengan Ipk Tertinggi */
SELECT NamaMhs,Ipk FROM Mhs 
WHERE Ipk=(SELECT MAX(Ipk) FROM Mhs)

/*Menampilkan Nama Mhs dengan Ipk diatas rata-rata */
SELECT NamaMhs,Ipk FROM Mhs
WHERE Ipk>(SELECT AVG(Ipk) FROM Mhs)
/*MIN(X) Untuk mencari nilai Terkecil */
SELECT MIN(Ipk) 'Ipk Terendah' FROM Mhs
/*COUNT(X) berfungsi untuk menghitung jumlah data*/
SELECT * FROM MK
SELECT COUNT(*) 'Jumlah MK' FROM MK
/*GROUP BY */
SELECT JK AS 'Jenis Kelamin',AVG(Ipk) 'Rata-Rata Ipk' 
FROM Mhs 
GROUP BY JK

SELECT NRP,COUNT(Nilai) 'Total Nilai yang sudah muncul' 
FROM Nilai
GROUP BY NRP


/*HAVING memiliki fungsinya sama dengan WHERE tetapi 
dalam keadaan GROUP BY */
SELECT ThAjaran,AVG(Nilai) 'Rata-rata Nilai' 
FROM Nilai
GROUP BY ThAjaran 
HAVING AVG(Nilai)>90

SELECT NRP,COUNT(Nilai) 'Total Nilai yang sudah muncul' 
FROM Nilai
GROUP BY NRP
HAVING COUNT(Nilai)>1

/* JOIN untuk mengakses lebih dari 1 tabel */
SELECT Nilai.NRP, Mhs.NamaMhs, Nilai.KodeMK, Nilai.Nilai 
FROM Nilai,Mhs
WHERE Mhs.NRP=Nilai.NRP

SELECT Nilai.NRP, Mhs.NamaMhs, Nilai.Nilai
FROM Nilai, Mhs
WHERE Mhs.NRP=Nilai.NRP

/*Tampilkan NRP,KodeMK,NamaMK,Nilai */
/* */
SELECT Nilai.NRP, MK.KodeMK, MK.NamaMK, Nilai.Nilai
FROM Nilai,MK
WHERE Nilai.KodeMK=MK.KodeMK
/* ALIAS untuk menyederhanakan penulisan*/
SELECT TN.NRP, K.KodeMK, K.NamaMK 'Mata Kuliah', TN.Nilai
FROM Nilai TN,MK K
WHERE TN.KodeMK=K.KodeMK
/* Menampilkan Nilai dari Mahasiswa yang bernama 'Annisa'*/
SELECT Mhs.NRP,Mhs.NamaMhs,Nilai.Nilai
FROM Mhs, Nilai
WHERE Mhs.NamaMhs='Annisa' AND Mhs.NRP=Nilai.NRP

SELECT * FROM Nilai

--BAB 4
--1
SELECT c.IDTransaksi, a.Nama, b.IDKoleksi, b.Judul, c.TglPinjam, d.TglHrsKembali
FROM TAnggota a, TKoleksi b, TTransaksi c, TDetilTransaksi d
WHERE a.Nama='Dinda' AND a.IDAnggota=c.IDAnggota AND c.IDTransaksi=d.IDTransaksi 
	AND b.IDKoleksi=d.IDKoleksi
--2	
SELECT c.IDTransaksi, a.Nama, b.IDKoleksi, b.Judul, 
c.TglPinjam, d.TglHrsKembali, d.TglPengembalian
FROM TAnggota a, TKoleksi b, TTransaksi c, TDetilTransaksi d
WHERE a.Nama='Joko Lelono' AND a.IDAnggota=c.IDAnggota AND c.IDTransaksi=d.IDTransaksi 
	AND b.IDKoleksi=d.IDKoleksi AND d.TglPengembalian IS NOT NULL
--4
--Menampilkan Nama Anggota yang meminjam koleksi dengan judul Habibi Ainun
SELECT a.Nama, b.Judul
FROM TAnggota a, TKoleksi b, TTransaksi c, TDetilTransaksi d
WHERE a.IDAnggota=c.IDAnggota AND c.IDTransaksi=d.IDTransaksi
AND b.IDKoleksi=d.IDKoleksi AND b.Judul='Tolong' 
AND d.TglPengembalian IS NULL

--Pengoperasian Tanggal
--Tanggal Sekarang
SELECT GETDATE() 'Tanggal Sekarang'
--Fungsi YEAR untuk mengambil tahun saja
SELECT YEAR(GETDATE())
--Fungsi MONTH untuk mengambil bulan saja
SELECT MONTH(GETDATE())
--Menampilkan IDKoleksi, dan Bulan pengembalian.
SELECT IDKoleksi, MONTH(TglPengembalian) FROM TDetilTransaksi
WHERE TglPengembalian IS NOT NULL

--Konversi Tanggal dengan menggunakan CONVERT()
SELECT GETDATE()

SELECT CONVERT(VARCHAR(20),GETDATE(),1) 
SELECT CONVERT(VARCHAR(20),GETDATE(),102) 


SELECT TglPengembalian FROM TDetilTransaksi 
WHERE TglPengembalian IS NOT NULL
--Hasil Konversi
SELECT CONVERT(VARCHAR(20),TglPengembalian,101) FROM TDetilTransaksi 
WHERE TglPengembalian IS NOT NULL

/* Menampilkan detail buku yang belum di kembalikan oleh 
joko lelono pada rentan tanggal 10 januari sampai 20 januari*/
SELECT c.IDTransaksi, a.Nama, b.IDKoleksi, b.Judul, 
CONVERT(VARCHAR(15),c.TglPinjam,103) 'Tanggal Pinjam', 
CONVERT(VARCHAR(15),d.TglHrsKembali,106) 'Tanggal Hrs Kembali', 
CONVERT(VARCHAR(24),d.TglPengembalian,101) 'Tanggal Pengembalian'
FROM TAnggota a, TKoleksi b, TTransaksi c, TDetilTransaksi d
WHERE a.Nama='Joko Lelono' AND a.IDAnggota=c.IDAnggota AND c.IDTransaksi=d.IDTransaksi 
	AND b.IDKoleksi=d.IDKoleksi AND d.TglPengembalian IS NOT NULL
	AND TglPengembalian BETWEEN '2018-01-10' AND '2018-01-31'
--Dari QUERY di atas, konversi tglPinjam, TglHrsKembali, dan 
--TglPengembalian menjadi type 102

--
--BAB V
--VIEW adalah tabel virtual.

ALTER VIEW VMHS AS
SELECT NRP, NamaMhs, AlamatMhs FROM Mhs
WITH CHECK OPTION

SELECT * FROM VMHS
/*Buat View bernama VNilai yang membuat tabel virtual: 
Nama Mata kuliah, Nama Mhs dan Nilai.
 */
 CREATE VIEW VNilai AS
 SELECT MK.NamaMK, Mhs.NamaMhs, Nilai.Nilai
 FROM MK, Mhs, Nilai
 WHERE MK.KodeMK=Nilai.KodeMK AND Mhs.NRP=Nilai.NRP
 WITH CHECK OPTION
 
 SELECT * FROM VNilai
 
 /*Saya adalah seorang admin database perpustakaan, beberapa kolom ditabel
 Tkoleksi bersifat rahasia. Pengguna hanya diperbolehkan akses 
 dengan ketentuan:
 1. Kolom Judul, Jenis dan Jumlah
 2. Jangka waktu kurang dari atau sama dengan 5.
 Apa yang saya lakukan ? Create VIEW.
 Buatlah !
  */
 CREATE VIEW VPengguna AS
 SELECT Judul, Jenis, Jumlah FROM TKoleksi
 WHERE JangkaWaktu<=5
 WITH CHECK OPTION
 
 SELECT Judul, Jenis FROM VPengguna
 WHERE Judul='Doraemon'
 
 /*Merubah/memodifikasi VIEW VPengguna menggunakan ALTER */
 ALTER VIEW VPengguna AS
 SELECT Judul, Jenis, Jumlah, JangkaWaktu FROM TKoleksi
 WHERE JangkaWaktu<=6
 WITH CHECK OPTION
 
 SELECT * FROM VPengguna
 
 /*
 Pada VMHS, admin hanya memperbolehkan akses NRP dan NamaMhs.
 5 tahun kemudian kebijakan berubah mengakibatkan perubahan view 
 dengan penambahan kolom Jenis Kelamin dan IPK yang lebih dari 3.00
 Buatlah !
 */
 ALTER VIEW VMHS AS
 SELECT NRP, NamaMhs, JK, Ipk
 FROM Mhs
 WHERE Ipk>3
 WITH CHECK OPTION
 
 SELECT * FROM VMHS
 /*Akses tabel virtual dan tabel asli */
 
 SELECT VMHS.NamaMhs, Nilai.Nilai 
 FROM VMHS, Nilai
 WHERE VMHS.NRP=Nilai.NRP
 /* Menghapus VIEW */
 DROP VIEW VMHS
 
 /*Buat View untuk menghitung jumlah mahasiswa 
 berdasarkan jenis kelamin */
 
ALTER VIEW VJK AS
 SELECT JK 'Jenis_Kelamin', COUNT(*) 'Jumlah_Mhs'
 FROM Mhs
 GROUP BY JK
 WITH CHECK OPTION
 
 SELECT Jenis_Kelamin,Jumlah_Mhs FROM VJK
 
 --Latihan Hal 66.
 /*Soal Lanjutan :
 1. Buat View bernama VIEW yang menyimpan 
 IDTransaksi, IDSupplier, NamaSupplier, ContactPerson.
 Setelah di simpan, Tampilkan ID Transaksi dan Nama Supplier saja. */
 
 /*Jawaban */
 --No: 1 ,NRP: 8819300029
 SELECT NamaBarang, Stok FROM Barang
 WHERE Stok >= 100 
 --No: 2 ,NRP: 8819300037
 SELECT NamaBarang, Stok, StokAman From Barang
 WHERE ABS(Stok - StokAman) <= 40
 --No: 3, NRP 8819300065
 SELECT* FROM Barang
 WHERE Stok = (SELECT MIN(Stok) FROM Barang)
 --No : 4, NRP 8819300057
 SELECT Supplier.NamaSupplier,Supplier.AlamatSupplier,Transaksi.TglPembelian 
 FROM Transaksi,Supplier
 WHERE Supplier.IDSupplier = Transaksi.IDSupplier
 --Ganti
 SELECT Supplier.NamaSupplier,Supplier.AlamatSupplier,Transaksi.TglPembelian 
 FROM Transaksi JOIN Supplier ON Supplier.IDSupplier = Transaksi.IDSupplier
 --No : 5, NRP : 
 SELECT IDTransaksi, SUM(Jumlah) 'Jumlah'
 FROM TransaksiDetail
 GROUP BY IDTransaksi
 --No : 6, NRP :8819300073
 SELECT IDBarang, Jumlah FROM TransaksiDetail WHERE (IDTransaksi) = 'T0004'
  
 SELECT Barang.IDBarang, Barang.NamaBarang, Barang.Stok, Barang.StokAman 
 FROM Barang, TransaksiDetail, Transaksi
 WHERE Barang.IDBarang=TransaksiDetail.IDBarang
 AND TransaksiDetail.IDTransaksi=Transaksi.IDTransaksi
 AND Transaksi.IDTransaksi='T0004'
 --No : 7,NRP: 8819300058,8819300057,8819300029
 SELECT B.NamaSupplier,A.IDTransaksi,A.TglPembelian FROM Transaksi A , Supplier B
 WHERE A.IDSupplier = B.IDSupplier AND B.NamaSupplier = 'SUKA MANDIRI'
 
 --no. 8, nrp ; 8819300031
 SELECT SUM(JUMLAH*HARGA)'TOTAL HARGA'
 FROM TransaksiDetail
 WHERE IDTransaksi = 'T0002'
 
 --No : 9, NRP: 8819300046
 SELECT Transaksi.IDTransaksi, Supplier.NamaSupplier, Transaksi.TglPembelian
 FROM Transaksi, Supplier
 WHERE Transaksi.IDSupplier=Supplier.IDSupplier
 
 --No : 10, NRP: 8819300033
 SELECT Supplier.NamaSupplier, Transaksi.TglPembelian
 from Barang,Supplier, Transaksi, TransaksiDetail
 where Supplier.IDSupplier=Transaksi.IDSupplier and Transaksi.IDTransaksi=TransaksiDetail.IDTransaksi
 and TransaksiDetail.IDBarang = Barang.IDBarang
 and Barang.NamaBarang='Keyboard'
 
 SELECT * FROM TAnggota
 
 CREATE VIEW VAnggota AS 
 SELECT IDAnggota,Nama,Alamat
 FROM TAnggota
 
 SELECT * FROM VAnggota
 
 SELECT JK, AVG(Ipk)'Rata-rata Ipk' 
 FROM Mhs 
 GROUP BY JK

SELECT Alamat, COUNT(*) 'Jumlah' FROM TAnggota
GROUP BY Alamat 
HAVING COUNT(*)>2

SELECT Alamat FROM TAnggota
GROUP BY Alamat

SELECT DISTINCT State FROM sales.customers

EXEC sp_Anggota_sby
/* 
	Keuntungan menggunakan Stored Prosedure untuk efisiensi 
	program yang panjang dan kompleks.
*/

SELECT c.IDTransaksi, a.Nama, b.IDKoleksi, b.Judul, 
CONVERT(VARCHAR(15),c.TglPinjam,103) 'Tanggal Pinjam', 
CONVERT(VARCHAR(15),d.TglHrsKembali,106) 'Tanggal Hrs Kembali', 
CONVERT(VARCHAR(24),d.TglPengembalian,101) 'Tanggal Pengembalian'
FROM TAnggota a, TKoleksi b, TTransaksi c, TDetilTransaksi d
WHERE a.IDAnggota=c.IDAnggota AND c.IDTransaksi=d.IDTransaksi 
	AND b.IDKoleksi=d.IDKoleksi AND d.TglPengembalian IS NOT NULL
--NRP: 8819300046	
--Buat Stored Prosedure untuk query diatas dan diberi nama sp_pengmbalian
EXEC sp_pengembalian

/*Di Database Perpustakaan, Buatlah stored prosedure sp_notadmin 
untuk menyimpan program dengan Query yang menampilkan 
Nama Anggota, Nama User, Total Biaya Sewa yang id usernya 
selain admin. 
*/
--NRP = 8819300029

SELECT a.Nama ,b.NamaUser, c.TotBiayaSewa 
FROM TAnggota a, TUser b, TTransaksi c
WHERE b.IDUser = c.IDUser and c.IDAnggota = a.IDAnggota and NOT b.IDUser = 'Admin'


CREATE VIEW Vpengembalian AS
SELECT c.IDTransaksi, a.Nama, b.IDKoleksi, b.Judul, 
CONVERT(VARCHAR(15),c.TglPinjam,103) 'Tanggal Pinjam', 
CONVERT(VARCHAR(15),d.TglHrsKembali,106) 'Tanggal Hrs Kembali', 
CONVERT(VARCHAR(24),d.TglPengembalian,101) 'Tanggal Pengembalian'
FROM TAnggota a, TKoleksi b, TTransaksi c, TDetilTransaksi d
WHERE a.IDAnggota=c.IDAnggota AND c.IDTransaksi=d.IDTransaksi 
	AND b.IDKoleksi=d.IDKoleksi AND d.TglPengembalian IS NOT NULL
	
SELECT * FROM Vpengembalian
SELECT IdTransaksi, Nama FROM Vpengembalian

EXEC sp_pengembalian

EXEC sp_notadmin

EXEC sp_Alamat_Anggota 'Madiun'

EXEC sp_Anggota_sby

--Trigger 
CREATE TRIGGER TrigPesan 
ON TAnggota
AFTER INSERT /*Respon yang terjadi setelah insert ke tabel 
TAnggota */
AS
--QUERY
PRINT 'Berhasil Menambahkan Data Anggota'

--Melakukan insert pada tabel TAnggota
SELECT * FROM TAnggota
INSERT INTO TAnggota VALUES ('A009','Aditya','Tulungagung','0856')

CREATE TRIGGER TrigPeminjaman --Membuat Trigger dengan nama TrigPeminjaman
ON TDetilTransaksi 
AFTER INSERT --Respon terjadi ketika insert pada tabel TdetilTransaksi
AS --Manjalankan Query setelah AS
UPDATE TK SET TK.Jumlah=TK.Jumlah-1 --Mengurangi Jumlah koleksi sebanyak 1
FROM TKoleksi TK,inserted I --relasi dari tabel Tkoleksi dan tabel yang di Insert
WHERE TK.IDKoleksi=I.IDKoleksi --Ketika Idkoleksinya sama
PRINT 'Anda Berhasil Menambahkan Transaksi' 

SELECT * FROM TKoleksi
SELECT * FROM TDetilTransaksi

INSERT INTO TDetilTransaksi(IDTransaksi,IDKoleksi,TglHrsKembali)
VALUES ('5','K001','11-01-2019')
SELECT * FROM TKoleksi

--Medeklarasikan variabel
DECLARE @ID char(10)
--Memberi nilai pada variabel @ID
SET @ID='K003'
--Memanggil data dengan IDkoleksi yang ada pada variabel @ID
SELECT * FROM TKoleksi
WHERE IDKoleksi=@ID

SELECT Judul FROM TKoleksi 
WHERE IDKoleksi=@ID

--declarasikan variabel @judul
DECLARE @Judul char(20)
--Set variabel @Judul dari Tkoleksi dengan IDkoleksi K001
SET @Judul=(SELECT Judul FROM TKoleksi Where IDKoleksi='K001')
PRINT @Judul

--Trigger Pengembalian
CREATE TRIGGER TrigPengembalian --Membuat trigger dengan nama
ON TDetilTransaksi --Update pada tabel TdetilTransaksi
AFTER UPDATE --Setelah mengalami update
AS
DECLARE @IDKoleksi char(10) --declarasi variabel
IF(UPDATE(TglPengembalian))
BEGIN
	SET @IDKoleksi=(SELECT IDKoleksi FROM inserted)
	--Menambahkan Jumlah sebanyak 1
	UPDATE TKoleksi SET Jumlah=Jumlah+1
	WHERE IDKoleksi=@IDKoleksi
END

SELECT * FROM TKoleksi
SELECT * FROM TDetilTransaksi

UPDATE TDetilTransaksi
SET TglPengembalian='01-15-2019'
WHERE IDTransaksi=5 AND IDKoleksi='K001'

SELECT * FROM TKoleksi