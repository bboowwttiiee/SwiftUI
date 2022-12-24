//
//  TagModel.swift
//  LayoutProtocol
//
//  Created by bowtie on 14.12.22.
//

import SwiftUI

struct Tag: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String
    var subtags: [Tag]?
    var isTapped: Bool
}

class TagModel: ObservableObject {
    @Published var tags: [Tag] = [
        Tag(title: "Lorem", subtags: [
            Tag(title: "One", isTapped: false),
            Tag(title: "Two", isTapped: false),
            Tag(title: "Three", isTapped: false)
        ], isTapped: false),
        Tag(title: "Ipsum", subtags: [
            Tag(title: "Four", isTapped: false),
            Tag(title: "Five", isTapped: false),
            Tag(title: "Six", isTapped: false)
        ], isTapped: false),
        Tag(title: "is", subtags: [
            Tag(title: "Seven", isTapped: false),
            Tag(title: "Eight", isTapped: false),
            Tag(title: "Nine", isTapped: false)
        ], isTapped: false),
        Tag(title: "simply", subtags: [
            Tag(title: "Ten", isTapped: false),
            Tag(title: "Eleven", isTapped: false),
            Tag(title: "Twelve", isTapped: false)
        ], isTapped: false),
        Tag(title: "dummy", subtags: [
            Tag(title: "Thirteen", isTapped: false),
            Tag(title: "Fourteen", isTapped: false),
            Tag(title: "Fifteen", isTapped: false)
        ], isTapped: false),
        Tag(title: "text", subtags: [
            Tag(title: "Sixteen", isTapped: false),
            Tag(title: "Seventeen", isTapped: false),
            Tag(title: "Eighteen", isTapped: false)
        ], isTapped: false),
        Tag(title: "of", subtags: [
            Tag(title: "Nineteen", isTapped: false),
            Tag(title: "Twenty", isTapped: false),
            Tag(title: "Twenty-one", isTapped: false)
        ], isTapped: false),
        Tag(title: "the", subtags: [
            Tag(title: "Twenty-two", isTapped: false),
            Tag(title: "Twenty-three", isTapped: false),
            Tag(title: "Twenty-four", isTapped: false)
        ], isTapped: false),
        Tag(title: "printing", subtags: [
            Tag(title: "Twenty-five", isTapped: false),
            Tag(title: "Twenty-six", isTapped: false),
            Tag(title: "Twenty-seven", isTapped: false)
        ], isTapped: false),
        Tag(title: "and", subtags: [
            Tag(title: "Twenty-eight", isTapped: false),
            Tag(title: "Twenty-nine", isTapped: false),
            Tag(title: "Thirty", isTapped: false)
        ], isTapped: false),
        Tag(title: "typesetting", subtags: [
            Tag(title: "Thirty-one", isTapped: false),
            Tag(title: "Thirty-two", isTapped: false),
            Tag(title: "Thirty-three", isTapped: false)
        ], isTapped: false),
        Tag(title: "industry", subtags: [
            Tag(title: "Thirty-four", isTapped: false),
            Tag(title: "Thirty-five", isTapped: false),
            Tag(title: "Thirty-six", isTapped: false)
        ], isTapped: false),
        Tag(title: ".", subtags: [
            Tag(title: "Thirty-seven", isTapped: false),
            Tag(title: "Thirty-eight", isTapped: false),
            Tag(title: "Thirty-nine", isTapped: false)
        ], isTapped: false),
        Tag(title: "Lorem", subtags: [
            Tag(title: "Forty", isTapped: false),
            Tag(title: "Forty-one", isTapped: false),
            Tag(title: "Forty-two", isTapped: false)
        ], isTapped: false),
        Tag(title: "Ipsum", subtags: [
            Tag(title: "Forty-three", isTapped: false),
            Tag(title: "Forty-four", isTapped: false),
            Tag(title: "Forty-five", isTapped: false)
        ], isTapped: false),
        Tag(title: "has", subtags: [
            Tag(title: "Forty-six", isTapped: false),
            Tag(title: "Forty-seven", isTapped: false),
            Tag(title: "Forty-eight", isTapped: false)
        ], isTapped: false),
        Tag(title: "been", subtags: [
            Tag(title: "Forty-nine", isTapped: false),
            Tag(title: "Fifty", isTapped: false),
            Tag(title: "Fifty-one", isTapped: false)
        ], isTapped: false),
        Tag(title: "the", subtags: [
            Tag(title: "Fifty-two", isTapped: false),
            Tag(title: "Fifty-three", isTapped: false),
            Tag(title: "Fifty-four", isTapped: false)
        ], isTapped: false),
        Tag(title: "industry's", subtags: [
            Tag(title: "Fifty-five", isTapped: false),
            Tag(title: "Fifty-six", isTapped: false),
            Tag(title: "Fifty-seven", isTapped: false)
        ], isTapped: false),
        Tag(title: "standard", subtags: [
            Tag(title: "Fifty-eight", isTapped: false),
            Tag(title: "Fifty-nine", isTapped: false),
            Tag(title: "Sixty", isTapped: false)
        ], isTapped: false),
        Tag(title: "dummy", subtags: [
            Tag(title: "Sixty-one", isTapped: false),
            Tag(title: "Sixty-two", isTapped: false),
            Tag(title: "Sixty-three", isTapped: false)
        ], isTapped: false),
        Tag(title: "text", subtags: [
            Tag(title: "Sixty-four", isTapped: false),
            Tag(title: "Sixty-five", isTapped: false),
            Tag(title: "Sixty-six", isTapped: false)
        ], isTapped: false),
        Tag(title: "ever", subtags: [
            Tag(title: "Sixty-seven", isTapped: false),
            Tag(title: "Sixty-eight", isTapped: false),
            Tag(title: "Sixty-nine", isTapped: false)
        ], isTapped: false),
        Tag(title: "since", subtags: [
            Tag(title: "Seventy", isTapped: false),
            Tag(title: "Seventy-one", isTapped: false),
            Tag(title: "Seventy-two", isTapped: false)
        ], isTapped: false),
        Tag(title: "the", subtags: [
            Tag(title: "Seventy-three", isTapped: false),
            Tag(title: "Seventy-four", isTapped: false),
            Tag(title: "Seventy-five", isTapped: false)
        ], isTapped: false),
        Tag(title: "1500s", subtags: [
            Tag(title: "Seventy-six", isTapped: false),
            Tag(title: "Seventy-seven", isTapped: false),
            Tag(title: "Seventy-eight", isTapped: false)
        ], isTapped: false),
        Tag(title: ",", subtags: [
            Tag(title: "Seventy-nine", isTapped: false),
            Tag(title: "Eighty", isTapped: false),
            Tag(title: "Eighty-one", isTapped: false)
        ], isTapped: false),
        Tag(title: "when", subtags: [
            Tag(title: "Eighty-two", isTapped: false),
            Tag(title: "Eighty-three", isTapped: false),
            Tag(title: "Eighty-four", isTapped: false)
        ], isTapped: false),
        Tag(title: "an", subtags: [
            Tag(title: "Eighty-five", isTapped: false),
            Tag(title: "Eighty-six", isTapped: false),
            Tag(title: "Eighty-seven", isTapped: false)
        ], isTapped: false),
        Tag(title: "unknown", subtags: [
            Tag(title: "Eighty-eight", isTapped: false),
            Tag(title: "Eighty-nine", isTapped: false),
            Tag(title: "Ninety", isTapped: false)
        ], isTapped: false),
        Tag(title: "printer", subtags: [
            Tag(title: "Ninety-one", isTapped: false),
            Tag(title: "Ninety-two", isTapped: false),
            Tag(title: "Ninety-three", isTapped: false)
        ], isTapped: false),
        Tag(title: "took", subtags: [
            Tag(title: "Ninety-four", isTapped: false),
            Tag(title: "Ninety-five", isTapped: false),
            Tag(title: "Ninety-six", isTapped: false)
        ], isTapped: false),
        Tag(title: "a", subtags: [
            Tag(title: "Ninety-seven", isTapped: false),
            Tag(title: "Ninety-eight", isTapped: false),
            Tag(title: "Ninety-nine", isTapped: false)
        ], isTapped: false),
        Tag(title: "galley", subtags: [
            Tag(title: "Hundred", isTapped: false),
            Tag(title: "One hundred one", isTapped: false),
            Tag(title: "One hundred two", isTapped: false)
        ], isTapped: false),
        Tag(title: "of", subtags: [
            Tag(title: "One hundred three", isTapped: false),
            Tag(title: "One hundred four", isTapped: false),
            Tag(title: "One hundred five", isTapped: false)
        ], isTapped: false),
        Tag(title: "type", subtags: [
            Tag(title: "One hundred six", isTapped: false),
            Tag(title: "One hundred seven", isTapped: false),
            Tag(title: "One hundred eight", isTapped: false)
        ], isTapped: false),
        Tag(title: "and", subtags: [
            Tag(title: "One hundred nine", isTapped: false),
            Tag(title: "One hundred ten", isTapped: false),
            Tag(title: "Researcher", isTapped: false)
        ], isTapped: false),
        Tag(title: "scrambled", subtags: [
            Tag(title: "One hundred eleven", isTapped: false),
            Tag(title: "One hundred twelve", isTapped: false),
            Tag(title: "One hundred thirteen", isTapped: false)
        ], isTapped: false),
        Tag(title: "it", subtags: [
            Tag(title: "One hundred fourteen", isTapped: false),
            Tag(title: "One hundred fifteen", isTapped: false),
            Tag(title: "One hundred sixteen", isTapped: false)
        ], isTapped: false),
        Tag(title: "to", subtags: [
            Tag(title: "One hundred seventeen", isTapped: false),
            Tag(title: "One hundred eighteen", isTapped: false),
            Tag(title: "One hundred nineteen", isTapped: false)
        ], isTapped: false),
        Tag(title: "make", subtags: [
            Tag(title: "One hundred twenty", isTapped: false),
            Tag(title: "One hundred twenty-one", isTapped: false),
            Tag(title: "Researcher", isTapped: false)
        ], isTapped: false),
        Tag(title: "a", subtags: [
            Tag(title: "One hundred twenty-two", isTapped: false),
            Tag(title: "One hundred twenty-three", isTapped: false),
            Tag(title: "Researcher", isTapped: false)
        ], isTapped: false),
        Tag(title: "type", subtags: [
            Tag(title: "One hundred twenty-four", isTapped: false),
            Tag(title: "One hundred twenty-five", isTapped: false),
            Tag(title: "Researcher", isTapped: false)
        ], isTapped: false),
        Tag(title: "specimen", subtags: [
            Tag(title: "One hundred twenty-six", isTapped: false),
            Tag(title: "One hundred twenty-seven", isTapped: false),
            Tag(title: "One hundred twenty-eight", isTapped: false)
        ], isTapped: false),
        Tag(title: "book", subtags: [
            Tag(title: "One hundred twenty-nine", isTapped: false),
            Tag(title: "One hundred thirty", isTapped: false),
            Tag(title: "One hundred thirty-one", isTapped: false)
        ], isTapped: false),
        Tag(title: ".", subtags: [
            Tag(title: "One hundred thirty-two", isTapped: false),
            Tag(title: "One hundred thirty-three", isTapped: false),
            Tag(title: "One hundred thirty-four", isTapped: false)
        ], isTapped: false)
    ]
    let permTags = ["Lorem", "Ipsum", "is", "simply", "dummy", "text", "of", "the", "printing", "and", "typesetting", "industry", ".", "Lorem", "Ipsum", "has", "been", "the", "industry's", "standard", "dummy", "text", "ever", "since", "the", "1500s", ",", "when", "an", "unknown", "printer", "took", "a", "galley", "of", "type", "and", "scrambled", "it", "to", "make", "a", "type", "specimen", "book", "."]
    
    func showSubtags(for tag: Tag) {
        hideSubtags(except: tag)
        
        if !tag.isTapped {
            guard let index = tags.firstIndex(of: tag) else { return }
            guard let subs = tag.subtags else { return }
            tags.insert(contentsOf: subs, at: index + 1)
            tags[index].isTapped = true
        }
    }
    
    private func hideSubtags(except: Tag) {
        tags.removeAll { !permTags.contains($0.title) }
        
        for (index, _) in tags.enumerated() {
            tags[index].isTapped = false
        }
    }
    
    func selectSubtag(tag: Tag) {
        guard let index = tags.firstIndex(of: tag) else { return }
        
        if !permTags.contains(tag.title) {
            tags[index].isTapped.toggle()
        }
    }
}
