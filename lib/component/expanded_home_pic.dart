import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/constant.dart';

class ExpandedHomePicture extends StatelessWidget {
  final String image;

  const ExpandedHomePicture({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        width: K.width - 50.w,

      ),
    );
  }
}
