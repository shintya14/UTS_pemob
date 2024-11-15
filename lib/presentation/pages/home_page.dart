import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  HomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('e-Distribusi Agent'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section with welcome text
            const Text(
              'Selamat Datang di e-Distribusi Agent!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Statistics overview
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard('Pesanan Baru', '10', Colors.blue),
                _buildStatCard('Pesanan Selesai', '120', Colors.green),
                _buildStatCard('Stok Rendah', '5', Colors.red),
              ],
            ),
            const SizedBox(height: 24),

            // Notification section
            const Text(
              'Notifikasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildNotificationItem(
                      'Pesanan 7 akan dikirim dalam 2 jam'),
                       _buildNotificationItem(
                      'Pesanan 3 akan dikirim dalam 3 jam'),
                  _buildNotificationItem('Stok produk Topi rendah, sisa 5 unit'),
                  _buildNotificationItem(
                      'Pesanan 120 berhasil dikirim ke pelanggan'),
                ],
              ),
            ),

            // Navigation buttons
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton(context, 'Pesanan', Icons.list, '/orders'),
                _buildNavButton(context, 'Inventaris', Icons.inventory, '/inventory'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build statistic cards
  Widget _buildStatCard(String title, String count, Color color) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 100,
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build notification items
  Widget _buildNotificationItem(String message) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.notifications, color: Colors.orange),
        title: Text(message),
      ),
    );
  }

  // Helper to build navigation buttons
  Widget _buildNavButton(
      BuildContext context, String label, IconData icon, String route) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    );
  }
}
