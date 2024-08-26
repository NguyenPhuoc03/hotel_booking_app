import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/tab_bar_view/login_tab_bar_view.dart';
import 'package:hotel_booking_app/views/widgets/tab_bar_view/signup_tab_bar_view.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late ThemeData myTheme;
  late Size mediaSize;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myTheme.primaryColor,
        image: DecorationImage(
            image: const AssetImage('assets/images/bg_login.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                myTheme.primaryColor.withOpacity(0.2), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
        width: mediaSize.width,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: myTheme.textTheme.headlineLarge,
                ),
                Text(
                  "Welcome back to the best. We're always here, waiting for you!",
                  style: myTheme.textTheme.headlineSmall,
                ),
              ],
            )));
  }

  Widget _buildBottom() {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SizedBox(
        width: mediaSize.width,
        height: mediaSize.height * 0.75,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelPadding: const EdgeInsets.symmetric(vertical: 10.0),
              labelColor: myTheme.primaryColor,
              labelStyle: myTheme.textTheme.bodyMedium,
              unselectedLabelColor: Colors.grey.shade700,
              unselectedLabelStyle: myTheme.textTheme.bodyMedium,
              indicator: UnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 2.0, color: myTheme.primaryColor)),
              tabs: const [
                Center(
                  child: Text("Login"),
                ),
                Center(
                  child: Text("Signup"),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  LoginTabBarView(),
                  SignupTabBarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
