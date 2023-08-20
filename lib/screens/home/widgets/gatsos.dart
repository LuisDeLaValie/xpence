import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'graficas.dart';

class Gatsos extends StatelessWidget {
  const Gatsos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 1,
        initialPage: 0,
      ),
      items: [
        Graficas(data: generarData3(), periodo: Periodo.week),
        Graficas(data: generarData2(), periodo: Periodo.month),
        Graficas(data: generarData1(), periodo: Periodo.year),
      ],
    );
  }
}
