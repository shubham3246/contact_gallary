import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';

//cropping function
Future<File?> getCroppedImage(XFile pickedFile) async {
  final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 18, ratioY: 17));
  if (croppedFile == null) return null;
  return File(croppedFile.path);
}
