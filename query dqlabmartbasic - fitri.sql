use dqlabmartbasic;

select nama_produk from ms_produk_dqlab;

select kategori_produk, nama_produk 
        from ms_produk_dqlab;
       
select * from ms_produk_dqlab;

select dqlabmartbasic.ms_pelanggan_dqlab.nama_pelanggan
from ms_pelanggan_dqlab;

SELECT nama_pelanggan as np FROM ms_pelanggan_dqlab;

# Praktek 1

select	nama_pelanggan,
		alamat
from ms_pelanggan_dqlab;


# Praktek 2

select	nama_produk,
		harga
from ms_produk_dqlab;

# Praktek 3

select 	4 % 2 ,
		(4 * 8) % 7,
		(4 * 8) mod 7;
		
# Praktek 4

select	1 = true,
		1 = false,
		5 >= 5,
		5.2 = 5.20000,
		NULL = 1,
		NULL = NULL;

# Praktek 5

select	datediff('2023-03-20', now()),
		year('2022-07-23'),
		month('2022-07-23'),
		day('2022-07-23'),
		year(now());

# Praktek 6

select	datediff(now(), tgl_transaksi) jarak_hari_transaksi,
		year(tgl_transaksi) tahun_transaksi
from tr_penjualan_dqlab;
		
# WHERE

select	nama_produk,
		harga
from ms_produk_dqlab
where harga > 50000;

select	nama_produk,
		qty
from tr_penjualan_dqlab
where qty > 3;

select	nama_produk,
		qty
from tr_penjualan_dqlab
where qty > 3 and
month(tgl_transaksi) = 5;

# like operator

select	nama_produk
from tr_penjualan_dqlab
where nama_produk like 'g%';

# filtering dengan operator perbandingan

select	nama_produk,
		qty
from tr_penjualan_dqlab
where nama_produk like 'g%' and qty > 3;

select	nama_produk,
		qty
from tr_penjualan_dqlab
where nama_produk like 'g%' or qty > 3;

# where

# menampilkan kolom nama_produk, harga, dan diskon dari transaksi penjualan yang memiliki diskon dan diurutkan berdasarkan harga tertinggi

select	nama_produk,
		harga,
		diskon_persen
from tr_penjualan_dqlab
where diskon_persen != 0
order by harga desc;

# menampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan yang memiliki harga minimal seratus ribu rupiah dan diurutkan berdasarkan harga tertinggi

select	nama_produk,
		qty,
		harga
from tr_penjualan_dqlab
where harga >= 100000
order by harga desc;

# menampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan yang memiliki harga minimal seratus ribu rupiah atau nama produk berawalan karakter ‘T’ dan diurutkan berdasarkan diskon tertinggi

select	nama_produk,
		qty,
		harga
from tr_penjualan_dqlab
where harga >= 100000 or nama_produk like 'T%'
order by diskon_persen desc;

# menampilkan nilai total, rata-rata, max, dan min dari kolom harga, count semua kolom dan count(distinct) kolom nama_produk dari transaksi penjualan

select sum(harga), avg(harga), max(harga), min(harga), count(*), count(distinct nama_produk)
from tr_penjualan_dqlab;
		
# Order By dan Having

# Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk adalah di atas nilai 4

select nama_produk, sum(qty) jumlah_produk
from tr_penjualan_dqlab
group by nama_produk
having sum(qty) > 4;

# Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk sama dengan 9. 

select nama_produk, sum(qty) jumlah_produk
from tr_penjualan_dqlab
group by nama_produk
having sum(qty) = 9;

# Melihat daftar kelompok nama produk dan total nilai penjualan (harga dikalikan jumlah dikurangi diskon) dengan dan urutan berdasarkan nilai penjualan terbesar. 

select nama_produk, sum((harga * qty) - diskon_persen) total_penjualan
from tr_penjualan_dqlab
group by nama_produk
order by total_penjualan desc;		

# Join / inner join

select tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
from tr_penjualan_dqlab tp
join ms_pelanggan_dqlab mp
on tp.kode_pelanggan = mp.kode_pelanggan;

# cross join

select tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
from tr_penjualan_dqlab tp
join ms_pelanggan_dqlab mp
on true;

# left join / left outer join

select tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
from tr_penjualan_dqlab tp
left join ms_pelanggan_dqlab mp
on tp.kode_pelanggan = mp.kode_pelanggan;

# right join / right outer join

select tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
from tr_penjualan_dqlab tp
right join ms_pelanggan_dqlab mp
on tp.kode_pelanggan = mp.kode_pelanggan;

# order by pada join 

select tp.kode_pelanggan, mp.nama_pelanggan, 
	   mpd.kategori_produk , mpd.nama_produk , tp.qty
from ms_pelanggan_dqlab mp 
left join tr_penjualan_dqlab tp 
on mp.kode_pelanggan = tp.kode_pelanggan
left join ms_produk_dqlab mpd
on mpd.kode_produk = tp.kode_produk
order by qty desc;

# group by pada join


