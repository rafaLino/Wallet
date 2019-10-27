import 'package:flutter/material.dart';
import 'package:wallet_rebalance/src/Screens/Graphic/graphics.dart';
import 'package:wallet_rebalance/src/Screens/Search/search.dart';
import 'package:wallet_rebalance/src/Screens/Settings/settings.dart';
import 'package:wallet_rebalance/src/Screens/Wallet/wallet.dart';
import 'package:wallet_rebalance/src/Utilities/constants.dart';
import 'package:wallet_rebalance/src/Utilities/localizations.dart';

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
              icon: Icon(Icons.insert_chart),
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
