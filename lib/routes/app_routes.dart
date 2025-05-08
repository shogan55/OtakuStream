import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/app_bindings.dart';
import '../models/api/anime_model.dart';

import '../ui/splash/splash_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/details/details_screen.dart';
import '../ui/details/details_controller.dart';
import '../ui/watchlist/watchlist_screen.dart';
import '../ui/search/search_screen.dart';
import '../ui/genre/genre_screen.dart';
import '../ui/settings/settings_screen.dart';
import '../ui/about/about_screen.dart';
import '../ui/authentication/login_screen.dart';
import '../ui/authentication/signup_screen.dart';
import '../ui/player/player_screen.dart';
import '../ui/player/player_controller.dart';
import '../ui/profile/profile.dart';

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
  static const String profile = '/profile'; // ✅ Profile route added

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen(), binding: AppBindings()),
    GetPage(name: home, page: () => HomeScreen(), binding: AppBindings()),
    GetPage(
      name: details,
      page: () => const DetailsScreen(),
      binding: BindingsBuilder(() {
        final anime = Get.arguments as Anime;
        Get.lazyPut(() => DetailsController(anime));
      }),
      transition: Transition.fadeIn,
      curve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 300),
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
    GetPage(name: genre, page: () => GenreScreen(), binding: AppBindings()),
    GetPage(
      name: settings,
      page: () => SettingsScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: about,
      page: () => const AboutScreen(),
      binding: AppBindings(),
    ),
    GetPage(name: login, page: () => LoginScreen(), binding: AppBindings()),
    GetPage(name: signup, page: () => SignupScreen(), binding: AppBindings()),

    GetPage(
      name: player,
      page: () {
        final url = Get.arguments as String;
        Get.put(PlayerController(url: url), tag: url);
        return const PlayerScreen();
      },
    ),

    GetPage(name: profile, page: () => ProfileScreen(), binding: AppBindings()),
  ];
}
