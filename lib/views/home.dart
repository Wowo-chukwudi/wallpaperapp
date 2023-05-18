import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/category_data.dart';
import 'package:wallpaperapp/models/category_model.dart';
import 'package:wallpaperapp/widgets/logo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];

  @override
  void initState() {
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
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: const Color(0XFFf5f8fd),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        decorationThickness: 0.0),
                    decoration: InputDecoration(
                        hintText: 'search wallpapers',
                        border: InputBorder.none),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
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
          )
        ],
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
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
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
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        )
      ]),
    );
  }
}
