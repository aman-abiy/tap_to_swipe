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
  late AnimationController animationController;
  var background;
  

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    background = ColorTween(
    begin: Colors.grey.shade200,
    end: Colors.blue,
  ).animate(animationController)
    ..addListener(() {
      setState(() {});
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController, 
      builder: (context, child) {
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
                          });
                        } else {
                          Fluttertoast.showToast(msg: 'End of List');
                        }
                        print('TAPPED LEFT');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.2 ,
                        color: background.value,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if(counter < 10) {
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
                        color: background.value
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}