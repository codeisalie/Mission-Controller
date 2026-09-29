import AppKit
import SwiftUI

/// About pane: application icon and build identifier.
struct AboutPane: View {
    var body: some View {
        VStack(spacing: DS.Spacing.md) {
            Image(nsImage: NSApp.applicationIconImage)
                .resizable()
                .frame(width: DS.Size.aboutIcon, height: DS.Size.aboutIcon)

            Text(verbatim: "Build 1.0")
                .font(DS.Font.version)
                .foregroundStyle(.secondary)
        }
        .padding(DS.Spacing.section)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
