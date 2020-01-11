
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

class First extends StatefulWidget {
  F createState() => F();
}

class Second extends StatefulWidget {
  A createState() => A();
}


class F extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Text("First");
  }
}

class A extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Text("Seconds");
  }
}

class Navigatora extends State<S> {
  // fetch my races
  int idx = 0;

  Widget callPage(int idx) {
    switch (idx) {
      case 0:
        return First();
        break;

      case 1:
        return Second();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Races"),
      ),
      body: Center(child: callPage(idx)),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          onTap: (value) {
            idx = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.access_time), title: Text("One")),
            BottomNavigationBarItem(icon: Icon(Icons.access_time), title: Text("Two"))
          ]),
    );
  }
}