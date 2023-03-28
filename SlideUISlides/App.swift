import SwiftUI
import SlideUI
import SlideUICommons
import SlideVaporized

private let backgrounds: [any Background.Type] = [
    WowBackground.self,
    PackageBackground.self,
    Outro.self,
]

private let slides: [any Slide.Type] = [
    TitleSlide.self,
    AboutSlide.self,
    MotivationSlide.self,
    HowItStarted.self,
    RepoExample.self,
    SlideExample.self,
    AppExample.self,
    RegexExample.self,
    PluginSlide.self,
    Problems.self,
    Future.self
]

// @focuses(focuses){
private var focuses: [Focus] = [
    Focus(kind: .specific([TitleSlide.self]), hint: generated_hint_0),
    Focus(kind: .specific([AboutSlide.self]), hint: generated_hint_1),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 0.49071108722985435, dy: 0.0), scale: 0.47189999999999954)), hint: generated_hint_2),
    Focus(kind: .specific([MotivationSlide.self]), hint: generated_hint_3),
    Focus(kind: .specific([HowItStarted.self]), hint: generated_hint_4),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 3.4977567561719765, dy: 3.0), scale: 0.3266666666666664)), hint: generated_hint_5),
    Focus(kind: .specific([RepoExample.self]), hint: generated_hint_6),
    Focus(kind: .specific([SlideExample.self]), hint: generated_hint_7),
    Focus(kind: .specific([AppExample.self]), hint: generated_hint_8),
    Focus(kind: .specific([RegexExample.self]), hint: generated_hint_9),
    Focus(kind: .specific([PluginSlide.self]), hint: generated_hint_10),
    Focus(kind: .specific([Problems.self]), hint: generated_hint_11),
    Focus(kind: .specific([Future.self]), hint: generated_hint_12),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 2.2353000649159385, dy: -0.5481867958034121), scale: 0.08399999999999999)), hint: generated_hint_13),
]

private let generated_hint_0: String =
"""

"""

private let generated_hint_1: String =
"""

"""

private let generated_hint_2: String =
"""
Snímky nemají podobu karet, ale jsou na jedné velké ploše
"""

private let generated_hint_3: String =
"""

"""

private let generated_hint_4: String =
"""

"""

private let generated_hint_5: String =
"""
S teď se podíváme, co všechno ve SlideUI najdete
"""

private let generated_hint_6: String =
"""

"""

private let generated_hint_7: String =
"""

"""

private let generated_hint_8: String =
"""

"""

private let generated_hint_9: String =
"""

"""

private let generated_hint_10: String =
"""

"""

private let generated_hint_11: String =
"""

"""

private let generated_hint_12: String =
"""

"""

private let generated_hint_13: String =
"""
Děkuji za pozornost - a na závěr mi dovolte Vás ještě oslnit
"""

private let generated_hint_14: String =
"""
Step 14
"""

// }@focuses(focuses)

// In this presentation, I'm forcing the slides to have paticular resoltuion
private let presentation = {
    let presentation = PresentationProperties(
        rootPath: Array(String(#file).components(separatedBy: "/").dropLast()).joined(separator: "/"),
        slidesPath: Array(String(#file).components(separatedBy: "/").dropLast()).joined(separator: "/") + "/Slides",
        backgrounds: backgrounds,
        slides: slides,
        focuses: focuses
    )

    presentation.screenSize = .init(width: 1920, height: 1080)
    presentation.frameSize = .init(width: 1920, height: 1080)

    presentation.colorScheme = .light

    presentation.title = NSFont.systemFont(ofSize: 90, weight: .bold)
    /// Default font for Subtitle styled text
    presentation.subTitle = NSFont.systemFont(ofSize: 80, weight: .regular)
    /// Default font for Headline styled text
    presentation.headline = NSFont.systemFont(ofSize: 70, weight: .bold)
    /// Default font for Subheadline styled text
    presentation.subHeadline = NSFont.systemFont(ofSize: 50, weight: .regular)
    /// Default font for Body styled text
    presentation.body = NSFont.systemFont(ofSize: 40)
    /// Default font for Note styled text
    presentation.note = NSFont.systemFont(ofSize: 30, weight: .light)
    /// Default font size for Editor styled text (used in Text Editor view)
    presentation.codeEditorFontSize = 30

    return presentation
}()

// This view integrates Vapor services into the Presentation
private struct VaporControlView: View {
    @State var booted: Bool = false

    var body: some View {
        if booted {
            HStack {
                VStack {
                    Text("Remote control")
                    RemoteControlService.QRAccessoryView()
                }
                Spacer()
                VStack {
                    Text("Address: " + (VaporService.shared.flatMap { "\($0.ipAddress):\($0.port)" } ?? ""))
                }
                Spacer()
                VStack {
                    Text("Hint stream")
                    RemoteHitnSocketService.QRAccessoryView()
                }
            }
        } else {
            Button("Launch server") {
                VaporService.shared = VaporService.shared ?? (try? VaporService { app in
                    RemoteControlService.register(to: app, for: presentation)
                    RemoteHitnSocketService.register(to: app, for: presentation)
                })

                VaporService.shared.flatMap(RemoteControlService.performAfter(loaded:))
                VaporService.shared.flatMap(RemoteHitnSocketService.performAfter(loaded:))
                booted.toggle()
            }
        }
    }
}

@main
struct SlideUISlidesApp: App {
    var body: some Scene {
        WindowGroup("Toolbar") {
            SlideControlPanel {
                VaporControlView()
            }
            .environmentObject(presentation)
        }

        Window("Slides", id: "slides") {
            Presentation(environment: presentation)
                .environmentObject(presentation)
                .frame(width: 1920, height: 1080)
        }.defaultSize(width: 1920, height: 1080)
    }
}

