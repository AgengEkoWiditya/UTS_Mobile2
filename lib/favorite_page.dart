import 'package:flutter/material.dart';
import 'resep_detail_page.dart'; // Halaman detail

class FavoritePage extends StatelessWidget {
  // List resep favorit dengan data yang lebih lengkap
  final List<Map<String, String>> favoriteList = [
    {
      "title": "Resep Ayam Goreng",
      "image": "https://down-id.img.susercontent.com/file/8c6999f7b6145a095562c60d8b3c798f@resize_w450_nl.webp", // URL gambar
    },
    {
      "title": "Resep Nasi Goreng",
      "image": "https://down-id.img.susercontent.com/file/5072063b8e60fd58f4c694612839e6c2@resize_w450_nl.webp", // URL gambar
    },
    // Anda bisa menambahkan lebih banyak resep di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorit Saya'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: favoriteList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResepDetailPage(
                      resep: favoriteList[index], // Kirim data resep ke halaman detail
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 10,
                shadowColor: Colors.blueAccent, // Menambahkan bayangan yang lebih menarik
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Rounded corners yang lebih halus
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16), // Rounded corners untuk gambar
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        favoriteList[index]['image']!, // Menggunakan Image.network untuk gambar dari URL
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          favoriteList[index]['title']!,
                          style:const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
