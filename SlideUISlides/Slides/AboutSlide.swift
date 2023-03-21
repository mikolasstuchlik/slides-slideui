import SwiftUI
import SlideUI

struct AboutSlide: Slide {
    // @offset(AboutSlide)
    static var offset = CGVector(dx: 1.0000298423939615, dy: 0.0)

    // @hint(AboutSlide){
    static var hint: String? =
"""
Balíček je dostupný na Githubu
"""
    // }@hint(AboutSlide)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Co a proč").font(.presentationSubHeadline)
            }
            VStack {
                Text(
"""
 - **TL;DR**: Chci to, co umí Playground, ale v prezentaci.

 - SlideUI je Swift Package, který pomocí SwiftUI umožňuje vytvářet interaktivní prezentace
"""
                ).font(.presentationBody)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                VStack(spacing: 36) {
                    Image("github")
                    Text("mikolasstuchlik/SlideUI").font(.presentationBody).bold()
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
        .background(Color.black)
    }
}

struct AboutSlide_Previews: PreviewProvider {
    static var previews: some View {
        AboutSlide()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
