import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  double _margin = 0;
  double _width = 250;
  Color _bgColor = Colors.teal;
  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        color: _bgColor,
        width: _width,

        duration: Duration(seconds: 4),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _margin = 30;
                  _bgColor = Colors.blueAccent;
                  _width = 250;
                  _opacity = 0;
                });
              },
              child: Text("Animate"),
            ),
            AnimatedOpacity(
              duration: Duration(seconds: 4),
              opacity: _opacity,
              child: Container(color: Colors.amber, width: 200, height: 200),
            ),
          ],
        ),
      ),
    );
  }
}
