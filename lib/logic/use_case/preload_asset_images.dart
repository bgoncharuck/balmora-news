import 'package:balmoranews/data/entity/asset_images.dart';
import 'package:balmoranews/data/service/image_preload/asset_image_preload.dart';
import 'i_use_case.dart';

class PreloadImages with IUseCase<void, void> {
  const PreloadImages();

  @override
  Future<void> execute({void params}) async {
    final assetsToFutures = assetImagesToLoad.map(
      preloadAssetImage,
    );

    await Future.wait(assetsToFutures);
  }
}
