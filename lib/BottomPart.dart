import 'package:castle_mobile_course/Data/castle_model.dart';
import 'package:castle_mobile_course/Screens/AddNewCastleDataToFirebase.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:castle_mobile_course/Screens/MyImageList.dart';
import 'package:castle_mobile_course/Screens/MyTextScreen.dart';

class BottomPart extends StatefulWidget {
  final Function (Castle, bool) onUpdateCastle;

  const BottomPart({Key? key, required this.onUpdateCastle}) : super(key: key);

  @override
  State<BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  late int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
 /**static final List<Widget> _widgetOptions = <Widget>[
   // const Text("Text"),
    const MyTextScreen(),
    const MyImageList(),
    AddNewCastleDataToFirebase(),
  ];
     **/

  @override
  void initState(){
   super.initState();
   _widgetOptions = <Widget>[
     MyTextScreen(
       onUpdateCastle: (Castle castle, bool isUpdate){
         _updateCastle(castle, isUpdate);
       },
     ),
     AddNewCastleDataToFirebase(
      onUpdateCastle: (Castle castle, bool isUpdate) {
        _updateCastle(castle, isUpdate);
      },
     ),
     const MyImageList(),
   ];
  }

  void _updateCastle(Castle castle, isUpdate){
   setState(() {
     _selectedIndex = 1;
     _widgetOptions[1] = AddNewCastleDataToFirebase(
       castle: castle,
       isUpdate: isUpdate,
         onUpdateCastle: (Castle castle, bool isUpdate){}
     );
   });
  }

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
      if(value == 1){
        _widgetOptions[1] = AddNewCastleDataToFirebase(
            onUpdateCastle: (Castle castle, bool isUpdate){
              _updateCastle(castle, isUpdate)
            },
        );
      }
      _selectedIndex = value;
      print("_selectedIndex: $_selectedIndex");
    });
  }
}

