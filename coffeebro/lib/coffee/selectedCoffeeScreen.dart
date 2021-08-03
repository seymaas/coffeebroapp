import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeebro/coffee/coffeDetailsScreen.dart';
import 'package:coffeebro/coffeeScreen.dart';
import 'package:flutter/material.dart';

class SelectedCoffeeScreen extends StatefulWidget {
  final String coffeePage;
  SelectedCoffeeScreen(this.coffeePage);

  @override
  _SelectedCoffeeScreenState createState() => _SelectedCoffeeScreenState();
}

class _SelectedCoffeeScreenState extends State<SelectedCoffeeScreen> {
  final databaseReference = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text((widget.coffeePage == "instant")
                        ? "Hazır Kahve"
                        :"Çekirdek Kahve"),
            backgroundColor: Colors.brown[800],
            leading: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CoffeeScreen()));
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
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 5,
                thickness: 1,
                color: Colors.brown,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: StreamBuilder(
                    stream: (widget.coffeePage == "instant")
                        ? databaseReference.collection("instant").snapshots()
                        : databaseReference.collection("bean").snapshots(),
                    //.where("date", isEqualTo: pickedDate)

                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error : ${snapshot.error}"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.data.docs.isEmpty) {
                        return Center(
                          child: Text(
                            "Henüz bir hedef belirlenmemiştir.",
                            style: TextStyle(color: Colors.brown),
                          ),
                        );
                      }
                      /*return  ListView(
                                  children: snapshot.data.docs
                                      .map((doc) {
                                        ToDoListScreen.not = doc["note"];
                                           _SingleOrder(
                                          note: doc["note"],
                                          image: doc["image"],
                                          title: doc["task_title"],
                                          importance: doc["importance"],
                                          //backgroundColor: Color(doc["backgroundColor"]),
                                        );})
                                    .toList());*/

                      return ListView(
                        children: snapshot.data.docs
                            .map((doc) => Card(
                                  // color: Colors.amber,
                                  child: Container(
                                    height: 150,
                                    color: Colors.brown[100],
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CoffeDetailsScreen(
                                                      doc["brand"],doc["origin"],doc["taste"],doc["type"],doc["star"],doc["isbrand"]

                                                    )));
                                      },
                                      child: ListTile(
                                        leading: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.indigoAccent,
                                            child: Image.asset(
                                              "assets/images/coffeee.png",
                                            ),
                                            foregroundColor: Colors.white,
                                          ),
                                        ),
                                        title: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Text(
                                            doc["brand"],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(doc["type"],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(doc["origin"],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(doc["taste"],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: Container(
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.brown[300],
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: Center(
                                                  child: Text(
                                                      doc["star"].toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
