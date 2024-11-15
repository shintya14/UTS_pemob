import 'package:e_distribusi/presentation/controllers/home_controller.dart';
import 'package:e_distribusi/presentation/pages/base_page.dart';
import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  final HomeController controller;

  InventoryPage(this.controller, {super.key});
  // Data inventory
  final List<Map<String, dynamic>> inventory = [
    {'name': 'Produk Sepatu', 'stock': 50, 'minimumStock': 20},
    {'name': 'Produk Sandal', 'stock': 15, 'minimumStock': 20},
    {'name': 'Produk Jacket', 'stock': 30, 'minimumStock': 10},
    {'name': 'Produk Topi', 'stock': 5, 'minimumStock': 10},
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: ListView.builder(
        itemCount: inventory.length,
        itemBuilder: (context, index) {
          final item = inventory[index];
          final isLowStock = item['stock'] < item['minimumStock'];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(item['name']),
              subtitle: Text('Stok: ${item['stock']}'),
              trailing: isLowStock
                  ? Text(
                      'Stok Rendah',
                      style: const TextStyle(color: Colors.red),
                    )
                  : const Icon(Icons.check_circle, color: Colors.green),
            ),
          );
        },
      ),
      selectedIndex: 2,
      controller: controller,
    );
  }
}
