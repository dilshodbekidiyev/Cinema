// import 'package:cinema/pages/home_page.dart';
// import 'package:flutter/material.dart';
//
// class SplashPage extends StatefulWidget {
//   const SplashPage({Key? key}) : super(key: key);
//
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage> {
//   @override
//   Widget build(BuildContext context) {
//     navigateToNext(context);
//     return const Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Text(
//             'Splash Page',
//             style: TextStyle(
//               fontSize: 25,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void navigateToNext(BuildContext context) {
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushNamedAndRemoveUntil(
//           context,  MaterialPageRoute(builder: (_) => HomePage()), (
//           route) => false);
//     },
//     );
//   }
// }
