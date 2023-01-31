import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_colors.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';
import 'package:travel_app_sample/widgets/app_text.dart';
import 'package:travel_app_sample/widgets/medium_text.dart';
import 'package:travel_app_sample/widgets/semi_bold_text.dart';

import '../../widgets/app_card.dart';
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
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(
          top: AppDimension.height40,
        ),
        child: Column(
          children: [
            // Menu and Home title
            Container(
              margin: EdgeInsets.only(
                  // bottom: AppDimension.height10,
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
            // Search Bar
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimension.width20,
                  right: AppDimension.width20,
                  bottom: AppDimension.height10),
              child: AppSearchBox(),
            ),
            Divider(height: 2, color: AppColors.appSearchHintColor),
            // Show Post
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
            // Tab Bars
            Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                ///Implemented the Circular tab indicator
                indicator: CircularTabIndicator(
                    radius: 4, color: AppColors.appMainColor),
                labelPadding: EdgeInsets.symmetric(horizontal: AppDimension.width25),
                ///Implemented the Circular tab indicator using tab bar properties
                // indicatorPadding: EdgeInsets.only(top: 43, left: 18, right: 18),
                // indicator: BoxDecoration(
                //   color: AppColors.appMainColor,
                //   borderRadius: BorderRadius.circular(7)
                // ),
                labelColor: AppColors.appMainColor,
                unselectedLabelColor: AppColors.appInactiveColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColors.appMainColor,
                indicatorWeight: 1,
                isScrollable: true,
                tabs: const [
                  Tab(
                      child: Text(
                    'Tab1',
                    style: TextStyle(fontSize: 16),
                  )),
                  Tab(child: Text('Tab2', style: TextStyle(fontSize: 16))),
                  Tab(child: Text('Tab3', style: TextStyle(fontSize: 16))),
                  Tab(child: Text('Tab4', style: TextStyle(fontSize: 16))),
                ],
                controller: _tabController,
                // onTap: (tabIndex) {
                //   setState(() {
                //     currentTabIndex = tabIndex;
                //   });
                // },
              ),
            ),
            // Tab bar ListView(Horizontal)
            Container(
              margin: EdgeInsets.only(left: AppDimension.width20, top: AppDimension.height20),
              width: double.maxFinite,
              height: AppDimension.height70,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 14,
                    itemBuilder: (_, index) {
                      return Container(
                        width: AppDimension.height120,
                        height: AppDimension.height20,
                        margin: EdgeInsets.only(right: AppDimension.width10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimension.width10),
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage('assets/images/canada1.png')),
                        ),
                      );
                    }),
                SemiBoldText(text: 'TabView2'),
                SemiBoldText(text: 'TabView3'),
                SemiBoldText(text: 'TabView4'),
              ]),
            ),
            // Popular Destination
            Container(
              margin: EdgeInsets.only(left: AppDimension.width20, right: AppDimension.width20, top: AppDimension.height10, bottom: AppDimension.width5/2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppMediumText(
                    text: 'Popular Destination',
                    color: Colors.black,
                    size: AppDimension.font33/2,
                  ),
                  AppText(
                    text: 'View All',
                    color: AppColors.appTextColor.withOpacity(0.66),
                    size: AppDimension.width15,
                  ),
                ],
              ),
            ),
            // Popular Destination Card
            AppCard(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppDimension.width20, vertical: AppDimension.height5),
              child: Align(
                alignment: Alignment.topLeft,
                child: AppMediumText(
                  text: 'Explore',
                  color: Colors.black,
                  size: AppDimension.font33/2,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: AppDimension.width20, top: AppDimension.height5),
              width: double.maxFinite,
              height: AppDimension.height100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      width: AppDimension.height100,
                      margin: EdgeInsets.only(right: AppDimension.width5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppDimension.width10),
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage('assets/images/canada1.png')),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
