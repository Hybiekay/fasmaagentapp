import 'dart:io';
import '../contants/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) {
    return null;
  } else {
    File? file = await cropImage(File(image.path));
    if (file != null) {
      return file;
    } else {
      return null;
    }
  }
}

Future<File?> cropImage(File imageFile) async {
  CroppedFile? croppedFile = await ImageCropper()
      .cropImage(sourcePath: imageFile.path, aspectRatioPresets: [
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.ratio16x9,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio5x3,
    CropAspectRatioPreset.ratio5x4,
    CropAspectRatioPreset.ratio7x5,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
    CropAspectRatioPreset.values[0]
  ], uiSettings: [
    AndroidUiSettings(
      toolbarTitle: 'Crop Image',
      toolbarColor: AppColor.brandColor,
      toolbarWidgetColor: AppColor.whiteColor,
      initAspectRatio: CropAspectRatioPreset.square,
      showCropGrid: true,
    ),
  ]);

  if (croppedFile != null) {
    return File(croppedFile.path);
  }
  return null;
}
