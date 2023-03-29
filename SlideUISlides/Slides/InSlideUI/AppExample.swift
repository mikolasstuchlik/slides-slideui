import SwiftUI
import SlideUI
import SlideUICommons
import SlideUIViews

struct AppExample: Slide {
    // @offset(SlideExample)
    static var offset = CGVector(dx: 3.5, dy: 3.5)
    // @hint(SlideExample){
    static var hint: String? =
"""

"""
    // }@hint(SlideExample)

    private static let code =
#"""
private let backgrounds: [any Background.Type] = [
    ABackground.self,
]

private let slides: [any Slide.Type] = [
    TitleSlide.self,
]

// @focuses(focuses){
private var focuses: [Focus] = [
    Focus(kind: .specific([TitleSlide.self])),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 0.49071108722985435, dy: 0.0), scale: 0.47189999999999954))),
]
// }@focuses(focuses)

let presentation = PresentationProperties(
    rootPath: Array(String(#file).components(separatedBy: "/").dropLast()).joined(separator: "/"),
    slidesPath: Array(String(#file).components(separatedBy: "/").dropLast()).joined(separator: "/") + "/Slides",
    backgrounds: backgrounds,
    slides: slides,
    focuses: focuses
)

@main
struct SlideUISlidesApp: App {
    var body: some Scene {
        WindowGroup("Toolbar") {
            SlideControlPanel().environmentObject(presentation)
        }

        Window("Slides", id: "slides") {
            Presentation(environment: presentation).environmentObject(presentation)
        }
    }
}
"""#

    public final class ExposedState: ForwardEventCapturingState {
        public static var stateSingleton: AppExample.ExposedState = .makeSingleton()

        var slide: TextEditorView.Model = .init(
            filePath: FileCoordinator.shared.pathToFolder(for: "slide") + "/app.swift",
            format: .swift,
            content: AppExample.code
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
    @StateObject private var state: ExposedState = ExposedState.stateSingleton


    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Ukázka kódu aplikace").font(.presentationSubHeadline)
            }
            ToggleView(toggledOn: $state.toggle) {
                TextEditorView(model: state.slide)
            }
        }.padding()
    }
}

struct AppExample_Previews: PreviewProvider {
    static var previews: some View {
        AppExample()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
