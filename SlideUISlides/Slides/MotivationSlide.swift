import SwiftUI
import SlideUI

struct MotivationSlide: Slide {
    @EnvironmentObject var presentation: PresentationProperties

    // @offset(MotivationSlide)
    static var offset = CGVector(dx: 1.0, dy: 3.0)

    // @hint(MotivationSlide){
    static var hint: String? =
"""
Nejde si nevšimnout, že zatímco na začátku talku vidím samé nadšené tváře
...
po necelé hodině "informačně přínosného" obsahu, je už na lidech vidět únava
"""
    // }@hint(MotivationSlide)

    init() {}

    @State var selected: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Motivace a Use Case").font(.presentationSubHeadline)
            }
            VStack(spacing: 62) {
                Text(
"""
Problém: Moje prezentace na iOS meet začaly být delší a delší
"""
                ).font(.presentationBody).frame(maxWidth: .infinity, alignment: .topLeading)
                Image("muni")
                Button {
                    selected.toggle()
                } label: {
                    Image(selected ? "hide-pain" : "no-pain")
                        .resizable()
                        .frame(
                            width: presentation.frameSize.width * 0.5,
                            height: presentation.frameSize.height * 0.5
                        )
                }.buttonStyle(.plain)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct MotivationSlide_Previews: PreviewProvider {
    static var previews: some View {
        MotivationSlide()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
