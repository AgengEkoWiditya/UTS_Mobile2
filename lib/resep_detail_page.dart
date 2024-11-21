import 'package:flutter/material.dart';

class ResepDetailPage extends StatelessWidget {
  final Map<String, String> resep;

  ResepDetailPage({required this.resep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resep['title'] ?? 'Resep Tidak Ditemukan'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _buildImage(), // Memanggil fungsi untuk menampilkan gambar
              ),
              const SizedBox(height: 20),
              Text(
                'Bahan-bahan:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _getIngredients(resep['title'] ?? ''), // Menggunakan fungsi untuk mendapatkan bahan
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Text(
                'Cara Memasak:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _getCookingSteps(resep['title'] ?? ''), // Menggunakan fungsi untuk mendapatkan cara memasak
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun gambar menggunakan NetworkImage
  Widget _buildImage() {
    final imageUrl = resep['image'] ?? ''; // Menggunakan fallback string jika tidak ada URL
    return imageUrl.isNotEmpty
        ? Image.network(
            imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Icon(Icons.error, color: Colors.red));
            },
          )
        :const Center(child: Icon(Icons.error, color: Colors.red));
  }

  // Fungsi untuk mendapatkan bahan berdasarkan judul resep
  String _getIngredients(String title) {
    switch (title) {
      case 'Resep Ayam Goreng':
        return '• 2 Ayam\n• 1 Bawang Merah\n• 1 Bawang Putih\n• Minyak Goreng\n• Garam\n• Merica';
      case 'Resep Nasi Goreng':
        return '• 2 Porsi Nasi\n• 1 Telur\n• 1 Bawang Merah\n• 1 Bawang Putih\n• Kecap Manis\n• Minyak Goreng\n• Sayuran';
      case 'Resep Mie Goreng':
        return '• 1 Bungkus Mie Instan\n• 1 Telur\n• 1 Bawang Merah\n• 1 Bawang Putih\n• Kecap Manis\n• Sayuran';
      case 'Resep Sate Ayam':
        return '• 500g Daging Ayam\n• Bumbu Sate\n• Kecap Manis\n• Minyak Goreng\n• Tusuk Sate';
      default:
        return 'Bahan-bahan tidak tersedia.';
    }
  }

  // Fungsi untuk mendapatkan cara memasak berdasarkan judul resep
  String _getCookingSteps(String title) {
    switch (title) {
      case 'Resep Ayam Goreng':
        return '1. Potong ayam sesuai selera.\n'
            '2. Haluskan bawang merah dan bawang putih.\n'
            '3. Tumis bawang hingga harum.\n'
            '4. Goreng ayam sampai matang.\n'
            '5. Sajikan dengan nasi.';
      case 'Resep Nasi Goreng':
        return '1. Masak nasi terlebih dahulu.\n'
            '2. Tumis bawang merah dan bawang putih.\n'
            '3. Tambahkan telur dan orak-arik.\n'
            '4. Masukkan nasi dan kecap manis.\n'
            '5. Sajikan dengan sayuran.';
      case 'Resep Mie Goreng':
        return '1. Rebus mie sesuai petunjuk.\n'
            '2. Tumis bawang merah dan bawang putih.\n'
            '3. Tambahkan mie dan kecap manis.\n'
            '4. Aduk rata dan sajikan dengan telur dan sayuran.';
      case 'Resep Sate Ayam':
        return '1. Potong daging ayam dan tusukkan pada tusuk sate.\n'
            '2. Olesi dengan bumbu sate.\n'
            '3. Panggang sate hingga matang.\n'
            '4. Sajikan dengan sambal kecap dan nasi.';
      default:
        return 'Cara memasak tidak tersedia.';
    }
  }
}
