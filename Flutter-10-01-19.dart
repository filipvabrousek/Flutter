import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert'; //'package:convert/convert.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:image_picker_modern/image_picker_modern.dart';
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

class Settings extends State<SettingsPage> {
  var atext = "None";
  final ctrl = TextEditingController();


  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var tr = "";

    return Column(
      children: [
        TextField(
          controller: ctrl,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Enter a search term')
        /*  onChanged: (text) {
            atext = text;
          },*/
        ),
        FlatButton(
          child: Text("Hey"),
          onPressed: () {
            tr = ctrl.text;
          },
        )
      ],
    );
  }
}

class S extends StatefulWidget {
  Navigatora createState() => Navigatora();
}

class ChatPage extends StatefulWidget {
  App createState() => App();
}

class FetchPage extends StatefulWidget {
  XA createState() => XA();
}

class SettingsPage extends StatefulWidget {
  Settings createState() => Settings();
}

/*---------------------------------------------------------------APP---------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------- */
class App extends State<ChatPage> {
  final tasks = [
    M(text: "Filip", incoming: false),
    M(text: "Sára", incoming: true),
    M(text: "Jana", incoming: true)
  ];
  int curr = 0;

  File image;

  // static const List<Widget> options = [Text("Hello"), Text("Wow")];

  ScrollController cr = new ScrollController();
  TextEditingController edit = TextEditingController();

  // do not return Scaffold here!
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        list(),
        heigher(),
      ],
    );
  }

  Widget list() {
    return Expanded(
      child: ListView(
        controller: cr,
        reverse: false,
        children: tasks.map((data) {
          return alignRow(data);
        }).toList(),
      ),
    );
  }

  Future getImage() async {
    print("L");
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  Widget cChild(M m) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 48.0),
          child: Text(m.text),
        )
      ],
    );
  }

  Widget picker() {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );
  }

  Widget alignRow(M m) {
    final align =
        m.incoming ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final radius = BorderRadius.all(Radius.circular(4.0));
    final color = m.incoming ? Colors.grey : Colors.lightBlue;

    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          margin: EdgeInsets.all(3.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: radius,
          ),
          child: cChild(m),
        )
      ],
    );
  }

/*
  Widget bubbleRow(M message){
  final align = message.incoming ? CrossAxisAlignment.end : CrossAxisAlignment.start;

  return Row(
    crossAxisAlignment: align,
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: bubble(message),
        ),
      )
    ],
  );
  }

*/

  Widget bubble(M message) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child:
              Padding(padding: EdgeInsets.all(8.0), child: Text(message.text)),
        ),
      ],
    );
  }

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

  Widget heigher() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70,
      child: rowa(),
    );
  }

  Widget rowa() {
    return Row(children: [
      Expanded(child: field()),
      Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: FlatButton(
          child: Text("Send"),
          onPressed: add,
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: FlatButton(
          child: Text("iPhone"),
          onPressed: getImage,
        ),
      ),
    ]);
  }

  add() {
    setState(() {
      if (edit.text.isEmpty) {
        emptyAlert();
      } else {
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            tasks.add(
                M(text: "${edit.text} ${tasks.length + 1}", incoming: true));
            cr.jumpTo(cr.position.maxScrollExtent + 30);
            edit.clear();
          });
        });
      }
    });
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
    return /*FloatingActionButton(
      onPressed: _add,
      child: Text("+"),
      backgroundColor: Colors.lightBlue,
    );*/

        FlatButton(
      onPressed: add,
      child: Text("Send"),
    );
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

  @override
  void dispose() {
    // TODO: implement dispose
    cr.dispose();
    super.dispose();
  }
}

class XA extends State<FetchPage> {
  int idx = 0;

  final String url = "https://jsonplaceholder.typicode.com/todos";
  List data; // = new List.from(["L"]);

  @override
  void initState() {
    super.initState();
    getTxt();
    print("Hey");
  }

  Future<String> getTxt() {
    new HttpClient()
        .getUrl(Uri.parse("http://swimrunworld.co/database.txt"))
        .then((request) => request.close())
        .then(
          (response) => response.transform(new Utf8Decoder()).listen((c) =>
              {print("Hello"), print(c.split('\n')), data = c.split('\n')}),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext ctx, int idx) {
        return RCell(data[idx]); //Text(data[idx]);
      },
    );
    // Text(data.length > 1 ? data[1] : "Loads");
  }
}

Widget RCell(String race) {
  return Padding(
    padding: EdgeInsets.all(12.0),
    child: Text(race),
  );
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
        return ChatPage();
        break;

      case 1:
        return NavPage();
        break;

      case 2:
        return FetchPage();
        break;

      case 3:
        return SettingsPage();
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
                icon: Icon(Icons.access_time), title: Text("Chat")),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), title: Text("Nav")),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), title: Text("Fetch")),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time), title: Text("Settings")),
          ]),
    );
  }
}

class P {
  String name;
}

class M {
  String text;
  bool incoming;

  M({this.text, this.incoming});
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
          return bubble(data);
        }).toList(),
      ),
    );
  }

  Widget bubble(M message) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
        ),
      ],
    );
  }

  Widget oldbubble(String content) {
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

class NavPage extends StatelessWidget {
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

// flutter run --debug
