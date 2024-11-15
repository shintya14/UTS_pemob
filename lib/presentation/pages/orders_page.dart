import 'package:e_distribusi/presentation/controllers/home_controller.dart';
import 'package:e_distribusi/presentation/pages/base_page.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  final HomeController controller;

  OrdersPage(this.controller, {super.key});

  final List<Map<String, dynamic>> orders = [
    {'id': 1, 'status': 'Dalam Proses', 'total': 150.0},
    {'id': 2, 'status': 'Dikirim', 'total': 200.0},
    {'id': 3, 'status': 'Selesai', 'total': 350.0},
    {'id': 4, 'status': 'Dalam Proses', 'total': 125.0},
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Order ${order['id']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status: ${order['status']}'),
                  Text('Total: \Rp${order['total'].toStringAsFixed(2)}'),
                ],
              ),
              trailing: Icon(
                _getStatusIcon(order['status']),
                color: _getStatusColor(order['status']),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailPage(order: order),
                  ),
                );
              },
            ),
          );
        },
      ),
      selectedIndex: 1,
      controller: controller, 
    );
  }

  // Helper to get status icon
  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Dalam Proses':
        return Icons.hourglass_top;
      case 'Dikirim':
        return Icons.local_shipping;
      case 'Selesai':
        return Icons.check_circle;
      default:
        return Icons.error;
    }
  }

  // Helper to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Dalam Proses':
        return Colors.orange;
      case 'Dikirim':
        return Colors.blue;
      case 'Selesai':
        return Colors.green;
      default:
        return Colors.red;
    }
  }
}

class OrderDetailPage extends StatelessWidget {
  final Map<String, dynamic> order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Order #${order['id']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID Order: ${order['id']}', style: TextStyle(fontSize: 18)),
            Text('Status: ${order['status']}', style: TextStyle(fontSize: 18)),
            Text('Total: \Rp ${order['total'].toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
