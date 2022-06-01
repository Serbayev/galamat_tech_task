import 'package:galamat_tech_task/models/fetched_images_model.dart';
import 'package:galamat_tech_task/service/images_service.dart';

class ImagesRepository {
  final ImagesService service;

  ImagesRepository(this.service);

  Future<List<FetchedImagesModel>> fetchImages(int page) async {
    final images = await service.fetchImages(page);
    final List<FetchedImagesModel> fetchedImages = [
      for (var i in images)
        FetchedImagesModel(
          url: i["urls"]["regular"],
          id: i["id"],
        ),
    ];
    return fetchedImages;
  }
}
