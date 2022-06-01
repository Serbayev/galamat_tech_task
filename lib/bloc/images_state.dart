part of 'images_cubit.dart';

@immutable
abstract class ImagesState {}

class ImagesInitialState extends ImagesState {}

class ImagesLoadedState extends ImagesState {
  final List<FetchedImagesModel> images;

  ImagesLoadedState(this.images);
}

class ImagesLoadingState extends ImagesState {
  final List<FetchedImagesModel> loadedImages;
  final bool isFirstFetched;

  ImagesLoadingState(
    this.loadedImages, {
    this.isFirstFetched = false,
  });
}
