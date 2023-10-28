import 'dart:io';
import 'package:path_provider/path_provider.dart';

//file name and length function
Future<List<Map<String, dynamic>>> getAllFileDetails() async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final localPath = appDocDir.path;
  final directory = Directory(localPath);
  final files = await directory.list().toList();
  List<Map<String, dynamic>> fileDetails = [];

  for (var file in files) {
    if (file is File) {
      final fileName = file.path.split('/').last;
      final fileSize = await file.length(); // Get the file size in bytes

      fileDetails.add({
        'name': fileName,
        'size': fileSize,
      });
    }
  }
  return fileDetails;
}
