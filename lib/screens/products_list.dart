import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test_crud/APIs/api.dart';
import 'package:test_crud/screens/singleusers.dart';


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          "Home",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        leading: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black26),
            ),
            onPressed: () {},
            child: Icon(Icons.home)),
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          children: [
            const Card(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Welcome To Users List",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: API().getAllUsers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        snapshot.data[index]['title'],
                                        style:const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      leading: Image.network(snapshot.data[index]['image'],width: 50,height: 50,),
                                      subtitle: Text('price - \$'+
                                          snapshot.data[index]['price'].toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                      ),
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>SingleUsers(snapshot.data[index]["id"])));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // TextButton(
                              //     onPressed: () {
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(
                              //       //       builder: (context) =>ShowUsersData().show()),
                              //       // );
                              //     },
                              //     child: Text(
                              //       snapshot.data[index]['username'],
                              //       style: const TextStyle(
                              //           fontSize: 20,
                              //           fontWeight: FontWeight.w900),
                              //     )),
                            ]);
                      },
                      itemCount: snapshot.data.length,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
