import 'package:expense_tracker/widgest/expenses.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 117, 151, 203),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 21, 37, 185),
  brightness: Brightness.dark,
);

void main() {
  // THÊM DÒNG NÀY: Đảm bảo Flutter đã được khởi tạo trước khi gọi GoogleFonts
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ToastificationWrapper(
      config: ToastificationConfig(
        maxTitleLines: 2,
        maxDescriptionLines: 6,
        marginBuilder: (context, alignment) =>
            const EdgeInsets.fromLTRB(0, 16, 0, 110),
      ),
      child: MaterialApp(
        home: const Expenses(),
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: CardThemeData().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),
        // Tối ưu hóa: Dùng ThemeData.from() để tạo theme Material 3
        // từ ColorScheme một cách chính xác
        theme: ThemeData.from(colorScheme: kColorScheme, useMaterial3: true)
            .copyWith(
              // Bạn vẫn có thể .copyWith() để tùy chỉnh thêm
              appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer,
              ),
              cardTheme: const CardThemeData().copyWith(
                color: kColorScheme.secondaryContainer,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer,
                  foregroundColor: kColorScheme.onPrimaryContainer,
                ),
              ),
              textTheme: ThemeData().textTheme.copyWith(
                titleLarge: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kColorScheme.onSecondaryContainer,
                ),
              ),
            ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
      ),
    ),
  );
}
