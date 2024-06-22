import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage({required ImageSource source}) async {
  final image = await ImagePicker().pickImage(source: source);
    return image != null ? XFile(image.path) : null;
}