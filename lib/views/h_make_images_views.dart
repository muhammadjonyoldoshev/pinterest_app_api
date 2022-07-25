import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:printerest_app/models/single_photo_model.dart';
import 'package:printerest_app/views/h_shimmer_views.dart';

class HMakeImages extends StatelessWidget {
  final SinglePhotoModel singlePhoto;

  const HMakeImages({
    Key? key,
    required this.singlePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ekranga chiqar');
    return AspectRatio(
      aspectRatio: (singlePhoto.width ?? 16) / (singlePhoto.height ?? 9),
      child: singlePhoto.urls?.regular != null? CachedNetworkImage(
        imageUrl: singlePhoto.urls!.smallS3!,
        progressIndicatorBuilder: (context, url, downloadProgress) => const HMakeShimmer(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ): Container(),
    );
  }
}
