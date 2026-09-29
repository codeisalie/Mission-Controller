import CoreGraphics
import Testing

@testable import CloseUpKit

@Suite("Shortcut matching")
struct ShortcutMatchingTests {
    @Test("modifier set keeps only the four chord modifiers")
    func modifierNormalization() {
        let flags: CGEventFlags = [.maskCommand, .maskAlphaShift /* caps lock — ignored */]
        #expect(ModifierSet(cgEventFlags: flags) == .command)
    }

    @Test("a chord matches its exact key + modifiers")
    func exactMatch() {
        let quit = MissionControlShortcut.quit.defaultChord // ⌘Q
        #expect(quit.matches(keyCode: 12, flags: .maskCommand))
    }

    @Test("⌥⌘W (close all) never collides with ⌘W (close one)")
    func batchVersusSingle() {
        let close = MissionControlShortcut.close.defaultChord
        let closeAll = MissionControlShortcut.closeAll.defaultChord
        // Close is ⌘W (key 13); close-all is ⌥⌘W (key 13) — same key, modifiers differ.
        #expect(close.matches(keyCode: 13, flags: .maskCommand))
        #expect(!close.matches(keyCode: 13, flags: [.maskCommand, .maskAlternate]))
        #expect(closeAll.matches(keyCode: 13, flags: [.maskCommand, .maskAlternate]))
        #expect(!closeAll.matches(keyCode: 13, flags: .maskCommand))
    }

    @Test("default chords are the native window verbs")
    func defaults() {
        #expect(MissionControlShortcut.close.defaultChord == KeyChord(keyCode: 13, modifiers: .command))
        #expect(MissionControlShortcut.minimize.defaultChord == KeyChord(keyCode: 46, modifiers: .command))
        #expect(MissionControlShortcut.hide.defaultChord == KeyChord(keyCode: 4, modifiers: .command))
        #expect(MissionControlShortcut.quit.defaultChord == KeyChord(keyCode: 12, modifiers: .command))
        #expect(MissionControlShortcut.minimizeAll.defaultChord.modifiers == [.command, .option])
    }

    @Test("each shortcut maps to the right window action and batch flag")
    func actionMapping() {
        #expect(MissionControlShortcut.closeAll.windowAction == .close)
        #expect(MissionControlShortcut.closeAll.isBatch)
        #expect(!MissionControlShortcut.close.isBatch)
        #expect(MissionControlShortcut.zoom.windowAction == .zoom)
    }
}
