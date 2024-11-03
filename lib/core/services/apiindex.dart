class ApiIndex {
  static String baseurl = "https://ott-backend-1.onrender.com";
  static String baseapi = baseurl+"/api/user";
  String sendOTP = baseapi+"/send-otp";
  String verifyOTP = baseapi+"/verify-otp";
  String loginwallet = baseapi+"/login-wallet";
  String createprofile = baseapi+"/create-profile";
}