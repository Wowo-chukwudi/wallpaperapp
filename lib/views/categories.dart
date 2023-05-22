import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/wallpaper_model.dart';
import 'package:wallpaperapp/widgets/logo.dart';
import 'package:http/http.dart' as http;

import '../widgets/wallpaper_tile.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;
  const CategoryPage({super.key, required this.categoryName});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<WallpaperModel> wallpapers = [];
  getCategory(String input) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$input&per_page=16        "),
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

  @override
  void initState() {
    getCategory(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Logo(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: wallpapers.isEmpty
            ? const CircularProgressIndicator(
                color: Colors.orange,
              )
            : WallpaperTile(
                wallpapers: wallpapers,
              ),
      ),
    );
  }
}
