import 'package:flutter/material.dart';

void main() {
  runApp(Third());
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage2();
  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

const _youAre = "You are";
const _compatible = "compatibel with\nDoris D. Developer";
double _loveFlutterSliderValue = 1.0;
String _messageTour = "$_youAre Not $_compatible";

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Are yo ucompative with Doris"),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              _buildFlutterlove(),
              Row(
                children: [_button(), _text()],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlutterlove() {
    return Column(
      children: [
        Text("On scale of 1 to 10, "
            "How much do you love developing flutter apps"),
        Slider(
          min: 0,
          max: 9,
          divisions: 10,
          value: _loveFlutterSliderValue,
          onChanged: _updateFlutterlove,
          label: '${_loveFlutterSliderValue.toInt()}',
        )
      ],
    );
  }

  Widget _button() {
    return Row(
      children: [
        ElevatedButton(onPressed: _updateSwitch, child: Text("Switch"))
      ],
    );
  }

  Widget _text() {
    return Row(
      children: <Widget>[
        Text(
          _messageTour,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  void _updateFlutterlove(double newvalue) {
    setState(() {
      _loveFlutterSliderValue = newvalue;
    });
  }

  void _updateSwitch() {
    setState(() {
      _messageTour =
          _youAre + (_loveFlutterSliderValue >= 8 ? "" : "Not") + _compatible;
    });
  }
}
