// ignore_for_file: avoid_unnecessary_containers, always_use_package_imports, unnecessary_lambdas, lines_longer_than_80_chars, use_super_parameters, avoid_redundant_argument_values, prefer_final_locals

import 'package:flutter/material.dart';
import 'package:my_portfolio_web_app/l10n/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/footer_item.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import '../../../utils/utils.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconData: Icons.location_on,
    title: 'ADDRESS',
    text1: 'Soreang, Bandung',
    text2: 'Indonesia',
    onTap: () {
      Utilty.openMyLocation();
    },
  ),
  FooterItem(
    iconData: Icons.phone,
    title: 'PHONE',
    text1: '+62 8995258011',
    text2: '',
    onTap: () {
      Utilty.openMyPhoneNo();
    },
  ),
  FooterItem(
    iconData: Icons.mail,
    title: 'EMAIL',
    text1: 'wafiqmuhaz@gmail.com',
    text2: '',
    onTap: () {
      Utilty.openMail();
    },
  ),
  FooterItem(
    iconData: Icons.sms,
    title: 'WHATSAPP',
    text1: '+62 8995258011',
    text2: '',
    onTap: () {
      Utilty.openWhatsapp();
    },
  ),
];

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

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
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var l10n = context.l10n;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: footerItems
                      .map(
                        (footerItem) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            onTap: footerItem.onTap,
                            child: SizedBox(
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2 - 20
                                  : constraints.maxWidth / 4 - 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        footerItem.iconData,
                                        color: kPrimaryColor,
                                        size: 28,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        footerItem.title,
                                        style: const TextStyle(
                                          color: kCaptionColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        // GoogleFonts.josefinSans(
                                        //   fontSize: 18,
                                        //   fontWeight: FontWeight.w700,
                                        // ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${footerItem.text1}\n',
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${footerItem.text2}\n',
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      l10n.kEndFooter,
                      style: const TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
