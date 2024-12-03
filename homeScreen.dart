import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Screen/comment_Screen.dart';
import 'dart:convert';
import '../Models/FetchPostModel.dart';
import '../Models/GetImagesModel.dart';
import '../services/api.dart';
import '../services/exception.dart'; // Ensure your model is correctly imported

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static List<String> people = [
    "Gulshan", "Amit", "Sanjay", "Abhinav", "Vikrant", "Syam", "gtyu",
  ];

  List<int> favoriteCounts = List.filled(100, 3);
  List<bool> isFavorited = List.filled(100, false);
  List<int> commentsCounts = List.filled(100, 3);
  List<bool> isComments = List.filled(100, false);

  GetImagesModel? fetchPostModelsFuture;
  final Api api = Api();

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  int currentPage = 1;

  Future<void> fetchImages() async {
    try {
      final model = await api.getImages(page: currentPage);
      if (model != null) {
        setState(() {
          fetchPostModelsFuture = model;
        });
      }
    } on FetchDataException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Instagram",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Badge.count(
                    count: 20,
                    child: Icon(Icons.notifications, size: 32),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.message, size: 31),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            // Horizontal list of people
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: people.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          people[index],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Display fetched posts if available
            fetchPostModelsFuture == null
                ? Center(
              child: Text("No Post Found"),
            )
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: fetchPostModelsFuture!.hits!.length,
              itemBuilder: (BuildContext context, int index) {
                final post = fetchPostModelsFuture!.hits![index];
                return Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Post user details
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              height: 25,
                              width: 25,
                              post.webformatURL!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(post.user.toString()),
                        ],
                      ),

                      SizedBox(height: 5),

                      // Post image
                      Container(
                        color: Colors.black,
                        child: Image.network(post.webformatURL!),
                      ),

                      // Actions (like, comment)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorited[index] =
                                !isFavorited[index];
                                if (isFavorited[index]) {
                                  favoriteCounts[index]++;
                                } else {
                                  favoriteCounts[index]--;
                                }
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFavorited[index]
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                          Text('${post.likes}'),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommentScreen()),
                              );
                              setState(() {
                                isComments[index] = !isComments[index];
                              });
                            },
                            icon: Icon(
                              Icons.comment,
                            ),
                          ),
                          Text('${post.comments}'),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
