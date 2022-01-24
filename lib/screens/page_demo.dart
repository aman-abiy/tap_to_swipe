import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageDemo extends StatefulWidget {

  @override
  _PageDemoState createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> with SingleTickerProviderStateMixin {
  int counter = 1;
  bool isTapped = false;
  Color onTapColor = Colors.grey;

  double _currentOpacity =  0.0;
  

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Demo'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text(counter.toString(),
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
                        _currentOpacity = 0.5;
                      });
                    } else {
                      Fluttertoast.showToast(msg: 'End of List');
                    }
                    print('TAPPED LEFT');
                  },
                  child: AnimatedOpacity(
                    opacity:_currentOpacity,
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.2 ,
                      color: Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if(counter < 10) {
                      setState(() {
                        counter++;
                        _currentOpacity = 0.5;
                      });
                    } else {
                      Fluttertoast.showToast(msg: 'End of List');
                    }
                    print('TAPPED RIGHT');
                  },
                  child: AnimatedOpacity(
                    opacity:_currentOpacity,
                    curve: Curves.linear,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.2 ,
                      color: Colors.grey
                    ),
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