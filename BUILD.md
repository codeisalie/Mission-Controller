# Mission Controller

## Identity (this build)

| | |
|--|--|
| App on disk | **MissionController.app** |
| Process | **MissionController** |
| Display name | **Mission Controller** |
| Bundle ID (Release) | `com.oomol.MissionController` |
| Bundle ID (Debug) | `com.oomol.MissionController.dev` |

This is a **new** code identity — not CloseUp / CloseUp Dev. Old Accessibility
entries will never rename themselves; grant the **new** app.

## Build

1. Quit every old CloseUp / CloseUp Dev / Mission Controller process.
2. Xcode → **Product → Clean Build Folder** (⇧⌘K).
3. Delete old products:
   ```bash
   rm -rf ~/Library/Developer/Xcode/DerivedData/CloseUp-*
   rm -rf ~/Library/Developer/Xcode/DerivedData/Mission*
   ```
4. Open `CloseUp.xcodeproj` → Run.
5. Confirm the built product is `MissionController.app` (Xcode → Products).
6. System Settings → Privacy & Security → Accessibility → enable **Mission Controller**.

## Close button

**X** closes **that window only** (AX close button). It does **not** minimize
and does **not** quit the whole app.
