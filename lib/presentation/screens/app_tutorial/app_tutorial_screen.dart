import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Laborum proident sunt elit velit laboris. Non esse ut tempor velit irure mollit enim excepteur. Dolore ullamco amet fugiat veniam nulla cupidatat laborum velit. Culpa commodo aliquip deserunt enim sunt nisi quis elit duis velit nisi quis nisi. Fugiat nisi dolore id eu dolore. Occaecat ullamco culpa labore nisi occaecat velit sunt. Irure excepteur culpa irure ipsum cillum occaecat aliquip consequat anim occaecat ut laboris elit nisi.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Aliqua adipisicing cupidatat dolor id excepteur reprehenderit nostrud velit officia ea. Et sit ad Lorem esse labore commodo duis dolore velit ullamco. Eu id irure consectetur incididunt nisi eu cillum. Aliquip consequat ea cillum elit irure irure culpa anim. Occaecat nostrud id proident enim commodo cillum non veniam est consequat Lorem aliquip commodo non. Proident proident et esse minim consectetur anim dolor ad nostrud.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Adipisicing culpa eiusmod culpa enim irure voluptate fugiat commodo aliquip deserunt mollit velit in. Sit laborum magna magna officia Lorem pariatur. Enim reprehenderit amet mollit exercitation excepteur dolore ea et dolor irure. Eu reprehenderit dolor nostrud non in ad velit magna mollit ut duis aliqua.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  void disponse() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl,
                    ))
                .toList(),
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('salir'))),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar')),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titlestyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Text(
            title,
            style: titlestyle,
          ),
          const SizedBox(height: 10),
          Text(
            caption,
            style: captionStyle,
          ),
        ],
      ),
    );
  }
}
