// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../features/common/presentation/screen/splash/splash.dart' as _i1;
import '../../features/common/presentation/screen/tabbar_page/tabbar_page.dart'
    as _i5;
import '../../features/record/presentation/screen/calender_page/calender_page.dart'
    as _i3;
import '../../features/record/presentation/screen/home_record_page/home_record_page.dart'
    as _i2;
import '../../features/setting/presentation/screen/notice_page/notice_page.dart'
    as _i7;
import '../../features/setting/presentation/screen/setting_page/setting_page.dart'
    as _i6;
import '../../features/setting/presentation/screen/terms_policy_page/policy_detail_page.dart'
    as _i8;
import '../../features/setting/presentation/screen/terms_policy_page/terms_detail_page.dart'
    as _i9;
import '../../features/setting/presentation/screen/terms_policy_page/terms_policy.dart'
    as _i10;
import '../../features/statistics/presentation/screen/statistics_page/statistics_page.dart'
    as _i4;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    HomeRecordRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeRecordPage(),
      );
    },
    CalenderRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CalenderPage(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.StatisticsPage(),
      );
    },
    TabbarRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.TabbarPage(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SettingPage(),
      );
    },
    AppNoticeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AppNoticePage(),
      );
    },
    PrivacyPolicyDetailRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.PrivacyPolicyDetailPage(),
      );
    },
    TermsDetailRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.TermsDetailPage(),
      );
    },
    TermsPolicyAgreementRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.TermsPolicyAgreementPage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          HomeRecordRoute.name,
          path: '/home-record-page',
        ),
        _i11.RouteConfig(
          CalenderRoute.name,
          path: '/calender-page',
        ),
        _i11.RouteConfig(
          StatisticsRoute.name,
          path: '/statistics-page',
        ),
        _i11.RouteConfig(
          TabbarRoute.name,
          path: '/tabbar-page',
        ),
        _i11.RouteConfig(
          SettingRoute.name,
          path: '/setting-page',
        ),
        _i11.RouteConfig(
          AppNoticeRoute.name,
          path: '/app-notice-page',
        ),
        _i11.RouteConfig(
          PrivacyPolicyDetailRoute.name,
          path: '/privacy-policy-detail-page',
        ),
        _i11.RouteConfig(
          TermsDetailRoute.name,
          path: '/terms-detail-page',
        ),
        _i11.RouteConfig(
          TermsPolicyAgreementRoute.name,
          path: '/terms-policy-agreement-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomeRecordPage]
class HomeRecordRoute extends _i11.PageRouteInfo<void> {
  const HomeRecordRoute()
      : super(
          HomeRecordRoute.name,
          path: '/home-record-page',
        );

  static const String name = 'HomeRecordRoute';
}

/// generated route for
/// [_i3.CalenderPage]
class CalenderRoute extends _i11.PageRouteInfo<void> {
  const CalenderRoute()
      : super(
          CalenderRoute.name,
          path: '/calender-page',
        );

  static const String name = 'CalenderRoute';
}

/// generated route for
/// [_i4.StatisticsPage]
class StatisticsRoute extends _i11.PageRouteInfo<void> {
  const StatisticsRoute()
      : super(
          StatisticsRoute.name,
          path: '/statistics-page',
        );

  static const String name = 'StatisticsRoute';
}

/// generated route for
/// [_i5.TabbarPage]
class TabbarRoute extends _i11.PageRouteInfo<void> {
  const TabbarRoute()
      : super(
          TabbarRoute.name,
          path: '/tabbar-page',
        );

  static const String name = 'TabbarRoute';
}

/// generated route for
/// [_i6.SettingPage]
class SettingRoute extends _i11.PageRouteInfo<void> {
  const SettingRoute()
      : super(
          SettingRoute.name,
          path: '/setting-page',
        );

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i7.AppNoticePage]
class AppNoticeRoute extends _i11.PageRouteInfo<void> {
  const AppNoticeRoute()
      : super(
          AppNoticeRoute.name,
          path: '/app-notice-page',
        );

  static const String name = 'AppNoticeRoute';
}

/// generated route for
/// [_i8.PrivacyPolicyDetailPage]
class PrivacyPolicyDetailRoute extends _i11.PageRouteInfo<void> {
  const PrivacyPolicyDetailRoute()
      : super(
          PrivacyPolicyDetailRoute.name,
          path: '/privacy-policy-detail-page',
        );

  static const String name = 'PrivacyPolicyDetailRoute';
}

/// generated route for
/// [_i9.TermsDetailPage]
class TermsDetailRoute extends _i11.PageRouteInfo<void> {
  const TermsDetailRoute()
      : super(
          TermsDetailRoute.name,
          path: '/terms-detail-page',
        );

  static const String name = 'TermsDetailRoute';
}

/// generated route for
/// [_i10.TermsPolicyAgreementPage]
class TermsPolicyAgreementRoute extends _i11.PageRouteInfo<void> {
  const TermsPolicyAgreementRoute()
      : super(
          TermsPolicyAgreementRoute.name,
          path: '/terms-policy-agreement-page',
        );

  static const String name = 'TermsPolicyAgreementRoute';
}
