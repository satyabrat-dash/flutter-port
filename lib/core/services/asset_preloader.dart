import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetPreloader {
  factory AssetPreloader() => _instance;
  AssetPreloader._internal();
  static final AssetPreloader _instance = AssetPreloader._internal();

  bool _isPreloaded = false;

  bool get isPreloaded => _isPreloaded;

  static const List<String> _imageAssets = [
    'assets/images/avatar.png',
    'assets/images/workBg.png',
    'assets/images/paper.png',
    'assets/images/rohan.png',
    'assets/images/front.jpg',
    'assets/images/back.jpg'
  ];

  Future<void> preloadAssets() async {
    if (_isPreloaded) {
      return;
    }

    try {
      final preloadTasks = <Future>[];

      for (final imagePath in _imageAssets) {
        preloadTasks.add(_preloadImage(imagePath));
      }

      await Future.wait(preloadTasks);

      _isPreloaded = true;
    } on Exception catch (e) {
      debugPrint('Asset preloading failed: $e');
      _isPreloaded = true;
    }
  }

  Future<void> _preloadImage(String assetPath) async {
    try {
      final data = await rootBundle.load(assetPath);
      if (data.lengthInBytes > 0) {
        debugPrint('Preloaded image: $assetPath');
      }
    } on Exception catch (e) {
      debugPrint('Failed to preload image $assetPath: $e');
    }
  }

  void reset() {
    _isPreloaded = false;
  }
}
