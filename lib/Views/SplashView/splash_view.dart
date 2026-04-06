import 'dart:async';

import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Views/SplashView/models/splash_info_model.dart';
import 'package:chatface/Views/SplashView/widgets/splash_widget.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/blurred_gradient_background.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/constants.dart';
import 'package:cross_fade/cross_fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showInitialSplash = useState<bool>(true);

    final currentPage = useState<int>(0);
    final autoScrollTimer = useRef<Timer?>(null);

    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () async {
        final authRepo = ref.read(AllProviders.authRepositoryProvider);
        final isLoggedIn = await authRepo.isLoggedIn();

        if (!context.mounted) return;

        if (isLoggedIn) {
          Navigator.of(context).pushReplacementNamed('/main');
        } else {
          showInitialSplash.value = false;
        }
      });
      return null;
    }, []);

    final splashData = [
      SplashInfoModel(
        imagePath: AppImages.splash1,
        title: context.t.splash.screen1.title,
        description: context.t.splash.screen1.description,
      ),
      SplashInfoModel(
        imagePath: AppImages.splash2,
        title: context.t.splash.screen2.title,
        description: context.t.splash.screen2.description,
      ),
    ];

    void startAutoScroll() {
      autoScrollTimer.value?.cancel();
      autoScrollTimer.value = Timer.periodic(const Duration(seconds: 3), (
        timer,
      ) {
        if (currentPage.value < splashData.length - 1) {
          currentPage.value++;
        } else {
          currentPage.value = 0;
        }
      });
    }

    void resetAutoScroll() {
      autoScrollTimer.value?.cancel();
      startAutoScroll();
    }

    useEffect(() {
      if (!showInitialSplash.value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          startAutoScroll();
        });
      }
      return () {
        autoScrollTimer.value?.cancel();
      };
    }, [showInitialSplash.value]);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CrossFade<bool>(
        value: showInitialSplash.value,
        duration: const Duration(milliseconds: 800),
        builder: (context, isInitialSplash) {
          if (isInitialSplash) {
            return const _InitialSplashScreen();
          } else {
            return GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  if (currentPage.value > 0) {
                    currentPage.value--;
                    resetAutoScroll();
                  }
                } else if (details.primaryVelocity! < 0) {
                  if (currentPage.value < splashData.length - 1) {
                    currentPage.value++;
                    resetAutoScroll();
                  }
                }
              },
              child: CrossFade<int>(
                value: currentPage.value,
                duration: const Duration(milliseconds: 400),
                builder: (context, page) {
                  return SplashWidget(
                    image: splashData[page].imagePath,
                    title: splashData[page].title,
                    subtitle: splashData[page].description,
                    currentPage: page,
                    totalPages: splashData.length,
                    onGetStarted: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class _InitialSplashScreen extends StatelessWidget {
  const _InitialSplashScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BlurredGradientBackground(),

          Align(
            alignment: const Alignment(0, 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _SplashLogo(),
                SizedBox(height: 8),
                _SplashTitle(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SplashLogo extends StatelessWidget {
  const _SplashLogo();

  @override
  Widget build(BuildContext context) {
    const double logoSize = 140;

    return Container(
      width: logoSize,
      height: logoSize,

      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Builder(
          builder: (context) {
            final dpr = MediaQuery.devicePixelRatioOf(context);
            final int targetDecodeWidth = (logoSize * dpr).round().clamp(
              128,
              1024,
            );

            return Center(
              child: Image(
                image: ResizeImage(
                  const AssetImage(AppIcons.appLogo),
                  width: targetDecodeWidth,
                  policy: ResizeImagePolicy.exact,
                ),
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                isAntiAlias: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SplashTitle extends StatelessWidget {
  const _SplashTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      Constants.appName,
      style: GoogleFonts.urbanist(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.05,
        height: 32 / 24,
        color: Colors.white,
      ),
    );
  }
}
