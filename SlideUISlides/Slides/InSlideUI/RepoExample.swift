import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RepoExample: Slide {
    // @offset(RepoExample)
    static var offset = CGVector(dx: 2.5, dy: 3.5)

    // @hint(RepoExample){
    static var hint: String? =
"""
V budoucnu vydělím předpřipravené funkce do samostatných repozitářů, aby se snížilo množství kompilovaných závislostí
"""
    // }@hint(RepoExample)

    public final class ExposedState: ForwardEventCapturingState {
        public static var stateSingleton: RepoExample.ExposedState = .makeSingleton()

        @Published var toggle: Bool = false

        public func captured(forwardEvent number: UInt) -> Bool {
            switch number {
            case 0:
                toggle.toggle()
            case 1:
                toggle.toggle()
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
                Text("Repozitář").font(.presentationSubHeadline)
            }
            HStack(spacing:64) {
                VStack(alignment: .leading, spacing: 64) {
                    VStack(alignment: .center) {
                        Image("github").colorInvert()
                        Text("mikolasstuchlik/SlideUI").bold()
                    }.frame(maxWidth: .infinity, alignment: .center)
                    Text(
"""
Repozitář obsahuje:
 - Třídy a View které řídí renderování
 - Dokumentaci veřejného API
 - Předpřipravená View a komponenty
 - Zatím monorepo
 - Ukázky mých prezentací
 - Sady templatů
"""
                    ).frame(alignment: .leading)
                }.font(.presentationBody).fixedSize()
                ToggleView(toggledOn: $state.toggle) {
                    WebView(url: URL(string: "https://github.com/mikolasstuchlik/SlideUI")!)
                }
            }
        }.padding()
    }
}

struct RepoExample_Previews: PreviewProvider {
    static var previews: some View {
        RepoExample()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
