import SwiftUI
import SlideUI
import SlideUICommons

struct WowBackground: Background {
    @EnvironmentObject var presentation: PresentationProperties

    static var offset = CGVector(dx: 0.5, dy: 0)
    static var relativeSize: CGSize = CGSize(width: 2, height: 2) / scale
    static var scale: CGFloat = 4.0

    init() {}

    var body: some View {
        ZStack(alignment: .topLeading) {
            Text("wow")
                .font(.custom("ComicSansMS",fixedSize: 50))
                .foregroundColor(.orange)
                .rotationEffect(.degrees(30))
                .position(
                    x: presentation.frameSize.width * WowBackground.relativeSize.width * 0.1,
                    y: presentation.frameSize.height * WowBackground.relativeSize.height * 0.1
                )

            Text("so animated")
                .font(.custom("ComicSansMS",fixedSize: 50))
                .foregroundColor(.white)
                .rotationEffect(.degrees(350))
                .position(
                    x: presentation.frameSize.width * WowBackground.relativeSize.width * 0.75,
                    y: presentation.frameSize.height * WowBackground.relativeSize.height * 0.85
                )

            Text("many slides")
                .font(.custom("ComicSansMS",fixedSize: 50))
                .foregroundColor(.blue)
                .rotationEffect(.degrees(3))
                .position(
                    x: presentation.frameSize.width * WowBackground.relativeSize.width * 0.75,
                    y: presentation.frameSize.height * WowBackground.relativeSize.height * 0.05
                )

        }
    }
}

struct WowBackground_Previews: PreviewProvider {
    static var previews: some View {
        WowBackground()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
