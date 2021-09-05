# Zoom Tap Animation

Zoom Tap Animation is is a package that allows you to make an zoom animation effect similar to App Store's (ios app) items in Today tab, when you long tap on some item, it start to zoom in then it zoom out when you release it..

## How To Use It:

# add the package to your dependencies

```dart
dependencies:
  zoom_tap_animation: ^1.0.0
```

```dart
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
```

# use ZoomTapAnimation widget

```dart
ZoomTapAnimation(
      onTap: (){
            // what should happen when you tap on the widget
      },
            // put your widget here
      child: YOUR_WIDGET
);
```

## Parameters
| parameter       | description                                              | default                           |
|-----------------|----------------------------------------------------------|-----------------------------------|
| child           | your child widget that you want put the effect on.       |                                   |
| onTap           | what should happen if you tap on the widget.             | null                              |
| begin           | the size of widget you want to begin with.               | 1.0                               |
| end             | the size of widget you want to begin with.               | 0.93                              |
| duration        | the duration of the begin zoom in animation.             | const Duration(milliseconds: 20)  |
| reverseDuration | the duration of the end zoom in animation.               | const Duration(milliseconds: 120) |
| beginCurve      | the curve animation type of the begin zoom in animation. | Curves.decelerate                 |
| endCurve        | the curve animation type of the end zoom in animation.   | Curves.fastOutSlowIn              |