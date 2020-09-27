import 'package:conatus_app/components/custom_divider.dart';
import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:conatus_app/views/explore_pages/explore_page.dart';
import 'package:conatus_app/views/home_pages/home_page.dart';
import 'package:conatus_app/views/profile_pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootLoggedIn extends StatefulWidget {
  @override
  _RootLoggedInState createState() => _RootLoggedInState();
}

class _RootLoggedInState extends State<RootLoggedIn> {
  int selectedIndex = 0;
  String _currentPage = "Home";
  List<String> pageKeys = ["Home", "Explore", "Profile"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "Explore": GlobalKey<NavigatorState>(),
    "Profile": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
      });
    }
  }

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //Bottom Navbar
  Widget bottomNavbar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPalette.PRIMARY_DARK,
      selectedItemColor: ColorPalette.SELECTED_NAV_BAR,
      unselectedItemColor: ColorPalette.UNSELECTED_NAV_BAR,
      selectedFontSize: Unit.FONT_SMALL,
      unselectedFontSize: Unit.FONT_SMALL,
      currentIndex: selectedIndex,
      elevation: 16,
      iconSize: 25,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
        _selectTab(pageKeys[index], index);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.store), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.alternate_email), title: Text('Explore')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
      ],
    );
  }

  //run home page !
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Home") {
            setState(() {
              selectedIndex = 0;
            });
            _selectTab("Home", 0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: ColorPalette.PRIMARY_DARK,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(children: <Widget>[
                _buildOffstageNavigator("Home"),
                _buildOffstageNavigator("Explore"),
                _buildOffstageNavigator("Profile"),
              ]),
            ),
            CustomDivider.zeroPaddingDivider(),
          ],
        ),
        bottomNavigationBar: bottomNavbar(),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator({Key key, this.navigatorKey, this.tabItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "Home")
      child = HomePage();
    else if (tabItem == "Explore")
      child = ExplorePage();
    else if (tabItem == "Profile") child = ProfilePage();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
