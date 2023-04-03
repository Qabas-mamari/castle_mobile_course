import 'package:castle_mobile_course/Screens/AddNewCastleDataToFirebase.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:castle_mobile_course/Screens/MyImageList.dart';
import 'package:castle_mobile_course/Screens/MyTextScreen.dart';

class BottomPart extends StatefulWidget {
  const BottomPart({Key? key}) : super(key: key);

  @override
  State<BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  late int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
   // const Text("Text"),
    const MyTextScreen(),
    const MyImageList(),
    AddNewCastleDataToFirebase(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(child: _widgetOptions[_selectedIndex],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        elevation: 10,
        onTap: _onTabFunction,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_text_add_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_text_add_regular),
          label: "textList",
        ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_image_add_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_image_add_regular),
            label: "textList",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_image_add_filled),
            label: "add Castle"

          )
        ],
      ),
    );
  }
  void _onTabFunction(int value) {
    setState(() {
      _selectedIndex = value;
      print("_selectedIndex: $_selectedIndex");
    });
  }
  }

