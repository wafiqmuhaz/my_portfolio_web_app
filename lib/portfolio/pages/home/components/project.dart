// ignore_for_file: avoid_unnecessary_containers, use_super_parameters, sort_constructors_first, always_put_required_named_parameters_first, lines_longer_than_80_chars, always_use_package_imports, prefer_single_quotes, prefer_if_elements_to_conditional_expressions, unused_local_variable, prefer_final_locals

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio_web_app/l10n/l10n.dart';

import '../../../models/project.dart';
import '../../../provider/theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import '../../../utils/utils.dart';

class ProjectSection extends StatelessWidget {
  final List<ProjectModel> projects;
  const ProjectSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: projects
              .map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: _buildProject(
                    width,
                    e,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Center _buildProject(double width, ProjectModel projectModel) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          var l10n = context.l10n;
          return SizedBox(
            width: width,
            child: Consumer(
              builder: (context, ref, _) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ref.watch(themeProvider).isDarkMode
                        ? const Color.fromARGB(75, 12, 12, 7)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Flex(
                    direction: ScreenHelper.isMobile(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    children: [
                      SizedBox(
                        width: ScreenHelper.isMobile(context)
                            ? width * 0.9
                            : width * 0.46,
                        child: Image.asset(
                          projectModel.appPhotos,
                          width: constraints.maxWidth > 720 ? null : 350,
                          height: 250,
                        ),
                      ),

                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: ScreenHelper.isMobile(context)
                            ? width * 0.9
                            : width * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              projectModel.project,
                              style: const TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                              //  GoogleFonts.josefinSans(
                              //   color: kPrimaryColor,
                              //   fontWeight: FontWeight.w900,
                              //   fontSize: 16,
                              // ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              projectModel.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                height: 1.3,
                                fontSize: 28,
                              ),
                              // style: GoogleFonts.josefinSans(
                              //   fontWeight: FontWeight.w900,
                              //   height: 1.3,
                              //   fontSize: 28,
                              // ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              projectModel.description,
                              style: const TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            projectModel.techUsed.isEmpty
                                ? Container()
                                : const Text(
                                    "Technologies Used",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                    // style: GoogleFonts.josefinSans(
                                    //   fontWeight: FontWeight.w900,
                                    //   fontSize: 16,
                                    // ),
                                  ),
                            Wrap(
                              children: projectModel.techUsed
                                  .map(
                                    (e) => Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 25,
                                      color:
                                          e.logo == AppConstants.razorPayImage
                                              ? Colors.white
                                              : null,
                                      height: 25,
                                      child: Image.asset(e.logo),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height: 48,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Utilty.openUrl(
                                          projectModel.projectLink,
                                        );
                                      },
                                      child: Center(
                                        child: Text(
                                          (projectModel.buttonText ??
                                                  "Explore MORE")
                                              .toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                      // Expanded(
                      //   flex: constraints.maxWidth > 720 ? 1 : 0,
                      //   child: ,
                      // )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
