# Zoom Tap Animation

Zoom Tap Animation is is a package that allows you to make an zoom animation effect similar to App Store's (ios app) items in Today tab, when you long tap on some item, it start to zoom in then it zoom out when you release it.

- [Zoom Tap Animation](#zoom-tap-animation)
  - [Screenshots](#screenshots)
  - [Installation](#installation)
  - [Usage](#usage)

## Screenshots:

### Source of idea

The idea is inspired from App Store app in Today tab where you can long tap on some item and it start to zoom in then zoom out as shown in the screenshot below.

<img src="https://raw.githubusercontent.com/KreatorDev/zoom_tap_animation/main/screenshots/original_idea.gif" height="480px" >

### Example:

Check out the example project in the example folder.

<img src="https://raw.githubusercontent.com/KreatorDev/zoom_tap_animation/main/screenshots/example.gif" height="480px" >

## Installation:

### add the package to your dependencies

```dart
dependencies:
  zoom_tap_animation: ^1.1.0
```

```dart
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
```

## Usage:

### default use of ZoomTapAnimation widget

```dart
ZoomTapAnimation(
      onTap: (){},
      child: YOUR_WIDGET
);
```

### and you can also define custom parameters

```dart
ZoomTapAnimation(
      child: YOUR_WIDGET,
      onTap: (){},
      onLongTap: (){},
      enableLongTapRepeatEvent: false,
      longTapRepeatDuration: const Duration(milliseconds: 100),
      begin: 1.0,
      end: 0.93,
      beginDuration: const Duration(milliseconds: 20),
      endDuration: const Duration(milliseconds: 120),
      beginCurve: Curves.decelerate,
      endCurve: Curves.fastOutSlowIn
);
```

### also you can use ZoomTapAnimation with your custom gestures

```dart
ZoomTapAnimation(
      child: GestureDetector(
      onTap: () {},
      onLongPress: (){},
      onDoubleTap: (){},
      // you can add more gestures...
      child: Container(color: Colors.yellow, width: 100.0, height: 100.0),
      ),
);
```

### parameters
| parameter       | description                                                | default                           |
|-----------------|------------------------------------------------------------|-----------------------------------|
| child           | your child widget that you want to put the zoom effect on. |                                   |
| onTap           | what should happen when you tap on the widget.             | null                              |
| onLongTap       | what should happen when you long tap on the widget.        | null                              |
| enableLongTapRepeatEvent | option to enable long tap loop which repeat every onTap event (in case onLongTap is specified, it repeats the onLongTap event). | false |
| longTapRepeatDuration | the duration between every onTap/onLongTap loop event. | const Duration(milliseconds: 100) |
| begin           | the size of widget you want to begin with.                 | 1.0                               |
| end             | the size of widget you want to begin with.                 | 0.93                              |
| beginDuration   | the duration of the begin zoom in animation.               | const Duration(milliseconds: 20)  |
| endDuration     | the duration of the end zoom in animation.                 | const Duration(milliseconds: 120) |
| beginCurve      | the curve animation type of the begin zoom in animation.   | Curves.decelerate                 |
| endCurve        | the curve animation type of the end zoom in animation.     | Curves.fastOutSlowIn              |