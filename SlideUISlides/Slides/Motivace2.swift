import SwiftUI
import SlideUI

struct Motivace2: Slide {
    // @offset(Motivace2)
    static var offset = CGVector(dx: 1.0, dy: 4.0)

    // @hint(Motivace2){
    static var hint: String? =
"""

"""
    // }@hint(Motivace2)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Motivace a Use Case").font(.presentationSubHeadline)
            }
            Text(
"""
 - Protahuje se to zejména, když potřebuji provázat prezentaci s ukázkami kódu

 - SlideUI vnizklo, když jsem připravoval prezentaci na iOS meet, která obsahovala hodně kódu

 - při tvorbě prezentace mi vyhovuje víc `markdown` stylování než patlat se s mono fonty v Pages

 - chtěl jsem si vyzkoušet SwiftUI
"""
            ).font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct Motivace2_Previews: PreviewProvider {
    static var previews: some View {
        Motivace2()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
