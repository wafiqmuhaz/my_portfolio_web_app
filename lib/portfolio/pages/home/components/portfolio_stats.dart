// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, always_use_package_imports, lines_longer_than_80_chars, avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/stat.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import '../../../utils/utils.dart';

final List<Stat> stats = [
  // Stat(count: '43', text: 'Clients'),
  Stat(count: '4+', text: 'Projects'),
  Stat(count: '10', text: 'Certificates'),
  Stat(count: '1', text: 'Years\nExperience'),
];

class PortfolioStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Container(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: stats.map((stat) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  // Just use the helper here really
                  width: ScreenHelper.isMobile(context)
                      ? constraint.maxWidth / 2 - 20
                      : (constraint.maxWidth / 4 - 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Utilty.openUrl(
                            'https://wafiqmuhaz.showwcase.com/',
                            // 'https://github.com/AgnelSelvan/AgnelSelvan.github.io/raw/main/assets/files/Agnel-Selvan.pdf',
                          );
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            stat.count,
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                            ),
                            // GoogleFonts.josefinSans(
                            //   fontWeight: FontWeight.w700,
                            //   fontSize: 32,
                            // ),
                          ),
                        ),
                      ),
                      // Text(
                      //   stat.count,
                      //   style: GoogleFonts.josefinSans(
                      //     fontWeight: FontWeight.w700,
                      //     fontSize: 32,
                      //   ),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        stat.text,
                        style: const TextStyle(
                          fontSize: 16,
                          color: kCaptionColor,
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
