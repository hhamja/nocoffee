import 'package:auto_route/annotations.dart';
import 'package:nocoffee/src/features/common/presentation/screen/splash/splash.dart';
import 'package:nocoffee/src/features/common/presentation/screen/tabbar_page/tabbar_page.dart';
import 'package:nocoffee/src/features/record/presentation/screen/calender_page/calender_page.dart';
import 'package:nocoffee/src/features/record/presentation/screen/home_record_page/home_record_page.dart';
import 'package:nocoffee/src/features/setting/presentation/screen/notice_page/notice_page.dart';
import 'package:nocoffee/src/features/setting/presentation/screen/setting_page/setting_page.dart';
import 'package:nocoffee/src/features/setting/presentation/screen/terms_policy_page/policy_detail_page.dart';
import 'package:nocoffee/src/features/setting/presentation/screen/terms_policy_page/terms_detail_page.dart';
import 'package:nocoffee/src/features/setting/presentation/screen/terms_policy_page/terms_policy.dart';
import 'package:nocoffee/src/features/statistics/presentation/screen/statistics_page/statistics_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: HomeRecordPage),
    AutoRoute(page: CalenderPage),
    AutoRoute(page: StatisticsPage),
    AutoRoute(page: TabbarPage),
    AutoRoute(page: SettingPage),
    AutoRoute(page: AppNoticePage),
    AutoRoute(page: PrivacyPolicyDetailPage),
    AutoRoute(page: TermsDetailPage),
    AutoRoute(page: TermsPolicyAgreementPage),
  ],
)
class $AppRouter {}
