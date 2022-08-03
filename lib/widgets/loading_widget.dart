import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapphttpfirebase/services/utils.dart';
import 'package:newsapphttpfirebase/widgets/vertical_spacing.dart';
import 'package:shimmer/shimmer.dart';

import '../consts/vars.dart';

class LoadingWidget extends StatefulWidget {
  LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(18);
  late Color baseShimmer, highlightShimmer, widgetShimmer;
  @override
  void didChangeDependencies() {
    var utils = Utils(context: context);
    baseShimmer = utils.baseShimmer;
    highlightShimmer = utils.highlightShimmer;
    widgetShimmer = utils.widgetShimmer;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).getScreenSize;
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ArticleShimmerEffect(
            highlightShimmer: highlightShimmer,
            baseShimmer: baseShimmer,
            size: size,
            borderRadius: borderRadius,
            widgetShimmer: widgetShimmer,
          );
        },
        itemCount: 20,
      ),
    );
  }
}

class ArticleShimmerEffect extends StatelessWidget {
  const ArticleShimmerEffect({
    Key? key,
    required this.highlightShimmer,
    required this.baseShimmer,
    required this.size,
    required this.borderRadius,
    required this.widgetShimmer,
  }) : super(key: key);

  final Color highlightShimmer;
  final Color baseShimmer;
  final Size size;
  final BorderRadius borderRadius;
  final Color widgetShimmer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Shimmer.fromColors(
                highlightColor: highlightShimmer,
                baseColor: baseShimmer,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.red[900],
                        height: size.height * 0.12,
                        width: size.height * 0.12,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.06,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: borderRadius,
                                color: widgetShimmer),
                          ),
                          VerticalSpacing(height: 5, child: Container()),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: size.height * 0.03,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: Colors.red[900]),
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    color: Colors.red[900],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: size.height * 0.03,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: borderRadius,
                                      color: Colors.red[900]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
