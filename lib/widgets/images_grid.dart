import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:galamat_tech_task/bloc/images_cubit.dart';
import 'package:galamat_tech_task/widgets/image_element.dart';
import 'package:galamat_tech_task/models/fetched_images_model.dart';

class ImagesGrid extends StatefulWidget {
  const ImagesGrid({Key? key}) : super(key: key);

  @override
  State<ImagesGrid> createState() => _ImagesGridState();
}

class _ImagesGridState extends State<ImagesGrid> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(scrollListen);
    super.initState();
  }

  void scrollListen() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels != 0) {
        context.read<ImagesCubit>().loadImages();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ImagesCubit>(context).loadImages();
    return BlocBuilder<ImagesCubit, ImagesState>(
      builder: (context, state) {
        if (state is ImagesLoadingState && state.isFirstFetched) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<FetchedImagesModel> images = [];
        if (state is ImagesLoadingState) {
          images = state.loadedImages;
        }
        if (state is ImagesLoadedState) {
          images = state.images;
        }
        return MasonryGridView.count(
            controller: scrollController,
            padding: const EdgeInsets.all(10),
            crossAxisCount: 3,
            itemCount: images.length,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemBuilder: (context, i) => ImageElement(
                  image: images[i].url,
                  id: images[i].id,
                ));
      },
    );
  }
}
