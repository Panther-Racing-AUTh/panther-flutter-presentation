# Flutter Calculator

This is a simple calculator app built with Flutter that allows you to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.

## Prerequisites
- Flutter SDK (>= 2.0.0)
- Android Studio or VS Code with Flutter extension

## Getting Started
1. Clone the repository or download the ZIP file.
2. Open the project in Android Studio or VS Code.
3. Install the dependencies by running `flutter pub get` in the terminal.
4. Run the app with `flutter run` command in the terminal or use the Run button in the IDE.

## Features
- The calculator has buttons for all the digits from 0 to 9, NOT including a decimal point.
- It supports the basic arithmetic operations of `addition`, `subtraction`, `multiplication`, and `division`.
- The `C` button allows you to clear the calculator display and start again.
- The calculator input is designed to look like a numpad on a keyboard.

## Project Structure
- `main.dart` file contains the code for the `CalculatorApp` widget which is the root of the app.
- `calculator.dart` file contains the code for the `Calculator` widget which is the main calculator UI and functionality.

## Notes
- The app uses the `eval` package to evaluate the mathematical expression entered by the user.
- The UI is designed to be responsive to different screen sizes and orientations.
