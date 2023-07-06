import 'package:flutter/material.dart';
import 'package:frontend/pages/Chat/chat_page.dart';
import 'package:frontend/pages/Home%20Page/home_page.dart';
import 'package:frontend/pages/Profile/profile_page.dart';
import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;
  final Widget page;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    required this.page,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomnavs = [
  RiveAsset("images/icon.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
      title: "HOME",
      page: const HomePage()),
  RiveAsset("images/icon.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "TIMER",
      page: ChatPage()),
  RiveAsset("images/icon.riv",
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "CHAT",
      page: ChatPage()),
  RiveAsset("images/icon.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "NOTIFICATION",
      page: ChatPage()),
  RiveAsset("images/icon.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "PROFILE",
      page: ProfilePage()),
];
