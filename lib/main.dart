import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TimerApp(),
    );
  }
}

class TimerApp extends StatefulWidget {
  const TimerApp({super.key, this.countdown = 10});

  final int countdown;

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int _countdown = 0;
  bool isRunning = false;

  @override void initState() {
    super.initState();

    _countdown = widget.countdown;
  }

  void startTimer() async {
    if (isRunning) return;
    setState(() => isRunning = true);

    _countdown = widget.countdown;

    for (int i = _countdown; i >= 0; i--) {
      setState(() => _countdown = i);
      await Future.delayed(const Duration(seconds: 1));
    }

    setState(() => isRunning = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF72BBFF),
          title: const Text('Countdown Timer', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 30),),
          centerTitle: true,
          shadowColor: Colors.black,
          elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isRunning ? 'Time: $_countdown' : 'TIME UP',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            isRunning ? const SizedBox.shrink() : const Text(
              'Press button to start countdown',
              style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w600),
            )
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF72BBFF)
        ),
        onPressed: startTimer,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Text('Start Timer', style: TextStyle(color: Colors.white, fontSize: 18),),
        ),
      ),
    );
  }
}