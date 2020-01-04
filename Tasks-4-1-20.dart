import 'package:flutter/material.dart';

void main() => runApp(Wrapper());

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return S();
  }
}

class S extends StatefulWidget {
  @override
  _App createState() => _App();
}

/*---------------------------APP---------------------------*/
class _App extends State<S> {
  final tasks = ["Filip"];
  ScrollController cr = new ScrollController();
  TextEditingController edit = TextEditingController();

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
      ),
    );
  }


  _add() {
    setState(() {
      tasks.add("${edit.text}");
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
        reverse: true,
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
