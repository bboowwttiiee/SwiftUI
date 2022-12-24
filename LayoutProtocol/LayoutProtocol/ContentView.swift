//
//  ContentView.swift
//  LayoutProtocol
//
//  Created by bowtie on 14.12.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tagModel = TagModel()
    @State private var tagAlignment: Alignment = .leading
    @State private var settings: Bool = false
    @State private var buttonPlate: Bool = false
    @Namespace var animation
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("Yellow"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("Yellow"))]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                WrappingHStack(alignment: tagAlignment) {
                    ForEach(tagModel.tags, id: \.id) { tag in
                        if tagModel.permTags.contains(tag.title) {
                            TagView(title: tag.title, isTapped: tag.isTapped, isSubtag: false) {
                                tagModel.showSubtags(for: tag)
                            }
                        } else {
                            TagView(title: tag.title, isTapped: tag.isTapped, isSubtag: true) {
                                tagModel.selectSubtag(tag: tag)
                            }
                        }
                    }
                    .animation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6).speed(1.1), value: tagModel.tags)
                }
                .padding()
            }
            .background(Color("Dark").ignoresSafeArea())
            .navigationTitle("Lorem Ipsum")
            .toolbar {
                Button {
                    settings.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        buttonPlate.toggle()
                    }
                } label: {
                    Image(systemName: "gearshape")
                        .tint(Color("Yellow"))
                        .font(.title3)
                }
            }
        }
        .overlay {
            if settings {
                ZStack {
                    Rectangle()
                        .fill(.white.opacity(0.01))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                        .onTapGesture {
                            buttonPlate = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                settings = false
                            }
                        }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 34, style: .continuous)
                            .fill(.ultraThinMaterial)
                            .frame(width: 300, height: 200)
                            .scaleEffect(buttonPlate ? 1 : 5)
                            .opacity(buttonPlate ? 1 : 0)
                        
                        HStack(spacing: 25) {
                            Image(systemName: "align.horizontal.left")
                                .font(.title)
                                .foregroundColor(tagAlignment == .leading ? Color("Dark") : Color("Yellow"))
                                .padding()
                                .background {
                                    ZStack {
                                        Circle()
                                            .stroke(lineWidth: 1)
                                            .fill(Color("Yellow"))
                                            .opacity(tagAlignment == .leading ? 0 : 1)
                                        
                                        if tagAlignment == .leading {
                                            Circle()
                                                .fill(Color("Yellow"))
                                                .matchedGeometryEffect(id: 1, in: animation)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    if tagAlignment != .leading {
                                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    }
                                    tagAlignment = .leading
                                }
                            
                            Image(systemName: "align.horizontal.center")
                                .font(.title)
                                .foregroundColor(tagAlignment == .center ? Color("Dark") : Color("Yellow"))
                                .padding()
                                .background {
                                    ZStack {
                                        Circle()
                                            .stroke(lineWidth: 1)
                                            .fill(Color("Yellow"))
                                            .opacity(tagAlignment == .center ? 0 : 1)
                                        
                                        if tagAlignment == .center {
                                            Circle()
                                                .fill(Color("Yellow"))
                                                .matchedGeometryEffect(id: 1, in: animation)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    if tagAlignment != .center {
                                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    }
                                    tagAlignment = .center
                                }
                            
                            Image(systemName: "align.horizontal.right")
                                .font(.title)
                                .foregroundColor(tagAlignment == .trailing ? Color("Dark") : Color("Yellow"))
                                .padding()
                                .background {
                                    ZStack {
                                        Circle()
                                            .stroke(lineWidth: 1)
                                            .fill(Color("Yellow"))
                                            .opacity(tagAlignment == .trailing ? 0 : 1)
                                        
                                        if tagAlignment == .trailing {
                                            Circle()
                                                .fill(Color("Yellow"))
                                                .matchedGeometryEffect(id: 1, in: animation)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    if tagAlignment != .trailing {
                                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    }
                                    tagAlignment = .trailing
                                }

                        }
                        .tint(.black)
                        .scaleEffect(buttonPlate ? 1 : 5)
                        .opacity(buttonPlate ? 1 : 0)
                    }
                    .animation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6), value: buttonPlate)
                }
            }
        }
        .animation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6).speed(1.1), value: tagAlignment)
    }
}

struct TagView: View {
    var title: String
    var isTapped: Bool
    var isSubtag: Bool
    var action: () -> ()
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(isTapped ? Color("Dark") : (isSubtag ? Color("Orange") : Color("Yellow")))
            .padding(.horizontal, 20)
            .padding(.vertical)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill((isSubtag && isTapped) ? Color("Orange") : (isTapped ? Color("Yellow") : .clear))
                    
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(lineWidth: 1)
                        .fill(isSubtag ? Color("Orange") : Color("Yellow"))
                }
            }
            .onTapGesture {
                action()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
