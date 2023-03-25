import SwiftUI
import SlideUI
import SlideUICommons

struct Outro: Background {
    static var offset = CGVector(dx: 2.5, dy: -4)
    static var relativeSize: CGSize = CGSize(width: 8, height: 4) / scale
    static var scale: CGFloat = 8.0

    init() {}

    var body: some View {
        Text("Děkuji za pozornost!")
            .font(.system(size: 1400 / Self.scale, weight: .bold))
    }
}

struct Outro_Previews: PreviewProvider {
    static var previews: some View {
        Outro()
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
