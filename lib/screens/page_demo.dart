import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageDemo extends StatefulWidget {

  @override
  _PageDemoState createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Demo'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text('1',
              style: TextStyle(fontSize: 25),
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if(counter > 1) {
                      setState(() {
                        counter--;
                      });
                    } else {
                      Fluttertoast.showToast(msg: 'End of List');
                    }
                    print('TAPPED LEFT');
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.2 ,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if(counter <= 10) {
                      setState(() {
                        counter++;
                      });
                    } else {
                      Fluttertoast.showToast(msg: 'End of List');
                    }
                    print('TAPPED RIGHT');
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.2 ,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}