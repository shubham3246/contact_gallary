import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

//compression function
Future<File?> testCompressAndGetFile(File file, String targetPath) async {
  int fileLength = await file.length();
  int quality = 100;
  if (fileLength > 5000000)
    quality = 50;
  else if (fileLength > 3000000)
    quality = 60;
  else if (fileLength > 1000000)
    quality = 70;
  else
    quality = 80;

  final compressed = await FlutterImageCompress.compressAndGetFile(
    file.path,
    targetPath,
    quality: quality,
  );
  // File(targetPath).delete();
  if (compressed == null) return null;
  return File(compressed.path);
}
