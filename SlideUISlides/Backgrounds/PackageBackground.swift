import SwiftUI
import SlideUI
import SlideUICommons

struct PackageBackground: Background {
    static var offset = CGVector(dx: 3.5, dy: 3)
    static var relativeSize: CGSize = CGSize(width: 3, height: 2) / scale
    static var scale: CGFloat = 4.0

    init() {}


// SPM image resource from https://www.timc.dev/posts/understanding-swift-packages/
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack(spacing: 40 / Self.scale) {
                Image("spm")
                    .resizable()
                    .frame(width: 700 * 0.8 / Self.scale, height: 590 * 0.8 / Self.scale)
                    .foregroundStyle(Color(red: 240.0/255.0, green: 140.0/255.0, blue: 40.0/255.0))
                Text("SlideUI")
                    .font(.system(size: 300 / Self.scale, weight: .light))
                    .foregroundColor(Color(red: 240.0/255.0, green: 140.0/255.0, blue: 40.0/255.0))
            }.padding(40 / Self.scale)
            LinearGradient(
                colors: [.init(red: 233.0/255.0, green: 100.0/255.0, blue: 50.0/255.0), .init(red: 240.0/255.0, green: 140.0/255.0, blue: 40.0/255.0)],
                startPoint: .bottom,
                endPoint: .top
            ).mask(RoundedRectangle(cornerRadius: 40 / Self.scale).stroke(style: StrokeStyle(lineWidth: 20 / Self.scale, dash: []))).frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct PackageBackground_Previews: PreviewProvider {
    static var previews: some View {
        PackageBackground()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
