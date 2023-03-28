import SwiftUI
import SlideUI

private extension View {
    func cellStyle(color: Color) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 70)
                    .stroke(color, style: StrokeStyle(lineWidth: 20, dash: [30, 10])).opacity(0.4)
            )
    }
}

struct AboutSlide: Slide {
    // @offset(AboutSlide)
    static var offset = CGVector(dx: 1.0, dy: 0.0)

    // @hint(AboutSlide){
    static var hint: String? =
"""
- Package pro tvorbu prezentací
- API kompletně ve SwiftUI (ukážeme si pozdějí)
- Swift Playground ve formě prezentace
- Je zcela interaktivní
- SwiftUI: Benefity jako např. animace

... Tento přístup má spoustu výhod. Např. možnost organizovat vše na jedné ploše.
"""
    // }@hint(AboutSlide)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Co je SlideUI").font(.presentationSubHeadline)
            }
            Grid(alignment: .center, horizontalSpacing: 75, verticalSpacing: 75) {
                Group {
                    GridRow {
                        Text("Package pro tvorbu prezentací").cellStyle(color: .gray)
                        Text("SwiftUI").cellStyle(color: .gray)
                    }
                    GridRow {
                        Text("Swift Playground ve \nformě prezentace").multilineTextAlignment(.center).cellStyle(color: .gray)
                        Text("Interaktivní").cellStyle(color: .gray)
                    }
                }
            }.padding(200).font(.presentationSubHeadline).bold()
        }.padding()
        .background(Color.white)
    }
}

struct AboutSlide_Previews: PreviewProvider {
    static var previews: some View {
        AboutSlide()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
