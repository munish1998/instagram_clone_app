class AppUrl {
  static var baseUrl = 'https://pranavsocial.appskeeper.in';

  static var loginEndPint = '$baseUrl/api/v1/user/login';

  static var registerApiEndPoint = '$baseUrl/api/register';

  static var SignUp = '$baseUrl/api/v1/user/signup';

  static var SignupOtpVerification = '$baseUrl/api/v1/user/verify-user';

  static var ForgetPassword = '$baseUrl/api/v1/user/forgot-password';

  static var resendotp = '$baseUrl/api/v1/user/send-otp';

  static var forgetverifyotp = '$baseUrl/api/v1/user/verify-otp';

  static var resetpassword = '$baseUrl/api/v1/user/reset-password';

  static var logout= '$baseUrl/api/v1/user/logout';

  static var CreatePost = '$baseUrl/api/v1/user/post';

  static var UserProfile = '$baseUrl/api/v1/user/user-profile';

  static var fetchProfileEndPoint =
      'https://pranavsocial.appskeeper.in/api/v1/user/user-profile?userId=';

  static var fetchProfileEndPoint1 =
      'https://pranavsocial.appskeeper.in/api/v1/user/like?postId=';

  static var fetchProfileEndPoint2 =
      'https://pranavsocial.appskeeper.in/api/v1/user/user-search?name=';

  static var userfollowerslist =
      'https://pranavsocial.appskeeper.in/api/v1/user/followers-list?UserId=';

  static var userfollowinglist =
      'https://pranavsocial.appskeeper.in/api/v1/user/following-list?UserId=';

  static var userfollow = '$baseUrl/api/v1/user/follow';

  static var userunfollow =
      'https://pranavsocial.appskeeper.in/api/v1/user/unfollow?followingId';

  static var userfeed = '$baseUrl/api/v1/user/user-feed';

  static var userlike =
      'https://pranavsocial.appskeeper.in/api/v1/user/like?postId=';

  static var userdislike =
      'https://pranavsocial.appskeeper.in/api/v1/user/dislike?postId=';

  static var userlistlikes =
      'https://pranavsocial.appskeeper.in/api/v1/user/list-likes?postId=';

  static var usercomment = '$baseUrl/api/v1/user/comments';

  static var usersearch = '$baseUrl/api/v1/user/user-search';

  static var editprofile = '$baseUrl/api/v1/user/edit-profile';

  static var getpost = '$baseUrl/api/v1/user/post';

  static var editPost =
      'https://pranavsocial.appskeeper.in/api/v1/user/post?postId=';

  static var commentpost = '$baseUrl/api/v1/user/comment';

  static var commentsuser =
      'https://pranavsocial.appskeeper.in/api/v1/user/comments?postId=';

  static var reportpost =
      'https://pranavsocial.appskeeper.in/api/v1/user/report-post?postId=';

  static var deletepost =
      'https://pranavsocial.appskeeper.in/api/v1/user/post?postId=';

  static var notification =
      'https://pranavsocial.appskeeper.in/api/v1/notification';

  static var notificationget =
      'https://pranavsocial.appskeeper.in/api/v1/notification';

      static var deletenotification =
      'https://pranavsocial.appskeeper.in/api/v1/notification';
}
