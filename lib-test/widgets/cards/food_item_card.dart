import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double imageWidth = isPortrait ? 110.w : screenWidth * 0.3;
    double imageHeight = isPortrait ? 125.h : screenHeight * 0.735;

    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 120.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Left - Image
            Padding(
              padding: EdgeInsets.only(
                left: isPortrait ? 5.w : 5.h,
                bottom: isPortrait ? 5.h : 2.w,
                top: isPortrait ? 5.h : 2.w,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?fit=crop&w=600&q=80',
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Right - Info
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cheese Burst Pizza',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      'Extra cheesy with fresh veggies and toppings',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 6.h),

                    Row(
                      children: [
                        Text('1 plate', style: TextStyle(fontSize: 12.sp)),
                        SizedBox(width: 10.w),
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),
                        Text('4.5', style: TextStyle(fontSize: 12.sp)),
                      ],
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      '₹199',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

