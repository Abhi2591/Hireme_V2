import 'package:flutter/material.dart';

void CustomSnackbar(BuildContext ctx, String msg){
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(msg)));
}