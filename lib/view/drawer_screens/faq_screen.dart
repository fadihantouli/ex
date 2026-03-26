import 'package:xvisa/controller/drawer_cubit/cubit.dart';
import 'package:xvisa/controller/drawer_cubit/state.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/best_visa/visa_view_all.dart';
import 'package:xvisa/view/drawer_screens/widget/faq_details_appbar_widget.dart';
import 'package:xvisa/view/home/widget/we_help_you_section.dart';
import 'package:xvisa/view/home/widget/why_choose_us_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xvisa/widgets/no_internet.dart';

class FAQScreen extends StatefulWidget {
   FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool isExpanded1 = false;
  bool isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit()..getFaq(),
      child: BlocConsumer<DrawerCubit, DrawerStates>(
        listener: (context, state) {},
        builder: (context, state) {
        if(state is GetFaqLoadingStates){
          return  Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }if(state is GetFaqSuccessStates){
          return Scaffold(
            backgroundColor:  Color(0xffFFFFFF),
            body: SingleChildScrollView(
              physics:  ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                children: [
                  FAQDetailsAppbarWidget(image: "assets/images/faqs.png", title: S.of(context)!.faq,),
                  Padding(
                    padding:  EdgeInsets.all(15),
                    child: Column(
                      children: [
                         Text(S.of(context)!.hereYouWillFindAllTheMostFrequently,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8D94A2)
                          ),
                        ),
                         SizedBox(height: 20,),
                        ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                            physics:  NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => buildExpandablePanel(
                              context,
                              title: DrawerCubit.get(context).faqs[index]['title']['ar'],
                              content: DrawerCubit.get(context).faqs[index]['title']['en'],
                              isExpanded: isExpanded2,
                              onPressed: () => setState(() => isExpanded2 = !isExpanded2),
                            ),
                            separatorBuilder: (context, index) =>  SizedBox(height: 16,),
                            itemCount: DrawerCubit.get(context).faqs.length
                        ),
                         SizedBox(height: 16),

                        // // Description Text
                        //  Text(
                        //    S.of(context)!.mightlyRenjani,
                        //   style: TextStyle(fontSize: 14 ,color:  Color(0xffFF2828), fontWeight: FontWeight.w400),
                        //   textAlign: TextAlign.justify,
                        // ),
                        //  SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width*0.7,
                          child: DefaultCustomButton(
                            title: S.of(context)!.bookNow,
                            color:  Color(0xff149459),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> VisaViewAll(visaRequire: false,)));
                            },
                          ),
                        ),
                         SizedBox(height: 30),
                         WhyChooseUsSection(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }if(state is GetFaqErrorStates){
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

  // Function to build expandable panels
  Widget buildExpandablePanel(BuildContext context,
      {required String title,
        required String content,
        required bool isExpanded,
        required VoidCallback onPressed}) {
    return Directionality(
      textDirection: (CacheHelper.getString("LOCALE") == "ar")? TextDirection.rtl:TextDirection.ltr,
      child: Card(
        elevation: 3,
        color:  Color(0xff61461B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        child: ExpansionTile(
          backgroundColor:  Color(0xff61461B),
          title: Text(title, style:  TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
          initiallyExpanded: isExpanded,
          onExpansionChanged: (_) => onPressed(),
          children: [
            Container(
              width: double.infinity,
              color:  Color(0xff263238),
              child: Padding(
                padding:  EdgeInsets.all(12.0),
                child: Text(content, style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white)),
              ),
            ),
          ],
        ),
      )
    );
  }
  Widget buildBottomDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DetailColumn(
          icon: Icons.timer,
          title: S.of(context)!.travelDuration,
          description: S.of(context)!.threeHours,
        ),
        DetailColumn(
          icon: Icons.location_on,
          title: S.of(context)!.location,
          description: S.of(context)!.saudi,
        ),
        DetailColumn(
          icon: Icons.monetization_on,
          title: S.of(context)!.cost,
          description: '\$150',
        ),
      ],
    );
  }
}

class DetailColumn extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

   DetailColumn({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.teal),
         SizedBox(height: 8),
        Text(
          title,
          style:  TextStyle(fontWeight: FontWeight.bold),
        ),
         SizedBox(height: 4),
        Text(description),
      ],
    );
  }
}

