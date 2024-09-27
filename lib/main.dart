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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    const figmaScreenWidth = 375;
    const figmaScreenHeight = 812;
    final widthRatio =
        ((screenWidth - figmaScreenWidth) / figmaScreenWidth) + 1;
    final heightRatio =
        ((screenHeight - figmaScreenHeight) / figmaScreenHeight) + 1;
    final combinedScreenSize = screenWidth * screenHeight;
    const combinedFigmaScreenSize = figmaScreenWidth * figmaScreenHeight;
    final combinedRatio = ((combinedScreenSize - combinedFigmaScreenSize) /
            combinedFigmaScreenSize) +
        1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
                "Target Width: $figmaScreenWidth // Target Height: $figmaScreenHeight"),
            Text("My Width: $screenWidth // My Height: $screenHeight"),
            Text(
                "widthRatio: ${widthRatio.toStringAsFixed(3)} // heightRatio: ${heightRatio.toStringAsFixed(3)}"),
            Text("Combined Ratio: ${combinedRatio.toStringAsFixed(3)}"),
            const Divider(),
            const Text("With ratios (16 padding each side):"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "This is a somewhat long sentence. It will take up multiple lines.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23 * widthRatio),
              ),
            ),
            const Text("Without ratios (16 padding each side):"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "This is a somewhat long sentence. It will take up multiple lines.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              width: 350 * widthRatio,
              height: 60 * heightRatio,
              decoration: const BoxDecoration(color: Colors.red),
              child: const Center(
                  child: Text("Width: 350\nwith widthRatio\nwith heightRatio")),
            ),
            Container(
              width: 350,
              height: 60,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Center(
                  child: Text("Width: 350\nno widthRatio\nno heightRatio")),
            ),
            Container(
              width: 200 * widthRatio,
              height: 60,
              decoration: const BoxDecoration(color: Colors.orange),
              child: const Center(child: Text("Width: 200\nwith widthRatio")),
            ),
            Container(
              width: 200,
              height: 60,
              decoration: const BoxDecoration(color: Colors.cyan),
              child: const Center(child: Text("Width: 200\nno widthRatio")),
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
