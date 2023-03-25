import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RegexExample: Slide {
    // @offset(RegexExample)
    static var offset = CGVector(dx: 3.5, dy: 3.5)

    // @hint(RegexExample){
    static var hint: String? =
"""

"""
    // }@hint(RegexExample)

    private static let defaultCode =
#"""
import Foundation
let aSet = CharacterSet(charactersIn: "🧒🏻👧")
print("👧🏻".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
print("🧒".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
print("👧🏼".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
"""#

    private static let defaultStdIn = [
        "swiftc code.swift && ./code"
    ]

    public final class ExposedState: ForwardEventCapturingState {
        public static var stateSingleton: RegexExample.ExposedState = .init()

        @Published var execCode: TextEditorView.Model = .init(
            filePath: FileCoordinator.shared.pathToFolder(for: "codeExample") + "/code.swift",
            format: .swift,
            content: RegexExample.defaultCode
        )
        @Published var terminal: TerminalView.Model = .init(
            workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "codeExample")),
            stdIn: RegexExample.defaultStdIn[0]
        )
        @Published var toggle: Bool = false

        public func captured(forwardEvent number: UInt) -> Bool {
            switch number {
            case 0:
                toggle.toggle()
            case 1:
                execCode.save()
                terminal.execute()
            case 2:
                toggle.toggle()
            default:
                return false
            }
            return true
        }
    }
    @ObservedObject private var state: ExposedState = ExposedState.stateSingleton

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Výstřižek z prezentace String Processing").font(.presentationSubHeadline)
            }
            Text(
"""
 - `CharacterSet` je `Foundation` typ
 - Obsahuje 20 kategorií, mnohem více než `Character` (např. `urlPathAllowed`)
 - Umožňuje množivné oprace: průnik, doplněk, ...
 - **Pracuje ale se skaláry, nikoliv grafémy!**
 - Podporuje zadání pomocí explicitního výčtu znaků
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
            ToggleView(toggledOn: $state.toggle) {
                VStack(spacing: 8) {
                    TextEditorView(model: state.execCode)
                    TerminalView(model: state.terminal, aspectRatio: 0.35, axis: .horizontal)
                }
            }
        }.padding()
    }
}

struct RegexExample_Previews: PreviewProvider {
    static var previews: some View {
        RegexExample()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
