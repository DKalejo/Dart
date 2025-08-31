import 'package:flutter/material.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Your Budget',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 14,
                  ),
                ),

                SizedBox(width: 2),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: '2.868.000,'),
                      TextSpan(
                        text: '00',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
