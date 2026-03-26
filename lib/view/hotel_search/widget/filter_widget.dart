import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/controller/hotel_and_room/hotel_cubit/cubit.dart';
import 'package:xvisa/controller/hotel_and_room/hotel_cubit/state.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import '../../../controller/country_and_city/cubit.dart';

class HotelFilterWidget extends StatefulWidget {
  const HotelFilterWidget({super.key});

  @override
  State<HotelFilterWidget> createState() => _HotelFilterWidgetState();
}

class _HotelFilterWidgetState extends State<HotelFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
      builder: (context, state) {
          var cubit = HotelCubit.get(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: buildTextFieldDate(labelText: cubit.selectedDate??S.of(context)!.arrivedDate, onTap: ()async{
                    await cubit.selectDate(context);
                  }, ),
                ),
                Expanded(
                  child: buildTextFieldDate(labelText: cubit.selectedDate2??S.of(context)!.departureDate, onTap: ()async{
                    await cubit.selectDateOnther(context);
                  }),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocConsumer<CountryAndCityCubit, CountryAndCityState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Expanded(
                      child: buildDropdownButton(
                          onChange: (value) {
                            setState(() {
                              cubit.selectLocation = value;
                            });
                          },
                          hint: S.of(context)!.location,
                          item: CountryAndCityCubit.get(context).countries.map((value) {
                            return DropdownMenuItem(
                              value: value['id'].toString(),
                              child: Text(
                                value['name']['ar'],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000)
                                        .withOpacity(0.74)),
                              ),
                            );
                          }).toList(),
                          value: cubit.selectLocation),
                    );
                  },
                ),
                Expanded(
                  child: buildDropdownButton(
                      onChange: (value) {
                        setState(() {
                          cubit.selectStudyInsurance = value;
                        });
                      },
                      hint: S.of(context)!.numberOfRooms,
                      item: [19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1].map((value) {
                        return DropdownMenuItem(
                          value: value.toString(),
                          child: Text(
                            value.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000)
                                    .withOpacity(0.74)),
                          ),
                        );
                      }).toList(),
                      value: cubit.selectStudyInsurance),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
