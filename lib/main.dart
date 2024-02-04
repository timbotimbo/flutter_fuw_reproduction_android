import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _enabled = false;

  void _toggleUnity() {
    setState(() {
      _enabled = !_enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(children: [
          _enabled
              ? Container(
                  // red background only shows when UnityWidget is transparent/invisible
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: UnityWidget(
                    // PlatformView mode: false -> Virtual Display, true -> Hybrid composition
                    useAndroidViewSurface: false,
                    onUnityCreated: (controller) => {},
                  ),
                )
              : SizedBox(),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Text input',
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleUnity,
        child: Center(
          child: Text("Toggle"),
        ),
      ),
    );
  }
}
