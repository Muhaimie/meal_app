import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import './favourite_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  @override
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {
        "page": FavouriteScreen(widget.favouriteMeals),
        "title": "Your Favourite"
      }
    ];
  }

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
      drawer: MainDrawer(),
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
