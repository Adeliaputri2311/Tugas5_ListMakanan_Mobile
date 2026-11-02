
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'makanan.dart';
import 'detail_makanan.dart';

void main() {
  runApp(const MyApp());
}

// ================= DATA MAKANAN =================

final List<Makanan> daftarMakanan = [
  Makanan(
    gambar:
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=600',
    nama: 'Nasi Goreng',
    harga: 18000,
    deskripsi:
        'Nasi goreng spesial dengan telur, ayam, sayuran, dan bumbu pilihan yang lezat.',
  ),
  Makanan(
    gambar:
        'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=600',
    nama: 'Ayam Geprek',
    harga: 15000,
    deskripsi:
        'Ayam crispy dengan sambal geprek pedas dan nasi hangat yang menggugah selera.',
  ),
  Makanan(
    gambar:
        'https://images.unsplash.com/photo-1555126634-323283e090fa?w=600',
    nama: 'Mie Goreng',
    harga: 13000,
    deskripsi:
        'Mie goreng dengan sayuran segar, telur, dan bumbu khas yang nikmat.',
  ),
  Makanan(
    gambar:
        'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600',
    nama: 'Seblak',
    harga: 20000,
    deskripsi:
        'Seblak pedas dengan kerupuk, bakso, sosis, telur, dan kuah kencur.',
  ),
  Makanan(
  gambar:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMOCX73ahY_751gJUiFC1UqtrHcTg41FSyZzxvuXQzYot_4dvlM52nnZc&s=10',
  nama: 'Bakso',
  harga: 17000,
  deskripsi:
      'Bakso sapi kenyal dengan kuah kaldu gurih, mie, dan sayuran segar.',
),
  Makanan(
    gambar:
        'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=600',
    nama: 'Sate Ayam',
    harga: 22000,
    deskripsi:
        'Sate ayam bakar dengan bumbu kacang khas dan lontong yang lezat.',
  ),
  Makanan(
    gambar:
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=600',
    nama: 'Pizza',
    harga: 35000,
    deskripsi:
        'Pizza dengan topping keju, saus tomat, dan berbagai pilihan topping.',
  ),
  Makanan(
    gambar:
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600',
    nama: 'Burger',
    harga: 25000,
    deskripsi:
        'Burger dengan daging juicy, selada segar, keju, dan saus spesial.',
  ),
];

// ================= APLIKASI UTAMA =================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodList',
      theme: ThemeData(
        primaryColor: const Color(0xFFE91E63),
        scaffoldBackgroundColor: const Color(0xFFFFF5F8),
        fontFamily: 'Roboto',
      ),
      home: const HalamanMakanan(),
    );
  }
}

// ================= HALAMAN UTAMA =================

class HalamanMakanan extends StatelessWidget {
  const HalamanMakanan({super.key});

  String formatRupiah(int harga) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(harga);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
              decoration: const BoxDecoration(
                color: Color(0xFFE91E63),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Row(
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'FoodList',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Temukan Makanan Favoritmu!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    'Pilihan makanan lezat untuk menemani harimu.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // SEARCH BAR
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Color(0xFFE91E63),
                        ),
                        hintText: 'Cari makanan favorit...',
                        hintStyle: TextStyle(fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // JUDUL MENU
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
              child: Row(
                children: [
                  const Text(
                    'Menu Makanan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    '${daftarMakanan.length} Menu',
                    style: const TextStyle(
                      color: Color(0xFFE91E63),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // GRID MAKANAN
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                itemCount: daftarMakanan.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.70,
                ),

                itemBuilder: (context, index) {
                  final makanan = daftarMakanan[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailMakanan(makanan: makanan),
                        ),
                      );
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.10),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // GAMBAR MAKANAN
                          Expanded(
                            flex: 6,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.vertical(
                                top: Radius.circular(18),
                              ),
                              child: Image.network(
                                makanan.gambar,
                                width: double.infinity,
                                fit: BoxFit.cover,

                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.pink.shade50,
                                    child: const Center(
                                      child: Icon(
                                        Icons.restaurant,
                                        size: 45,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  );
                                },

                                loadingBuilder:
                                    (context, child, progress) {
                                  if (progress == null) {
                                    return child;
                                  }

                                  return const Center(
                                    child:
                                        CircularProgressIndicator(
                                      color: Color(0xFFE91E63),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          // INFORMASI MAKANAN
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    makanan.nama,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color(0xFF333333),
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    makanan.deskripsi,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),

                                  const Spacer(),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          formatRupiah(makanan.harga),
                                          maxLines: 1,
                                          style: const TextStyle(
                                            color: Color(0xFFE91E63),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),

                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFFE91E63),
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
