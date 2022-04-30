//
//
// import 'package:flutter/material.dart';
//
// import '../constant.dart';
// import 'card_products_screen.dart';
// class ResponsiveLayout extends StatefulWidget {
//   @override
//   _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
// }
//
// class _ResponsiveLayoutState extends State<ResponsiveLayout> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, dimens) {
//         if (dimens.maxWidth <= K.MobileBreakpoint) {
//           return CustomGridView(columnRatio: 6,);
//         } else if (dimens.maxWidth > K.MobileBreakpoint &&
//             dimens.maxWidth <= K.TabletBreakpoint) {
//           return CustomGridView(columnRatio: 4,);
//         } else if (dimens.maxWidth > K.TabletBreakpoint &&
//             dimens.maxWidth <= K.DesktopBreakPoint) {
//           return CustomGridView(columnRatio: 3,);
//         } else {
//           return CustomGridView(columnRatio: 2);
//         }
//       },
//     );
//   }
// }
//
