import 'package:flutter/material.dart';
import 'package:flutter_learn_basic_flutter/account_data.dart';

class ListAccount extends StatelessWidget {
  final List<AccountData> lsData;

  ListAccount({Key key, this.lsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: lsData.length,
          itemBuilder: (context, index) => buildItemList(index),
        ),
      ),
    );
  }

  Card buildItemList(int index) {
    return Card(
      margin: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: (index - 1) % 2 == 0 ? Colors.blue[600] : Colors.blue[300],
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        leading: Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: Text(
          '${lsData[index].email}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        subtitle: Text(
          '${lsData[index].password}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
