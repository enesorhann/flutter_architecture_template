// EAGER SINGLETON
class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();
  ImageConstants._init();

  String get logo => _getPng("logo");

  String _getPng(String name) => "assets/images/$name.png";
}
