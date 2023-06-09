import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/category_data.dart';
import 'package:wallpaperapp/models/category_model.dart';
import 'package:wallpaperapp/models/wallpaper_model.dart';
import 'package:wallpaperapp/views/categories.dart';
import 'package:wallpaperapp/views/search.dart';
import 'package:wallpaperapp/widgets/logo.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/widgets/wallpaper_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];

  List<WallpaperModel> wallpapers = [];

  //a function to get data from the api
  getCuratedWallpapers() async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=16'),
        headers: {
          'Authorization':
              'ZHr9xwZwVMfvRUNVipYrAobnuG3ivJHpZymiDZMDSS711WX2484H19H6'
        });

    //to check if its working -- It works
    //print(response.body);

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData['photos'].forEach((element) {
      //check if it works -- It works
      //print(element);
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);

      //add this model to the list
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    getCuratedWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Logo(),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: const Color(0XFFf5f8fd),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          decorationThickness: 0.0),
                      decoration: const InputDecoration(
                          hintText: 'search wallpapers',
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage(
                                      searchQuery: controller.text,
                                    )));
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                        imgUrl: categories[index].imgUrl,
                        title: categories[index].categoryName);
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: wallpapers.isEmpty
                  ? const CircularProgressIndicator(
                      color: Colors.orange,
                    )
                  : WallpaperTile(
                      wallpapers: wallpapers,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  const CategoryTile({super.key, required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage(
                      categoryName: title,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        child: Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              )),
          Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26,
            ),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          )
        ]),
      ),
    );
  }
}
