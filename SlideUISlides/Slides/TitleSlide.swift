import SwiftUI
import SlideUI

struct TitleSlide: Slide {
    // @offset(TitleSlide)
    static var offset = CGVector(dx: 0.0, dy: -0.00022152465674146748)

    // @hint(TitleSlide){
    static var hint: String? =
"""
Představení
 - Mikoláš Stuchlík
 - Futured.app - iOS developer
"""
    // }@hint(TitleSlide)

    init() {}

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("SlideUI")
                    .font(.presentationTitle)
                Text("Kdyby Keynote & Xcode měly dítě.")
                    .font(.presentationSubTitle)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Image("futured").resizable().frame(width: 194, height: 47)
            Text("Mikoláš Stuchlík, 2023")
                .font(.presentationNote)
        }
        .padding(100)
        .background(Color.black)
    }
}

struct TitleSlide_Previews: PreviewProvider {
    static var previews: some View {
        TitleSlide()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
