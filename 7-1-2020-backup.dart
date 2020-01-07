import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert'; //'package:convert/convert.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Wrapper());

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: S(),
    );
  }
}

class S extends StatefulWidget {
  Navigatora createState() => Navigatora();
}

class PageThree extends StatefulWidget {
  App createState() => App();
}

class PageFour extends StatefulWidget {
  XA createState() => XA();
}



class XA extends State<PageFour> {
  int idx = 0;

  final String url = "https://jsonplaceholder.typicode.com/todos";
  List data;// = new List.from(["L"]);


  @override
  void initState() {
    super.initState();
    getTxt();
    print("Hey");
  }

  Future<String> getTxt(){
    new HttpClient().getUrl(Uri.parse("http://swimrunworld.co/database.txt"))
    .then((request) => request.close())
    .then((response) => response.transform(new Utf8Decoder()).listen(
            (c) => {
              print("Hello"),
              print(c.split('\n')),
              data = c.split('\n')
            }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext ctx, int idx){
        return Text(data[idx]);
      },
    );
    // Text(data.length > 1 ? data[1] : "Loads");
  }
}



/*
  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"})
        .then((response) => {
              setState(() {
                print(json.decode(response.body));
                data = json.decode(response.body);
              })
            })
        .catchError((error) => print(error));

    // setState(() {
    // var convert = json.decode(response.body);
    // data = convert['title'];
    // });

    return "Success";
  }
  */

class Navigatora extends State<S> {
  // fetch my races

  int idx = 0;
  final tasks = ["Filip"];

  // static const List options = [First(), Second()];
  static const List options = [Text("JOJ"), Text("UIHIUG")];
  ScrollController cr = new ScrollController();
  TextEditingController edit = TextEditingController();

  Widget callPage(int idx) {
    switch (idx) {
      case 0:
        return PageFour();
        break;

      case 1:
      return PageThree();
      break;

      case 2:
        return Second();
        break;

     // default:
     //   return Second(); //PageFour();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Races"),
      ),

      // hot restart if not showing
      body: Center(child: callPage(idx)),

      // body: Text("Hey"),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          onTap: (value) {
            idx = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), title: Text("One")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), title: Text("Two")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), title: Text("Three")),
          ]),
    );
  }
}

class P {
  String name;
}

class M {
  String text;
  M({this.text});
}

class FetchList extends State<S> {
  final String url = "https://swapi.com/api/people";
  List data;

  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var convert = json.decode(response.body);
      data = convert['results'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Text("Load", style: TextStyle(color: Colors.green));
    // Text("J");
  }

// final String url = "https://swapi.com/api/people";
// List data;

/* @override
  void initState(){
    super.initState();
    getData();
    print("Hey");
    stderr.writeln('print me');
  }

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"}
    );

    print(response.body);

    setState(() {
      var convert = json.decode(response.body);
      data = convert['results'];
    });

    return "Success";
  }*/

/*Scaffold(
        body: Center(
            child: Text("Load")
        )
    );*/

}

class Detail extends StatelessWidget {
  final String data;
  final tasks = [M(text: "Filip"), M(text: "Sára"), M(text: "Jana")];
  TextEditingController edit = TextEditingController();

  Detail({Key key, @required this.data}) : super(key: key);

  final String url = "https://swapi.co/api/people";
  List datas;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Center(child: body()));
  }

  Widget body() {
    return Column(
      children: [row(), list(), field()],
    );
  }

  // Web fetch
  // https://www.youtube.com/watch?v=aIJU68Phi1w

  Widget list() {
    return Expanded(
      child: ListView(
        reverse: false,
        children: tasks.reversed.map((data) {
          return bubble(data.text);
        }).toList(),
      ),
    );
  }

  Widget bubble(String content) {
    return Padding(
        padding: EdgeInsets.all(3.0),
        child: Text(content,
            style: TextStyle(backgroundColor: Colors.blue, fontSize: 20)));
    /*Dismissible(
      key: UniqueKey(),
      child: ListTile(
        title: Text(content),
      ),
    );*/
  }

  Widget row() {
    return Column(children: [
      Container(height: 40),
      CircleAvatar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.orange,
          backgroundImage: AssetImage("images/wanaka.jpg"),
          radius: 30.0),
      Text(data, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
    ]);
  }

  Widget field() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: TextField(
        controller: edit,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: "Enter search term"),
      ),
    );
  }
}

class Post {
  final String name;

  Post({this.name});
}

class Second extends StatelessWidget {
  // static const List<Widget> options = [Text("Hello"), Text("Wow")];
  //ScrollController cr = new ScrollController();
  final tasks = [Post(name: "Filip"), Post(name: "Sára"), Post(name: "Jana")];
  TextEditingController edit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [list(context)],
    );
  }

  Widget list(BuildContext ctx) {
    return Expanded(
      child: ListView(
        reverse: false,
        children: tasks.reversed.map((data) {
          return cell(data.name, ctx);
        }).toList(),
      ),
    );
  }

  Widget cell(String content, BuildContext ctx) {
    return stack(content, ctx);
  }

  // stack(content, ctx)

  /*ListTile(
        title: Text(content),
        onTap: () {
          Navigator.push(ctx,
              MaterialPageRoute(builder: (context) => Detail(data: content)));
        });*/

  Widget stack(String content, BuildContext ctx) {
    return Padding(
        padding: EdgeInsets.all(6.0),
        child: ListTile(
            title: Row(
              children: <Widget>[
                Text(content,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
              ],
            ), //
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.orange,
              backgroundImage: AssetImage("images/wanaka.jpg"),
              radius: 30.0,
            ),
            onTap: () {
              Navigator.push(
                  ctx,
                  MaterialPageRoute(
                      builder: (context) => Detail(data: content)));
            }));
  }
}

/*---------------------------APP---------------------------*/
class App extends State<PageThree> {
  final tasks = ["Filip"];
  int curr = 0;

  static const List<Widget> options = [Text("Hello"), Text("Wow")];

  ScrollController cr = new ScrollController();
  TextEditingController edit = TextEditingController();

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // do not return Scaffold here!
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        list(),
        Row(
          children: [
            Container(
              width: 200,
              child: field(),
            ),
            float()
          ],
        )
      ],
    );
  }

  _add() {
    setState(() {
      if (edit.text.isEmpty) {
        emptyAlert();
      } else {
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            tasks.add("${edit.text}");
            cr.jumpTo(cr.position.maxScrollExtent + 30);
            edit.clear();
          });
        });
      }
    });
  }

  void emptyAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Empty message"),
            content: Text("Please type in some message"),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget list() {
    return Expanded(
      child: ListView(
        controller: cr,
        reverse: false,
        children: tasks.map((data) {
          return cell(data);
        }).toList(),
      ),
    );
  }

  Widget cell(String content) {
    return Padding(
        padding: EdgeInsets.all(3.0),
        child: Text(content,
            style: TextStyle(backgroundColor: Colors.blue, fontSize: 20)));
    /*Dismissible(
      key: UniqueKey(),
      child: ListTile(
        title: Text(content),
      ),
    );*/
  }

  Widget field() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: TextField(
        controller: edit,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: "Enter search term"),
      ),
    );
  }

  Widget float() {
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
*
*
*
* class Bubble extends StatelessWidget {
  Bubble({this.message, this.time, this.delivered, this.isMe});

  final String message, time;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.white : Colors.greenAccent.shade100;
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(message),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
*
* */

/*
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
