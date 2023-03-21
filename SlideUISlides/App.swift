import SwiftUI
import SlideUI

private let backgrounds: [any Background.Type] = [
    WowBackground.self,
    PackageBackground.self,
    Outro.self,
]

private let slides: [any Slide.Type] = [
    TitleSlide.self,
    AboutSlide.self,
    MotivationSlide.self,
    Motivace2.self,
    InsideSlide.self,
    RepoExample.self,
    RegexExample.self,
    PluginSlide.self,
]

// @focuses(focuses){
private var focuses: [Focus] = [
    Focus(kind: .specific([TitleSlide.self]), hint: generated_hint_0),
    Focus(kind: .specific([AboutSlide.self]), hint: generated_hint_1),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 0.49071108722985435, dy: 0.0), scale: 0.47189999999999954)), hint: generated_hint_2),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 1.0, dy: 2.12), scale: 0.9999)), hint: generated_hint_3),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 1.0, dy: 2.18), scale: 0.9999)), hint: generated_hint_4),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 1.0, dy: 2.35), scale: 0.9999)), hint: generated_hint_5),
    Focus(kind: .specific([MotivationSlide.self]), hint: generated_hint_6),
    Focus(kind: .specific([Motivace2.self]), hint: generated_hint_7),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 4.0, dy: 3.0), scale: 0.3266666666666664)), hint: generated_hint_8),
    Focus(kind: .specific([InsideSlide.self]), hint: generated_hint_9),
    Focus(kind: .specific([RepoExample.self]), hint: generated_hint_10),
    Focus(kind: .specific([RegexExample.self]), hint: generated_hint_11),
    Focus(kind: .specific([PluginSlide.self]), hint: generated_hint_12),
    Focus(kind: .unbound(Camera(offset: CGVector(dx: 2.2353000649159385, dy: -0.5481867958034121), scale: 0.08399999999999999)), hint: generated_hint_13)
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
No, a teďka proč jsem se do toho vůbec pouštěl
"""

private let generated_hint_4: String =
"""
Můj problém je, že...
"""

private let generated_hint_5: String =
"""
A ačkoliv je kolegové hodnotí jako informačně přínosné
"""

private let generated_hint_6: String =
"""

"""

private let generated_hint_7: String =
"""

"""

private let generated_hint_8: String =
"""
S teď se podíváme, co všechno ve SlideUI najdete
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
Děkuji za pozornost
"""

// }@focuses(focuses)

private let presentation = PresentationProperties(
    rootPath: Array(String(#file).components(separatedBy: "/").dropLast()).joined(separator: "/"),
    slidesPath: Array(String(#file).components(separatedBy: "/").dropLast()).joined(separator: "/") + "/Slides",
    backgrounds: backgrounds,
    slides: slides,
    focuses: focuses
)

@main
struct SlideUISlidesApp: App {
    var body: some Scene {
        WindowGroup("Toolbar") {
            SlideControlPanel().environmentObject(presentation)
        }

        Window("Slides", id: "slides") {
            Presentation(environment: presentation).environmentObject(presentation)
        }
    }
}
