import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarWidget(BuildContext context,
    {String? message}){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message!),));
}
