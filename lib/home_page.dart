// ignore_for_file: library_prefixes

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:moviessku/data/movie_model.dart';
import 'package:moviessku/list_popular.dart';
import 'package:moviessku/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<MovieModel>> readJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/movie.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => MovieModel.fromJson(e)).toList();
  }

  late final PageController pageController;
  int pageNo = 0;

  final List<String> imageUrls = [
    "https://upload.wikimedia.org/wikipedia/en/9/9a/The_Raid_2011_poster.jpg",
    "https://m.media-amazon.com/images/M/MV5BNGU0YWEwOTUtOTFkOC00M2M2LTkwNTYtYmQ2ODhlNTYwMDIwXkEyXkFqcGdeQXVyMzYzOTYxNzM@._V1_QL75_UY562_CR7,0,380,562_.jpg",
    "https://cdnwpseller.gramedia.net/wp-content/uploads/2023/05/pendekar-tongkat-emas.jpg",
  ];
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildProfile(),
          buildBanner(),
          buildFilter(),
          buildPopuler(),
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'assets/img_profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: greyTextStyle,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Faik Irkham',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.search_rounded,
                size: 20,
              ),
              SizedBox(width: 5),
              Icon(
                Icons.notifications_outlined,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBanner() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 280,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              pageNo = index;

              setState(() {});
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  return child!;
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrls[index]),
                    ),
                  ),
                ),
              );
            },
            itemCount: 3,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.all(2),
              child: Icon(
                Icons.circle,
                size: pageNo == index ? 12 : 8,
                color: pageNo == index ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFilter() {
    var filters = ["Action", "Comedy", "Horor", "Drama", "Adventure"];
    var selectedFilters = 0;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 36,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedFilters == index
                      ? Colors.blue
                      : Colors.grey.shade200,
                ),
                child: Text(
                  filters[index],
                  style: selectedFilters == index
                      ? whiteTextStyle
                      : blackTextStyle,
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: filters.length),
    );
  }

  Widget buildPopuler() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Populer',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'Lihat Semua',
                      style: blueTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 18,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
            future: readJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                return Column(
                  children: data.data!.map((data) {
                    return InkWell(
                      child: PopularMovie(data: data),
                    );
                  }).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        const SizedBox(height: 50),
      ],
    );
  }
}
