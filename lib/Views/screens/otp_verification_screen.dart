import 'package:baba/Views/screens/bottom_nav_bar.dart';
import 'package:baba/Views/screens/dashboard.dart';
import 'package:baba/Views/widgets/default_size.dart';
import 'package:baba/Views/widgets/heading_text.dart';
import 'package:baba/utils/constant.dart';
import 'package:baba/utils/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({
    Key key,
  }) : super(key: key);

  @override
  _PinVerificationScreenState createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTextEditingController =
      TextEditingController();

  String pin = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  // bool otpVisibility = false;

  String verificationID = "";

  @override
  void dispose() {
    _pinTextEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kDefaultSize * 6,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultSize(),
                const DefaultSize(),
                const Center(
                  child: HeadingText(
                    title: "Phone Verification",
                  ),
                ),
                const DefaultSize(),
                const Center(
                  child: Text(
                    "Enter your OTP code here",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                  ),
                ),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kDefaultSize * 6,
                  ),
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      controller: _pinTextEditingController,
                      onChanged: (value) {
                        setState(() {
                          pin = value;
                        });
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.kDefaultSize * 8,
                        ),
                        selectedColor: Constant.primaryColor,
                        activeFillColor: Constant.primaryColor,
                        inactiveFillColor: Constant.primaryColor,
                        activeColor: const Color(0xffE5E5E5),
                        disabledColor: const Color(0xffE5E5E5),
                        inactiveColor: const Color(0xffE5E5E5),
                        selectedFillColor: Constant.primaryColor,
                        fieldHeight: SizeConfig.kDefaultSize * 14,
                        fieldWidth: SizeConfig.kDefaultSize * 14,
                      ),
                      cursorColor: Constant.primaryColor,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                const DefaultSize(),
                const DefaultSize(),
                const DefaultSize(),
                TextButton(onPressed: (){
                  verifyOTP();
                },child: Text('virify otp'),),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Didn't you received any code?",
                          style: TextStyle(
                            color: Constant.darkGreyColor,
                          ),
                        ),
                        TextSpan(
                          text: "\nResend a new code.",
                          style: TextStyle(
                            color: Constant.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: 'AJOnW4TDKkoRp-sznK1RDf-nJfkQCqu0bJAq_cK1dWdpKI-eK_moUXumaQmC4Iri-pchpT4tJH9TctiGPdghGxXd_3Jp0GRuU1x8m0kiMN6Uy6TSmkymBw0UV5wLttiZBS5FwZAFI3PODlWu-5H9FZQHYHV2Ns17jG_1dc2Fys1unU8kBUK0LVBpcOfO7mRF_R4sZp0tgvgafQuno3L3uw3_s2Ad_vAIDPdiQc_dPss-8N1t55JxKsY', smsCode: '265959');

    await auth.signInWithCredential(credential).then(
          (value) {
        print("You are logged in successfully");
        // Fluttertoast.showToast(
        //   msg: "You are logged in successfully",
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.CENTER,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: Colors.red,
        //   textColor: Colors.white,
        //   fontSize: 16.0,
        // );
      },
    ).whenComplete(
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ),
        );
      },
    );
  }
}
