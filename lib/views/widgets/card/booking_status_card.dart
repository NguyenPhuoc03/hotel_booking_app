import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookingStatusCard extends StatefulWidget {
  BookingStatusCard({super.key, required this.labelButton});
  final String labelButton;

  @override
  State<BookingStatusCard> createState() => _BookingStatusCardState();
}

class _BookingStatusCardState extends State<BookingStatusCard> {
  late ThemeData myTheme;
  bool _isButtonDisabled = false;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text("Ten khách sạn ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: myTheme.textTheme.bodyLarge),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text("Số phòng: 3"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Check-in"),
                  Text("8:00"),
                  Text("12-Dec_2023"),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Check-out"),
                  Text("8:00"),
                  Text("12-Dec_2023"),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ 999", style: myTheme.textTheme.labelLarge),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange.shade400,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(120, 50),
                ),
                child: Text(
                  widget.labelButton,
                  style: myTheme.textTheme.titleMedium?.copyWith(
                    letterSpacing: 1.25,
                  ),
                ),
                onPressed: _isButtonDisabled
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
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: Text('OK',
                                    style: myTheme.textTheme.labelMedium),
                              ),
                            ],
                          ),
                        );

                        setState(() {
                          _isButtonDisabled = true;
                        });
                      },
              )
            ],
          ),
        ],
      ),
    );
  }
}
