import SwiftUI
import SlideUI
import SlideUICommons
import SlideUIViews

struct SlideExample: Slide {
    // @offset(SlideExample)
    static var offset = CGVector(dx: 3.5, dy: 2.5)
    // @hint(SlideExample){
    static var hint: String? = ""
    // }@hint(SlideExample)

    private static let code =
#"""
struct AppExample: Slide {
    // @offset(AppExample)
    static var offset = CGVector(dx: 0, dy: 0)
    // @hint(AppExample){
    static var hint: String? = ""
    // }@hint(AppExample)

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Headline").font(.presentationHeadline)
                Text("Subheadline").font(.presentationSubHeadline)
            }
            Text(
"""
Body
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct AppExample_Previews: PreviewProvider {
    static var previews: some View {
        AppExample()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
"""#

    public final class ExposedState: ForwardEventCapturingState {
        public static var stateSingleton: SlideExample.ExposedState = .init()

        @StateObject var slide: TextEditorView.Model = .init(
            filePath: FileCoordinator.shared.pathToFolder(for: "slide") + "/slide.swift",
            format: .swift,
            content: SlideExample.code
        )
        @Published var toggle: Bool = false

        public func captured(forwardEvent number: UInt) -> Bool {
            switch number {
            case 0:
                withAnimation { toggle.toggle() }
            case 1:
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
                Text("Ukázka kódu slide").font(.presentationSubHeadline)
            }
            ToggleView(toggledOn: $state.toggle) {
                TextEditorView(model: state.slide)
            }
        }.padding()
    }
}

struct SlideExample_Previews: PreviewProvider {
    static var previews: some View {
        SlideExample()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
