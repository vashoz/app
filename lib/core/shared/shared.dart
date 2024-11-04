library shared;

//! ----------------- Native -----------------
export 'constants.dart';
export 'custom_button.dart';
export 'dimension.dart';
export 'enums.dart';
export 'router.dart';
export 'task_notifier.dart';
export 'text_styles.dart';
export 'error/failure/failure.dart';
export 'extension/context.dart';
export 'extension/date_time.dart';
export 'extension/int.dart';
export 'extension/onboard.dart';
export 'extension/theme.dart';
export 'remote/endpoints.dart';
export 'remote/response.dart';
export 'remote/network_info.dart';
export 'resources/images.dart';
export 'resources/links.dart';
export 'shimmer/icon.dart';
export 'shimmer/label.dart';
export 'theme/scheme.dart';
export 'theme/theme_bloc.dart';

//! ----------------- Core -----------------
export 'dart:async';
export 'dart:io';
export 'dart:convert';
export 'dart:math' hide log;
export 'dart:developer' hide Flow;

//! ----------------- 3rd party -----------------
export 'package:cached_network_image/cached_network_image.dart';
export 'package:convex_bottom_bar/convex_bottom_bar.dart';
export 'package:either_dart/either.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter/material.dart' hide ThemeExtension;
export 'package:flutter/services.dart';
export 'package:flutter_animate/flutter_animate.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/svg.dart';
export 'package:get_it/get_it.dart';
export 'package:go_router/go_router.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:hydrated_bloc/hydrated_bloc.dart';
export 'package:http/http.dart';
export 'package:internet_connection_checker/internet_connection_checker.dart';
export 'package:path_provider/path_provider.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';