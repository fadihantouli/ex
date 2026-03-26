import 'package:xvisa/controller/branch_cubit/cubit.dart';
import 'package:xvisa/controller/branch_cubit/state.dart';
import 'package:xvisa/main.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/home/widget/why_choose_us_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class BranchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => BranchCubit()..getBranch(),
    child: BlocConsumer<BranchCubit, BranchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BranchCubit.get(context);
        return defaultScaffold(
          context: context,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.of(context)!.branches,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xff000000), fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    S.of(context)!.allOurBranchesAreYeadyFor,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff8D94A2)),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => BranchCard(
                        title: cubit.branches[index]['name']['ar'],
                        imagePath: cubit.branches[index]['image_path'], // Replace with your image path
                        description: cubit.branches[index]['description'],
                        phoneNumber: cubit.branches[index]['phone'],
                        accountNumber: cubit.branches[index]['phone'],
                        branchNumber: cubit.branches[index]['phone'],
                        address: cubit.branches[index]['address'],
                      ),
                      itemCount: cubit.branches.length,
                      separatorBuilder: (context, index) => SizedBox(height: 20,),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: false,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(height: 50,),
                  WhyChooseUsSection(),
                ],
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}

class BranchCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String description;
  final String phoneNumber;
  final String accountNumber;
  final String branchNumber;
  final String address;

  const BranchCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.phoneNumber,
    required this.accountNumber,
    required this.branchNumber,
    required this.address,
  }) : super(key: key);

  @override
  _BranchCardState createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Color(0xff61461B),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFFFFFF), fontSize: 18),
            ),
            trailing: IconButton(
              icon: Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              color: Color(0xffFFFFFF),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Column(
              children: [
                CachedNetworkImage(
                    imageUrl: widget.imagePath ?? '',
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context,
                        url) =>
                    const ShimmerAnimatedLoading(
                      circularRaduis:
                      50,
                    ),
                    errorWidget: (context,
                        url, error) =>
                    const Icon(
                      Icons
                          .image_not_supported_outlined,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.description, style: TextStyle(fontSize: 16 ,color: Color(0xffFFFFFF), fontWeight: FontWeight.w400),),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                    children: [
                      Text('هاتف: ${widget.phoneNumber}', style: TextStyle(fontSize: 16 ,color: Color(0xffFFFFFF), fontWeight: FontWeight.w400)),
                      SizedBox(height: 4),
                      Text('رقم الحساب: ${widget.accountNumber}', style: TextStyle(fontSize: 16 ,color: Color(0xffFFFFFF), fontWeight: FontWeight.w400)),
                      SizedBox(height: 4),
                      Text('رقم الفرع: ${widget.branchNumber}', style: TextStyle(fontSize: 16 ,color: Color(0xffFFFFFF), fontWeight: FontWeight.w400)),
                      SizedBox(height: 4),
                      Text(widget.address, style: TextStyle(fontSize: 16 ,color: Color(0xffFFFFFF), fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

