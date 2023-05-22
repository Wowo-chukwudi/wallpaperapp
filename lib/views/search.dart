import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/wallpaper_model.dart';

import '../widgets/logo.dart';
import 'package:http/http.dart' as http;

import '../widgets/wallpaper_tile.dart';

class SearchPage extends StatefulWidget {
  final String searchQuery;
  const SearchPage({super.key, required this.searchQuery});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  List<WallpaperModel> wallpapers = [];

  getSearchWallpapers(String query) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=16        "),
        headers: {
          'Authorization':
              'ZHr9xwZwVMfvRUNVipYrAobnuG3ivJHpZymiDZMDSS711WX2484H19H6'
        });

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);

        jsonData['photos'].forEach((element) {
          WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);

          wallpapers.add(wallpaperModel);
        });

        setState(() {});
      } else {
        print('Api not responding');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void clearWallpaper() {
    wallpapers.clear();
  }

  @override
  void initState() {
    controller.text = widget.searchQuery;
    getSearchWallpapers(widget.searchQuery);
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
        iconTheme: const IconThemeData(color: Colors.black),
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
                      // onEditingComplete: () =>
                      //     getSearchWallpapers(controller.text),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        clearWallpaper();
                        getSearchWallpapers(controller.text);
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(controller.text.toUpperCase(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5)),
            const SizedBox(
              height: 20,
            ),
            wallpapers.isEmpty
                ? const CircularProgressIndicator(
                    color: Colors.orange,
                  )
                : WallpaperTile(
                    wallpapers: wallpapers,
                  ),
          ],
        ),
      ),
    );
  }
}
