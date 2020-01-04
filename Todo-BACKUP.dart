import 'package:flutter/material.dart';


class Second extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.green);
  }
}


void main() => runApp(Wrapper());

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Title",
      home: S(),
    );

  }
}


class S extends StatefulWidget {
  @override
  _App createState() => _App();
}


class Navigator extends State<S> {
  int idx = 0;
  final tasks = ["Filip"];
  static const List<Widget> options = [Text("Hello"), Text("View 2")];
  ScrollController cr = new ScrollController();
  TextEditingController edit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Center(
          child: options.elementAt(idx),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          onTap: (value) {
            idx = value;
            setState(() {});
          },

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo),
                title: Text("Hey")
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo),
                title: Text("Hey")
            )
          ]
      ),
    );
  }


  Widget main() {
    return Container(
        child: Column(
          children: [
            field(),
            list()
          ],
        )
    );
  }

  Widget field(){
    return
      Padding(
        padding: EdgeInsets.all(8.0),
        child:  TextField(
          controller: edit,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "Enter search term"),
        ),
      );
  }


  Widget list(){
    return
      Expanded(
        child: ListView(
          controller: cr,
          children:
          tasks.reversed.map((data) {
            return cell(data);
          }).toList(),
        ),
      );
  }


  Widget cell(String content){
    return Dismissible(
      key: UniqueKey(),
      child: ListTile(
        title: Text(content),
      ),
    );
  }

}




/*---------------------------APP---------------------------*/
class _App extends State<S> {
  final tasks = ["Filip"];
  int curr = 0;

  static const List<Widget> options = [Text("Hello"), Text("Wow")];

  ScrollController cr = new ScrollController();
  TextEditingController edit = TextEditingController();

  Widget callPage(int curr){
    switch (curr){
      case 0: return S();
      break;

      case 1: return Second();
      break;

      default: return S();
    }
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
        body: Container(
          child: Column(
            children: [
             field(),
              list()
            ],
          ),
        ),
        floatingActionButton: float(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: curr,
         onTap: (value) {
            curr = value;
            setState(() {});
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              title: Text("Hey")
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo),
                title: Text("Hey")
            )
          ]
        ),
      ),
    );
  }

  _add() {
    setState(() {
      tasks.add("${edit.text}");
      edit.clear();
      cr.animateTo(0.0,
          duration: Duration(milliseconds: 100), curve: Curves.easeOut);
    });
  }


  Widget cell(String content){
    return Dismissible(
      key: UniqueKey(),
      child: ListTile(
        title: Text(content),
      ),
    );
  }


  Widget field(){
    return
      Padding(
        padding: EdgeInsets.all(8.0),
        child:  TextField(
          controller: edit,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "Enter search term"),
        ),
      );
  }


  Widget list(){
    return
    Expanded(
      child: ListView(
        controller: cr,
        children:
        tasks.reversed.map((data) {
          return cell(data);
        }).toList(),
      ),
    );
  }


  Widget float(){
    return FloatingActionButton(
      onPressed: _add,
      child: Text("+"),
      backgroundColor: Colors.lightBlue,
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    cr.dispose();
    super.dispose();
  }
  }


  class Cell extends StatelessWidget {
  final String data = "";

  @override
  Widget build(BuildContext context) {
   return Dismissible(
      key: UniqueKey(),
      child: ListTile(
        title: Text(data),
      ),
    );
  }
  }
















/*
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
            controller: cr,
            reverse: true,
            children:
            tasks.reversed.map((data) {
              return Dismissible(
                key: UniqueKey(),
                child: ListTile(
                  title: Text(data),
                ),
              );
            }).toList(),

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
  */




/*
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
}*/

/*
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
*/

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
