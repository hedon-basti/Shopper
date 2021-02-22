import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopper",
      initialRoute: "/",
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.deepPurpleAccent,
        applyElevationOverlayColor: true,
        buttonColor: Colors.greenAccent,
        snackBarTheme: SnackBarThemeData(
          actionTextColor: Colors.blue,
          backgroundColor: Colors.deepPurpleAccent,
          disabledActionTextColor: Colors.amberAccent,
          elevation: 10.0
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontFamily: "Times New Roman",
          ),
          unselectedLabelColor: Colors.white
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          elevation: 5.0,
          foregroundColor: Colors.white70,
          titleSpacing: 2.0,
          titleTextStyle: TextStyle(
            fontFamily: "Times New Roman"
          )
        ),
      ),
      routes: {
        "/": (context) => HomePage(),
        "/search": (context) => SearchPage(),
        "/settings": (context) => SettingsPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopper"),
        // backgroundColor: Colors.deepPurpleAccent,
        // centerTitle: true,
        // elevation: 10.0,
        // foregroundColor: Colors.black,
        // toolbarOpacity: 0.8,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.pushNamed(context, "/search");
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.pushNamed(context, "/settings");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Icon(
                Icons.adb_outlined,
                size: 72,
              ),
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              enableFeedback: true,
              focusColor: Colors.blue,
              title: Text("Settings"),
              onTap: () => Navigator.pushNamed(context, "/settings"),
            ),
            ListTile(
              leading: Icon(Icons.search),
              enableFeedback: true,
              focusColor: Colors.blue,
              title: Text("Search"),
              onTap: () => Navigator.pushNamed(context, "/search"),
            )
          ],
        ),
      ),
      body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.shopping_bag),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: "Cart",
                ),
                Tab(
                  icon: Icon(Icons.account_circle),
                  text: "Account",
                ),
              ]),
            ),
            body: TabBarView(
              children: [HomeTabPage(), CartTabPage(), AccountTabPage()],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('A SnackBar has been shown.'),
            ),
          );
        }, // on pressed
        tooltip: "Floating Button",
        child: Icon(Icons.add),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Center(),
    );
  }
}

class HomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                        leading: Icon(Icons.ac_unit_sharp),
                        title: Text("Item $index"),
                      ),
                  childCount: 50))
        ],
      ),
    );
  }
}

class CartTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                        leading: Icon(Icons.account_balance_rounded),
                        title: Text("Item $index"),
                      ),
                  childCount: 10))
        ],
      ),
    );
  }
}

class AccountTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
