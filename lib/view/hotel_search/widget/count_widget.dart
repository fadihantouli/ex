import 'package:xvisa/controller/hotel_and_room/hotel_cubit/cubit.dart';
import 'package:xvisa/controller/hotel_and_room/hotel_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class HotelCountWidget extends StatefulWidget {
  const HotelCountWidget({super.key});

  @override
  State<HotelCountWidget> createState() => _HotelCountWidgetState();
}

class _HotelCountWidgetState extends State<HotelCountWidget> {
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
                Column(
                  children: [
                    Text(S.of(context)!.adult, style: Theme.of(context).textTheme.bodyLarge,),
                    const SizedBox(height: 5,),
                     Text(S.of(context)!.aboveyrs, style: TextStyle(color: Color(0xff8E8E8E), fontSize: 8, fontWeight: FontWeight.w400),),

                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          cubit.adultCount--;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xffD2EAFF),
                        child: Icon(Icons.minimize, color: Color(0xff027FEE),),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text("${cubit.adultCount}", style: Theme.of(context).textTheme.bodyLarge,),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          cubit.adultCount++;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xffD2EAFF),
                        child: Icon(Icons.add, color: Color(0xff027FEE),),
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$ 0.00",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Color(0xffD9D9D9),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                  children: [
                    Text(S.of(context)!.children, style: Theme.of(context).textTheme.bodyLarge,),
                    const SizedBox(height: 5,),
                     Text(S.of(context)!.underyrs, style: TextStyle(color: Color(0xff8E8E8E), fontSize: 8, fontWeight: FontWeight.w400),),

                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          cubit.childCount--;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xffD2EAFF),
                        child: Icon(Icons.minimize, color: Color(0xff027FEE),),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text("${cubit.childCount}", style: Theme.of(context).textTheme.bodyLarge,),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          cubit.childCount++;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xffD2EAFF),
                        child: Icon(Icons.add, color: Color(0xff027FEE),),
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$ 0.00",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Color(0xffD9D9D9),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context)!.room, style: Theme.of(context).textTheme.bodyLarge,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          cubit.roomCount--;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xffD2EAFF),
                        child: Icon(Icons.minimize, color: Color(0xff027FEE),),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text("${cubit.roomCount}", style: Theme.of(context).textTheme.bodyLarge,),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          cubit.roomCount++;
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xffD2EAFF),
                        child: Icon(Icons.add, color: Color(0xff027FEE),),
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$ 0.00",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Color(0xffD9D9D9),),
            ),
          ],
        );
      },
    );
  }
}
