import 'package:doantotnghiep/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tin tức',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _articles[index];
              return Container(
                height: 136,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text("${item.author} · ${item.postedOn}",
                            style: Theme.of(context).textTheme.caption),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icons.bookmark_border_rounded,
                            Icons.share,
                            Icons.more_vert
                          ].map((e) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(e, size: 16),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    )),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.imageUrl),
                            ))),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String author;
  final String postedOn;

  Article(
      {required this.title,
      required this.imageUrl,
      required this.author,
      required this.postedOn});
}

final List<Article> _articles = [
  Article(
    title:
        "Chứng khoán có phiên tăng vọt, vì sao vẫn khó hi vọng phục hồi mạnh?",
    author: "BÌNH KHÁNH",
    imageUrl: "",
    postedOn: "Hôm nay",
  ),
  // Article(
  //     title: "Google Search dark theme goes fully black for some on the web",
  //     imageUrl: "https://picsum.photos/id/1010/960/540",
  //     author: "9to5Google",
  //     postedOn: "4 hours ago"),
  // Article(
  //   title: "Check your iPhone now: warning signs someone is spying on you",
  //   author: "New York Times",
  //   imageUrl: "https://picsum.photos/id/1001/960/540",
  //   postedOn: "2 days ago",
  // ),
  // Article(
  //   title:
  //       "Amazon’s incredibly popular Lost Ark MMO is ‘at capacity’ in central Europe",
  //   author: "MacRumors",
  //   imageUrl: "https://picsum.photos/id/1002/960/540",
  //   postedOn: "22 hours ago",
  // ),
  // Article(
  //   title:
  //       "Panasonic's 25-megapixel GH6 is the highest resolution Micro Four Thirds camera yet",
  //   author: "Polygon",
  //   imageUrl: "https://picsum.photos/id/1020/960/540",
  //   postedOn: "2 hours ago",
  // ),
  // Article(
  //   title: "Samsung Galaxy S22 Ultra charges strangely slowly",
  //   author: "TechRadar",
  //   imageUrl: "https://picsum.photos/id/1021/960/540",
  //   postedOn: "10 days ago",
  // ),
  // Article(
  //   title: "Snapchat unveils real-time location sharing",
  //   author: "Fox Business",
  //   imageUrl: "https://picsum.photos/id/1060/960/540",
  //   postedOn: "10 hours ago",
  // ),
];
