import 'package:get/get.dart';
import '../ui/splash/splash_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/details/details_screen.dart';
import '../ui/watchlist/watchlist_screen.dart';
import '../ui/search/search_screen.dart';
import '../ui/genre/genre_screen.dart';
import '../ui/settings/settings_screen.dart';
import '../ui/about/about_screen.dart';
import '../ui/authentication/login_screen.dart';
import '../ui/authentication/signup_screen.dart';
import '../ui/player/player_screen.dart';
import '../bindings/app_bindings.dart'; // ✅ Import Bindings

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String details = '/details';
  static const String watchlist = '/watchlist';
  static const String search = '/search';
  static const String genre = '/genre';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String player = '/player';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: AppBindings(),
    ),
    GetPage(name: home, page: () => HomeScreen(), binding: AppBindings()),
    GetPage(
      name: details,
      page: () => DetailsScreen(),
      binding: AppBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: watchlist,
      page: () => const WatchlistScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: search,
      page: () => const SearchScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: genre,
      page: () => const GenreScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: settings,
      page: () => const SettingsScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: about,
      page: () => const AboutScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: player,
      page: () => PlayerScreen(),
      binding: AppBindings(),
      transition: Transition.rightToLeft,
    ),
  ];
}
