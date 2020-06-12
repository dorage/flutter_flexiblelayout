import 'package:flexiblelayout/flexiblelayout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FlexibleTuto(),
    );
  }
}

class FlexibleTuto extends StatelessWidget {
  const FlexibleTuto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Flexible Layout'),
        backgroundColor: Colors.grey,
      ),
      body: FlexibleLayout(
        isColumn: false,
        flexList: [1, 2, 1, 4, 2, 1],
        children: <Widget>[
          MockContainer(color: Colors.blue),
          MockContainer(color: Colors.red),
          FlexibleSpace(),
          MockContainer(color: Colors.blue),
          MockContainer(color: Colors.red),
          MockContainer(color: Colors.green),
        ],
      ),
    );
  }
}

class MockContainer extends StatelessWidget {
  final Color color;
  MockContainer({@required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
