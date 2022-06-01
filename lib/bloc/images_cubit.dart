import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:galamat_tech_task/models/fetched_images_model.dart';
import 'package:galamat_tech_task/repository/images_repository.dart';


part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit(this.repository) : super(ImagesInitialState());
  int page = 1;
  final ImagesRepository repository;

  void loadImages() {
    if (state is ImagesLoadingState) return;
    final currentState = state;
    List<FetchedImagesModel> loadedImages = [];
    if (currentState is ImagesLoadedState) {
      loadedImages = currentState.images;
    }

    emit(ImagesLoadingState(loadedImages, isFirstFetched: page == 1));
    repository.fetchImages(page).then((newImages) {
      page++;
      final images = (state as ImagesLoadingState).loadedImages;
      images.addAll(newImages);
      emit(ImagesLoadedState(images));
    });
  }
}
