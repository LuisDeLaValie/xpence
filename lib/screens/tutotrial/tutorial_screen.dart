import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  TutorialScreenState createState() => TutorialScreenState();
}

class TutorialScreenState extends State<TutorialScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() {
    context.goNamed("home");
  }

  Widget _buildImage(String assetName, [double? width = 350]) {
    return SafeArea(
      child: Image.asset(
        assetName,
        width: width,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      // bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.blue,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      skip: const Text("Saltar"),
      next: const Text("Siguiente"),
      done: const Text("finalizar"),
      globalBackgroundColor: Colors.blue,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('assets/icon_app.png', 50),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Antes de empezar",
          body:
              "Introduzca su nombre y el monto con el que posee para empezar a calcular.",
          image: _buildImage('assets/images_tutorial/tut_img/mock1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tus gastos",
          body: "En esta sección puedes introducir tus gastos y clasificarlos",
          image: _buildImage('assets/images_tutorial/tut_img/mock2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "La grafica",
          body:
              "El ver un listado de gastos no siempre es facil de leer, con la ayuda de la grafica generada por la aplicacion, podras observar el flujo de tus gastos.",
          image: _buildImage('assets/images_tutorial/tut_img/mock3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Programa tus pagos",
          body:
              "Sabemos que ingresar todos tus pagos puede ser cansado. Por lo que hemos desarrollado una funcion que te permitira programar pagos periodicos, como tus sucripciones de streaming.",
          image: _buildImage('assets/images_tutorial/tut_img/mock4.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Observa tus gastos",
          body: "Another beautiful body text for this example onboarding",
          image: _buildImage('assets/images_tutorial/tut_img/mock5.png'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
      ],
      onDone: _onIntroEnd,
      onSkip: _onIntroEnd, // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
