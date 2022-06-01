import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:galamat_tech_task/widgets/default_layout.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageView extends StatelessWidget {
  final String image;

  const ImageView({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Photo view',
      child: PhotoViewGallery.builder(
          itemCount: 1,
          builder: (context, i) {
            return PhotoViewGalleryPageOptions(
                maxScale: PhotoViewComputedScale.contained * 6,
                minScale: PhotoViewComputedScale.contained * 0.9,
                imageProvider: CachedNetworkImageProvider(image),
                initialScale: PhotoViewComputedScale.contained * 0.9,
                heroAttributes: PhotoViewHeroAttributes(tag: image));
          }),
    );
  }
}
