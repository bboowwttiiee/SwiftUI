//
//  MorphingView.swift
//  ShapeMorphingAnimation
//
//  Created by bowtie on 19.09.2022.
//

import SwiftUI

struct MorphingView: View {
    @State private var currentImage: CustomShape = .flame
    @State private var pickerImage: CustomShape = .flame
    
    @State private var turnOnImageMorph: Bool = false
    @State private var blurRadius: CGFloat = 0
    @State private var animateMorph: Bool = false
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                let size = proxy.size
                
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipped()
                    .overlay(content: {
                        Rectangle()
                            .fill(.white)
                            .opacity(turnOnImageMorph ? 0 : 1)
                    })
                    .mask {
                        // Morphing shapes with the help of Canvas and Filters
                        Canvas { context, size in
                            // Morphing Filters
                            context.addFilter(.alphaThreshold(min: 0.4))
                            // For reverse animation until 20 -> 0-1, until 40 -> 1-0
                            context.addFilter(.blur(radius: blurRadius >= 20 ? 20 - (blurRadius - 20) : blurRadius))
                            
                            context.drawLayer { ctx in
                                if let resolvedImage = context.resolveSymbol(id: 1) {
                                    ctx.draw(resolvedImage, at: CGPoint(x: size.width / 2, y: size.height / 2), anchor: .center)
                                }
                            }
                        } symbols: {
                            // Giving images with IDs
                            ResolvedImage(currentImage: $currentImage)
                                .tag(1)
                        }
                        // Animations don't work in the Canvas so we can use Timeline View or Timer
                        .onReceive(Timer.publish(every: 0.007, on: .main, in: .common).autoconnect()) { _ in
                            if animateMorph {
                                if blurRadius <= 40 {
                                    // Animation Speed
                                    blurRadius += 0.5
                                    
                                    if blurRadius.rounded() == 20 {
                                        // Change of next image goes here
                                        currentImage = pickerImage
                                    }
                                }
                                
                                if blurRadius.rounded() == 40 {
                                    // End animation and reset blur radius to zero
                                    animateMorph = false
                                    blurRadius = 0
                                }
                            }
                        }
                    }
            }
            .frame(height: 400)
            
            // Segmented Picker
            Picker("", selection: $pickerImage) {
                ForEach(CustomShape.allCases, id: \.rawValue) { shape in
                    Image(systemName: shape.rawValue)
                        .tag(shape)
                }
            }
            .pickerStyle(.segmented)
            // Avoid tapping until current animation is finished
            .overlay(content: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.primary)
                    .opacity(animateMorph ? 0.03 : 0)
            })
            .padding()
            .padding(.top, -50)
            // Whenever picker image changes morph it into new shape
            .onChange(of: pickerImage) { newValue in
                animateMorph = true
            }
            
            Toggle("Turn On Image Morph", isOn: $turnOnImageMorph)
                .fontWeight(.semibold)
                .padding()
        }
        .offset(y: -50)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ResolvedImage: View {
    @Binding var currentImage: CustomShape
    
    var body: some View {
        Image(systemName: currentImage.rawValue)
            .font(.system(size: 200))
            .animation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8), value: currentImage)
            .frame(width: 300, height: 300)
    }
}

struct MorphingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
