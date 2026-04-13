# Analisis Optimasi Operasional F&B Berbasis Anomali Cuaca (Studi Kasus: Malang)

## 📌 Deskripsi Proyek
Proyek ini bertujuan untuk mengidentifikasi "Opportunity Loss" pada operasional restoran di Malang akibat perubahan cuaca yang tidak terprediksi. Fokus utama adalah menganalisis pergeseran perilaku konsumen dari *Dine-in* ke *Delivery* saat terjadi hujan deras pada jam operasional sibuk.

## 🛡️ Problem Statement (First Principles)
Banyak bisnis F&B hanya melihat total omzet harian tanpa melakukan dekomposisi data berdasarkan faktor eksternal (cuaca). 
* **Fakta:** Hujan deras di Malang sore hari menurunkan trafik *Dine-in* secara drastis.
* **Masalah Krusial:** Ketidaksiapan manajemen stok packaging dan alokasi SDM bagian packing saat pesanan *Delivery* melonjak tiba-tiba, menyebabkan *bottleneck* dan pembatalan pesanan.

## 🗡️ Metodologi Analisis (6 Phases of Data Analysis)
1. **Ask:** Bagaimana dampak hujan deras terhadap proporsi tipe pesanan dan efisiensi stok packaging?
2. **Prepare:** Menggunakan dataset simulasi penjualan (`penjualan_malang.csv`) yang mencakup waktu, kondisi cuaca, tipe order, dan omzet.
3. **Process:** Pembersihan data anomali (seperti angka minus atau karakter non-numerik) menggunakan SQL dan Excel.
4. **Analyze:** Melakukan komparasi performa antara hari cerah vs hari hujan menggunakan teknik *Clustered Analysis*.
5. **Share:** Visualisasi data menggunakan Bar Chart untuk menunjukkan gap omzet yang hilang.
6. **Act:** Memberikan rekomendasi strategis untuk manajemen stok dan re-alokasi staf.

## 📊 Analisis Teknis (SQL Snippet)
```sql
-- Mendeteksi pergeseran tipe order untuk persiapan stok packaging
SELECT 
    kondisi_cuaca, 
    tipe_order, 
    SUM(jumlah_porsi) as total_porsi,
    AVG(omzet) as rata_rata_omzet
FROM penjualan_malang
GROUP BY kondisi_cuaca, tipe_order
ORDER BY total_porsi DESC;