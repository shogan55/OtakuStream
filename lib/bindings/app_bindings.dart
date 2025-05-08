import 'package:get/get.dart';
import '../ui/splash/splash_controller.dart';
import '../ui/home/home_controller.dart';
import '../ui/watchlist/watchlist_controller.dart';
import '../ui/authentication/auth_controller.dart';
import '../ui/about/about_controller.dart';
import '../ui/search/search_controller.dart';
import '../ui/settings/settings_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => WatchlistController(), fenix: true);
    Get.lazyPut(() => SearchAnimeController(), fenix: true);
    Get.lazyPut(() => SettingsController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => AboutController(), fenix: true);
  }
}
