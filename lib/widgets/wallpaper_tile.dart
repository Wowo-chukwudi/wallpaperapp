import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/wallpaper_model.dart';
import 'package:wallpaperapp/views/home.dart';

class WallpaperTile extends StatelessWidget {
  final List<WallpaperModel> wallpapers;
  const WallpaperTile({super.key, required this.wallpapers});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: wallpapers.map((e) {
          return GridTile(
              child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                e.src.portrait,
                fit: BoxFit.cover,
              ),
            ),
          ));
        }).toList(),
      ),
    );
  }
}
