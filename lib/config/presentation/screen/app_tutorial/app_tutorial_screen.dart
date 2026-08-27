import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  new(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Welcome', 'to the', 'assets/Images/1.png'),
  SlideInfo('Goodbye', 'my dear', 'assets/Images/2.png'),
  SlideInfo('Enjoy it!', 'sweetie', 'assets/Images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  const new({super.key});

  static const name = 'app_tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController = PageController();
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!lastPage && page >= (slides.length - 1.5)) {
        setState(() {
          lastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
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
                .map(
                  (data) => _Slide(
                    title: data.title,
                    caption: data.caption,
                    imageUrl: data.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Return'),
            ),
          ),
          lastPage
              ? Positioned(
                  right: 30,
                  bottom: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {
                        pageViewController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );

                        setState(() {
                          lastPage = false;
                        });
                      },
                      child: const Text('Start'),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const new({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final (titleLarge, bodySmall) = (theme.titleLarge, theme.bodySmall);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20),
            Text(title, style: titleLarge),
            const SizedBox(height: 10),
            Text(caption, style: bodySmall),
          ],
        ),
      ),
    );
  }
}
