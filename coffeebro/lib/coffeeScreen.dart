import 'package:coffeebro/coffee/selectedCoffeeScreen.dart';
import 'package:coffeebro/homeScreen.dart';
import 'package:flutter/material.dart';

class CoffeeScreen extends StatefulWidget {
  static String page;
  @override
  _CoffeeScreenState createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
            title: Text("CoffeBro"),
            backgroundColor: Colors.brown[800],
            leading: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 5),
                  child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 25,),
                ),  
              ),
          ),
      body: Container(
              //color: themeData.scaffoldBackgroundColor,
                child: ListView(
              children: <Widget>[
                Container(
                  child: GridView.count(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      crossAxisCount: 1,
                      padding: EdgeInsets.only(left: 16, right: 16, top: 26),
                      mainAxisSpacing: 6,
                      childAspectRatio: 3 /2.5,
                      crossAxisSpacing: 16,
                      children: <Widget>[
                        _SingleSubject(
                          subject: 'Hazır Kahve',
                          backgroundColor: Colors.brown[400],
                          image: "assets/images/coffeee.png",
                          page: "instant",
                          
                        ),
                        _SingleSubject(
                          subject: 'Çekirdek Kahve',
                          backgroundColor: Colors.brown[500],
                          image: "assets/images/bean.png",
                          page: "bean",
                        ),
                       
                      ]),
                ),
              ],
            ))
      )
      
    );
  }
}
class _SingleSubject extends StatelessWidget {
  final Color backgroundColor;
  final String subject, image,page;
  
  

  const _SingleSubject(
      {Key key,
      @required this.backgroundColor,
      @required this.subject,
      @required this.image,
      @required this.page})
      : super(key: key);
      

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          (page == "instant")
          ?Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectedCoffeeScreen("instant")))
          :Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectedCoffeeScreen("bean")));            
        },
        child: Container(
          color: backgroundColor,
          height: 125,
          child: Container(
            //padding: EdgeInsets.only(bottom: 16, left: 16),
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Positioned(
                  child: Container(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(image)
                      ),
                ),
                Positioned(
                  left: 16,
                  bottom: 20,
                  child: Text(subject,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                        ),
                  
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}