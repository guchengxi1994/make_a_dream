import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/isar/player_record.dart';
import 'package:badges/badges.dart' as badges;

class AchievementWidget extends StatefulWidget {
  const AchievementWidget({super.key, required this.achievement});
  final Achievement achievement;

  @override
  State<AchievementWidget> createState() => _AchievementWidgetState();
}

class _AchievementWidgetState extends State<AchievementWidget> {
  bool onHover = false;
  late final DateTime d =
      DateTime.fromMillisecondsSinceEpoch(widget.achievement.createAt);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          onHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          onHover = false;
        });
      },
      child: badges.Badge(
        badgeContent: Visibility(
            visible: onHover,
            child: Text(
              "${d.year}.${d.month}.${d.day}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )),
        badgeStyle: onHover
            ? badges.BadgeStyle(
                shape: badges.BadgeShape.square,
                badgeColor: Colors.blue,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(4),
                elevation: 0,
              )
            : const badges.BadgeStyle(
                badgeColor: Colors.transparent,
              ),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: 200,
            height: 50,
            child: Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  width: 50,
                  height: 50,
                  child: ExtendedImage.asset(widget.achievement.iconPath ?? "",
                      shape: BoxShape.rectangle, loadStateChanged: (state) {
                    switch (state.extendedImageLoadState) {
                      case LoadState.completed:
                        return null;
                      case LoadState.failed:
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 40,
                        );

                      default:
                        return const CircularProgressIndicator();
                    }
                  }),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.achievement.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Text(widget.achievement.description,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
