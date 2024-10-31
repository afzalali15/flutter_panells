import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final int index;
  final double extent;
  const CollectionTile({
    super.key,
    required this.index,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: extent,
      child: Stack(
        children: [
          //Image 1
          Positioned(
            bottom: 0,
            left: 25,
            right: 25,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=img_1$index',
              ),
            ),
          ),
          //Image 2
          Positioned(
            bottom: 15,
            left: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 6,
                    spreadRadius: -6,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=img_2$index',
              ),
            ),
          ),
          //Image 3
          Positioned.fill(
            bottom: 30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 8,
                    spreadRadius: -6,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=img_3$index',
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Star icon
          Positioned(
            bottom: 35,
            right: 5,
            child: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
