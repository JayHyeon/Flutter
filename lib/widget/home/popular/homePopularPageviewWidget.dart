import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePopularPageviewWidget extends StatefulWidget {
  const HomePopularPageviewWidget({Key? key}) : super(key: key);

  @override
  HomePopularPageviewWidgetState createState() =>
      HomePopularPageviewWidgetState();
}

class HomePopularPageviewWidgetState extends State<HomePopularPageviewWidget> {
  PageController pageController = PageController();
  late int currentPageIndex;

  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa2tbCr7gezhFKEnWHBogLgawwdLXF8-vosA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK0IS7rxVYqDHm1a___wZLArB7ld5LHWmOXA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgW7xqbvhpV8Siyy8ytEzwTuCnNBfYC03xKQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKMVyeldDaPI_3jvWk4qcryRJWUB60PCIdBw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1rQbRDR8lndYo14gTs_X-aR6MnTLNeARrD-44qlHhu-luAGlnuSMBO1dOdmzfjHrrfZU&usqp=CAU',
  ];

  @override
  void initState() {
    currentPageIndex = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 7 / 2,
      child: Stack(
        children: [
          PageView.builder(
            itemBuilder: (BuildContext context, int index) {
              return CachedNetworkImage(
                imageUrl: images[index],
                imageBuilder: (context, imageProvider) => Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
            controller: pageController,
            itemCount: images.length,
            onPageChanged: (int value) {
              setState(() {
                currentPageIndex = value;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.only(right: 25, bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(500)),
              child: Text(
                '${currentPageIndex + 1}/${images.length} +',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
