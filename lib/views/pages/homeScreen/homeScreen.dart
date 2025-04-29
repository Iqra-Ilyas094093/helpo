import 'package:flutter/material.dart';
import 'package:login_design/views/pages/homeScreen/parts/doggerfile.dart';
import 'package:login_design/views/pages/homeScreen/parts/screenName.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _currentIndex = 0;

   void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[_currentIndex],
      bottomNavigationBar: DockingBar(onTabChanged: _onTabChanged,),
    );
  }
}
