import 'dart:io';

import 'package:contact_gallary/save/file_operations/compress_image.dart';
import 'package:contact_gallary/save/file_operations/crop_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

//here tempNo is used through shared preference so that it can resist after restarting app
Future<dynamic> selectImage() async {
  final imagePicker = ImagePicker();
  final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  // int temp = await tempNo;

  if (pickedFile != null) {
    // user selected the image now ...
    // function to get cropped image
    final croppedFile = await getCroppedImage(pickedFile);
    // if (croppedFile != null) return null;
    final appCacheDir = await getTemporaryDirectory();

    if (croppedFile != null) {
      //return bool so that we know whether we need to increase file number or not
      try {
        String targetPath = '${appCacheDir.path}/compressed_image.jpg';
        //function to get compressed image
        final compressedFile =
            await testCompressAndGetFile(croppedFile, targetPath);
        return targetPath;
      } catch (e) {
        return null;
      }
    }

    //deleting pickedFile (temporary file)
    File(pickedFile.path).delete();
    return null;
    // localFile now contains the image saved locally.
  } else {
    // User canceled image selection.
    return null;
  }
}
