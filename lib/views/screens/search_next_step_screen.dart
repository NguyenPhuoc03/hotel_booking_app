import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/local_storage.dart';
import 'package:hotel_booking_app/utils/shared_preferences_keys.dart';
import 'package:hotel_booking_app/viewmodels/hotel_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/card/recent_search_card.dart';
import 'package:hotel_booking_app/views/widgets/card/search_result_hotel_card.dart.dart';
import 'package:provider/provider.dart';

class SearchNextStepScreen extends StatefulWidget {
  const SearchNextStepScreen({super.key});

  @override
  State<SearchNextStepScreen> createState() => _SearchNextStepScreenState();
}

class _SearchNextStepScreenState extends State<SearchNextStepScreen> {
  final TextEditingController _searchController = TextEditingController();
  late ThemeData myTheme;
  late FocusNode _focusNode;
  late HotelViewmodel _viewmodel;
  List<String> _searchHistory = [];
  bool _showHistory = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });

    _getsearchHistory();
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
    _viewmodel = Provider.of<HotelViewmodel>(context);
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
                  onTap: () {
                    setState(() {
                      _showHistory = true;
                    });
                  },
                  onChanged: (query) {
                    setState(() {
                      _showHistory = true;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      _showHistory = false;
                    });
                    if (value.isNotEmpty) {
                      _viewmodel.getHotelsBySearch(value);
                      _saveHistory(value);
                    }
                  },
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Recent searches"),
          Expanded(
            child: _searchHistory.isEmpty
                ? Center(child: Text('No search history'))
                : ListView.builder(
                    itemCount:
                        _searchHistory.length >= 5 ? 5 : _searchHistory.length,
                    itemBuilder: (context, index) {
                      return RecentSearchCard(
                        label: _searchHistory[index],
                        onTap: () {
                          setState(() {
                            _searchController.text = _searchHistory[index];
                          });
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  //after submit
  Widget _buildHotelList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: _viewmodel.searchHotels.length,
            itemBuilder: (context, index) {
              final hotel = _viewmodel.searchHotels[index];
              return SearchResultHotelCard(hotel: hotel);
            },
          ))
        ],
      ),
    );
  }

  void _getsearchHistory() async {
    _searchHistory =
        await LocalStorage.getStringList(SharedPreferencesKeys.history);
  }

  void _saveHistory(String query) async {
    if (!_searchHistory.contains(query)) {
      _searchHistory.insert(0, query);
    }

    await LocalStorage.setStringList(
        SharedPreferencesKeys.history, _searchHistory);
  }
}
