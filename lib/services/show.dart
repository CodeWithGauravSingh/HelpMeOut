import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Show extends StatefulWidget {
  String name;
  String number;
  String url;
  String description;
  String item;
  String date;
  bool num;
  Show(this.name, this.number, this.url, this.description, this.item, this.date,
      this.num);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  _makingPhoneCall() async {
    var url = Uri.parse('tel:' + widget.number);
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
        backgroundColor: const Color(0xFF68B1D0),
        actions: [
          IconButton(
            onPressed: _makingPhoneCall,
            icon: Icon(Icons.phone),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: HexColor('30323F')),
              ),
              child: Image.network(
                widget.url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.item,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  widget.num ? 'Founder Information:' : 'Owner Information:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.number,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 6),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight,
                  ),
                  child: SingleChildScrollView(
                    child: AutoSizeText(
                      widget.description,
                      style: TextStyle(fontSize: 15),
                      maxLines: null,
                      minFontSize: 10,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Date:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.date,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
