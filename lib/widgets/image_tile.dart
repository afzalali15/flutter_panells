import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;
  final double extent;
  const ImageTile({
    super.key,
    required this.imageSource,
    required this.index,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageDetails(context, imageSource);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        height: extent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: imageSource,
              fit: BoxFit.cover,
            ),
            // Image.network(
            //   imageSource,
            //   fit: BoxFit.cover,
            // ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Art $index',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //change icon to filled heart
                        //manage state
                      },
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImageDetails(BuildContext context, String imageSource) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      clipBehavior: Clip.antiAlias,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: [
              //Image preview
              CachedNetworkImage(imageUrl: imageSource),
              //Title
              Text(
                'Image Title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //Download button
              MaterialButton(
                onPressed: () {},
                color: Colors.black,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Get Wallpaper',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              //Author details
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    //Image
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        //Thumbnail image
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(
                            imageUrl: 'https://picsum.photos/50/50',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        //Verified badge
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.check),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    //Name
                    Text(
                      'Samuel Elkins',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
