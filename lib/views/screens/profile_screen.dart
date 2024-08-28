import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/list_title/profile_item_list_title.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 80.0,
        title: const ListTile(
          leading: CircleAvatar(
            radius: 27,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWVsm9smljjDm9Ta08_It5JxUFPKIO6ZPfbA&s'),
          ),
          title: Text(
            "Nguyễn Huỳnh Phước",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ProfileItemListTitle(
              leading: Icon(Icons.manage_accounts_rounded),
              title: "Edit profile",
            ),
            Divider(
              height: 4,
            ),
            ProfileItemListTitle(
              leading: Icon(Icons.help_sharp),
              title: "Help",
            ),
            Divider(
              height: 4,
            ),
            ProfileItemListTitle(
              leading: Icon(Icons.help_sharp),
              title: "Help",
            ),
            Divider(
              height: 4,
            ),
            ProfileItemListTitle(
              leading: Icon(Icons.logout),
              title: "Log out",
            ),
            Divider(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
