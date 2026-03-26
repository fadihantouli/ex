import 'package:xvisa/controller/hotel_and_room/hotel_cubit/cubit.dart';
import 'package:xvisa/controller/hotel_and_room/hotel_cubit/state.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/hotel_search/widget/count_widget.dart';
import 'package:xvisa/view/hotel_search/widget/filter_widget.dart';
import 'package:xvisa/view/hotel_search/widget/hotel_search_listview_widget.dart';
import 'package:xvisa/view/hotel_search/widget/list_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/widgets/no_internet.dart';
class HotelSearchScreen extends StatefulWidget {
  const HotelSearchScreen({super.key});

  @override
  State<HotelSearchScreen> createState() => _HotelSearchScreenState();
}

class _HotelSearchScreenState extends State<HotelSearchScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HotelCubit()..getHotel(),
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          if(state is GetHotelLoadingState){
            return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
          }if (cubit.getHotelModel != null){
            return defaultScaffold(
                context: context,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: Text(S.of(context)!.agentsOfTheMostPrestigious,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Text(S.of(context)!.advancedSearch,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                        ),
                        const SizedBox(height: 10,),
                        const HotelFilterWidget(),
                        const SizedBox(height: 20,),
                        const HotelCountWidget(),
                        const SizedBox(height: 20,),
                        DefaultCustomButton(title: S.of(context)!.search,
                          onPressed: ()async {
                            // navigateTo(
                            //     context: context,
                            //     screen: const BestHotelFormFourScreen()
                            // );
                          },),
                        const SizedBox(height: 20,),
                        ListFilterWidget(),
                        const SizedBox(height: 20,),
                        HotelSearchListviewWidget(hotels: cubit.getHotelModel!.data!,),
                        const SizedBox(height: 30,),
                        DefaultCustomButton(title: S.of(context)!.submitNow,
                          onPressed: ()async {
                            // navigateTo(
                            //     context: context,
                            //     screen: const BestHotelFormFourScreen()
                            // );
                          },)
                      ],
                    ),
                  ),
                )
            );
          }if(state is GetHotelErrorState) {
           return defaultScaffold(
              context: context,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                   NoInternetConnectionWidget(context)
                  ],

                ),
              ),
            );
          }else{return Container();}
        },
      ),
    );
  }
}
