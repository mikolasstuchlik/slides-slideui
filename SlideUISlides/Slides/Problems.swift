import SwiftUI
import SlideUI

struct Problems: Slide {
    // @offset(Problems)
    static var offset = CGVector(dx: 0, dy: 0)

    // @hint(Problems){
    static var hint: String? =
"""
Pokud máte trému nebo jste nervozní, Keynote je možná lepší pro důležitější prezentace ... jako je tato
"""
    // }@hint(Problems)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SwiftUI").font(.presentationHeadline)
                Text("Problémy").font(.presentationSubHeadline)
            }
            HStack {
                Text(
"""
- **Výkon** - jakmile se člověk naučí co SwiftUI nemá rádo, přestává být takový problém
- Jednoduchá rozšiřitelnost => **bloat a feature creep**
- Časté změny v API

*Při prezentaci má Keynote menší náchylnost na problémy*
"""
                ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                Image("vykon")
            }
        }.padding()
    }
}

struct Problems_Previews: PreviewProvider {
    static var previews: some View {
        Problems()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
