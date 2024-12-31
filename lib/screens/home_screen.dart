import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_app/widgets/category_chip.dart';
import 'package:test_app/widgets/continue_watching_item.dart';
import 'package:test_app/widgets/custom_row.dart';
import 'package:test_app/widgets/movie_poster.dart';
import 'package:test_app/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MovieAppHomeState createState() => _MovieAppHomeState();
}

class _MovieAppHomeState extends State<HomeScreen> {
  int _current = 0;
  String _selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    List<String> sliderImages = [
      'assets/banner.png',
      'assets/banner.png',
      'assets/banner.png',
    ];

    List<String> categories = ["All", "Action", "Anime", "Sci-fi", "Thriller"];
    Map<String, List<Map<String, String>>> categoryMovies = {
      "All": [
        {"title": "Soul Mate", "imagePath": "assets/soulmate.png"},
        {"title": "UB's Secret", "imagePath": "assets/ubs secret.png"},
        {"title": "Yes I Do", "imagePath": "assets/yes i do.png"},
      ],
      "Action": [
        {"title": "Soul Mate", "imagePath": "assets/soulmate.png"},
        {"title": "UB's Secret", "imagePath": "assets/ubs secret.png"},
        {"title": "Yes I Do", "imagePath": "assets/yes i do.png"},
      ],
      "Anime": [
        {"title": "Soul Mate", "imagePath": "assets/soulmate.png"},
        {"title": "UB's Secret", "imagePath": "assets/ubs secret.png"},
        {"title": "Yes I Do", "imagePath": "assets/yes i do.png"},
      ],
      "Sci-fi": [
        {"title": "Soul Mate", "imagePath": "assets/soulmate.png"},
        {"title": "UB's Secret", "imagePath": "assets/ubs secret.png"},
        {"title": "Yes I Do", "imagePath": "assets/yes i do.png"},
      ],
      "Thriller": [
        {"title": "Soul Mate", "imagePath": "assets/soulmate.png"},
        {"title": "UB's Secret", "imagePath": "assets/ubs secret.png"},
        {"title": "Yes I Do", "imagePath": "assets/yes i do.png"},
      ],
      "Recommended": [
        {"title": "Double Love", "imagePath": "assets/double love.png"},
        {"title": "Curse Of The River", "imagePath": "assets/curse river.png"},
        {"title": "Sunita", "imagePath": "assets/sunita.png"},
      ]
    };

    return Scaffold(
      backgroundColor: Color(0XFF11161F),
      appBar: AppBar(
        backgroundColor: Color(0XFF11161F),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Rafsan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Let's watch today",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              onSearchTextChanged: (value) {},
            ),
            SizedBox(height: 20),
            CustomRow(
              title: "Categories",
              buttonText: "See More",
              onTap: () {},
            ),
            SizedBox(height: 11),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map((category) => CategoryChip(
                          category: category,
                          onSelected: (value) {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                          selectedCategory: _selectedCategory,
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 11),
            Container(
              alignment: Alignment.bottomCenter,
              child: CarouselSlider(
                items: sliderImages.map((AssetImage) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AssetImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 165,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sliderImages.map((url) {
                int index = sliderImages.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Color(0XFF4F5055) : Colors.white,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 25),
            CustomRow(
              title: "Trending Movies",
              buttonText: "See More",
              onTap: () {},
            ),
            SizedBox(height: 15),
            Container(
              height: 132,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categoryMovies[_selectedCategory]!
                    .map(
                      (movie) => MoviePoster(
                        title: movie["title"]!,
                        imagePath: movie["imagePath"]!,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomRow(
              title: "Continue Watching",
              buttonText: "See More",
              onTap: () {},
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ContinueWatchingWidget(
                    onTap: () {
                      print("Widget tapped!");
                    },
                    image: 'assets/wednesday.png',
                    title: 'Wednesday | Season - 1|',
                    subtitle: 'Episode - 3',
                  ),
                  ContinueWatchingWidget(
                    onTap: () {
                      print("Widget tapped!");
                    },
                    image: 'assets/emily.png',
                    title: 'Emily in Paris |\n Season - 1 | Episode - 1',
                    subtitle: '',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            CustomRow(
              title: "Recomended For You",
              buttonText: "See More",
              onTap: () {},
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 127,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categoryMovies[_selectedCategory]!
                    .map(
                      (movie) => MoviePoster(
                        title: movie["title"]!,
                        imagePath: movie["imagePath"]!,
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
