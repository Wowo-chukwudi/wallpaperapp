import 'package:wallpaperapp/models/category_model.dart';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = CategoriesModel();

  //Nature
  categoriesModel.categoryName = 'Nature';
  categoriesModel.imgUrl =
      'https://th.bing.com/th/id/R.ae87891b3dde7b28712b75d14342f1a5?rik=2ZT%2baXLkZYcxWg&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f01%2fnature-wallpaper-27.jpg&ehk=jIVFSOxLN%2fQKs4hEfZHNWAeXoeXkeEXooP%2fTy9Vwkek%3d&risl=&pid=ImgRaw&r=0';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //Animal
  categoriesModel.categoryName = 'Animal';
  categoriesModel.imgUrl =
      'https://th.bing.com/th/id/OIP.fPKaGCVJYDhdLlhcczZongHaE8?pid=ImgDet&rs=1';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //Abstract
  categoriesModel.categoryName = 'Abstract';
  categoriesModel.imgUrl =
      'https://th.bing.com/th/id/R.86a31f1c00ddf78857be4a75f3a52d08?rik=gCR%2fk39fvqvwMQ&pid=ImgRaw&r=0';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //Street Art
  categoriesModel.categoryName = 'Street Art';
  categoriesModel.imgUrl =
      'https://th.bing.com/th/id/R.13fa72b10b1573addc8d33831c650e35?rik=nLIVfQzxNDIv3g&pid=ImgRaw&r=0';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //Bikes
  categoriesModel.categoryName = 'Bikes';
  categoriesModel.imgUrl =
      'https://th.bing.com/th/id/R.3c6d7427b92539e54457122d11422a86?rik=tX2pIb9thx9R8w&pid=ImgRaw&r=0';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //Cars
  categoriesModel.categoryName = 'Cars';
  categoriesModel.imgUrl =
      'https://th.bing.com/th/id/OIP.L2MwCIOmhbP-DciTqo4-kwAAAA?pid=ImgDet&rs=1';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //City
  categoriesModel.categoryName = 'City';
  categoriesModel.imgUrl =
      'https://th.bing.com/th/id/OIP.G3Ce_pHcr84BBQNPNd8jFgHaE8?pid=ImgDet&rs=1';
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();
  return categories;
}
