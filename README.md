<p align="center">
<img width="1024" height="1024" alt="Icon-iOS-Default-1024@1x" src="https://github.com/user-attachments/assets/3bb2120b-5841-448d-adff-bd1f90bd6516" />
</p>

# Mission Controller 🚀

Put the controls back where they belong. **Mission Controller** is a lightweight macOS utility that overlays instant, responsive window management controls—featuring **Close/Force-Quit**, Minimize, and Zoom/Expand—directly onto your native Mission Control previews.

<p align="center">
  <img src="Screenshot 2026-09-29 at 4.32.52 AM.png" width="800" alt="Mission Controller Preview">
</p>

---

### ✨ What Makes It Different
* **Smart Force-Quit Action:** Clicking the close button completely terminates the target process for that window, backed by an intelligent safety safeguard so it won't accidentally nuke your last active instance.
* **Factory-Clean Alignment:** Meticulously re-aligned 3-icon cluster layout built to sit seamlessly and naturally over macOS Mission Control window thumbnails without visual clutter.

---

### 📦 Quick Installation

1. Grab the latest `Mission Controller.zip` build from the [Releases](../../releases) page.
2. Extract the archive and drag **Mission Controller.app** into your **Applications** folder.
3. Launch the app and grant **Accessibility permissions** when prompted so it can securely interact with system window layers.

> **First-time macOS tip:** If Gatekeeper blocks the app on first launch, simply **Right-click (or Control-click)** the app icon, select **Open**, and click **Open** in the dialog prompt.

---

### 🛠️ Building From Source

If you want to compile it locally:

```bash
git clone [https://github.com/codeisalie/Mission-Controller.git](https://github.com/codeisalie/Mission-Controller.git)
cd Mission-Controller
# Run your build configurations or Xcode/XcodeGen commands here
