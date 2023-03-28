import SwiftUI
import SlideUI

struct Future: Slide {
    // @offset(Future)
    static var offset = CGVector(dx: 0.0, dy: 2.0)

    // @hint(Future){
    static var hint: String? =
"""
Používejte commit checkouty
"""
    // }@hint(Future)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SwiftUI").font(.presentationHeadline)
                Text("Budoucnost").font(.presentationSubHeadline)
            }
            Text(
"""
- Zatím preview = API bude stabilizováno v budoucnu
- Integrace dalších funkcí OS (Vapor, Video, ...)
- Přidání dokumentace a inline dokumentace

Méně důležité:
 - Řešení problémů (viz TODO list)
 - Stabilizace současných funkcí (např. generátor kódu)

**Přijímám PR**
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct Future_Previews: PreviewProvider {
    static var previews: some View {
        Future()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
