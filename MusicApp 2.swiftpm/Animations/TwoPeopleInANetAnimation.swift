import SwiftUI

struct TwoPeopleInANetAnimation: View {
    let colorsArray = [Color.white, Color.accentColor, Color.white, Color.redPrimary, Color.white, Color.white]
    var body: some View {
        TimelineView(.animation) { timeline in
            let time = timeline.date.timeIntervalSinceReferenceDate / 1.5
            ZStack {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 200, height: 200)

                ForEach(0..<6) { i in
                    Stripe(time: time, size: 200, color: colorsArray[i])

                        .rotationEffect(.degrees((360 / 6) * Double(i)))
                }
            }
        }
    }
}

struct Stripe: View {
    let time: CGFloat
    let size: CGFloat
    let color: Color
    
    let lineWidth: CGFloat = 15
    
    @State private var animate = false
    
    var body: some View {
        let trim = time.remainder(dividingBy: 2.2)
        ZStack {
            ForEach(0..<Int(lineWidth), id: \.self) { i in
                ZStack {
                    Ellipse()
                        .trim(from: trim - (Double(i) / 100), to: trim + 0.1)
                        .stroke(style: StrokeStyle(lineWidth: lineWidth - Double(i), lineCap: .round))
                        .frame(width: (size / 2) - lineWidth , height: (size * 1.25) - lineWidth)
                }
                .frame(width: size / 2, height: size * 1.25)
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: animate)
                .reverseMask {
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .frame(width: size, height: size)
                        .rotationEffect(.degrees(-90))
                }
            }
        }
        .onAppear { animate.toggle() }
        .foregroundColor(color)
    }
}

struct TwoPeopleInANetView_Previews: PreviewProvider {
    static var previews: some View {
        TwoPeopleInANetAnimation()
    }
}

extension View {
  @inlinable
  public func reverseMask<Mask: View>(alignment: Alignment = .center, @ViewBuilder _ mask: () -> Mask) -> some View {
    self.mask {
      Rectangle()
        .overlay(alignment: alignment) {
          mask()
            .blendMode(.destinationOut)
        }
    }
  }
}

