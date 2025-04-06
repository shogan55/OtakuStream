import 'package:get/get.dart';
import 'package:otakustream/ui/settings/settings_controller.dart';
import '../ui/splash/splash_controller.dart';
import '../ui/home/home_controller.dart';
import 'package:otakustream/ui/details/details_controller.dart';
import '../ui/watchlist/watchlist_controller.dart';
import '../ui/authentication/auth_controller.dart';
import '../ui/player/player_controller.dart';
import '../ui/about/about_controller.dart';
import '../ui/search/search_controller.dart';

/// ✅ **Application-wide Bindings**
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // ✅ Lazy initialize all controllers
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<DetailsController>(() => DetailsController(), fenix: true);
    Get.lazyPut<WatchlistController>(() => WatchlistController(), fenix: true);
    Get.lazyPut<SearchAnimeController>(
      () => SearchAnimeController(),
      fenix: true,
    );
    Get.lazyPut<PlayerController>(() => PlayerController(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
  }
}
