## 1.0.0

* First release of the `AnimatedHalo` widget: a pulsing halo ring recreated
  frame-by-frame from a 72×72, 60fps, 0–89 frame reference animation.
* Inner ring fixed radius, stroke that thickens and fades in.
* Outer ring expands in sync while fading in and out.
* Configurable:
  * `size` — canvas edge length (default 72).
  * `color` / `innerColor` — outer and inner ring stroke colors.
  * `spacing` — outer-ring radius delta relative to the inner ring (default 6).
  * `strokeWidth` / `innerStrokeWidth` — ring widths.
  * `duration` — one animation loop (default 1483ms).
  * `child` — content clipped to a circle inside the inner ring.
* Includes an example app with live controls and a circular network image child.
