import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constant.dart';

class Cart extends StatelessWidget {
  final Function()? increase;
  final Function()? decrease;
  final Function()? clear;
  final String? image;
  final String? label;
  final String? price;
  final int? quantity;

  const Cart(
      {Key? key,
      this.label,
      this.price,
      this.image,
      this.clear,
      this.quantity,
      this.decrease,
      this.increase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: IconSlideAction(
            caption: 'Delete',
            color: K.mainColor,
            icon: Icons.delete,
            onTap: clear,
          ),
        ),
      ],
      actionPane: const SlidableDrawerActionPane(),
      child: SizedBox(

        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: K.whiteColor,
          child: SizedBox(
            height: 130.h,
            width: K.width,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(2),
                  topRight: Radius.circular(2)),
              clipBehavior: Clip.antiAlias,
              child: Image.network(image!, fit: BoxFit.contain,
                width: 140.w,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric
                  (horizontal: 10.0.w ,vertical: 10.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      width:200.w,
                      child: Text(label!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:  TextStyle(
                            fontSize: 16.sp,
                            color: K.blackColor,
                            fontFamily: "Poppins-SemiBold"),
                      ),
                    ),
                    Wrap(
                      children:[ RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0.sp,
                        direction: Axis.horizontal,
                      ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${price!*quantity!} ',
                          style:  TextStyle(
                              fontSize: 16.sp,
                              color: K.mainColor,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: decrease,
                              icon: Icon(MdiIcons.minusCircle,
                                  size: 20.sp, color: K.mainColor),
                            ),
                        Text(
                              quantity.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.sp),
                            ),
                        IconButton(
                          onPressed: increase,
                              icon: Icon(
                                MdiIcons.plusCircle,
                                size: 20.sp,
                                color: K.mainColor,
                              ),
                            ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              ],
            ),
          ),
        ),
        ),
    );
}
}
