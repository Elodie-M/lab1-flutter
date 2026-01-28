import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 1',
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Lab N1'),
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
  Timer? _timer;
  int _seconds = 0;

  bool get _isRunning => _timer?.isActive ?? false;


void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() {
        _seconds = 0;
      });
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Timer:',
              style: TextStyle(height: 1, fontSize: 40),
            ),
            const SizedBox(height: 14),
            Text(
              '$_seconds',
              style: const TextStyle(height: 1, fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _isRunning ? Colors.redAccent : Colors.blue,
        onPressed: _toggleTimer,
        child: Icon(_isRunning ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}
