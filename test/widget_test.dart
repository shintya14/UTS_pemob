// widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_distribusi/main.dart';

void main() {
  testWidgets('App builds and navigates through pages', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Cek bahwa halaman awal adalah 'Home' (sesuaikan teks sesuai halaman utama di `BasePage`)
    expect(find.text('Home'), findsOneWidget);

    // Cek bahwa halaman Orders dapat diakses melalui BottomNavigationBar
    await tester.tap(find.byIcon(Icons.local_shipping));
    await tester.pumpAndSettle();
    expect(find.text('Orders'), findsOneWidget); // Pastikan teks 'Orders' muncul

    // Cek bahwa halaman Inventory dapat diakses
    await tester.tap(find.byIcon(Icons.inventory));
    await tester.pumpAndSettle();
    expect(find.text('Inventory'), findsOneWidget); // Pastikan teks 'Inventory' muncul

    // Cek bahwa halaman Profile dapat diakses
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget); // Pastikan teks 'Profile' muncul

    // Cek bahwa halaman Settings dapat diakses
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    expect(find.text('Settings'), findsOneWidget); // Pastikan teks 'Settings' muncul
  });
}
