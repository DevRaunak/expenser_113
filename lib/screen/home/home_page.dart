import 'package:expenser_113/screen/home/frag_pages/stats_graph_page.dart';
import 'package:expenser_113/screen/home/frag_pages/transaction_page.dart';
import 'package:expenser_113/ui_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
  var isLight;

  var arrFrags = [
    TransactionPage(),
    StatsGraphPage()
  ];



  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness==Brightness.light;
    return Scaffold(
      body: arrFrags[selectedIndex],
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBottomNavigationBar(){
    return BottomNavigationBar(
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      currentIndex: selectedIndex,
      selectedIconTheme: IconThemeData(
          size: 25
      ),
      unselectedIconTheme: IconThemeData(
        size: 19,
      ),
      onTap: (index) {
        selectedIndex = index;
        setState(() {});
      },
      backgroundColor:
      isLight ? AppColor.appBlackColor : AppColor.secondaryColor,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.inbox_outlined,
              color:
              isLight ? AppColor.secondaryColor.withOpacity(0.5) : AppColor.appBlackColor.withOpacity(0.5),
            ),
            label: '',
            activeIcon: Icon(
              Icons.inbox_rounded,
              color: isLight ? AppColor.secondaryColor : AppColor.appBlackColor,
            ),
            tooltip: 'Transaction'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_outlined,
              color:
              isLight ? AppColor.secondaryColor.withOpacity(0.5) : AppColor.appBlackColor.withOpacity(0.5),
            ),
            label: '',
            activeIcon: Icon(
              Icons.account_balance,
              color: isLight ? AppColor.secondaryColor : AppColor.appBlackColor,
            ),
            tooltip: 'Stats')
      ],
    );
  }
}