import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Salam',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(title: 'Home'));
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      endDrawerEnableOpenDragGesture: true,
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(title: Text('Recipes'), onTap: () {}),
          ListTile(title: Text('Ingredients'), onTap: () {}),
          ListTile(title: Text('Shopping List'), onTap: () {})
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Hi');
          },
          tooltip: 'Add new',
          child: Icon(Icons.add),
          elevation: 2.0),
    );
  }
}
