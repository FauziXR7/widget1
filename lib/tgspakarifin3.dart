import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penilaian Siswa',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: PenilaianSiswa(
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

class PenilaianSiswa extends StatefulWidget {
  final VoidCallback toggleTheme;

  PenilaianSiswa({required this.toggleTheme});

  @override
  _PenilaianSiswaState createState() => _PenilaianSiswaState();
}

class _PenilaianSiswaState extends State<PenilaianSiswa> {
  final _controller = TextEditingController();
  String _hasil = '';
  List<int> _nilaiSiswa = [];

  void _tambahNilai() {
    final input = _controller.text;
    final nilai = int.tryParse(input);

    if (nilai == null || nilai < 0 || nilai > 100) {
      setState(() {
        _hasil = 'Masukkan nilai yang valid (0-100)';
      });
    } else {
      setState(() {
        _nilaiSiswa.add(nilai);
        _controller.clear();
        _hasil =
            'Nilai $nilai berhasil ditambahkan. Total nilai yang dimasukkan: ${_nilaiSiswa.length}';
      });
    }
  }

  void _kategoriNilaiTerakhir() {
    if (_nilaiSiswa.isEmpty) {
      setState(() {
        _hasil = 'Belum ada nilai yang dimasukkan.';
      });
      return;
    }

    int nilaiTerakhir = _nilaiSiswa.last;
    String kategori;

    if (nilaiTerakhir >= 85) {
      kategori = 'A';
    } else if (nilaiTerakhir >= 70) {
      kategori = 'B';
    } else if (nilaiTerakhir >= 55) {
      kategori = 'C';
    } else {
      kategori = 'D';
    }

    setState(() {
      _hasil = 'Nilai $nilaiTerakhir masuk kategori: $kategori';
    });
  }

  void _hitungRataRata() {
    if (_nilaiSiswa.isEmpty) {
      setState(() {
        _hasil = 'Belum ada nilai yang diinput untuk menghitung rata-rata.';
      });
      return;
    }

    double rataRata = _nilaiSiswa.reduce((a, b) => a + b) / _nilaiSiswa.length;
    String kategori;

    if (rataRata >= 85) {
      kategori = 'A';
    } else if (rataRata >= 70) {
      kategori = 'B';
    } else if (rataRata >= 55) {
      kategori = 'C';
    } else {
      kategori = 'D';
    }

    setState(() {
      _hasil =
          'Rata-rata nilai: ${rataRata.toStringAsFixed(2)}, Kategori: $kategori';
    });
  }

  void _clearNilai() {
    setState(() {
      _nilaiSiswa.clear();
      _hasil = 'Semua nilai telah dihapus';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penilaian Siswa'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan nilai siswa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _tambahNilai,
                  child: Text('Tambah Nilai'),
                ),
                //ElevatedButton(
                //onPressed: _kategoriNilaiTerakhir,
                //child: Text('Kategori Nilai Terakhir'),
                //),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _hitungRataRata,
                  child: Text('Rata-rata & kategori akhir'),
                ),
                ElevatedButton(
                  onPressed: _clearNilai,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text('Clear Nilai'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              _hasil,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            if (_nilaiSiswa.isNotEmpty)
              Text(
                'Nilai yang diinput: ${_nilaiSiswa.join(', ')}',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
