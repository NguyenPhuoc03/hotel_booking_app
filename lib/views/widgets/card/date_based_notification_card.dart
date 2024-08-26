import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

class DateBasedNotificationCard extends StatefulWidget {
  const DateBasedNotificationCard({super.key});

  @override
  State<DateBasedNotificationCard> createState() =>
      _DateBasedNotificationCardState();
}

class _DateBasedNotificationCardState extends State<DateBasedNotificationCard> {
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today (3)",
                style: myTheme.textTheme.displayMedium,
              ),
              MenuAnchor(
                builder: (BuildContext context, MenuController controller,
                    Widget? child) {
                  return IconButton(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    icon: const Icon(Icons.more_horiz),
                    tooltip: 'Show menu',
                  );
                },
                menuChildren: [
                  MenuItemButton(
                    onPressed: () {
                      print('Read được chọn');
                    },
                    child: Text(
                      'Mark as Read',
                      style: myTheme.textTheme.titleSmall
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SeparatedColumn(
            includeOuterSeparators: false,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 2,
            ),
            children: [
              for (int i = 0; i < 3; i++)
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.checklist_sharp,
                    size: 46,
                  ),
                  title: Text(
                      "Your stay at Hotel Venice Royal is booked in 2 days!",
                      style: myTheme.textTheme.bodyMedium
                      //read myTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
                      ),
                  subtitle: Text(
                    "19 min ago",
                    style: myTheme.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    //read myTheme.textTheme.bodySmall
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
