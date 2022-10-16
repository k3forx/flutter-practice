import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Section 1
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: const [
//             Icon(Icons.create),
//             Text("first title"),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           const Text("HelloWorld"),
//           const Text("ハローワールド"),
//           TextButton(
//             onPressed: () => {
//               print("button is pressed"),
//             },
//             child: const Text("button"),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: const [
//               Icon(
//                 Icons.favorite,
//                 color: Colors.pink,
//                 size: 24.0,
//               ),
//               Icon(
//                 Icons.audiotrack,
//                 color: Colors.green,
//                 size: 30.0,
//               ),
//               Icon(
//                 Icons.beach_access,
//                 color: Colors.blue,
//                 size: 36.0,
//               ),
//             ],
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => {
//           print("押したね？"),
//         },
//         child: const Icon(Icons.timer),
//       ),
//       drawer: const Drawer(
//         child: Center(
//           child: Text("Drawer"),
//         ),
//       ),
//       endDrawer: const Drawer(
//         child: Center(
//           child: Text("EndDrawer"),
//         ),
//       ),
//     );
//   }
// }

// Section 3: Animation
class _MyHomePageState extends State<MyHomePage> {
  bool _flag = false;

  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _flag ? 0.1 : 1.0,
                duration: const Duration(seconds: 3),
                child: Text(
                  "消える文字",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              AnimatedSize(
                duration: const Duration(seconds: 3),
                child: SizedBox(
                  width: _flag ? 50 : 200,
                  height: _flag ? 50 : 200,
                  child: Container(color: Colors.purple),
                ),
              ),
              AnimatedAlign(
                alignment: _flag ? Alignment.topLeft : Alignment.bottomRight,
                duration: const Duration(seconds: 3),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(color: Colors.green),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _click,
          child: const Icon(Icons.add),
        ));
  }
}
