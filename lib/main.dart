import 'package:flutter/material.dart';
import 'simple_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter D3.js Charts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChartDashboard(),
    );
  }
}

class ChartDashboard extends StatelessWidget {
  const ChartDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D3.js Charts in Flutter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Column(
        children: [
          Expanded(child: Streamgraph()),
          Expanded(child: ZoomableCircles()),
        ],
      ),
    );
  }
}

class Streamgraph extends StatefulWidget {
  const Streamgraph({super.key});

  @override
  State<Streamgraph> createState() => _StreamgraphState();
}

class _StreamgraphState extends State<Streamgraph> {
  @override
  Widget build(BuildContext context) {
    return const SimpleChart(
      title: 'Streamgraph',
      url: 'http://localhost:3000/example-1',
    );
  }
}

class ZoomableCircles extends StatefulWidget {
  const ZoomableCircles({super.key});

  @override
  State<ZoomableCircles> createState() => _ZoomableCirclesState();
}

class _ZoomableCirclesState extends State<ZoomableCircles> {
  @override
  Widget build(BuildContext context) {
    return const SimpleChart(
      title: 'Zoomable Circles',
      url: 'http://localhost:3000/example-2',
    );
  }
}
