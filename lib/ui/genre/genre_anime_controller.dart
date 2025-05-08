import 'package:get/get.dart';
import '../../models/api/anime_model.dart';
import '../../services/api_service.dart';

class GenreAnimeController extends GetxController {
  final String genre;
  GenreAnimeController(this.genre);

  var animeList = <Anime>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAnimeByGenre();
  }

  void fetchAnimeByGenre() async {
    try {
      isLoading.value = true;

      final String query = '''
      query {
        Page(perPage: 20) {
          media(genre: "$genre", type: ANIME, sort: POPULARITY_DESC) {
            id
            title { userPreferred }
            coverImage { extraLarge medium }
            averageScore
            genres
            trailer { id }
          }
        }
      }
      ''';

      final data = await ApiService.fetchAnimeData(query);
      animeList.value = data;
    } catch (e) {
      print("❌ Error fetching anime for genre $genre: $e");
      animeList.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
