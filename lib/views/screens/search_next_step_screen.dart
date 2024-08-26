import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/card/recent_search_card.dart';
import 'package:hotel_booking_app/views/widgets/card/search_result_hotel_card.dart.dart';

class SearchNextStepScreen extends StatefulWidget {
  const SearchNextStepScreen({super.key});

  @override
  State<SearchNextStepScreen> createState() => _SearchNextStepScreenState();
}

class _SearchNextStepScreenState extends State<SearchNextStepScreen> {
  TextEditingController _searchController = TextEditingController();
  late ThemeData myTheme;
  late FocusNode _focusNode;
  bool _showHistory = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: _focusNode,
                  controller: _searchController,
                  style: myTheme.textTheme.displayMedium,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: myTheme.textTheme.displayMedium,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (query) {
                    setState(() {
                      _showHistory = true;
                    });
                  },
                  onFieldSubmitted: (query) {
                    setState(() {
                      _showHistory = false;
                    });
                  },
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey,
              height: 1.0,
            ),
          ),
        ),
        body: _showHistory ? _buildRecentSearch() : _buildHotelList());
  }

  //recent search
  Widget _buildRecentSearch() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent searches"),
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return RecentSearchCard();
            },
          ))
        ],
      ),
    );
  }

  //after submit
  Widget _buildHotelList() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 16,
            itemBuilder: (context, index) {
              return SearchResultHotelCard();
            },
          ))
        ],
      ),
    );
  }
}
