
import 'dart:async';

import 'package:flutter/services.dart';

class StackedList {
  static const MethodChannel _channel = MethodChannel('stacked_list');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
