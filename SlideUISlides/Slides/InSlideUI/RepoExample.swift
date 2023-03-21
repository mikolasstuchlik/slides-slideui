import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct RepoExample: Slide {
    // @offset(RepoExample)
    static var offset = CGVector(dx: 4.5, dy: 2.5)

    // @hint(RepoExample){
    static var hint: String? =
"""

"""
    // }@hint(RepoExample)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Ukázka WebView").font(.presentationSubHeadline)
            }
            ToggleView {
                WebView(url: URL(string: "https://github.com/mikolasstuchlik/SlideUI")!)
            }
        }.padding()
    }
}

struct RepoExample_Previews: PreviewProvider {
    static var previews: some View {
        RepoExample()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
