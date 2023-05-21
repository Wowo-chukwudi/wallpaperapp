//create a class model
class WallpaperModel {
  SrcModel src;

  WallpaperModel(this.src);
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(SrcModel.fromMap(jsonData['src']));
  }
}

class SrcModel {
  final String portrait;

  SrcModel({required this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(portrait: jsonData['portrait']);
  }
}
