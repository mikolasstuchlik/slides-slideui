import SwiftUI
import SlideUI

struct HowItStarted: Slide {
    // @offset(HowItStarted)
    static var offset = CGVector(dx: 0, dy: 0)

    // @hint(HowItStarted){
    static var hint: String? =
"""
- Příprava velké prezentace
- Hodně různých diagramů, ukázkových programů, ...
- Vyplatilo se mi investovat více času do přípavy
  - Z kódu pro renzentování jsem pak udělal balíček
  - Před každou další prezentací jsem něco přidal
  => Celkem už cca 30 MD

Nyní je Open Source
"""
    // }@hint(HowItStarted)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Jak to začalo").font(.presentationSubHeadline)
            }
            Text(
"""
- Příprava velké prezentace
- Hodně různých diagramů, ukázkových programů, ...
- Vyplatilo se mi investovat více času do přípavy
  - Z kódu pro renzentování jsem pak udělal balíček
  - Před každou další prezentací jsem něco přidal
  => Celkem už cca 30 MD

Nyní je Open Source
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct HowItStarted_Previews: PreviewProvider {
    static var previews: some View {
        HowItStarted()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
