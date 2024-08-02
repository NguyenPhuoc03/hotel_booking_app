import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardHotelDetail extends StatelessWidget {
  CardHotelDetail({super.key});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
                fit: BoxFit.cover,
                "https://cdn3.ivivu.com/2014/01/SUPER-DELUXE2.jpg"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Home Deatail",
                style: myTheme.textTheme.bodyLarge,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    dense: true,
                    visualDensity:
                        VisualDensity(vertical: VisualDensity.minimumDensity),
                    leading: Icon(Icons.abc_sharp),
                    title: Text(
                      "Wifi",
                      style: myTheme.textTheme.bodySmall,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity:
                        VisualDensity(vertical: VisualDensity.minimumDensity),
                    leading: Icon(Icons.wifi),
                    title: Text(
                      "Wifi",
                      style: myTheme.textTheme.bodySmall,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity:
                        VisualDensity(vertical: VisualDensity.minimumDensity),
                    leading: Icon(Icons.bathtub_sharp),
                    title: Text(
                      "Bath",
                      style: myTheme.textTheme.bodySmall,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "\$ 1480",
                        style: myTheme.textTheme.labelLarge,
                      ),
                      subtitle: Text(
                        "1 night",
                        style: myTheme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: Size(120, 60),
                    ),
                    child: Text(
                      "Select",
                      style: myTheme.textTheme.titleLarge?.copyWith(
                        letterSpacing: 1.25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ]));
  }
}
