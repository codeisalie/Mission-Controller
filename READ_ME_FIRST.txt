MISSION CONTROLLER — READ THIS ONCE
====================================

WHY YOU SAW TWO APPS (CloseUp Dev + Mission Controller)
------------------------------------------------------
Older builds used a different name/path. macOS Accessibility keeps EVERY old
entry forever. This build is ONLY:

  App:     MissionController.app
  Name:    Mission Controller
  Bundle:  com.oomol.MissionController

CloseUp Dev is DEAD. Delete it from Accessibility. Do not enable it.

BEFORE YOU BUILD
----------------
1. Quit all CloseUp / CloseUp Dev / Mission Controller processes
   (Activity Monitor → search CloseUp / Mission → Force Quit).

2. System Settings → Privacy & Security → Accessibility
   - Remove EVERY row: CloseUp, CloseUp Dev, closeupdev, Mission Controller, MissionController
   - Leave the list clean.

3. In Xcode: Product → Clean Build Folder (Shift-Cmd-K)

4. Delete DerivedData:
   rm -rf ~/Library/Developer/Xcode/DerivedData/CloseUp-*
   rm -rf ~/Library/Developer/Xcode/DerivedData/Mission*

5. Open CloseUp.xcodeproj → Run

6. When Accessibility prompts (or menu bar says Not Granted):
   Enable ONLY "Mission Controller" / MissionController.app

7. Menu bar must show:
   ✓ Accessibility: Granted
   ✓ Overlay: Active

If Accessibility is not granted to THIS app, the buttons CANNOT work.
Granting CloseUp Dev does nothing for MissionController.

BUTTONS
-------
X  = quit that app (force quit)
−  = minimize
↗  = zoom
