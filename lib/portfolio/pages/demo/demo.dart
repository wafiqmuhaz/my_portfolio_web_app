// ignore_for_file: unused_field, use_key_in_widget_constructors, use_colored_box, always_use_package_imports, use_super_parameters, lines_longer_than_80_chars, avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/home.dart';
import '../../utils/screen_helper.dart';
import '../home/components/footer.dart';
import '../home/components/header.dart';

class DemoScreen extends ConsumerStatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends ConsumerState<DemoScreen> {
  late HomeProvider _homeProvider;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _homeProvider = ref.read(homeProvider);
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context) ? 30 : 20,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        'Demos',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                        ),
                        // GoogleFonts.josefinSans(
                        //   fontWeight: FontWeight.w900,
                        //   fontSize: 36,
                        // ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'I would like to emphasize that the following projects are not entirely mine as some of them have been developed for the company I work for and some others for clients or clients of my clients, while the backend side is provided.',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                // DemoSection(
                //   projects: ProjectModel.demos,
                // ),
                const Footer()
              ],
            ),
          ),
        ),
        DemoHeader(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
    );
  }
}

class DemoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            HeaderLogo(),
          ],
        ),
      ),
    );
  }
}
