import CloseUpKit
import Testing

@Suite("OverlaySettings")
struct OverlaySettingsTests {

    @Test("defaults turn close/minimize/maximize on")
    func defaults() {
        let s = OverlaySettings()
        #expect(s.showClose && s.showMinimize && s.showZoom)
        // The close button (close this window only, toggled by `showClose`) is FIRST
        // so it sits on the window's top-left corner, at the outer end of the cluster.
        #expect(s.enabledActions == [.close, .minimize, .zoom])
    }

    @Test("enabledActions places the close button first (top-left corner)")
    func order() {
        let s = OverlaySettings(showClose: true, showMinimize: false, showZoom: true)
        #expect(s.enabledActions == [.close, .zoom])
    }

    @Test("turning the close toggle off removes the close button")
    func exitToggleOff() {
        let s = OverlaySettings(showClose: false, showMinimize: true, showZoom: true)
        #expect(s.enabledActions == [.minimize, .zoom])
    }

    @Test("a blob written before later toggles existed still loads with defaults")
    func lenientDecode() throws {
        let json = #"{"showClose":false}"#
        let s = try JSONDecoder().decode(OverlaySettings.self, from: Data(json.utf8))
        #expect(!s.showClose)
        #expect(s.showMinimize)
        #expect(s.showZoom)
    }

    @Test("round-trips through Codable")
    func roundTrip() throws {
        let original = OverlaySettings(showClose: false, showMinimize: true, showZoom: false)
        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(OverlaySettings.self, from: data)
        #expect(decoded == original)
    }

    @Test("isEnabled agrees with the stored flags; quit/hide are never overlay buttons")
    func isEnabled() {
        let s = OverlaySettings(showClose: true, showMinimize: false, showZoom: false)
        #expect(s.isEnabled(.close))      // close this window only
        #expect(!s.isEnabled(.minimize))
        #expect(!s.isEnabled(.zoom))
        #expect(!s.isEnabled(.quit))      // never an overlay button
        #expect(!s.isEnabled(.hide))
    }
}
