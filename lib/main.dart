import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(title: 'Scale Test'));
}

class MyApp extends StatelessWidget {
  final String title;
  const MyApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Inter",
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  double _getRatio(orig, current) {
    return ((current - orig) / orig) + 1;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    const figmaScreenWidth = 375;
    const figmaScreenHeight = 812;
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final widthRatio = _getRatio(figmaScreenWidth, screenWidth);
    final heightRatio = _getRatio(figmaScreenHeight, screenHeight);
    final cScreenSize = screenWidth * screenHeight;
    const cFigmaScreenSize = figmaScreenWidth * figmaScreenHeight;
    final cRatio = _getRatio(cFigmaScreenSize, cScreenSize);

    const testString =
        "This is a somewhat long string. It should take up multiple lines and look similar on all screens, and line break similarly.";
    const wideBoxWidth = 350.0;
    const thinnerBoxWidth = 200.0;
    const boxHeight = 60.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
                "Target Size: ${figmaScreenWidth}w x ${figmaScreenHeight}h"),
            Text("My Size: ${screenWidth}w x ${screenHeight}h"),
            Text(
                "widthRatio: ${widthRatio.toStringAsFixed(3)}w / heightRatio: ${heightRatio.toStringAsFixed(3)}"),
            Text("Combined Ratio: ${cRatio.toStringAsFixed(3)}"),
            const Divider(),
            const Text(
              "With widthRatio",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * widthRatio),
              child: Text(
                testString,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18 * widthRatio),
              ),
            ),
            const Text(
              "Without widthRatios",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                testString,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              width: wideBoxWidth * widthRatio,
              height: boxHeight * heightRatio,
              decoration: const BoxDecoration(color: Colors.red),
              child: const Center(
                  child: Text(
                      "Width: $wideBoxWidth\nwith widthRatio\nwith heightRatio")),
            ),
            Container(
              width: wideBoxWidth,
              height: boxHeight,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Center(
                  child: Text(
                      "Width: $wideBoxWidth\nno widthRatio\nno heightRatio")),
            ),
            Container(
              width: thinnerBoxWidth * widthRatio,
              height: boxHeight,
              decoration: const BoxDecoration(color: Colors.orange),
              child: const Center(
                  child: Text("Width: $thinnerBoxWidth\nwith widthRatio")),
            ),
            Container(
              width: thinnerBoxWidth,
              height: boxHeight,
              decoration: const BoxDecoration(color: Colors.cyan),
              child: const Center(
                  child: Text("Width: $thinnerBoxWidth\nno widthRatio")),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Colors.green),
                child: const Center(child: Text("Take up the rest of space")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
