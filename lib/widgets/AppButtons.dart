import 'package:flutter/material.dart';

class AppButtons {
  Widget primary_button({callback, label, isdissable,width,height}) => Container(
        width: width??366,
        height: height??48,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: callback,
                child: Container(
                  height: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: ShapeDecoration(
                    color: isdissable == true
                        ? Color(0xFF33363C)
                        : Color(0xFFF2AA4C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        label ?? 'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isdissable == true
                              ? Colors.white.withOpacity(0.4000000059604645)
                              : Color(0xFF00040C),
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  Widget secondry_button({ontap, title}) => Container(
        width: 366,
        height: 48,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: ontap,
                child: Container(
                  height: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: ShapeDecoration(
                    color: Color(0xFF33363C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.28),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title ?? 'Login with mobile number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                          letterSpacing: -0.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
