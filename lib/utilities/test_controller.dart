import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class TestController extends GetxController {
  final ImagePicker picker = ImagePicker();
  List<XFile> images = [];

  Future<void> pickImages() async {
    images = await picker.pickMultiImage();
    update(); // GetX
  }

  Future<void> uploadProduct({
    required String name,
    required List<XFile> images,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('products'));

    request.fields['name'] = name;

    for (var image in images) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'images[]', // 🔥 VERY IMPORTANT
          image.path,
        ),
      );
    }

    var response = await request.send();
    var resBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      print("Success: $resBody");
    } else {
      print("Error: $resBody");
    }
  }
}
