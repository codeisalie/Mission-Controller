# Boot / build notes (modified tree)

Based on the original CloseUp source. Only these changes remain:

1. Exit button on the top-left corner: cluster anchored top-left, X centered on the window corner, minimize/zoom to its right (OverlayGeometry, OverlaySettings, WindowInfo, WindowAction).
2. The X quits the whole app using SmartClose's action (`NSRunningApplication.terminate()`), escalating to `forceTerminate()`/SIGKILL if the app is still alive 0.8 s later. Finder and CloseUp itself are protected.
3. Faster boot: engine start deferred one main-run-loop turn (AppState).

Minimize / maximize, the click tap and the engine are the ORIGINAL CloseUp code, unmodified.

Grant CloseUp in System Settings > Privacy & Security > Accessibility (and Input Monitoring if prompted), then relaunch. Debug builds are ad-hoc signed: re-grant after rebuilds, or run `make dev-cert` once.
