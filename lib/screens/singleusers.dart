import 'package:flutter/material.dart';
import 'package:test_crud/APIs/api.dart';

class SingleUsers extends StatelessWidget {
  final int id;
  SingleUsers(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single User"),
      ),
      body: FutureBuilder(
        future: API().sowAllUsers(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.all(12),
              child: Column(
                children: [
                  Image.network(
                    snapshot.data['image'].toString(),
                    height: 200,
                    width: double.infinity,
                  ),
                 const SizedBox(
                    height: 20,
                  ),

                  Text(snapshot.data['title'],
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
                 const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    "price - \$" + snapshot.data['price'].toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ))
                ],
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
    ;
  }
}
