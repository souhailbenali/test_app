import 'package:flutter/material.dart';
import 'package:test_app/app/seccren/cart.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Cart(),
            Cart(),
            Cart(),
            Cart(),
            Cart(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.grey[850],
          child: TabBar(
            labelPadding: const EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 16.0),
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, size: 20),
              ),
              Tab(
                icon: Icon(Icons.extension, size: 20),
              ),
              Tab(
                icon: Icon(Icons.location_on, size: 20),
              ),
              Tab(
                icon: Icon(Icons.shopping_cart, size: 20),
              ),
              Tab(
                icon: Icon(Icons.person_outline, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
