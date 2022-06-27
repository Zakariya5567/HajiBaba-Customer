// ignore: file_names
// ignore: file_names
import 'package:baba/ViewModel/appimages_viewmodel.dart';
import 'package:baba/ViewModel/onBoardingImages_ViewModel.dart';
import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/first_screen.dart';
import 'package:baba/Views/screens/login_registration_screen.dart';
import 'package:baba/Views/widgets/custom_widget.dart';
import 'package:baba/get_services/boarding_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baba/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen_bottom_navigation_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:introduction_screen/introduction_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  List<Widget> slideList;
  int initialPage;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Scaffold(
          body: GFIntroScreen(
            // height: MediaQuery.of(context).size.height * 0.7,
            // width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey[200]),
            slides: slides(),
            pageController: _pageController,
            showIntroScreenBottomNavigationBar: true,
            introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
              pageController: _pageController,
              pageCount: slideList.length,
              currentIndex: initialPage,
              backButtonText: 'Previous',
              forwardButtonText: 'Next',
              skipButtonText: 'Skip',
              doneButtonText: 'Done',
              onDoneTap: () {
                Get.offAll(() => LoginRegistrationScreen());
              },
              onSkipTap: () {
                Get.offAll(() => LoginRegistrationScreen());
              },
              navigationBarHeight: 50,
              navigationBarWidth: 300,
              navigationBarShape: RoundedRectangleBorder(
                side: const BorderSide(color: Constant.primaryColor, width: 4),
                borderRadius: BorderRadius.circular(60),
              ),
              navigationBarColor: Constant.greyColor,
              showDivider: false,
              dotHeight: 10,
              dotWidth: 16,
              dotShape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey[200], width: 1),
                  borderRadius: BorderRadius.circular(5)),
              inactiveColor: Colors.grey[200],
              activeColor: Constant.primaryColor,
              dotMargin: EdgeInsets.symmetric(horizontal: 6),
              showPagination: true,
            ),
            currentIndex: null,
            pageCount: null,
          ),
        )),
      );

  List<Widget> slides() {
    slideList = [
      GetBuilder<OnBoardingImagesViewModel>(
        // specify type as Controller
        init: OnBoardingImagesViewModel(), // intialize with the Controller
        builder: (value) => value.isLoading1
            ? CustomWidget.rectangular(height: 1.sh, width: 1.sw)
            : CachedNetworkImage(
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
                imageUrl: "${value.imagesSplash2.data}",
                placeholder: (context, url) => Center(
                    child: CustomWidget.rectangular(height: 1.sh, width: 1.sw)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
      ),
      GetBuilder<AppImagesViewModel>(
        // specify type as Controller
        init: AppImagesViewModel(), // intialize with the Controller
        builder: (value) => value.imagesSplash3.data == null
            ? CircularProgressIndicator()
            : CachedNetworkImage(
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
                imageUrl: "${value.imagesSplash3.data}",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
      ),
    ];
    return slideList;
  }
}

Widget _buildFullscrenImage1() {
  return GetBuilder<AppImagesViewModel>(
    // specify type as Controller
    init: AppImagesViewModel(), // intialize with the Controller
    builder: (value) => value.imagesSplash3.data == null
        ? CircularProgressIndicator()
        : CachedNetworkImage(
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            imageUrl: "${value.imagesSplash2.data}",
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
  );
}

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  PageController _pageController;

  List<Widget> slideList;

  int initialPage;

  final boardingService = Get.find<BoardingService>();

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    initialPage = _pageController.initialPage;

    loadSlides();

    super.initState();
  }

  void loadSlides() {
    slideList = [
      Obx(() {
        if (boardingService.loading.value) {
          return CustomWidget.rectangular(height: 1.sh, width: 1.sw);
        }

        return CachedNetworkImage(
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          imageUrl: boardingService.boardingImg2.value.data,
          placeholder: (context, url) =>
              CustomWidget.rectangular(height: 1.sh, width: 1.sw),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      }),
      Obx(() {
        if (boardingService.loading.value) {
          return CustomWidget.rectangular(height: 1.sh, width: 1.sw);
        }

        return CachedNetworkImage(
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          imageUrl: boardingService.boardingImg3.value.data,
          placeholder: (context, url) =>
              CustomWidget.rectangular(height: 1.sh, width: 1.sw),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Stack(
        children: [
          GFIntroScreen(
            // height: MediaQuery.of(context).size.height * 0.7,
            // width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey[200]),
            slides: slideList,
            pageController: _pageController,
            showIntroScreenBottomNavigationBar: true,
            introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
              pageController: _pageController,
              pageCount: 2,
              currentIndex: initialPage,
              // backButtonText: 'Previous',
              // forwardButtonText: 'Next',
              // skipButtonText: 'Skip',
              // doneButtonText: 'Done',

              // onDoneTap: (){
              //   Get.offAll(()=> const LoginRegistrationScreen());
              // },
              // onSkipTap: (){
              //   Get.offAll(()=>const LoginRegistrationScreen());
              // },

              // navigationBarHeight: 50,
              // navigationBarWidth: 300,
              // navigationBarShape: RoundedRectangleBorder(
              //   side: const BorderSide(color: Constant.primaryColor, width: 4),
              //   borderRadius: BorderRadius.circular(60),
              // ),
              navigationBarColor: Constant.greyColor,
              showDivider: false,
              dotHeight: 10,
              dotWidth: 16,
              dotShape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey[200], width: 1),
                  borderRadius: BorderRadius.circular(5)),
              inactiveColor: Colors.grey[200],
              activeColor: Constant.primaryColor,
              dotMargin: const EdgeInsets.symmetric(horizontal: 6),

              showPagination: true,
            ),
            currentIndex: 1,
            inactiveColor: Colors.grey[700],
            activeColor: Constant.primaryColor,
            pageCount: 2,
            dotHeight: 10,
            dotWidth: 16,
            dotShape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[800], width: 1),
                borderRadius: BorderRadius.circular(5)),
          ),
          Positioned(
              right: 20,
              bottom: 40,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.arrow_forward_ios),
              )
          )
        ],
      )),
    );
  }
}

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({Key key}) : super(key: key);

  @override
  _HomeScreen3State createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {

  final introKey = GlobalKey<IntroductionScreenState>();

  final boardingService = Get.find<BoardingService>();

  @override
  Widget build(BuildContext context) {

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        dotsContainerDecorator:  const ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        dotsDecorator: const DotsDecorator(
          activeColor: Constant.primaryColor,
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        controlsMargin: const EdgeInsets.all(16),
        curve: Curves.fastLinearToSlowEaseIn,
        onDone: (){},
        showDoneButton: false,
        showNextButton: false,
        showSkipButton: false,

        pages: [

          PageViewModel(
            title: "",
            bodyWidget: Container(),
            // titleWidget: Container(color: Colors.transparent,),
            // bodyWidget: Container(color: Colors.transparent,),
            image: _getImage1(),
            decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              fullScreen: true,
              bodyFlex: 1,
              imageFlex: 3,
            ),
          ),

          PageViewModel(
            title: "",
            bodyWidget: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton.extended(
                heroTag: "flot2",
                backgroundColor: Constant.primaryColor.withOpacity(0.8),
                onPressed: () async {

                  Get.offAll(() => FirstScreen());

                },
                label: const Text("Skip",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
                // child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
              ),
            ),
            image: _getImage2(),
            decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              fullScreen: true,
              // bodyFlex: 2,
              imageFlex: 3,
            ),
          ),

        ],
      ),
    );
  }

  _getImage1(){

    return Obx(() {
      if (boardingService.loading.value) {
        return CustomWidget.rectangular(height: 1.sh, width: 1.sw);
      }

      return CachedNetworkImage(
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        imageUrl: boardingService.boardingImg2.value.data,
        placeholder: (context, url) =>
            CustomWidget.rectangular(height: 1.sh, width: 1.sw),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    });
  }

  _getImage2(){

    return Obx(() {
      if (boardingService.loading.value) {
        return CustomWidget.rectangular(height: 1.sh, width: 1.sw);
      }

      return CachedNetworkImage(
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        imageUrl: boardingService.boardingImg3.value.data,
        placeholder: (context, url) =>
            CustomWidget.rectangular(height: 1.sh, width: 1.sw),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    });
  }


}
