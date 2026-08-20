abstract class Inavigationservice {
  Future<void> navigateToPath({required String path, required Object data});
  Future<void> navigateToPathClear({
    required String path,
    required Object data,
  });
}
