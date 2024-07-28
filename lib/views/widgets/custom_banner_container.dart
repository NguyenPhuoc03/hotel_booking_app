import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/sightseeing_spot_model.dart';

// ignore: must_be_immutable
class CustomBannerContainer extends StatelessWidget {
  SightseeingSpot sightseeingSpot;
  CustomBannerContainer(
    this.sightseeingSpot, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(sightseeingSpot.url, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  sightseeingSpot.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
