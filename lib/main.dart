import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/settings": (context) => SettingsPage()
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        elevation: 10.0,
        foregroundColor: Colors.black,
        title: Text("Shopper"),
        toolbarOpacity: 0.8,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.settings), onPressed: () {})
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Icon(
                Icons.account_box,
                size: 72.0,
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.shopping_bag_rounded),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart_rounded),
                  text: "Cart",
                ),
                Tab(
                  icon: Icon(Icons.account_circle_rounded),
                  text: "Account",
                ),
              ],
            ),
            // title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              PageOne(),
              PageTwo(),
              PageThree(),
            ],
          ),
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 1000,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.grey,
        child: const Icon(Icons.search_rounded),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
        ],
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // This Text widget uses the Raleway font.
        child: Text(
          'Sample text',
          style: TextStyle(
            fontFamily: 'Times New Roman',
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        elevation: 10.0,
        foregroundColor: Colors.black,
        title: Text("Shopper"),
        toolbarOpacity: 0.8,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.settings), onPressed: () {})
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
        ),
      ),
    );
  }
}
