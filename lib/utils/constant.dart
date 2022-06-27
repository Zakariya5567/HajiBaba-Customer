import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ApiConstant {
  static const APIKEY = 'api';
  // static const APPID = '';
  static const BASEURL = 'http://hajibabaapi.asollearning.com';
}

class Constant {
  static const primaryColor = Color(0xffFE9900);
  static const secondaryColor = Color(0xffFF3333);
  static const greyColor = Color(0xffF1F2F6);
  static const redColor = Color(0xffC00000);
  static const blueColor = Color(0xff3A5794);
  static const darkOrange = Color(0xffFF7300);
  static const darkGreyColor = Color(0xff9E9E9E);
  static const darkBlueColor = Color(0xFF242938);
  static const mainOrangeColor = Color(0xFFFB7712);
  static const greenColor = Color(0xFF4EC018);
  static const hotPinkColor = Color(0xFFFF0B54);
  static const transparent = Color(0xFF00000029);
  Constant._();

  static const _primaryColorValue = 0xffFE9900;

  static const MaterialColor primarySwatchColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xffFE9900),
      100: Color(0xffFE9900),
      200: Color(0xffFE9900),
      300: Color(0xffFE9900),
      400: Color(0xFF262626),
      500: Color(_primaryColorValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
}

class Assets {
  static const String MEAT = "assets/images/meat.png";
  static const String MEAT_BACKGROUND = "assets/images/meat_background.png";
  static const String LOGO_TEXT = "assets/images/logo_text.png";
  static const String SPLASH_BORDER = "assets/images/splash_border.png";
  static const String CLICK_ICON = "assets/images/click_icon.png";
  static const String STAR_ICON = "assets/images/star_icon.png";
  static const String POLICY_ICON = "assets/images/policy_icon.png";
  static const String DELIVERY_ICON = "assets/images/delivery_icon.png";
  static const String WISHLIST_ICON = "assets/images/wishlist.png";
  static const String MENU_ICON = "assets/images/menu.png";
  static const String AVATAR = "assets/images/avatar.png";
  static const String CATEGORY_ITEM = "assets/images/category_item.png";
  static const String SLIDER = "assets/images/slider.png";
  static const String SliderImg1 = "assets/images/sliderimg1.png";
  static const String SliderImg2 = "assets/images/sliderimg2.png";
  static const String SLIDER2 = "assets/images/slider2.png";
  static const String FreshBanner = "assets/images/freshbanner.png";
  static const String TodayOffer = "assets/images/todayoffercard.png";
  static const String UKFlag = "assets/images/uk.png";
  // static const String Tap = "assets/images/tap.png";
  static const String ShopingBag = "assets/images/bag.png";
  static const String ArrowBack = "assets/images/arrowBack.png";
  static const String Featured = "assets/images/featured.png";
  static const String Feature = "assets/images/feature.png";
  static const String ShopBanner = "assets/images/shopbanner.png";
  static const String MostTrending = "assets/images/mosttrending.png";
  static const String CatBG = "assets/images/catbg.png";
  static const String ProfileBg = "assets/images/profile_bg.png";
  static const String Profile_Pic = "assets/images/profile_pic.png";
  static const String Cammera_Icon = "assets/images/cammera_icon.png";
  static const String CartItem = "assets/images/cartitem.png";
  static const String Filter = "assets/images/filter.png";
  static const String HajiBabaLogo = "assets/images/haji_baba_logo.png";
  static const String DeliveryTruck = "assets/images/delivery_truck.png";
  static const String WishListItem = "assets/images/wishlistitem.png";
  static const String FavIcon = "assets/images/fav.png";
  static const String Disc_Banner = "assets/images/disc.png";
  static const String TodayBG1 = "assets/images/today1.png";
  static const String TodayBG2 = "assets/images/today2.png";
  static const String TodayBG3 = "assets/images/today3.png";
  static const String TrendingBG1 = "assets/images/trending1.png";
  static const String TrendingBG2 = "assets/images/trending2.png";
  static const String TrendingBG3 = "assets/images/trending3.png";
  static const String FeatureCuts1 = "assets/images/feature11.png";
  static const String FeatureCuts2 = "assets/images/feature22.png";
  static const String FeatureCuts3 = "assets/images/feature33.png";
  static const String FeatureCuts4 = "assets/images/feature4.png";
  static const String DeliveryImage = "assets/images/delivery.png";
  static const String StoreAddressIconImage =
      "assets/images/  addressIcon";



  static const String LOGIN_BACKGROUND_1 =
      "assets/images/login_background_1.png";
  static const String LOGIN_REGISTRATION_BACKGROUND =
      "assets/images/login_registration_background.png";
  static const String INTRODUCTION_BACKGROUND =
      "assets/images/introduction_background.png";

  static const String WELCOMESLIDER01 = "assets/images/welcome_slider01.jpg";
  static const String WELCOMESLIDER02 = "assets/images/welcome_slider02.jpg";
  static const String WELCOMESLIDER03 = "assets/images/welcome_slider03.jpg";
  static const String ADDRESS_BACKGROUND = "assets/images/address_background.jpeg";

// Svg Const
  static const String ShopingBagWhite = "assets/svgs/shopping-bag-white.svg";
  static const String Tap = "assets/svgs/tap.svg";
  static const String Cart = "assets/svgs/cart.svg";
  static const String Bin = "assets/svgs/bin.svg";
  static const String Stripe = "assets/svgs/stripe.svg";
  static const String Bank = "assets/svgs/bank.svg";
  static const String COD = "assets/svgs/cashondelivery.svg";
  static const String Delivery = "assets/svgs/delivery.svg";
  static const String ShoppingStore = "assets/svgs/shopping_store.svg";
  static const String Accept = "assets/svgs/accept.svg";
  static const String User_icon = "assets/svgs/user_icon.svg";
  static const String TrolleyCart = "assets/svgs/trolley_cart.svg";
  static const String OrderIcon = "assets/svgs/order_icon.svg";
  static const String HomeIcon = "assets/svgs/home_icon.svg";
  static const String CategoryIcon = "assets/svgs/category_icon.svg";
  static const String MeatShopIcon = "assets/svgs/meat.svg";
  static const String LocationIcon = "assets/svgs/location.svg";
  static const String minus_icon = "assets/svgs/minus_icon.svg";

}

class LocalData{
  SharedPreferences _sharedPreferences;
  addKeyToShareedPref(String key, String value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(key, value);
    var userid = _sharedPreferences.getString('userId');
    print('id saved suceess'+userid.toString());
  }
  getKeyValueFromShareedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    var userid = _sharedPreferences.getString('userId');
    print('user id from shared prefs'+userid.toString());
    return userid;
  }

  addIsLoginToShareedPref(bool value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool('isLogin', value);
    // var userid = _sharedPreferences.getString('userId');
    // print('id saved suceess'+userid.toString());
  }
  Future<bool> getIsLoginFromShareedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin =_sharedPreferences.getBool('isLogin');
    return isLogin;
    // var userid = _sharedPreferences.getString('userId');
    // print('id saved suceess'+userid.toString());
  }

  Future<bool> addIsSocialLoginToShareedPref(bool value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool('isSocialLogin', value);
    // var userid = _sharedPreferences.getString('userId');
    // print('id saved suceess'+userid.toString());
  }
  Future<bool> getIsSocialLoginFromShareedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    bool isSocialLogin = _sharedPreferences.getBool('isSocialLogin');
    return isSocialLogin;
    // var userid = _sharedPreferences.getString('userId');
    // print('id saved suceess'+userid.toString());
  }
}
