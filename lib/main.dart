import 'package:flutter/material.dart';
import 'package:js/js.dart';

@JS('console.log') // annotates `log` function to call `console.log`
external void log(dynamic str);
@JS('xtremepush') // annotates xtremepush function to call xtremepush
external void xtremepush(String event, String nameOfEvent);
@JS('xtremepush') //
external void xtremepushEventWithPayload(
    String event, String nameOfEvent, String payload);
@JS('xtremepush')
external void setUserId(String action, String field, String setValue);
@JS('xtremepush')
external void setTag(String action, String tagName, [String? tagValue]);
// hit tag wrapper function
void hitTag(String tagName) {
  const String action = 'tag';
  setTag(action, tagName);
}

void hitTagWithValue(String tagName, String tagValue) {
  const String action = 'tag';
  setTag(action, tagName, tagValue);
}

void main() {
  runApp(const MyApp());
  log("Hello World from JavaScript");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xtremepush Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Xtremepush Flutter Demo'),
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
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  void _onButton1Pressed() {
    hitTagWithValue('multi_tag', 'another_one');
    print('Button 1 pressed: ${_controller1.text}');
    log('Button 1 has been pressed');
  }

  void _onButton2Pressed() {
    xtremepushEventWithPayload('event', 'flutter_test', 'sample_payload');
    print('Button 2 pressed: ${_controller2.text}');
    log('Button 2 has been pressed');
  }

  void _onButton3Pressed() {
    print('Button 3 pressed: ${_controller3.text}');
    log('Button 3 has been pressed');
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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller1,
                    decoration: const InputDecoration(
                      labelText: 'Enter Event',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _onButton1Pressed,
                  child: const Text('Hit Event'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller2,
                    decoration: const InputDecoration(
                      labelText: 'Enter Tag',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _onButton2Pressed,
                  child: const Text('Hit Tag'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller3,
                    decoration: const InputDecoration(
                      labelText: 'Enter User ID ',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _onButton3Pressed,
                  child: const Text('Set User ID'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
