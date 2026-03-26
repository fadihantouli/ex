import 'package:flutter/cupertino.dart';
import '../../generated/l10n.dart';

Widget NoDataWidget(BuildContext context){

  return   Column(children: [
    Container(child: Image.asset("assets/SVG/images/no_data.png"),width: MediaQuery.sizeOf(context).width/2,height: MediaQuery.sizeOf(context).height/2,),
    Text(S.of(context)!
        .noDataFound
    ),
  ],);
}