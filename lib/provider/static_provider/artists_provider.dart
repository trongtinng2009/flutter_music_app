import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/api_fetcher.dart';
import 'package:music_app/data/converter/artist_converter.dart';
import 'package:music_app/data/converter/data_converter.dart';
import 'package:music_app/model/artist.dart';

final artistsProvider = FutureProvider((ref) async {
  DataConverter data = ArtistConverter();
  final results = await data.convertListData(ApiFetcher.fetchData(
      'v1/artists?ids=6YVMFz59CuY7ngCxTxjpxE%2C36cgvBn0aadzOijnjjwqMN%2C6HvZYsbFfjnjFrWF950C9d%2C6RHTUrRF63xao58xh9FXYJ%2C4SpbR6yFEvexJuaBpgAU5p'));
  return results as List<Artist>;
});
