import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RegexExample: Slide {
    // @offset(RegexExample)
    static var offset = CGVector(dx: 4.5, dy: 2.5)

    // @hint(RegexExample){
    static var hint: String? =
"""
A teďka si ukážeme tu interaktivitu v praxi.

Na Slidu vidítě 2 z přepřipravených view:
 - Text editor view (už jsme viděli)
 - Terminal view -> kompiluje a spouští, vypisuje níže
 - Můžeme kód pozměnit tak, abychom ukázali stdin a stdout.
"""
    // }@hint(RegexExample)

    private static let defaultCode =
#"""
print("Hello world!")
"""#

    private static let otherCode =
#"""
if let custom = CommandLine.arguments.dropFirst().first {
    print(custom)
} else {
    print("Hello world!")
}
"""#

    private static let defaultStdIn = [
        "swiftc code.swift && ./code",
        "swiftc code.swift && ./code \"Ahoj Miki!\""
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
                withAnimation { toggle.toggle() }
            case 1:
                execCode.save()
                terminal.execute()
            case 2:
                execCode.content = RegexExample.otherCode
            case 3:
                terminal.stdIn = RegexExample.defaultStdIn[1]
            case 4:
                execCode.save()
                terminal.execute()
            case 5:
                withAnimation { toggle.toggle() }
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
