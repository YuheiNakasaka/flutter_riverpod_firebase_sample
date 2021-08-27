import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String appName = '';
  String packageName = '';

  @override
  void initState() {
    super.initState();
    Future(() async {
      final info = await PackageInfo.fromPlatform();
      appName = info.appName;
      packageName = info.packageName;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RFSample'),
        ),
        body: Center(child: Text('Hello World!\n$appName\n$packageName')),
      ),
    );
  }
}
