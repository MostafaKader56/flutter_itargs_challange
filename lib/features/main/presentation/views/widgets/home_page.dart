import 'package:flutter/material.dart';

import 'listen_audios_section.dart';
import 'top_likes_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [TopLikesSection(), ListenAudiosSection()],
        ),
      ),
    );
  }
}
