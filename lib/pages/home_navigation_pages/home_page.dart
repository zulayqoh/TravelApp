import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_colors.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';
import 'package:travel_app_sample/widgets/medium_text.dart';
import 'package:travel_app_sample/widgets/semi_bold_text.dart';

import '../../widgets/app_search_box.dart';
import '../../widgets/circular_tab_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Container(
      padding: EdgeInsets.only(
        top: AppDimension.height40,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: AppDimension.height10,
                left: AppDimension.width20,
                right: AppDimension.width20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  color: AppColors.appMainColor,
                  size: AppDimension.font33,
                ),
                Expanded(child: SizedBox()),
                SemiBoldText(
                  text: 'Home',
                  color: AppColors.appMainColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: AppDimension.width20,
                right: AppDimension.width20,
                bottom: AppDimension.height20),
            child: AppSearchBox(),
          ),
          Divider(height: 2, color: AppColors.appSearchHintColor),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppDimension.height20,
                vertical: AppDimension.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppMediumText(
                  text: 'Show post',
                  color: Colors.black,
                  size: AppDimension.width15,
                ),
                Icon(Icons.arrow_forward_ios, size: AppDimension.height20)
              ],
            ),
          ),
          Divider(height: 2, color: AppColors.appSearchHintColor),
          Align(
            alignment: Alignment.topLeft,
            child: TabBar(
              indicator: CircularTabIndicator(radius: 4, color: AppColors.appMainColor),
              labelPadding: EdgeInsets.only(left: 25, right: 25),
              // indicatorPadding: EdgeInsets.only(top: 43, left: 18, right: 18),
              // indicator: BoxDecoration(
              //   color: AppColors.appMainColor,
              //   borderRadius: BorderRadius.circular(7)
              // ),
              labelColor: AppColors.appMainColor,
              unselectedLabelColor: AppColors.appInactiveColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.appMainColor,
              indicatorWeight: 5,
              isScrollable: true,
              tabs: const [
                Tab(child: Text('Tab1', style: TextStyle(fontSize: 20),)),
                Tab(child: Text('Tab2', style: TextStyle(fontSize: 20))),
                Tab(child: Text('Tab3', style: TextStyle(fontSize: 20))),
                Tab(child: Text('Tab4', style: TextStyle(fontSize: 20))),
              ],
              controller: _tabController,
              // onTap: (tabIndex) {
              //   setState(() {
              //     currentTabIndex = tabIndex;
              //   });
              // },
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(
                controller: _tabController,
                children: const [
              SemiBoldText(text: 'TabView1'),
              SemiBoldText(text: 'TabView2'),
              SemiBoldText(text: 'TabView3'),
              SemiBoldText(text: 'TabView4'),
            ]),
          ),
        ],
      ),
    );
  }
}
