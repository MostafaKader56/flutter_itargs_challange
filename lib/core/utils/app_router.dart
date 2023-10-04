// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itargs_challange/core/utils/api_service.dart';
import 'package:flutter_itargs_challange/features/main/data/repos/download_and_cashe_mp3_repo/download_and_cashe_mp3_repo_impl.dart';
import 'package:flutter_itargs_challange/features/main/data/repos/load_audio_repo/load_audio_repo_impl.dart';
import 'package:flutter_itargs_challange/features/main/presentation/manager/download_and_cashe_mp3_cubit/download_and_cashe_mp3_cubit.dart';
import 'package:flutter_itargs_challange/features/main/presentation/manager/load_audio_cubit/load_audio_cubit.dart';
import 'package:flutter_itargs_challange/features/main/presentation/views/main_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/kHomeView';

  Duration animationDuration = const Duration(milliseconds: 300);
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 400),
            key: state.pageKey,
            child: const SplashView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(
                  animation,
                ),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 400),
            key: state.pageKey,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => DownloadAndCasheMp3Cubit(
                      DownloadAndCasheMp3RepoImpl(
                          apiService: ApiService(Dio()))),
                ),
                BlocProvider(
                  create: (context) => LoadAudioCubit(
                      LoadAudioRepoImpl(apiService: ApiService(Dio())))
                    ..loadAudio(),
                ),
              ],
              child: MainView(isChangingSettings: state.extra as bool?),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(
                  animation,
                ),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
