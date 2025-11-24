import 'package:flutter/material.dart';

/// Uygulama genelinde kullanılacak standartlaştırılmış padding ve boşluk değerlerini içerir.
/// Bu sabitler, UI'ın tutarlılığını ve okunabilirliğini artırır.
class AppSpacing {
  // --- SABİT DEĞERLER (Standard Constants) ---

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // --- 1. EDGEINSETS: Tüm Yönlerde Padding'ler (iç dolgu/kenar boşluğu) ---

  /// 4.0
  static const EdgeInsets allXS = EdgeInsets.all(xs);

  /// 8.0
  static const EdgeInsets allSM = EdgeInsets.all(sm);

  /// 16.0
  static const EdgeInsets allMD = EdgeInsets.all(md);

  /// 24.0
  static const EdgeInsets allLG = EdgeInsets.all(lg);

  // --- 2. EDGEINSETS: Yönlü Padding'ler ---

  /// Yatay (Horizontal) 16.0
  static const EdgeInsets horizontalMD = EdgeInsets.symmetric(horizontal: md);

  /// Yatay (Horizontal) 8.0
  static const EdgeInsets horizontalSM = EdgeInsets.symmetric(horizontal: sm);

  /// Dikey (Vertical) 16.0
  static const EdgeInsets verticalMD = EdgeInsets.symmetric(vertical: md);

  /// Dikey (Vertical) 8.0
  static const EdgeInsets verticalSM = EdgeInsets.symmetric(vertical: sm);

  // --- 3. SIZEDBOX: Dikey Boşluklar (Öğeler Arası Boşluk) ---

  /// 8.0 Dikey Boşluk
  static const Widget verticalSpacerSM = SizedBox(height: sm);

  /// 16.0 Dikey Boşluk (En sık kullanılan)
  static const Widget verticalSpacerMD = SizedBox(height: md);

  /// 24.0 Dikey Boşluk
  static const Widget verticalSpacerLG = SizedBox(height: lg);

  /// 32.0 Dikey Boşluk
  static const Widget verticalSpacerXL = SizedBox(height: xl);

  // --- 4. SIZEDBOX: Yatay Boşluklar ---

  /// 8.0 Yatay Boşluk
  static const Widget horizontalSpacerSM = SizedBox(width: sm);

  /// 16.0 Yatay Boşluk
  static const Widget horizontalSpacerMD = SizedBox(width: md);


  // --- 5. ÖZEL KULLANIM: Ekran Ana Padding'i ---

  /// Ekranlar için önerilen ana padding: Yatay 16.0, Dikey 24.0 (AppBar altı için)
  static const EdgeInsets screenPadding = EdgeInsets.fromLTRB(md, lg, md, md);
}