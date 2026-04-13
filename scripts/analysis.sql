-- Mencari pergeseran tipe order saat hujan di Malang
SELECT 
    kondisi_cuaca, 
    tipe_order, 
    SUM(omzet) as total_pendapatan
FROM penjualan_malang
GROUP BY kondisi_cuaca, tipe_order
ORDER BY kondisi_cuaca;