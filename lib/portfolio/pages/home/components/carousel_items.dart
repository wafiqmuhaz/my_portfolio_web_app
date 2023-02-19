// ignore_for_file: avoid_unnecessary_containers, always_use_package_imports, avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio_web_app/l10n/l10n.dart';
import '../../../models/carousel_item_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';

List<CarouselItemModel> carouselItems(
  double carouselContainerHeight,
  BuildContext context,
) {
  var l10n = context.l10n;
  return List.generate(
    5,
    (index) => CarouselItemModel(
      text: SizedBox(
        height: carouselContainerHeight,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.flutterDeveloper,
                    style: const TextStyle(
                      color: kCaptionColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                    // GoogleFonts.josefinSans(
                    //   color: kPrimaryColor,
                    //   fontWeight: FontWeight.w900,
                    //   fontSize: 18,
                    //   letterSpacing: 2,
                    // ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Wafiq Muhaz'.toUpperCase(),
                    style: const TextStyle(
                      color: kCaptionColor,
                      height: 1.5,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.3,
                    ),
                    // GoogleFonts.josefinSans(
                    //   fontSize: 40,
                    //   fontWeight: FontWeight.w900,
                    //   height: 1.3,
                    //   letterSpacing: 2.3,
                    // ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '${l10n.flutterEngineer}, ',
                        style: const TextStyle(
                          color: kCaptionColor,
                          fontSize: 15,
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.location_on,
                        color: kCaptionColor,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const Text(
                        'Indonesia',
                        style: TextStyle(
                          color: kCaptionColor,
                          fontSize: 15,
                          height: 1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
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
                          Utilty.openUrl('https://wafiqmuhaz.showwcase.com/');
                        },
                        child: Text(
                          l10n.letsTalk,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: SizedBox(
                    height: carouselContainerHeight - 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: AppConstants.socialLoginDatas
                          .map(
                            (e) => InkWell(
                              onTap: e.onTap,
                              child: Container(
                                width: 20,
                                height: 20,
                                margin: const EdgeInsets.all(10),
                                child: Image.asset(e.title),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      image: Container(
        child: Lottie.asset(
          AppConstants.devlottie,
        ),
        // SvgPicture.asset(AppConstants.guySvg, semanticsLabel: 'Guy Logo'),
      ),
    ),
  );
}
