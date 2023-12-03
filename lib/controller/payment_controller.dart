import 'dart:developer';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  Razorpay razorpay = Razorpay();

  @override
  void onInit() {
    // PaymentController pcontroller = Get.put(PaymentController());
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.onInit();
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  void openPayment(int price) async {
    int amount = price * 100;
    final options = {
      'key': 'rzp_test_ylRlOxUN6l346l',
      'amount': amount,
      'name': 'E-Commerce',
      'description': '',
      'prefill': {'contact': '7034527959', 'email': 'E-com@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse successResponse) {
        handlePaymentSuccess(successResponse);
      });

      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse failureResponse) {
        handlePaymentError(failureResponse);
      });

      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse walletResponse) {
        handleExternalWallet(walletResponse);
      });
    } on PaymentFailureResponse catch (e) {
      log(e.toString(), name: 'razorpay catch');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    log("Payment success with signature ${response.signature}",
        name: 'success');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    log("Payment error with code ${response.error}", name: 'error');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    log("External wallet used: ${response.walletName}", name: 'wallet');
  }
}
