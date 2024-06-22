import 'dart:convert';

import 'package:chat_gpt_app/core/extensions/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper{
  static SharedPreferences? _preferences;
  static const String _userTokenKey='User Token Key';
  static const String _appModeKey='App Mode Key';
  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }
  static Future<bool?> saveUserToken({required String token})async=>await _preferences?.setString(_userTokenKey, token);
  static Future<bool?> saveAppMode({required ThemeMode mode}) async {
    var modeValue=mode.name.toString();
    print('current mode= $modeValue');
    return await _preferences?.setString(_appModeKey, modeValue);
  }
  static String getUserToken()=>_preferences?.getString(_userTokenKey)??'';
  static ThemeMode getAppMode() {
    var modeJson = _preferences?.getString(_appModeKey)?? '';
    return modeJson.getThemeMode();
  }
  static Future<bool?> removeToken()async=> await _preferences?.remove(_userTokenKey);
}