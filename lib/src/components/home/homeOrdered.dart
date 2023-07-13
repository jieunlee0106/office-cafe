// import 'package:cafe/src/model/selectedModel.dart';
// import 'package:cafe/src/pages/ordered.dart';
// import 'package:flutter/material.dart';

// class HomeOrdered extends StatelessWidget {
//   // const Ordered({Key? key}) : super(key: key);
//   final SelectedModel selectedModel = SelectedModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('주문 현황'),
//       ),
//       body: ListView.builder(
//         scrollDirection: Axis.horizontal, // 가로로 스크롤할 수 있도록 설정
//         itemCount: selectedModel.drinks?.length ?? 0,
//         itemBuilder: (context, index) {
//           final drink = selectedModel.drinks![index];
//           return Container(
//             width: 200, // 카드 뷰의 너비 조정
//             margin: EdgeInsets.all(8.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 8.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     drink.item.toString(),
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     '주문 개수: ${drink.orderItemCount}',
//                     style: TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     'Temperature: ${drink.isHot == 0 ? 'Hot' : 'Iced'}',
//                     style: TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     '샷 추가 개수: ${drink.shotCount}',
//                     style: TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
