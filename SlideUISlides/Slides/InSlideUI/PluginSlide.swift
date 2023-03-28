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
Pokračujeme v ukázce dynamických vlastností

Ukázku slide neukazuju, protože bych musel linkovat SlideUI dynamicky...

Ukázat chybu (a probluvit o crashi) FatalError()

Ukázat light/dark
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
        ) //.foregroundStyle(by: .value("Shape Color", shape.color))
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

    public final class ExposedState: ForwardEventCapturingState {
        public static var stateSingleton: PluginSlide.ExposedState = .init()

        @Published var toggle: Bool = false

        public func captured(forwardEvent number: UInt) -> Bool {
            switch number {
            case 0:
                withAnimation { toggle.toggle() }
            case 1:
                withAnimation { toggle.toggle() }
            default:
                return false
            }
            return true
        }
    }

    @EnvironmentObject var presentation: PresentationProperties

    @ObservedObject private var state: ExposedState = ExposedState.stateSingleton

    // It was observed, that view fails to update state if `compiler` SO is inside of ExposedState...
    @StateObject var compiler: CompilerView.Model = .init(uniqueName: "ExampleView", code: PluginSlide.defaultCode)

    init() {}

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("SlideUI").font(.presentationHeadline)
                Text("Ukázka Plug-in View").font(.presentationSubHeadline)
            }
            ToggleView(toggledOn: $state.toggle) {
                HStack {
                    VStack {
                        Picker(
                            "",
                            selection: .init(
                                get: {
                                    presentation.colorScheme == .dark ? 0 : 1
                                },
                                set: {
                                    presentation.colorScheme = $0 == 0 ? .dark : .light
                                }
                            )
                        ) {
                            Text("Dark mode").tag(0)
                            Text("Light mode").tag(1)
                        }
                        .pickerStyle(.segmented)

                        CompilerView(model: compiler, axis: .horizontal)
                    }
                    switch compiler.state {
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
            .frame(width: 1920, height: 1080)
            .environmentObject(PresentationProperties.preview())
    }
}
