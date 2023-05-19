// import 'package:flutter/material.dart';
// import 'package:helpmeout/services/sell.dart';
//
// import 'Buy.dart';
//
// class Sell extends StatefulWidget {
//   const Sell({Key? key}) : super(key: key);
//
//   @override
//   State<Sell> createState() => _SellState();
// }
//
// class _SellState extends State<Sell> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Buy and Sell'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(40.0),
//               child: SizedBox(
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size.fromHeight(50),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Buy()));
//                     },
//                     child: Text(
//                       'Buy',
//                     )),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(40.0),
//               child: SizedBox(
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size.fromHeight(50),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => sell()));
//                     },
//                     child: Text(
//                       'Sell',
//                     )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
