import 'package:flutter/material.dart';

class GraphCryptos extends StatefulWidget {
  const GraphCryptos({Key? key}) : super(key: key);

  @override
  State<GraphCryptos> createState() => _GraphCryptosState();
}

class _GraphCryptosState extends State<GraphCryptos> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'Recommended'),
              Tab(text: 'Stock List'),
              //Tab(icon: Icon(Icons.area_chart_outlined)),
              //Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.area_chart_rounded, size: 150,),
            Icon(Icons.list, size: 150,), // [TODO]: Render cryptos list from API
          ],
        ),
      ),
    );
  }
}
