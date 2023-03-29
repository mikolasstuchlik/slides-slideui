import SwiftUI
import SlideUI

struct MotivationSlide: Slide {
    @EnvironmentObject var presentation: PresentationProperties

    // @offset(MotivationSlide)
    static var offset = CGVector(dx: 3.5, dy: 0.0)

    // @hint(MotivationSlide){
    static var hint: String? =
"""
No, a co má SlideUI rešit?

- Představte si, že chcete ukázat kód a webové stránky.
- Tohle je přesně můj problém
- Ačkoliv informačně přínosný,
- A problém je, že ačkoliv moje iosmeety často začínají s nadšením
- po necelé hodině přednášení už je na lidech vydět únava

... taky vyzkoušet SwiftUI

"""
    // }@hint(MotivationSlide)

    public final class ExposedState: ForwardEventCapturingState {
        public static var stateSingleton: MotivationSlide.ExposedState = .makeSingleton()

        @Published var imageState: Bool = false
        @Published var imageVisible: Bool = false
        @Published var badgeVisible: Bool = false

        public func captured(forwardEvent number: UInt) -> Bool {
            switch number {
            case 0:
                withAnimation { badgeVisible.toggle() }
            case 1:
                withAnimation { imageVisible.toggle() }
            case 2:
                withAnimation { imageState.toggle() }
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
                Text("Proč").font(.presentationSubHeadline)
            }
            HStack(alignment: .top) {
                VStack(spacing: 40) {
                        Text(
"""
- Ušetřit čas během prezentace
- Chceme ukázat víc kódu, víc zdrojů
"""
                        ).font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
                    Image("muni").opacity(state.badgeVisible ? 1.0 : 0.0)
                }.frame(maxHeight: .infinity, alignment: .topLeading)

                Image(state.imageState ? "hide-pain" : "no-pain")
                    .resizable()
                    .frame(
                        width: presentation.frameSize.width * 0.6,
                        height: presentation.frameSize.height * 0.6
                    ).opacity(state.imageVisible ? 1.0 : 0.0)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.padding()
    }
}

struct MotivationSlide_Previews: PreviewProvider {
    static var previews: some View {
        MotivationSlide()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
