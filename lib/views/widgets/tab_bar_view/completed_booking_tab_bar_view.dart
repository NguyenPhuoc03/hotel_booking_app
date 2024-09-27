import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_app/models/booking.dart';
import 'package:hotel_booking_app/viewmodels/review_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/card/booking_status_card.dart';
import 'package:provider/provider.dart';

class CompletedBookingTabBarView extends StatefulWidget {
  CompletedBookingTabBarView({super.key, required this.completedBookings});
  final List<Booking> completedBookings;

  @override
  State<CompletedBookingTabBarView> createState() =>
      _CompletedBookingTabBarViewState();
}

class _CompletedBookingTabBarViewState
    extends State<CompletedBookingTabBarView> {
  late ThemeData myTheme;
  late double star;

  @override
  void initState() {
    super.initState();
    star = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    bool _isButtonDisabled = false;
    myTheme = Theme.of(context);
    return ListView.builder(
        itemCount: widget.completedBookings.length,
        itemBuilder: (context, item) {
          final booking = widget.completedBookings[item];
          return BookingStatusCard(
              labelButton: "Review",
              booking: booking,
              onPressed: () {
                _isButtonDisabled
                    ? null
                    : () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            actionsPadding: const EdgeInsets.only(bottom: 12),
                            title: const Text(
                              'Please rate your experience',
                            ),
                            titleTextStyle: myTheme.textTheme.bodyMedium,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: RatingBar.builder(
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                                setState(() {
                                  star = rating;
                                });
                              },
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text(
                                  'Cancel',
                                  style: myTheme.textTheme.labelMedium,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final reviewViewModel =
                                      Provider.of<ReviewViewmodel>(context,
                                          listen: false);
                                  await reviewViewModel.createNewReview(
                                    booking,
                                    star,
                                  );
                                  Navigator.pop(context, 'OK');
                                },
                                child: Text('OK',
                                    style: myTheme.textTheme.labelMedium),
                              ),
                            ],
                          ),
                        );

                        setState(() {
                          _isButtonDisabled = true;
                        });
                      };
              });
        });
  }
}
