import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/hotel_search/widget/list_filter_hotel_details.dart';
import 'package:flutter/material.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultScaffold(
        context: context,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            ListFilterHotelDetailsWidget()
          ],
        ),
      )
    );
  }
}
