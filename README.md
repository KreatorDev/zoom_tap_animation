# Zoom Tap Animation

Zoom Tap Animation is is a package that allows you to make an zoom animation effect similar to App Store's (ios app) items in Today tab, when you long tap on some item, it start to zoom in then it zoom out when you release it.

![](https://github.com/fluttercandies/Flutter_Candies/blob/master/gif/like_button/like_button.gif)

- [Zoom Tap Animation](#zoom-tap-animation)
  - [Screenshots](#screenshots)
  - [How To Use It](#how-to-use-it)

## Screenshots:

## Source of idea:
The idea is inspired from App Store app in Today tab where you can long tap on some item and it start to zoom in then zoom as shown in the screenshot below.

<img src="screenshots/original_idea.gif" height="480px" >

## How To Use It:

### add the package to your dependencies

```dart
dependencies:
  zoom_tap_animation: ^1.0.0
```

```dart
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
```

### default use of ZoomTapAnimation widget:

```dart
ZoomTapAnimation(
      onTap: (){},
      child: YOUR_WIDGET
);
```

### and you can also define custom parameters:

```dart
ZoomTapAnimation(
      child: YOUR_WIDGET,
      onTap: (){},
      begin: 1.0,
      end: 0.93,
      beginDuration: const Duration(milliseconds: 20),
      endDuration: const Duration(milliseconds: 120),
      beginCurve: Curves.decelerate,
      endCurve: Curves.fastOutSlowIn
);
```

### parameters:
| parameter       | description                                                | default                           |
|-----------------|------------------------------------------------------------|-----------------------------------|
| child           | your child widget that you want to put the zoom effect on. |                                   |
| onTap           | what should happen when you tap on the widget.             | null                              |
| begin           | the size of widget you want to begin with.                 | 1.0                               |
| end             | the size of widget you want to begin with.                 | 0.93                              |
| beginDuration   | the duration of the begin zoom in animation.               | const Duration(milliseconds: 20)  |
| endDuration     | the duration of the end zoom in animation.                 | const Duration(milliseconds: 120) |
| beginCurve      | the curve animation type of the begin zoom in animation.   | Curves.decelerate                 |
| endCurve        | the curve animation type of the end zoom in animation.     | Curves.fastOutSlowIn              |