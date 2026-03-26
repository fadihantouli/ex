import '../../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:flutter/material.dart';
import 'package:xvisa/view/best_visa/best_visa_screen.dart';
import 'package:xvisa/widgets/no_data.dart';

class VisaRequireScreen extends StatelessWidget {
  var visaDetail;
  var visa ;
  var countryImage ;
  bool? fromAll = false ;
  VisaRequireScreen({this.visaDetail, this.visa ,this.fromAll, this.countryImage});
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: CacheHelper.getString("language") == "ar"? TextDirection.rtl :TextDirection.rtl,
        child: defaultScaffold(
            context: context,
            body: (visaDetail != null)?SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CacheHelper.getString("language") == "ar"? CrossAxisAlignment.start:CrossAxisAlignment.end,
                children: [
                  Center(
                    child:  Text(S.of(context)!.visasRequirments,
                      style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child:
                    Text(
                      CacheHelper.getString("language") == "ar"?visaDetail!.title!.ar ?? "":(visaDetail!.title!.en != null)?visaDetail!.title!.en??"" : "" , style: Theme.of(context).textTheme.bodyMedium!
                        .copyWith(),
                      textAlign: TextAlign.center,),
                    // Text(
                    //   CacheHelper.getString("language") == "ar"?visaDetail!.title!.ar ?? "":(visaDetail!.title!.en != null)?visaDetail!.title!.en??"" : "" , style: Theme.of(context).textTheme.bodyMedium!
                    //     .copyWith(color: Colors.orange),
                    // textAlign: TextAlign.center,),
                  ),
                 if(visaDetail!.title!.ar != null && visaDetail!.title!.en != null) const SizedBox(height: 20,),
                  // Text("${S.of(context)!.description}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue),),
                  Text("${S.of(context)!.description}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),),

                  const SizedBox(height: 10,),
                  // Text((visaDetail!.title!.ar != null)? CacheHelper.getString("language") == "ar"?visaDetail!.title!.ar!:visaDetail!.title!.en! : S.of(context)!.notFount, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),textAlign: CacheHelper.getString("language") == "ar" ?TextAlign.start:TextAlign.end,),
                  const SizedBox(height: 30,child: Divider()),
                  // Text("${S.of(context)!.imageDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue),),
                  Text("${S.of(context)!.imageDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400 ),),

                  const SizedBox(height: 10,),
                  Text((visaDetail!.imageDescription!['ar'] != null)? CacheHelper.getString("language") == "ar"?visaDetail!.imageDescription!['ar']:visaDetail!.imageDescription!['en'] : S.of(context)!.notFount, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),textAlign: CacheHelper.getString("language") == "ar" ?TextAlign.start:TextAlign.end),
                  const SizedBox(height: 30,child: Divider()),
                  Text("${S.of(context)!.salaryDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),),

                  // Text("${S.of(context)!.salaryDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue),),
                  const SizedBox(height: 10,),
                  Text((visaDetail!.salaryDescription!['ar'] != null)? CacheHelper.getString("language") == "ar"?visaDetail!.salaryDescription!['ar']:visaDetail!.salaryDescription!['en']: S.of(context)!.notFount, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),textAlign: CacheHelper.getString("language") == "ar" ?TextAlign.start:TextAlign.end),
                  const SizedBox(height: 30,child: Divider()),
                  Text("${S.of(context)!.accountDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),),
                  // Text("${S.of(context)!.accountDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue),),
                  const SizedBox(height: 10,),
                  Text((visaDetail!.accountStatementDescription!['ar'] != null)? CacheHelper.getString("language") == "ar"?visaDetail!.accountStatementDescription!['ar']:visaDetail!.accountStatementDescription!['en'] : S.of(context)!.notFount, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),textAlign: CacheHelper.getString("language") == "ar" ?TextAlign.start:TextAlign.end),
                  const SizedBox(height: 30,child: Divider()),
                  Text("${S.of(context)!.fingerDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),),

                  // Text("${S.of(context)!.fingerDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue),),
                  const SizedBox(height: 10,),
                  Text((visaDetail!.fingerprintDescription!['ar'] != null)?CacheHelper.getString("language") == "ar"? visaDetail!.fingerprintDescription!['ar']:visaDetail!.fingerprintDescription!['en'] : S.of(context)!.notFount, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),textAlign: CacheHelper.getString("language") == "ar" ?TextAlign.start:TextAlign.end),
                  const SizedBox(height: 30,child: Divider()),
                  Text("${S.of(context)!.durationDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),),

                  // Text("${S.of(context)!.durationDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue),),
                  const SizedBox(height: 10,),
                  Text((visaDetail!.durationDescription!['ar'] != null)?CacheHelper.getString("language") == "ar"? visaDetail!.durationDescription!['ar']: visaDetail!.durationDescription!['en'] : S.of(context)!.notFount, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),textAlign: CacheHelper.getString("language") == "ar" ?TextAlign.start:TextAlign.end),
                  const SizedBox(height: 30,child: Divider()),
                  Text("${S.of(context)!.medicalInsuranceDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),),

                  // Text("${S.of(context)!.medicalInsuranceDescription}:", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.blue),),
                  const SizedBox(height: 10,),
                  Text((visaDetail!.medicalInsuranceDescription!['ar'] != null)?
                  CacheHelper.getString("language") == "ar"? visaDetail!.medicalInsuranceDescription!['ar']:
                  visaDetail!.medicalInsuranceDescription!['en']:S.of(context)!.notFount,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),textAlign: CacheHelper.getString("language") == "ar" ?TextAlign.start:TextAlign.end),
                  const SizedBox(height: 30,),
                  DefaultCustomButton(
                    title: S.of(context)!.bookNow,
                    onPressed: ()async {
                      print("visaaa is --> ${visa}");
                      print(fromAll);
                      if(fromAll == true){
                        navigateTo(
                            screen: BestVisaScreen(
                              fromAll: true,
                              finger: visa.visaFingerprint,
                              id: visa.id,
                              visaTypes: visa.visaTypes,
                              countryName: visa.country.name.ar,
                            ),
                            context: context
                        );
                      }else{
                      navigateTo(
                          screen: BestVisaScreen(
                            fromAll: false,
                            finger: visa['visa_fingerprint'],
                            id: visa['id'],
                            visaTypes: visa['visa_types'],
                            countryName: visa['country']['name']['en'],
                          ),
                          context: context
                      );}
                    },)
                ],
              ),
            ) : Center(child: NoDataWidget(context),)
        )
    );
  }
}
