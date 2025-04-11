import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/config/colors/colors.dart';
import 'package:cineverse/widget/fade_text.dart';
import 'package:cineverse/widget/shimmer_card.dart';
import 'package:cineverse/widget/shimmer_image.dart';
import 'package:cineverse/widget/title.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class CardRow<T> extends StatelessWidget {
  const CardRow(
      {super.key,
      this.mini = false,
      required this.title,
      required this.items,
      required this.onRefresh,
      required this.onTap,
      required this.getLink,
      required this.getName,
      this.refreshable = true});

  final String title;
  final bool mini;
  final List? items;
  final Future Function() onRefresh;
  final bool refreshable;
  final Function(T item) onTap;
  final String Function(T item) getLink;
  final String Function(T item) getName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    list(List items) => ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            final item = items[i];
            final imageLink = getLink(item);

            return GestureDetector(
              onTap: () => onTap(item),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width / 3,
                      child: cardRowContents(imageLink, size, item),
                    ),
                  ),
                  const FadeText(),
                ],
              ),
            );
          },
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: MyTitle(title: title),
        ),
        SizedBox(
          height: size.height / 2.8,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: items == null
                    ? ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => ShimmerCard(mini: mini),
                      )
                    : refreshable
                        ? CustomMaterialIndicator(
                            trigger: IndicatorTrigger.trailingEdge,
                            onRefresh: onRefresh,
                            child: list(items!),
                          )
                        : list(items!),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget cardRowContents(imageLink, size, item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: imageLink.endsWith('null')
              ? Container(
                  height: size.width / 2,
                  width: size.width / 3,
                  color: lightNavy,
                  child: const Center(
                    child: Icon(Icons.person_rounded, size: 50),
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: imageLink,
                  placeholder: (context, _) => const ShimmerImage(),
                ),
        ),
        const SizedBox(height: 10),
        Text(getName(item), maxLines: 3)
      ],
    );
  }
}
