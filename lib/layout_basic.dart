import 'package:flutter/material.dart';
import 'package:flutter_learn_basic_flutter/account_data.dart';

import 'listview_account.dart';

class LayoutBasic extends StatefulWidget {
  @override
  _LayoutBasicState createState() => _LayoutBasicState();
}

class _LayoutBasicState extends State<LayoutBasic> {
  //controll TextField controller
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();

  AccountData data = new AccountData();
  List<AccountData> lsData = List<AccountData>();

  //init global key
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  void _insertAccount() {
    //add to list
    if (_controllerEmail.text.isNotEmpty) {
      data.email = _controllerEmail.text;
      data.password = _controllerPass.text;
      lsData.add(data);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ListAccount(
          lsData: lsData,
        ),
      ));

      data = new AccountData();
      _controllerEmail.clear();
      _controllerPass.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set key of scaffold
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Layout Basic',
          style: TextStyle(
            fontFamily: 'NerkoOne',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () {
              _insertAccount();
            },
          )
        ],
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
      ),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      // padding tối thiểu
      minimum: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch, //expand flatbutton
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
            controller: _controllerEmail,
            onChanged: (text) {
              //double _anmout = double.tryParse(text) ?? 0; //if error _amount = 0
              setState(() {
                //data.email = text;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            controller: _controllerPass,
            onChanged: (text) {
              //double _anmout = double.tryParse(text) ?? 0; //if error _amount = 0
              setState(() {
                //data.password = text;
              });
            },
          ),
          SizedBox(
            height: 20.0,
          ),

          //button switch screen
          ButtonTheme(
            child: FlatButton(
              height: 50,
              child: Text(
                'Submmit',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  side: BorderSide.none),
              color: Colors.blue,
              onPressed: () {
                _insertAccount();
              },
            ),
          ),

          //size box
          SizedBox(
            height: 16.0,
          ),

          //button show bottom sheet
          ButtonTheme(
            child: FlatButton(
              height: 50,
              child: Text(
                'Bottom Sheet',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  side: BorderSide.none),
              color: Colors.blue,
              onPressed: () {
                _showBottomSheet();
              },
            ),
          ),

          //MAP LISTTILE
          /*Container(
            margin: EdgeInsets.only(
              top: 20.0,
            ),
            child: Column(
              children: lsData.map((element) {
                return ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    '${element.email}',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(
                    '${element.password}',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),*/
        ],
      ),
    );
  }

  //build bottom sheet with text field and button
  void _showBottomSheet() {
    //chú ý đặt tên khác với tên hàm
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Email'),
                        controller: _controllerEmail,
                        onChanged: (text) {
                          //double _anmout = double.tryParse(text) ?? 0; //if error _amount = 0
                          setState(() {
                            //data.email = text;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        controller: _controllerPass,
                        onChanged: (text) {
                          //double _anmout = double.tryParse(text) ?? 0; //if error _amount = 0
                          setState(() {
                            //data.password = text;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                //2 BUTTON SAVE & CANCEL
                Container(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //BUTTON SAVE
                        Expanded(
                          child: SizedBox(
                            height: 46.0,
                            child: RaisedButton(
                              color: Colors.blue[400],
                              elevation: 0.0,

                              //elevator when press button
                              highlightElevation: 3,
                              onPressed: () {
                                this._insertAccount();

                                //HIDE BOTTOM SHEET
                                if (_controllerEmail.text.isNotEmpty)
                                  Navigator.of(context).pop();
                              },
                              child: Text(
                                'Save'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 16.0,
                        ),

                        //BUTTON CANCEL
                        Expanded(
                          child: SizedBox(
                            height: 46.0,
                            child: RaisedButton(
                              color: Colors.red[400],
                              elevation: 0.0,

                              //elevator when press button
                              highlightElevation: 3,
                              onPressed: () {
                                //HIDE BOTTOM SHEET
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancel'.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
