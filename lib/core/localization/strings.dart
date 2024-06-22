import 'package:easy_localization/easy_localization.dart';

abstract class AppStrings{
  static const String _appName = 'appName';
  static const String _myGellary = 'myGellary';
  static const String _login = 'login';
  static const String _userName = 'userName';
  static const String _password = 'password';
  static const String _submit = 'submit';
  ///errors
  static const String _offlineError = 'offlineErrorMsg';
  static const String _serverError = 'serverErrorMsg';
  static const String _cacheError = 'cacheErrorMsg';
  static const String _invalidPageNumberError = 'invalidPageNumberErrorMsg';
  ///
  static const String _noMessage = 'noMessage';
  static const String _upload = 'upload';
  static const String _welcome = 'welcome';
  static const String _gellary = 'gellary';
  static const String _camera = 'camera';
  static const String _successLoginMsg = 'successLoginMsg';
  static const String _languageBtnTxt = 'languageBtnTxt';
  static const String _welcomeToChatGPT = 'welcomeToChatGPT';
  static const String _askAnythingGetYourAnswer = 'askAnythingGetYourAnswer';
  static const String _next = 'next';
  static const String _edit = 'edit';
  static const String _delete = 'delete';
  static const String _letsChat = 'letsChat';
  static const String _newChat = 'newChat';
  static const String _clearConversations = 'clearConversations';
  static const String _upgradeToPlus = 'upgradeToPlus';
  static const String _lightMode = 'lightMode';
  static const String _updatesAndFAQ = 'updatesAndFAQ';
  static const String _logout = 'logout';
  static const String _newTxt = 'new';
  static const String _back = 'back';
  ///Local Data
  static const String _examples = 'examples';
  static const String _examplesService1 = 'examplesService1';
  static const String _examplesService2 = 'examplesService2';
  static const String _examplesService3 = 'examplesService3';
  static const String _capabilities = 'capabilities';
  static const String _capabilitiesService1 = 'capabilitiesService1';
  static const String _capabilitiesService2 = 'capabilitiesService2';
  static const String _capabilitiesService3 = 'capabilitiesService3';
  static const String _limitations = 'limitations';
  static const String _limitationsService1 = 'limitationsService1';
  static const String _limitationsService2 = 'limitationsService2';
  static const String _limitationsService3 = 'limitationsService3';
  ///
/////////////////////////////////////////////////////////////////

  static String get appName => _appName.tr();

  static String get newChat => _newChat.tr();

  static String get edit => _edit.tr();

  static String get next => _next.tr();

  static String get letsChat => _letsChat.tr();

  static String get limitationsKey => _limitations;
  static String get limitations => _limitations.tr();

  static String get capabilitiesKey => _capabilities;
  static String get capabilities => _capabilities.tr();

  static String get examplesKey => _examples;
  static String get examples => _examples.tr();

  static String get askAnythingGetYourAnswer => _askAnythingGetYourAnswer.tr();

  static String get myGellary => _myGellary.tr();

  static String get login => _login.tr();

  static String get userName => _userName.tr();

  static String get password => _password.tr();

  static String get submit => _submit.tr();

  static String get offlineError => _offlineError.tr();

  static String get welcomeToChatGPT => _welcomeToChatGPT.tr();

  static String get serverError => _serverError.tr();

  static String get cacheError => _cacheError.tr();

  static String get invalidPageNumberError => _invalidPageNumberError.tr();

  static String get noMessage => _noMessage.tr();

  static String get logout => _logout.tr();

  static String get upload => _upload.tr();

  static String get welcome => _welcome.tr();

  static String get gellary => _gellary.tr();

  static String get camera => _camera.tr();

  static String get successLoginMsg => _successLoginMsg.tr();

  static String get languageBtnTxt => _languageBtnTxt.tr();

  static String get limitationsService3 => _limitationsService3.tr();
  static String get limitationsService3Key => _limitationsService3;

  static String get limitationsService2 => _limitationsService2.tr();
  static String get limitationsService2Key => _limitationsService2;

  static String get limitationsService1 => _limitationsService1.tr();
  static String get limitationsService1Key => _limitationsService1;

  static String get capabilitiesService3 => _capabilitiesService3.tr();
  static String get capabilitiesService3Key => _capabilitiesService3;

  static String get capabilitiesService2 => _capabilitiesService2.tr();
  static String get capabilitiesService2Key => _capabilitiesService2;

  static String get capabilitiesService1 => _capabilitiesService1.tr();
  static String get capabilitiesService1Key => _capabilitiesService1;

  static String get examplesService3 => _examplesService3.tr();
  static String get examplesService3Key => _examplesService3;

  static String get examplesService2 => _examplesService2.tr();
  static String get examplesService2Key => _examplesService2;

  static String get examplesService1 => _examplesService1.tr();
  static String get examplesService1Key => _examplesService1;

  static String get delete => _delete.tr();

  static String get updatesAndFAQ => _updatesAndFAQ.tr();

  static String get lightMode => _lightMode.tr();

  static String get upgradeToPlus => _upgradeToPlus.tr();

  static String get clearConversations => _clearConversations.tr();

  static String get newTxt => _newTxt.tr();

  static String get back => _back.tr();
  static String get backKey => _back;
}