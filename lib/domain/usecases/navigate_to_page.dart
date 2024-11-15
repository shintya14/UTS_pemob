import '../../core/navigation/navigation_service.dart';

class NavigateToPageUseCase {
  final NavigationService _navigationService;

  NavigateToPageUseCase(this._navigationService);

  void execute(int index) {
    switch (index) {
      case 0:
        _navigationService.navigateTo('/home');
        break;
      case 1:
        _navigationService.navigateTo('/orders');
        break;
      case 2:
        _navigationService.navigateTo('/inventory');
        break;
      default:
        throw Exception('Invalid page index');
    }
  }
}