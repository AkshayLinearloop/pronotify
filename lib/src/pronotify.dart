import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title, this.color}) : super(key: key);
  final String? title;
  final String? color;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
Color c = const Color(0xFF42A5F5);

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c,
      appBar: AppBar(
        backgroundColor: c,
        title: Text(widget.title.toString()),
        actions: <Widget>[
          PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
              itemBuilder: (context){
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Red"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Blue"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Black"),
                  ),
                ];
              },
              onSelected:(value){
                if(value == 0){
                  setState(() {
                    c = const Color(0xFFEE4B2B);
                  });
                }else if(value == 1){
                  setState(() {
                    c = const Color(0xFF42A5F5);
                  });
                }else if(value == 2){
                  setState(() {
                    c = const Color(0xFF000000);
                  });
                }
              }
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: NotificationItemWidget(),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NotificationItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 15,left: 15,top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1.00,
              blurRadius: 1.00,
              offset: Offset(
                0,
                0,
              ),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.00,
                  top: 10.00,
                  right: 5.00,
                  bottom: 10.00,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: c,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Message",
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "10 min ago",
                maxLines: null,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 10,
                  height: 1.50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}