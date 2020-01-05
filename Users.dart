import 'package:flutter/material.dart';

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
  @override
  Navigatora createState() => Navigatora();
}

class PageThree extends StatefulWidget {
  App createState() => App();
}

class Navigatora extends State<S> {
  int idx = 0;
  final tasks = ["Filip"];

  // static const List options = [First(), Second()];
  static const List options = [Text("JOJ"), Text("UIHIUG")];

  ScrollController cr = new ScrollController();
  TextEditingController edit = TextEditingController();

  Widget callPage(int idx) {
    switch (idx) {
      case 0:
        return Second();
        break;
      case 1:
        return PageThree();
        break;
      default:
        Second();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child: callPage(idx)),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          onTap: (value) {
            idx = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), title: Text("Hey")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), title: Text("Hey"))
          ]),
    );
  }
}

class P {
  String name;
}

class Detail extends StatelessWidget {
  final String data;

  Detail({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.blue,
        child: Center(
          child: Text(data),
        ));
    //Container(color: Colors.green); // Text(data);
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
        reverse: true,
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
    return Stack(
      children: <Widget>[
        Container(
          height: 100,
        ),

        Positioned.fill(
          child: Container(
            child: Text("Hello"),
          ),
        ),

        Positioned.fill(
            child: FadeInImage(
              placeholder: AssetImage("images/wanaka.jpg"),
              image: AssetImage("images/wanaka.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              fadeInDuration: Duration(milliseconds: 100),
              fadeInCurve: Curves.linear,
            )),


       /* ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Positioned.fill(
              child: FadeInImage(
                width: 50,
                height: 50,
                placeholder: AssetImage("images/wanaka.jpg"),
                image: AssetImage("images/wanaka.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                fadeInDuration: Duration(milliseconds: 100),
                fadeInCurve: Curves.linear,

              )),
        )*/






      ],
    );
  }

/*
  new Stack(
  children: <Widget>[
    new Positioned.fill(
      child: new FadeInImage(
        placeholder: new AssetImage('placeholder.png'),
        image: new CachedNetworkImageProvider(photos[int].url),
        fit: BoxFit.contain,
        alignment: Alignment.center,
        fadeInDuration: new Duration(milliseconds: 200),
        fadeInCurve: Curves.linear,
      ),
    ),
    new Positioned(
      top: 10.0,
      left: 10.0,
      child: new Container(
        child: new Text(photos[int].title)
      ),
    ),
  ],
)
  * */

/*Text(
            content,
            style: TextStyle(
                backgroundColor: Colors.green,
                color: Colors.white,
                fontSize: 20)
        ));*/
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
        tasks.add("${edit.text}");
        edit.clear();
        cr.jumpTo(cr.position.minScrollExtent);
      }

      // cr.animateTo(0.0, duration: Duration(milliseconds: 100), curve: Curves.easeOut);
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
        reverse: true,
        children: tasks.reversed.map((data) {
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
