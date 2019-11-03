import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet_rebalance/src/2%20-%20Domain/Models/Enums/homePages.dart';
import 'package:wallet_rebalance/src/2%20-%20Domain/Services/localizations.dart';
import 'graphics.dart';
import 'search.dart';
import 'wallet.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;
  var _page = HomePages.Wallet.index;

  final _screens = <Widget>[Search(), Wallet(), Graphics(), Settings()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white12,
        brightness: Brightness.dark,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(DemoLocalizations.of(context)
                  .home_BottomNavigationBarItem_Text_Search)),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(DemoLocalizations.of(context)
                  .home_BottomNavigationBarItem_Text_Home)),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartBar),
              title: Text(DemoLocalizations.of(context)
                  .home_BottomNavigationBarItem_Text_Graphics)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(DemoLocalizations.of(context)
                  .home_BottomNavigationBarItem_Text_Settings)),
        ],
        onTap: navigationTapped,
        currentIndex: this._page,
        type: BottomNavigationBarType.fixed,
      ),
      body: PageView(
        children: _screens,
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: onPageChanged,
        pageSnapping: true,
      ),
      drawer: Drawer(
          child: Center(
        child: Text('SLIDEBAR'),
      )),
    );
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInCubic,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
