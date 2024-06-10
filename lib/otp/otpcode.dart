import 'package:flutter/material.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({super.key});

  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  // _onOtpCallBack(String otpCode, bool isAutofill) {
  //   setState(() {
  //     this._otpCode = otpCode;
  //     if (otpCode.length == _otpCodeLength && isAutofill) {
  //       _enableButton = false;
  //       _isLoadingButton = true;
  //       _verifyOtpCode();
  //     } else if (otpCode.length == _otpCodeLength && !isAutofill) {
  //       _enableButton = true;
  //       _isLoadingButton = false;
  //     }else{
  //       _enableButton = false;
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          "Verify by OTP",
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TextFieldPin(
            //     textController: TextEditingController,
            //     autoFocus: true,
            //     codeLength: 4,
            //     alignment: MainAxisAlignment.center,
            //     defaultBoxSize: 46.0,
            //     margin: 10,
            //     selectedBoxSize: 46.0,
            //     textStyle: TextStyle(fontSize: 16),
            //     defaultDecoration: (
            //       border: Border.all(
            //           color: Theme.of(context).primaryColor.withOpacity(0.6))
            //     ),
            //     //selectedDecoration: _pinPutDecoration,
            //     onChange: (code) {
            //       //  _onOtpCallBack(code,false);
            //     }),
          ],
        ),
      ),
    );
  }
}
