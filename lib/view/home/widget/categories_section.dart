import 'package:xvisa/model/get_home_model.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/view/home/widget/categories_item_list_widget.dart';
import 'package:xvisa/view/home/widget/custom_row_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.categories});

  final List<Categories>? categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 10.0.w,
            end: 10.0.w,
            bottom: 10.0.h,
          ),
          child: CustomRowTitle(
            text: S.of(context)!.categories,
            onPressed: () {
            //  context.push(AppRoutesString.allCategoriesScreen);
            },
          ),
        ),
        SizedBox(
          height: 40.0.h,
          child: ListView.separated(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: categories!.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //context.push(AppRoutesString.categoryNameScreen, extra: categories?[index]);
                  },
                  child: CategoriesItem(
                    categoryName: categories![index].title!.ar ?? "",
                    image: categories?[index].logoPath ?? "",
                    height: 38.0.h,
                    width: 103.0.w,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.0.w,
                );
              }),
        ),
      ],
    );
  }
}
