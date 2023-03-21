import SwiftUI
import SlideUI
import SlideUIViews
import SlideUICommons

struct PluginSlide: Slide {
    // @offset(PluginSlide)
    static var offset = CGVector(dx: 4.5, dy: 3.5)

    // @hint(PluginSlide){
    static var hint: String? =
"""

"""
    // }@hint(PluginSlide)

    // Example source: https://developer.apple.com/documentation/charts/creating-a-chart-using-swift-charts
    private static let defaultCode =
"""
import Charts

struct ExampleView: View {
    var body: some View {
        Chart {
            ForEach(stackedBarData) { shape in
                BarMark(
                    x: .value("Shape Type", shape.type),
                    y: .value("Total Count", shape.count)
                )
                //.foregroundStyle(by: .value("Shape Color", shape.color))
            }
        }
    }
}

struct ToyShape: Identifiable {
    var color: String
    var type: String
    var count: Double
    var id = UUID()
}

var stackedBarData: [ToyShape] = [
    .init(color: "Green", type: "Cube", count: 2),
    .init(color: "Green", type: "Sphere", count: 0),
    .init(color: "Green", type: "Pyramid", count: 1),
    .init(color: "Purple", type: "Cube", count: 1),
    .init(color: "Purple", type: "Sphere", count: 1),
    .init(color: "Purple", type: "Pyramid", count: 1),
    .init(color: "Pink", type: "Cube", count: 1),
    .init(color: "Pink", type: "Sphere", count: 2),
    .init(color: "Pink", type: "Pyramid", count: 0),
    .init(color: "Yellow", type: "Cube", count: 1),
    .init(color: "Yellow", type: "Sphere", count: 1),
    .init(color: "Yellow", type: "Pyramid", count: 2)
]

"""

    @State var code: String = PluginSlide.defaultCode
    @State var buildCommand: String = RuntimeViewProvider.defaultCommand
    @State var state: CompilerView.State = .idle

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Ukázka Plug-in View").font(.presentationSubHeadline)
            }
            ToggleView {
                HStack {
                    CompilerView(
                        uniqueName: "ExampleView",
                        code: $code,
                        state: $state,
                        buildCommand: $buildCommand,
                        axis: .horizontal
                    )
                    switch state {
                    case let .exception(ProcessError.endedWith(code: code, error: message)):
                        Text("Process ended with code \(code). Message: \(message ?? "")").foregroundColor(.red).monospaced()
                    case .exception(let error):
                        Text(error.localizedDescription)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    case .view(let view):
                        view
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    case .idle, .loading:
                        Text("Nothing to present")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
            }
        }
        .padding()
    }
}

struct PluginSlide_Previews: PreviewProvider {
    static var previews: some View {
        PluginSlide()
            .frame(width: 1024, height: 768)
            .environmentObject(PresentationProperties.preview())
    }
}
