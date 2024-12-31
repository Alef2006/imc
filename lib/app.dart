

import 'package:calc_imc/page_calc_imc.dart';
import 'package:flutter/material.dart';

class AppImc extends StatefulWidget {
  const AppImc({super.key});

  @override
  State<AppImc> createState() => _AppImcState();
}

class _AppImcState extends State<AppImc> {
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PageCalcImc(),
    );
  }
}