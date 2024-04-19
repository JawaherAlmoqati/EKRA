import 'package:ekra/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedItemImage = ''.obs;

  get images => null;

  /// -- Get All Images from product and Variations
  List<String> getAllProductImages(ProductModel item) {
    // Use Set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(item.image);
    // Assign Thumbnail as Selected Image
    selectedItemImage.value = item.image;

    // Get all images from the Product Model if not null.
    if (item.images != null) {
      images.addAll(item.images!);
    }

    return images.toList();
  }
}
