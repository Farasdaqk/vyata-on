VYATA ON ONLINE — WEB BUILD

Isi paket:
- index.html: aplikasi VYATA ON dengan login Supabase Auth dan sinkronisasi data lewat app_settings.
- VYATA-ON-SUPABASE-RLS.sql: kebijakan RLS yang membatasi data bersama ke profil role=admin.
- vercel.json: konfigurasi deploy Vercel.

LANGKAH PENTING SEBELUM UJI
1. Di Supabase SQL Editor, jalankan VYATA-ON-SUPABASE-RLS.sql.
2. Pastikan akun ada di Authentication → Users dan public.profiles memiliki id sama dengan Auth UID serta role='admin'.
3. Deploy folder ini sebagai proyek Vercel BARU untuk VYATA ON. Jangan ubah proyek SIPANDU/rindamsiliwangi.tech.
4. Buka web VYATA ON, login memakai email dan kata sandi Supabase.
5. Uji tambah data siswa/laporan dan jadwal Running Text, lalu buka di browser/perangkat lain dan login akun admin yang sama.

CATATAN
- Supabase Publishable Key tertanam di HTML client; ini memang kunci client, bukan secret. Jangan pernah memasukkan service_role/secret key ke HTML.
- Data siswa, laporan, dan jadwal disimpan sebagai JSON di public.app_settings agar bentuk data aplikasi lama tetap dipertahankan. Tabel students/reports/running_text tetap tersedia untuk skema terstruktur di tahap lanjutan.
- Login hanya menerima akun yang memiliki role admin pada public.profiles. Pendaftaran admin lokal dimatikan.
- Integrasi ini memerlukan koneksi internet. Ini adalah build web; APK Android lama tidak berubah otomatis dan perlu dibangun ulang dari source project Android untuk menggunakan backend ini.
- Data default lokal yang belum ada di cloud akan diunggah pada login admin pertama. Jika sudah ada nilai di cloud, nilai cloud akan menggantikan cache lokal perangkat. Cadangkan data penting sebelum pengujian.
