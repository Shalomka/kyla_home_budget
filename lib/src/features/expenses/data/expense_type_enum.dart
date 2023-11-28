import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ExpenseType enum with font awesome icons
enum ExpenseType {
  coffee(FontAwesomeIcons.coffee),
  food(FontAwesomeIcons.utensils),
  shopping(FontAwesomeIcons.shoppingBag),
  commute(FontAwesomeIcons.bus),
  car(FontAwesomeIcons.car),
  bills(FontAwesomeIcons.fileInvoice),
  travel(FontAwesomeIcons.plane),
  health(FontAwesomeIcons.heartbeat),
  pets(FontAwesomeIcons.paw),
  unassigned(FontAwesomeIcons.question),
  ;

  final IconData icon;

  const ExpenseType(this.icon);
}
