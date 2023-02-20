// ignore_for_file: lines_longer_than_80_chars, always_use_package_imports, use_super_parameters, avoid_redundant_argument_values, prefer_final_locals, use_decorated_box

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio_web_app/l10n/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/technology.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          var l10n = context.l10n;
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            // defaultScale: false,
            child: Flex(
              direction:
                  constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: constraints.maxWidth > 720 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        l10n.kAboutMe,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                          fontSize: 35,
                        ),
                        // GoogleFonts.josefinSans(
                        //   fontWeight: FontWeight.w900,
                        //   height: 1.3,
                        //   fontSize: 35,
                        // ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        l10n.kAboutMeTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                          fontSize: 35,
                        ),
                        // GoogleFonts.josefinSans(
                        //   fontWeight: FontWeight.bold,
                        //   height: 1.3,
                        //   fontSize: 24,
                        // ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        l10n.kAboutMeDesc,
                        style: const TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        l10n.kAboutMeDesc2,
                        style: const TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        l10n.kTechStack,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer(
                        builder: (context, ref, _) {
                          return ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: TechnologyConstants.technologyLearned
                                    .map(
                                      (e) => MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ref
                                                    .watch(themeProvider)
                                                    .isDarkMode
                                                ? Colors.grey[800]
                                                : Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 6,
                                          ),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: Image.asset(e.logo),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    e.name,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                if (ScreenHelper.isDesktop(context) ||
                    ScreenHelper.isTablet(context))
                  Expanded(
                    flex: constraints.maxWidth > 720 ? 1 : 0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        child: Image.asset(
                          AppConstants.meImages,
                          width: constraints.maxWidth > 720 ? null : 350,
                        ),
                      ),
                    ),
                    // SvgPicture.asset(
                    //   AppConstants.personSvg,
                    //   width: constraints.maxWidth > 720 ? null : 350,
                    // ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
