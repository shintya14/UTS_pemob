import 'package:flutter/material.dart';
import 'presentation/pages/inventory_page.dart';
import 'presentation/pages/orders_page.dart';
import 'presentation/pages/home_page.dart';
import 'core/navigation/navigation_service.dart';
import 'presentation/controllers/home_controller.dart';
import 'domain/usecases/navigate_to_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize services and controllers
    final navigationService = NavigationService();
    final navigateToPageUseCase = NavigateToPageUseCase(navigationService);
    final homeController = HomeController(navigateToPageUseCase);

    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey, // Use global navigator key
      title: 'e-distribusi',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(homeController),
        '/orders': (context) => OrdersPage(homeController), // Mengirimkan homeController
        '/inventory': (context) => InventoryPage(homeController), // Menggunakan huruf kecil
      },
    );
  }
}
