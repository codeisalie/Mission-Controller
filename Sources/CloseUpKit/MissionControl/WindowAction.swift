import ApplicationServices

/// A control CloseUp can perform on a window shown in Mission Control.
/// Overlay button order is defined by `OverlaySettings.enabledActions` (the exit
/// / force-quit button is placed first so it sits on the window's top-left
/// corner, at the outer end of the cluster).
public enum WindowAction: String, CaseIterable, Sendable {
    case close
    case minimize
    case zoom
    case hide
    case quit

    /// The Accessibility button attribute pressed to perform this action, or
    /// `nil` for actions handled without an AX button (hide/quit operate on the
    /// owning application, not a window button).
    public var axButtonAttribute: String? {
        switch self {
        case .close: kAXCloseButtonAttribute
        case .minimize: kAXMinimizeButtonAttribute
        case .zoom: kAXZoomButtonAttribute
        case .hide, .quit: nil
        }
    }

    /// SF Symbol drawn on the overlay button.
    public var symbolName: String {
        switch self {
        case .close: "xmark"
        case .minimize: "minus"
        case .zoom: "arrow.up.left.and.arrow.down.right"
        case .hide: "eye.slash"
        case .quit: "xmark"   // force-quit whole app (keyboard/batch only; not an overlay button)
        }
    }

    /// Catalog key for the button's accessibility label / tooltip.
    public var titleKey: String {
        switch self {
        case .close: "Close Window"
        case .minimize: "Minimize Window"
        case .zoom: "Maximize Window"
        case .hide: "Hide App"
        case .quit: "Quit App"
        }
    }
}

/// Mission Control / Exposé activation state, observed on the Dock process via
/// these undocumented-but-stable AX notification names.
public enum MissionControlState: String, CaseIterable, Sendable {
    case showAllWindows = "AXExposeShowAllWindows"   // Mission Control
    case showFrontWindows = "AXExposeShowFrontWindows" // App Exposé
    case showDesktop = "AXExposeShowDesktop"
    case inactive = "AXExposeExit"

    /// Whether an overlay should be shown for this state. Show Desktop hides all
    /// windows, so there is nothing to overlay there.
    public var showsWindowOverlays: Bool {
        switch self {
        case .showAllWindows, .showFrontWindows: true
        case .showDesktop, .inactive: false
        }
    }
}
