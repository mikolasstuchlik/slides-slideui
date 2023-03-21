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

    init() {}


    private static let defaultCode =
#"""
import Foundation
let aSet = CharacterSet(charactersIn: "🧒🏻👧")
print("👧🏻".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
print("🧒".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
print("👧🏼".allSatisfy { $0.unicodeScalars.allSatisfy(aSet.contains(_:)) })
"""#

    private static let defaultStdIn = [
        "swiftc regexEx.swift && ./regexEx"
    ]

    @State var content: String = RegexExample.defaultCode
    @State var state: TerminalView.State = .idle
    @State var stdin: String = RegexExample.defaultStdIn[0]

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
            ToggleView {
                VStack(spacing: 8) {
                    TextEditorView(
                        filePath: FileCoordinator.shared.pathToFolder(for: "stringcode") + "/regexEx.swift",
                        format: .constant(.swift),
                        content: $content
                    )
                    TerminalView(
                        workingPath: URL(fileURLWithPath: FileCoordinator.shared.pathToFolder(for: "stringcode")),
                        stdIn: $stdin,
                        state: $state,
                        aspectRatio: 0.35,
                        axis: .horizontal
                    )
                }
            }
        }.padding()
    }
}

struct RegexExample_Previews: PreviewProvider {
    static var previews: some View {
        RegexExample()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
