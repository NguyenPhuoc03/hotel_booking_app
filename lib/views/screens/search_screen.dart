import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/local_storage.dart';
import 'package:hotel_booking_app/utils/shared_preferences_keys.dart';
import 'package:hotel_booking_app/viewmodels/hotel_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/card/recent_search_card.dart';
import 'package:hotel_booking_app/views/widgets/card/search_result_hotel_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late ThemeData myTheme;
  late FocusNode _focusNode;
  late HotelViewmodel _viewmodel;
  bool _isDisableSurfixIcon = false;
  List<String> _searchHistory = [];
  late bool _showHistory;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _showHistory = true;
    _getSearchHistory();
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
                    prefixIcon: const Icon(Icons.search, size: 28),
                    suffix: _isDisableSurfixIcon
                        ? null
                        : IconButton(
                            onPressed: _searchController.clear,
                            icon: const Icon(Icons.close)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onTap: () {
                    _focusNode.requestFocus();
                    setState(() {
                      _showHistory = true;
                      _isDisableSurfixIcon = false;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      _showHistory = false;
                      _isDisableSurfixIcon = true;
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
          _searchHistory.isEmpty
              ? const Center(child: Text('No search history'))
              : Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _searchHistory.length >= 5
                          ? 5
                          : _searchHistory.length,
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
                    TextButton(
                      child: Text(
                        "Clear search history",
                        style: myTheme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                      onPressed: () {
                        _clearHistory();
                      },
                    ),
                  ],
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

  void _getSearchHistory() async {
    List<String> history =
        await LocalStorage.getStringList(SharedPreferencesKeys.history);

    setState(() {
      _searchHistory = history;
    });
  }

  void _saveHistory(String query) async {
    if (!_searchHistory.contains(query)) {
      _searchHistory.insert(0, query);
    }

    await LocalStorage.setStringList(
        SharedPreferencesKeys.history, _searchHistory);
  }

  void _clearHistory() async {
    setState(() {
      _searchHistory.clear();
    });
    await LocalStorage.setStringList(
        SharedPreferencesKeys.history, _searchHistory);
  }
}
