import 'package:flutter/material.dart';

void main() => runApp(Wrapper());

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Test",
      home: S(),
    );
  }
}

class S extends StatefulWidget {
  @override
  _App createState() => _App();
}

/*---------------------------APP---------------------------*/
class _App extends State<S> {
  final tasks = ["Filip"];

  _add() {
    setState(() {
      tasks.add("ER");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "I love Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Center(
          child: ListView(
            children: tasks.reversed.map((data) {
              return Dismissible(
                key: Key(data),
                child: ListTile(
                  title: Text(data),
                ),
              );
            }).toList(),
            /* itemCount: tasks.length,
            itemBuilder: (ctx, row){
              return Text(tasks[row]);
            },*/
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _add,
          child: Text("+"),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (ctx, row) {
        return Text("Hello");
      },
    );
  }
}

/*---------------------------BODY---------------------------*/
// 21:31:41 First extraction
class Body extends StatelessWidget {
  final tasks = <String>["Filip"];

  Widget row(String text) {
    return ListTile(
      title: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: ListWidget());
  }
}

// 3.1.2020: 18:13:20 Start!
/*class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      home: Text("Filip"),
    );
  }
}*/

/*

NOT WORKING AS WIDGET ???

  Widget items() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 67,
      itemBuilder: (ctx, i) {
        Text("J");//row(tasks[i]);
      },
    );
  }
*/
