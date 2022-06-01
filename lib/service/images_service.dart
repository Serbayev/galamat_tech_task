import 'dart:convert';

import 'package:http/http.dart';

class ImagesService {
  final baseUrl =
      'https://api.unsplash.com/photos/?client_id=r_7tMSevSzhxAuNeynIFfkRYKQtkoLtmCARGQ06C-R8';

  Future<List<dynamic>> fetchImages(int page) async {
    try {
      final response = await get(Uri.parse("$baseUrl&?per_page=30&page=$page"));
      return jsonDecode(response.body) as List<dynamic>;
    } catch (error) {
      return [];
    }
  }
}
