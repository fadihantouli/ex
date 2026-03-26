import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class ListFilterHotelDetailsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List filter = [
      S.of(context)!.accommodationPhotos,
      S.of(context)!.rooms,
      S.of(context)!.utilities,
      S.of(context)!.allInfo,
      S.of(context)!.accommodationPolicy,
    ];
    return SizedBox(
      height: 41,
      child: ListView.separated(
          reverse: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
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
