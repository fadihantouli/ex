import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class ListFilterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List filter = [
      S.of(context)!.all,
      S.of(context)!.topRated,
      S.of(context)!.price,
      S.of(context)!.rated,
      S.of(context)!.paymentWay,
    ];
    return SizedBox(
      height: 41,
      child: ListView.separated(
          reverse: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            width: 65,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: const Color(0xffF5F5F5)),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Text(filter[index], style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff606060)
            ),),
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 10,),
          itemCount: filter.length
      ),
    );
  }
}
