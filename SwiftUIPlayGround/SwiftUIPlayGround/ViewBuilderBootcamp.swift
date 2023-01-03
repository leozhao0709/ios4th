//
//  ViewBuilderBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/23/22.
//

import SwiftUI

struct LocalViewBuilder: View {
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        headerSection
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            Text("One")
        case .two:
            VStack {
                Text("Two")
                Image(systemName: "heart.fill")
            }
        case .three:
            HStack {
                Text("Three")
                Image(systemName: "heart.fill")
            }
        }
    }
}

struct MyHStack<ContentType: View>: View {
    private var content: ContentType

    init(@ViewBuilder content: () -> ContentType) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
//        LocalViewBuilder(type: .one)
        MyHStack {
            Text("hello1")
            Text("hello2")
        }
    }
}

struct ViewBuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderBootcamp()
    }
}
