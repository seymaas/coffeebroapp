import 'package:flutter/material.dart';

class CoffeDetailsScreen extends StatefulWidget {
  final String brand, origin, taste, type;
  final int star;
  final bool isbrand;
  CoffeDetailsScreen(
      this.brand, this.origin, this.taste, this.type, this.star, this.isbrand);

  @override
  _CoffeDetailsScreenState createState() => _CoffeDetailsScreenState();
}

class _CoffeDetailsScreenState extends State<CoffeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.brand),
            backgroundColor: Colors.brown[800],
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 5),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 4),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  width: 220,
                  height: 220,
                  child: Image.asset("assets/images/bean.png"),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.brown[200],
                  child: Text(widget.type.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(widget.star.toString() + "/10",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                SizedBox(
                  height: 10,
                ),
                Text(widget.origin.toUpperCase(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                Text(widget.taste.toUpperCase(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(
                            margin: EdgeInsets.only(left: 16),
                            child: ClipOval(
                              child: Material(
                                color: Colors.brown[100],
                                child: InkWell(
                                  splashColor: Colors.orange[800],
                                  highlightColor:
                                      Colors.brown[50],
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.textsms,
                                        color: Colors.brown[900],
                                        size: 30,
                                      )),
                                  onTap: () {
                                    print("yorumla");
                              
                                  },
                                ),
                              ),
                            ),
                          ),
                    Container(
                            margin: EdgeInsets.only(left: 16),
                            child: ClipOval(
                              child: Material(
                                color: Colors.brown[100],
                                child: InkWell(
                                  splashColor: Colors.orange[800],
                                  highlightColor:
                                      Colors.brown[50],
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.brown[900],
                                        
                                      )),
                                  onTap: () {
                                    print("listele");
                              
                                  },
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
                
              ],
            ),
          ),
        ));
  }
}
