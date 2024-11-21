import 'package:flutter/material.dart';
import 'resep_detail_page.dart'; // Impor halaman detail

class ResepPage extends StatefulWidget {
  ResepPage({Key? key}) : super(key: key);

  @override
  _ResepPageState createState() => _ResepPageState();
}

class _ResepPageState extends State<ResepPage> {
  // Daftar Resep menggunakan Map<String, String> dan URL gambar
  final List<Map<String, String>> resepData = [
    {
      "title": "Resep Ayam Goreng",
      "image": "https://down-id.img.susercontent.com/file/8c6999f7b6145a095562c60d8b3c798f@resize_w450_nl.webp", // Ganti dengan URL gambar Anda
    },
    {
      "title": "Resep Nasi Goreng",
      "image": "https://down-id.img.susercontent.com/file/5072063b8e60fd58f4c694612839e6c2@resize_w450_nl.webp", // Ganti dengan URL gambar Anda
    },
    {
      "title": "Resep Mie Goreng",
      "image": "https://down-id.img.susercontent.com/file/aa849373eb7ae4b7c011138c57dbb54c@resize_w450_nl.webp", // Ganti dengan URL gambar Anda
    },
    {
      "title": "Resep Sate Ayam",
      "image": "https://down-id.img.susercontent.com/file/f1670c75922cb2ca3b65e6672253ab46@resize_w450_nl.webp", // Ganti dengan URL gambar Anda
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Resep'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: resepData.length,
          itemBuilder: (context, index) {
            final resep = resepData[index]; // Ambil data resep

            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(resep["image"]!), // Menggunakan NetworkImage
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  resep["title"]!, // Akses properti `title`
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                subtitle: Text(
                  'Klik untuk melihat resep detailnya',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                onTap: () {
                  // Navigasi ke halaman detail resep
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResepDetailPage(
                        resep: {
                          "title": resep["title"]!,
                          "image": resep["image"]!,
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
