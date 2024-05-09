//
//  File: Combine+EXT.swift. Package: Widget2024
//  🍋‍🟩 Created by (mac/P.Dev) on 28/4/24.
//  Copyright © 2024 mac. All rights reserved.
//
//  If it can help you, support me by submitting 1 start at github project.
//  name: Purplle-Code
//  Sourch: https://github.com/Purplle-Code/Config-Widget-2024-SwiftUI-

import Combine
import SwiftUI

// MASK: Combine technical throttle
class ThrottleTakeLast: ObservableObject {
    private var passthroughSubject = PassthroughSubject<(() -> Void), Never>()
    var cancellables: Set<AnyCancellable> = []
    
    init(timeInterval: Double) {
        passthroughSubject
            .throttle(for: .seconds(timeInterval), scheduler: RunLoop.main, latest: true)
            .weakSink(passthroughSubject, receiveValue: { weakSubject, output in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "ss"
                let timestamp = dateFormatter.string(from: Date())
                print("[Combine]][RUN] [\(timestamp)]:", output())
            })
            .store(in: &self.cancellables)
    }
    deinit {
        self.cancellables.removeAll()
    }
    
    func action(closure: @escaping (() -> Void)) {
        passthroughSubject.send(closure)
    }
}

extension Publisher where Failure == Never {
    func weakAssign<T: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<T, Output>,
        on object: T
    ) -> AnyCancellable {
        sink { [weak object] value in
            object?[keyPath: keyPath] = value
        }
    }
    
    func weakSink<T: AnyObject>(
        _ weaklyCaptured: T,
        receiveValue: @escaping (T, Self.Output) -> Void
    ) -> AnyCancellable {
        sink { [weak weaklyCaptured] output in
            guard let strongRef = weaklyCaptured else { return }
            receiveValue(strongRef, output)
        }
    }
}
