import 'dart:math';

import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  PostItemState createState() => PostItemState();
}

class PostItemState extends State<PostItem> {
  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa2tbCr7gezhFKEnWHBogLgawwdLXF8-vosA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK0IS7rxVYqDHm1a___wZLArB7ld5LHWmOXA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgW7xqbvhpV8Siyy8ytEzwTuCnNBfYC03xKQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKMVyeldDaPI_3jvWk4qcryRJWUB60PCIdBw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1rQbRDR8lndYo14gTs_X-aR6MnTLNeARrD-44qlHhu-luAGlnuSMBO1dOdmzfjHrrfZU&usqp=CAU',
  ];

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
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white10,
        child: Image.network(
          images[Random().nextInt(5)],
          fit: BoxFit.contain,
        ),
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
              const Text('indic'),
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