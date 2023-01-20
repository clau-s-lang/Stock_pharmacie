import 'package:flutter/material.dart';

class Image_produit extends StatelessWidget {
  const Image_produit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Icon(
        Icons.image,
        color: Colors.grey,
      ),
    );
  }
}