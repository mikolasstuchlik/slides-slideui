import SwiftUI
import SlideUI

struct CompareSlide: Slide {
    // @offset(CompareSlide)
    static var offset = CGVector(dx: 5, dy: 0)

    // @hint(CompareSlide){
    static var hint: String? =
"""

"""
    // }@hint(CompareSlide)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Výhody a nevýhody").font(.presentationSubHeadline)
            }
            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 16) {
                Group {
                    GridRow {
                        Image("spm").resizable().frame(width: 700 / 5, height: 590 / 5)
                        Image("keynote").resizable().frame(width: 400 / 3, height: 400 / 3)
                    }
                    GridRow {
                        Text(#"SlideUI"#)
                        Text("Keynote")
                    }.foregroundColor(.gray)
                    Divider()
                    GridRow {
                        Text("hodně ukázek kódu").fixedSize(horizontal: false, vertical: true)
                        Text("hodně textu, obrázků, **videa**").fixedSize(horizontal: false, vertical: true)
                    }
                    GridRow {
                        Text("šetří čas během prezentace").fixedSize(horizontal: false, vertical: true)
                        Text("šetří čas během přípravy").fixedSize(horizontal: false, vertical: true)
                    }
                    GridRow {
                        Text("Možnost integrace se systémem, např. prezentér pomocí Vapor serveru").fixedSize(horizontal: false, vertical: true)
                        Text(#"Možnost využití prezentérů a periferií "zdarma""#).fixedSize(horizontal: false, vertical: true)
                    }
                    GridRow {
                        Text("-").fixedSize(horizontal: false, vertical: true)
                        Text("(téměř) nehrozí riziko pádu").fixedSize(horizontal: false, vertical: true)
                    }
                    GridRow {
                        Text("Možnost dynamicky měnit fonty a velikosti")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("-")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    GridRow {
                        Text("Jednoduše formátovaný text s inline výskyty **mono fontu**")
                            .fixedSize(horizontal: false, vertical: true)
                        Text("-")
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    // Ugh, this makes the columns equal width 🙈
                    GridRow {
                        Text("").frame(maxWidth: .infinity)
                        Text("").frame(maxWidth: .infinity)
                    }
                }
             }.font(.presentationBody).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.padding()
    }
}

struct CompareSlide_Previews: PreviewProvider {
    static var previews: some View {
        CompareSlide()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
