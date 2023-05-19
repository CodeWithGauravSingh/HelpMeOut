import 'package:flutter/material.dart';
import 'package:helpmeout/services/show.dart';

import 'post_lost.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'post_found.dart';
import 'package:hexcolor/hexcolor.dart';

class Found extends StatefulWidget {
  @override
  State<Found> createState() => _FoundState();
}

class _FoundState extends State<Found> {
  String description = '';
  String name = '';
  String number = '';
  String link = ' ';
  String item = '';
  String date = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF68B1D0),
        title: Text(
          'Found Items',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<QuerySnapshot>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final datas = snapshot.data?.docs;
                for (var data in datas!) {
                  description = data['description'];
                  name = data['name'];
                  number = data['contact'];
                  link = data['url'];
                  item = data['itemname'];
                  date = data['date'];
                  print(link);
                }
                return Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        print('#@@');
                        print(snapshot.data?.docs[index]['url']);
                        return func(
                            link: snapshot.data?.docs[index]['url'],
                            name: snapshot.data?.docs[index]['name'],
                            number: snapshot.data?.docs[index]['contact'],
                            description: snapshot.data?.docs[index]
                                ['description'],
                            item: snapshot.data?.docs[index]['itemname'],
                            date: snapshot.data?.docs[index]['date']);
                      }),
                );
              }
              return Column();
            },
            stream: FirebaseFirestore.instance.collection('found').snapshots(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Text('+', style: TextStyle(fontSize: 30)),
          backgroundColor: Color(0xFF68B1D0),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Post_lost()));
          }),
    );
  }
}

class func extends StatelessWidget {
  func({
    Key? key,
    required this.link,
    required this.name,
    required this.number,
    required this.description,
    required this.item,
    required this.date,
  }) : super(key: key);

  final String link;
  final String name;
  final String number;
  final String description;
  final String item;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Show(name, number, link,
                              description, item, date, true)));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.network('$link',
                          // width: 300,
                          height: 250,
                          fit: BoxFit.fill),
                    ),
                    ListTile(
                      title: Center(
                          child: Text(
                        item,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
