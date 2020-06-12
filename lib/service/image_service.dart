
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageService {
  // 工厂模式
  factory ImageService() => _getInstance();
  static ImageService get instance => _getInstance();
  static ImageService _instance;
  ImageService._internal() {
    // 初始化
  }
  static ImageService _getInstance() {
    if (_instance == null) {
      _instance = new ImageService._internal();
    }
    return _instance;
  }

  Future<String> getImagesPath() async {
    Directory tempDir;
    if(Platform.isAndroid) {
      tempDir =  await getExternalStorageDirectory();
    } else {
      tempDir =  await getApplicationDocumentsDirectory();
    }
    // var tempDir =  await getApplicationSupportDirectory();
    var path = tempDir.path + '/images/';
    var dir = Directory(path);
    if(!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return path;
  }

  Future<String> saveImage(String path) async {
    var suffix = '.png';
    var index = path.lastIndexOf('.');
    if(index >= 0 && index < path.length) {
      suffix = path.substring(index);
    }
    var destPath = await getImagesPath() + '${Uuid().v4()}${suffix}';
    File imageFile = File(path);
    var newFile = await imageFile.copy(destPath);
    return newFile.path;
  }

  Future<FileSystemEntity> deleteImage(String path) async {
    return await File(path).delete();
  }
  
}