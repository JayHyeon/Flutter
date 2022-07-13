import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  PostItemState createState() => PostItemState();
}

class PostItemState extends State<PostItem> {
  late int pageLength;
  late int currentPageIndex;
  late double initRatio;

  PageController mController = PageController();

  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa2tbCr7gezhFKEnWHBogLgawwdLXF8-vosA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK0IS7rxVYqDHm1a___wZLArB7ld5LHWmOXA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgW7xqbvhpV8Siyy8ytEzwTuCnNBfYC03xKQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKMVyeldDaPI_3jvWk4qcryRJWUB60PCIdBw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1rQbRDR8lndYo14gTs_X-aR6MnTLNeARrD-44qlHhu-luAGlnuSMBO1dOdmzfjHrrfZU&usqp=CAU',
  ];

  List range = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  @override
  void initState() {
    pageLength = 1 + Random().nextInt(5);
    currentPageIndex = 0;
    initRatio = range[Random().nextInt(16)] * 0.1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.white10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      'https://www.woolha.com/media/2020/03/eevee.png'),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('100sucoding'),
              ],
            ),
            const Icon(Icons.subject),
          ],
        ),
      ),
      AspectRatio(
        aspectRatio: initRatio,
        child: Stack(children: [
          PageView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                images[Random().nextInt(5)],
                fit: BoxFit.cover,
              );
            },
            controller: mController,
            itemCount: pageLength,
            onPageChanged: (int value) {
              setState(() {
                currentPageIndex = value;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ScrollingPageIndicator(
                  dotColor: Colors.grey,
                  dotSelectedColor: Colors.deepPurple,
                  dotSize: 8,
                  dotSelectedSize: 10,
                  dotSpacing: 12,
                  controller: mController,
                  itemCount: pageLength,
                  orientation: Axis.horizontal),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(500)),
              child: Text(
                '${currentPageIndex + 1}/$pageLength',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
      ),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite_border),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(Icons.chat_outlined),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(Icons.send),
                ],
              ),
              const Icon(Icons.bookmark_border)
            ],
          )),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white10,
          child: Row(
            children: const [
              Text('좋아요'),
              SizedBox(width: 6),
              Text('100개'),
            ],
          )),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white10,
          child: const Text(
              "CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT CONTENT ")),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white10,
          child: Row(
            children: const [
              Text(
                '댓글 ',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                '9개',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                ' 모두 보기',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white10,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text('id', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 6,
                      ),
                      Text('content')
                    ],
                  ),
                  const Icon(Icons.favorite_outline, size: 12)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text('id2',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 6,
                      ),
                      Text('content2')
                    ],
                  ),
                  const Icon(Icons.favorite_outline, size: 12)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text('id3',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 6,
                      ),
                      Text('content3')
                    ],
                  ),
                  const Icon(Icons.favorite, color: Colors.red, size: 12)
                ],
              ),
            ],
          )),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                        'https://www.woolha.com/media/2020/03/eevee.png'),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text('댓글 달기...'),
                ],
              ),
              Row(children: const [
                Icon(Icons.favorite, color: Colors.redAccent, size: 12),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.alarm, color: Colors.yellowAccent, size: 12),
                SizedBox(
                  width: 8,
                ),
                Icon(Icons.add_circle_outline_outlined, size: 12)
              ])
            ],
          ))
    ]);
  }
}
