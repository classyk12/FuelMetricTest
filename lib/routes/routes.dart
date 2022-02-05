import 'package:fuelmetrics_flutter_project/screens/add_driver_screen.dart';
import 'package:fuelmetrics_flutter_project/screens/dashboard_screen.dart';
import 'package:fuelmetrics_flutter_project/screens/driver_detail_screen.dart';
import 'package:fuelmetrics_flutter_project/screens/login_screen.dart';
import 'package:fuelmetrics_flutter_project/screens/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> routeConstants() {
  var routes = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/dashboard', page: () => DashboardScreen()),
    GetPage(name: '/driver-details', page: () => DriverDetailScreen()),
    GetPage(name: '/addDriver', page: () => AddDriverScreen())
  ];

  return routes;
}
