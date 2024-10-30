import 'package:flutter/material.dart';

class Tugaspakarifin extends StatelessWidget {
  const Tugaspakarifin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Berita hari ini',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Main News Container
            Container(
              color: Color.fromARGB(255, 64, 214, 251),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://img.idxchannel.com/images/idx/2024/09/03/paus_fransiskus_tiba_di_Indonesia.jpg',
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Pemimpin tertinggi Gereja Katolik, Paus Fransiskus, mendarat di Indonesia via Bandara Soekarno-Hatta',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Trending',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // News List Section
            Column(
              children: [
                ListTile(
                  leading: Image.network(
                    'https://img.idxchannel.com/images/idx/2023/11/23/IHSG.jpg',
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: const Text(
                    'Indeks Harga Saham Gabungan (IHSG) berbalik arah atau tercatat turun 0,73 persen atau 56,29 poin ke level 7.638 pada penutupan perdagangan sesi pertama',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Selasa (3/9/2024).'),
                ),
                const Divider(),
                ListTile(
                  leading: Image.network(
                    'https://img.idxchannel.com/images/idx/2024/01/12/gaji_karyawan.jpg',
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: const Text(
                    'Pemerintah tengah menyiapkan program pensiun tambahan bagi para pekerja. Hal ini demi meningkatkan replacement ratio alias rasio pendapatan saat pensiun dibandingkan dengan gaji yang diterima saat bekerja.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Selasa (3/9/2024).'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
