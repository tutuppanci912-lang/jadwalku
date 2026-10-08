import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      // Tambahkan AppBar dengan tombol logout di pojok kanan atas
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFF172B4D)),
            tooltip: 'Logout',
            onPressed: () {
              // Navigasi kembali ke halaman Login dan menghapus riwayat tumpukan halaman
              Navigator.pushNamedAndRemoveUntil(
                context, 
                '/', 
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'JADWALKU',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                  color: Color(0xFF42526E),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Minggu, 17 November',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF172B4D),
                ),
              ),
              const Text(
                'Minggu ke-8 masa pelajaran',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Text(
                'SENIN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              _buildTimeSlot(
                time: '7:30 - 9:00',
                badgeNumber: '1',
                items: [
                  {'title': 'AGAMA', 'color': const Color(0xFF4A7BEC)},
                  {'title': 'MANDARIN', 'color': const Color(0xFF00B894)},
                  {'title': 'MATEMATIKA', 'color': const Color(0xFFFFA800)},
                ],
              ),
              const SizedBox(height: 16),
              _buildTimeSlot(
                time: '9:10 - 10:40',
                badgeNumber: '2',
                items: [
                  {'title': 'AGAMA', 'color': const Color(0xFF5B86E5)},
                  {'title': 'MANDARIN', 'color': const Color(0xFF00B894)},
                ],
              ),
              const SizedBox(height: 16),
              _buildTimeSlot(
                time: '10:50 - 12:20',
                items: [
                  {'title': 'PERPUSTAKAAN', 'color': const Color(0xFFFF7675)},
                  {'title': 'MATEMATIKA', 'color': const Color(0xFFFFA800)},
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'SELASA',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              _buildTimeSlot(
                time: '7:30 - 9:00',
                badgeNumber: '1',
                items: [
                  {'title': 'MATEMATIKA', 'color': const Color(0xFFFFA800)},
                ],
              ),
              const SizedBox(height: 30),
              // Opsi tambahan: Tombol Logout di bagian bawah halaman
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context, 
                    '/', 
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Keluar / Logout',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlot({
    required String time,
    String? badgeNumber,
    required List<Map<String, dynamic>> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            if (badgeNumber != null)
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  badgeNumber,
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        ...items.map((item) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: item['color'] as Color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  item['title'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}