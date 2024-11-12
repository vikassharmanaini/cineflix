class ApiIndex {
  static String baseurl = "https://ott-backend-1.onrender.com";
  static String baseapiUser = baseurl+"/api/user";
  static String baseapiContent = baseurl+"/api/contents"; 
  String sendOTP = baseapiUser+"/send-otp";
  String verifyOTP = baseapiUser+"/verify-otp";
  String loginwallet = baseapiUser+"/login-wallet";
  String createprofile = baseapiUser+"/create-profile";

  String getTrending= baseapiContent+"/get-trending";
  String getNewReleases= baseapiContent+"/new-releases";

}