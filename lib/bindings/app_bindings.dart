import 'package:get/get.dart';
import '../ui/splash/splash_controller.dart';
import '../ui/home/home_controller.dart';
import '../ui/details/details_controller.dart';
import '../ui/watchlist/watchlist_controller.dart';
import '../ui/search/search_controller.dart';
import '../ui/authentication/auth_controller.dart';
import '../ui/player/player_controller.dart';

/// ✅ **Application-wide Bindings**
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // ✅ Lazy initialize all controllers
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<WatchlistController>(() => WatchlistController(), fenix: true);

    Get.lazyPut<PlayerController>(() => PlayerController(), fenix: true);
  }
}
//