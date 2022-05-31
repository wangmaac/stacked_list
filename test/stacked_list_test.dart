import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_list/stacked_list.dart';

void main() {
  const MethodChannel channel = MethodChannel('stacked_list');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await StackedList.platformVersion, '42');
  });
}
