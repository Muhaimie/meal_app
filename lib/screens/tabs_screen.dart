import 'package:flutter/material.dart';
import './favourite_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [{"page":CategoriesScreen(),"title":"Categories"},
  {"page" :FavouriteScreen(),"title":"Your Favourite"}];

  int _selectedPageIndex = 0;

  //automatic flutter gv index in BNB
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]["title"])),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Category"),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favourite"),
              backgroundColor: Theme.of(context).primaryColor)
        ],
      ),
    );

    //  DefaultTabController(
    //   child: Scaffold(
    //       appBar: AppBar(
    //           title: Text("Meals"),
    //           bottom: TabBar(tabs: <Widget>[
    //             Tab(
    //               icon: Icon(Icons.category),
    //               text: "Category",
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: "Favourite",
    //             )
    //           ])),
    //       body: TabBarView(
    //           children: <Widget>[CategoriesScreen(), FavouriteScreen()])),
    //   length: 2,
    // );
  }
}
