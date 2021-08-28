import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RFSample'),
        ),
        body: Center(child: Text('Hello World!\n$appName\n$packageName')),
      ),
    );
  }
}
