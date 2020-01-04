
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
  Navigator createState() => Navigator();
}

class Navigator extends State<S> {
  int idx = 0;
  final tasks = ["Filip"];

  // static const List options = [First(), Second()];
  static const List options = [Text("JOJ"), Text("UIHIUG")];

  ScrollController cr = new ScrollController();
  TextEditingController edit = TextEditingController();

  Widget callPage(int idx) {
    switch (idx) {
      case 0:
        return First();
        break;
      case 1:
        return Second();
        break;
      default:
        First();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Center(child: callPage(idx) //options.elementAt(idx),
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
                icon: Icon(Icons.add_a_photo), title: Text("Hey")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), title: Text("Hey"))
          ]),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.green);
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.orange);
  }
}
