import SwiftUI
import SlideUI
import SlideUIViews

struct InsideSlide: Slide {
    // @offset(InsideSlide)
    static var offset = CGVector(dx: 3.5, dy: 2.5)

    // @hint(InsideSlide){
    static var hint: String? =
"""
...
No a jednu předpřipravenou komponentu můžeme vidět níže. Je to `ToggleView`, které nahrazuje svůj obsah předrenderovaným obrázkem. Cílem je ušetřit zdroje.
"""
    // }@hint(InsideSlide)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Co najdete ve SlideUI").font(.presentationSubHeadline)
            }
            VStack {
                Text(
"""
 - Model, který poskládá a prezentuje slidy (`SlideUI`)
 - Sadu templatů pro projekt a soubory
 - Předpřipravené komponenty pro prezentace
"""
                ).font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
                ToggleView {
                    VStack(spacing: 32.0) {
                        Text(
"""
- FUNKČNÍ PREVIEWS
"""
                        ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        Image("blow")
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct InsideSlide_Previews: PreviewProvider {
    static var previews: some View {
        InsideSlide()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
