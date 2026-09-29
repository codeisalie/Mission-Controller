import AppKit
import SwiftUI

/// The status-bar (menu-bar) dropdown. Rendered as a native `NSMenu` by
/// `MenuBarExtra(.menu)`, so every label is pre-resolved through `appState.loc`
/// to follow the in-app language override rather than the system language.
struct MenuBarView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        @Bindable var appState = appState

        // Live permission / engine status so the user can see at a glance
        // whether Mission Controller can actually drive Mission Control.
        Text(accessibilityStatusLabel)
            .foregroundStyle(appState.accessibilityGranted ? .primary : .secondary)
        Text(overlayStatusLabel)
            .foregroundStyle(.secondary)

        if !appState.accessibilityGranted {
            Button(appState.loc("Grant Accessibility…")) {
                appState.requestAccessibilityAccess()
            }
        }

        Divider()

        Toggle(appState.loc("Enable"), isOn: $appState.isEnabled)

        Divider()

        Button(appState.loc("Settings…")) {
            // AppKit-managed window shared with the reopen handler; SwiftUI's
            // `Settings` scene can't be opened from the reopen path in an
            // accessory app, so Mission Controller does not use it. See
            // `SettingsWindowController`.
            appState.openSettings()
        }
        .keyboardShortcut(",", modifiers: .command)

        Button(appState.loc("Quit Mission Controller")) {
            NSApplication.shared.terminate(nil)
        }
        .keyboardShortcut("q", modifiers: .command)
    }

    private var accessibilityStatusLabel: String {
        if appState.accessibilityGranted {
            return "✓  " + appState.loc("Accessibility: Granted")
        }
        return "⚠  " + appState.loc("Accessibility: Not Granted")
    }

    private var overlayStatusLabel: String {
        if !appState.accessibilityGranted {
            return appState.loc("Overlay: Waiting for Accessibility")
        }
        if appState.isEnabled {
            return "✓  " + appState.loc("Overlay: Active")
        }
        return appState.loc("Overlay: Disabled")
    }
}
