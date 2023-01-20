import 'package:flutter/material.dart';


class DetailRapport extends StatelessWidget {
  const DetailRapport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.only(top: 7, left: 15, right: 15),
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:EdgeInsets.all(10.0),
                  child: Icon(Icons.data_saver_on_sharp, color: Colors.blue,size: 38,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Anti-malaria',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('\$200 restant'),
                  ],
                ),
                SizedBox(width: 70,),
                Padding(
                  padding:  EdgeInsets.only(top: 17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$1200', style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green
                      ),),
                      Text('\$500 sur 1200', style: TextStyle(fontSize: 12),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

