import 'package:flutter/cupertino.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('17', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Text('NOV', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('2020')
                  ],
                ),
              ],
            ),
            Text('DIENSTAG')
          ],
        ),
      ],
    );
  }
}
