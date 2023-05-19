import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpmeout/services/pool.dart';

class CarPoolingPage extends StatefulWidget {
  const CarPoolingPage({Key? key}) : super(key: key);

  @override
  State<CarPoolingPage> createState() => _CarPoolingPageState();
}

class _CarPoolingPageState extends State<CarPoolingPage> {
  String? src = '';
  String? dis = '';

  final TextEditingController _srcController = TextEditingController();
  final TextEditingController _disController = TextEditingController();

  @override
  void dispose() {
    _srcController.dispose();
    _disController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: _srcController,
                decoration: InputDecoration(
                  hintText: 'From',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    src = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _disController,
                decoration:
                    InputDecoration(hintText: 'To', border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    dis = value;
                  });
                },
              ),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF68B1D0),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       setState(() {
        //         src = _srcController.text;
        //         dis = _disController.text;
        //         print(src);
        //         print(dis);
        //       });
        //     },
        //     icon: const Icon(Icons.search),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Poolrequest(src: src, dis: dis),
      ),
      backgroundColor: Color(0xFFE4F4FD),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pool()))
        },
        backgroundColor: Color(0xFF68B1D0),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {},
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class PoolRequest extends StatefulWidget {
  String? source, destination;
  int? fare;
  String? Date, Time, type, contact, name;
  PoolRequest(
      {Key? key,
      this.source,
      this.destination,
      this.fare,
      this.Date,
      this.Time,
      this.type,
      this.contact,
      this.name})
      : super(key: key);

  @override
  State<PoolRequest> createState() => _PoolRequestState();
}

class _PoolRequestState extends State<PoolRequest> {
  _makingPhoneCall() async {
    // var url = Uri.parse(widget.number);
    var url = Uri.parse('tel:' + widget.contact!);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Card(
            elevation: 5,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle, color: Color(0xFF68B1D0)),
                              SizedBox(width: 10),
                              Text(
                                widget.source!,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Color(0xFF68B1D0)),
                              SizedBox(width: 10),
                              Text(
                                widget.destination!,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        '\u{20B9} ' + widget.fare.toString(),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.drive_eta, color: Color(0xFF68B1D0)),
                      SizedBox(width: 10),
                      Text(
                        widget.type!,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range, color: Color(0xFF68B1D0)),
                          SizedBox(width: 10),
                          Text(
                            widget.Date!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined,
                              color: Color(0xFF68B1D0)),
                          SizedBox(width: 10),
                          Text(
                            widget.Time!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ListTile(
                    leading: Image.asset('assets/avataricon.png'),
                    title: Text(
                      widget.name!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      widget.contact!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    trailing: InkWell(
                      child: Icon(
                        Icons.call,
                        size: 30,
                        color: Colors.green,
                      ),
                      onTap: () {
                        _makingPhoneCall();
                      },
                    ),
                  )
                ],
              ),
            )));
  }
}

class Poolrequest extends StatefulWidget {
  final String? src;
  final String? dis;

  const Poolrequest({Key? key, this.src, this.dis}) : super(key: key);

  @override
  _PoolrequestState createState() => _PoolrequestState();
}

class _PoolrequestState extends State<Poolrequest> {
  Stream<QuerySnapshot> poolref =
      FirebaseFirestore.instance.collection("pool").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: poolref,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (widget.src!.isNotEmpty && widget.dis!.isNotEmpty) {
            List<Widget> feedlist =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              if (data['source'] == widget.src &&
                  data['destination'] == widget.dis) {
                return PoolRequest(
                  source: data['source'],
                  destination: data['destination'],
                  Date: data['date'],
                  Time: data['time'],
                  type: data['type'],
                  contact: data['contact'],
                  name: data['name'],
                  fare: data['fare'],
                );
              }
              return SizedBox.shrink(); // or `return null;`
            }).toList();
            return Column(children: feedlist);
          } else if (snapshot.hasData) {
            List<Widget> feedlist =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              return PoolRequest(
                source: data['source'],
                destination: data['destination'],
                Date: data['date'],
                Time: data['time'],
                type: data['type'],
                contact: data['contact'],
                name: data['name'],
                fare: data['fare'],
              );
            }).toList();
            return Column(children: feedlist);
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
