import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/domain/entity/base.dart';

double heightQuery(BuildContext ctx, int percent) {
  return ctx.mediaQuery.size.height * (percent / 100);
}

double widthQuery(BuildContext ctx, int percent) {
  return ctx.mediaQuery.size.width * (percent / 100);
}

extension IsNull on BaseEntity? {
  bool get isNotNull => this != null;
}

extension IsListNull on Iterable<BaseEntity>? {
  bool get isNotNull => this != null;
}
