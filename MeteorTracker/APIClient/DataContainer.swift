//
//  DataContainer.swift
//  MeteorTracker
//
//  Created by Thiago Lourin on 07/10/21.
//

import Foundation

public struct DataContainer<Results: Decodable> : Decodable {
    public let results: Results
}
