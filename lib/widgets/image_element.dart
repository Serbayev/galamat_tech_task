import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:galamat_tech_task/pages/image_view.dart';

class ImageElement extends StatelessWidget {
  final String id;
  final String image;

  const ImageElement({
    Key? key,
    required this.id,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ImageView(image: image),
        ),
      ),
      child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 0),
                blurRadius: 1)
          ]),
          child: Hero(
              tag: id,
              child: CachedNetworkImage(
                imageUrl: image,
              ))),
    );
  }
}
