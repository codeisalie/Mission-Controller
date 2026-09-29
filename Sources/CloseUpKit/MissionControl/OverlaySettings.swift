import Foundation

/// Which overlay controls are shown, persisted as a single JSON blob. Defaults
/// = close + minimize + maximize all on. The close ("X") button — governed by
/// `showClose` — closes **only the selected window** (not the whole app).
/// Force-quit of an entire app is never offered as an overlay button.
///
/// Forward/backward-compatible: every field decodes present-or-default, so a blob
/// written by an older build (missing a later toggle) still loads, and a blob
/// from a newer build (extra keys) loads on the fields this build knows. Each
/// default reproduces the pre-field behavior.
public struct OverlaySettings: Codable, Equatable, Sendable {
    public var showClose: Bool
    public var showMinimize: Bool
    public var showZoom: Bool

    public init(
        showClose: Bool = true,
        showMinimize: Bool = true,
        showZoom: Bool = true
    ) {
        self.showClose = showClose
        self.showMinimize = showMinimize
        self.showZoom = showZoom
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        let d = OverlaySettings()
        showClose = try c.decodeIfPresent(Bool.self, forKey: .showClose) ?? d.showClose
        showMinimize = try c.decodeIfPresent(Bool.self, forKey: .showMinimize) ?? d.showMinimize
        showZoom = try c.decodeIfPresent(Bool.self, forKey: .showZoom) ?? d.showZoom
    }

    /// Whether a given action's button is enabled. The close button is the
    /// `.close` action (close this window only), toggled by `showClose`.
    /// App-level force-quit (`.quit`) and hide are never overlay buttons.
    public func isEnabled(_ action: WindowAction) -> Bool {
        switch action {
        case .close: showClose
        case .minimize: showMinimize
        case .zoom: showZoom
        case .hide, .quit: false
        }
    }

    /// The enabled actions in left-to-right overlay order. The close button is
    /// FIRST so it sits at the outer end of the top-left cluster — on the
    /// window's corner. Always non-empty in practice (the settings UI keeps at
    /// least the close button on), but callers must tolerate an empty result —
    /// an empty overlay simply doesn't show.
    public var enabledActions: [WindowAction] {
        let order: [WindowAction] = [.close, .minimize, .zoom, .hide, .quit]
        return order.filter(isEnabled)
    }
}
