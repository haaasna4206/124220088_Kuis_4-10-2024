import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan dan Dukungan'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.lightBlue[300], 
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue[200]!,
              Colors.lightBlue[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Customer Service
                Center(
                  child: Image.asset(
                    'assets/customerService.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),

                // Pertanyaan Umum (FAQ)
                _buildSectionTitle('Pertanyaan Umum (FAQ)'),
                _buildSectionContent(
                  'Temukan jawaban atas berbagai pertanyaan yang sering ditanyakan oleh pengguna mengenai penggunaan aplikasi ini. Dari proses pendaftaran, cara membeli barang, hingga pengaturan akun, semua jawaban ada di sini untuk mempermudah pengalaman Anda.',
                ),
                SizedBox(height: 30),

                // Panduan Penggunaan
                _buildSectionTitle('Panduan Penggunaan'),
                _buildSectionContent(
                  'Pelajari langkah demi langkah cara menggunakan fitur-fitur aplikasi kami. Panduan ini akan membantu Anda memahami bagaimana memaksimalkan penggunaan aplikasi, mulai dari mencari produk hingga menyelesaikan transaksi dengan mudah.',
                ),
                SizedBox(height: 30),

                // Kontak Dukungan
                _buildSectionTitle('Kontak Dukungan'),
                _buildSectionContent(
                  'Jika Anda membutuhkan bantuan lebih lanjut, tim dukungan kami siap membantu. Anda dapat menghubungi kami melalui email, telepon, atau live chat. Kami berkomitmen untuk memberikan solusi terbaik bagi setiap masalah atau pertanyaan yang Anda miliki.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlue[800], // Warna gelap untuk judul
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Latar belakang konten
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Gaya bayangan
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87, // Warna teks
        ),
      ),
    );
  }
}
