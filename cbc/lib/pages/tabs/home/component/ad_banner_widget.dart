import 'package:card_swiper/card_swiper.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/pages/tabs/home/component/child/cpxq/view.dart';
import 'package:cbc/pages/tabs/home/component/child/grxfdk/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {

        String image = "home_ad_$index";
        if (index == 0) {
          image = "home_ad_6";
        }
        else if (index == 1) {
          image = "home_ad_7";
        }
        else {
          image = "home_ad_${index - 2}";
        }


        return Image(
          image: 'home_ad_$index'.png3x,
          width: 1.sw,
          fit: BoxFit.fitWidth,
        ).withOnTap(onTap: () {
          if (index == 0) {
            Get.to(() => FixedNavPage(), arguments: {
              'image': 'home_ad_detail_0',
              'title': '月花有礼（10月）',
            });
          }
          else if (index == 1) {
            Get.to(() => CpxqPage());
          }
          else if (index == 2) {
            Get.to(() => FixedNavPage(), arguments: {
              'image': 'home_ad_2_detail',
              'title': '升金有礼',
            });
          }
          else if (index == 3) {
            Get.to(() => Image(image: "home_ad_3_detail".png3x).withOnTap(onTap: () {
              Get.back();
            }));
          }
          else if (index == 4) {
            Get.to(() => FixedNavPage(), arguments: {
              'image': 'home_ad_4_detail',
              'title': '首页-融e行手机银行频道...',
            });
          }
          else if (index == 5) {
            Get.to(() => GrxfdkPage());
          }
          else if (index == 6) {
            Get.to(() => FixedNavPage(), arguments: {
              'image': 'home_ad_6_detail',
              'title': '好运周末派，红包抽不停',
              'right': true,
            });
          }
          else if (index == 7) {
            Get.to(() => FixedNavPage(), arguments: {
              'image': 'home_ad_7_detail',
              'title': '本地服务',
            });
          }
        });
      },
      itemCount: 8,
      autoplay: true,
    ).withContainer(width: 1.sw, height: 120.w,color: const Color(0xffF4F5F8));
  }
}
