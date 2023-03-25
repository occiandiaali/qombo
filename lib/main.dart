import 'package:flutter/material.dart';
import 'package:qombo/src/features/cryptos/presentation/graph_cryptos/graph_cryptos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const QomboApp(),
    );
  }
}

class QomboApp extends StatefulWidget {
  const QomboApp({Key? key}) : super(key: key);
  static const List<Widget> _pages = <Widget>[
    GraphCryptos(),
    // Icon(
    //   Icons.home,
    //   size: 150,
    // ),
    Icon(
      Icons.article,
      size: 150,
    ),
    Icon(
      Icons.work,
      size: 150,
    ),
    Icon(
      Icons.build,
      size: 150,
    ),
  ];

  @override
  State<QomboApp> createState() => _QomboAppState();
}

class _QomboAppState extends State<QomboApp> {
  int selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('qombo', style: TextStyle(fontSize: 26),),
        centerTitle: true,
        leading: const Icon(Icons.account_circle_rounded, size: 34,),
        leadingWidth: 65,
        elevation: 0,
        // actions: const [
        //   Icon(Icons.more_vert)
        // ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: QomboApp._pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedFontSize: 20,
        selectedItemColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'News'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Work'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'Settings'
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}


