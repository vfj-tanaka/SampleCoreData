//
//  SampleCoreData+CoreDataProperties.swift
//  SampleCoreData
//
//  Created by mtanaka on 2022/10/04.
//
//

import Foundation
import CoreData


extension SampleCoreData {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SampleCoreData> {
        return NSFetchRequest<SampleCoreData>(entityName: "SampleCoreData")
    }
    
    @NSManaged public var content: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var title: String?
    @NSManaged public var updatedAt: Date?
    
}

extension SampleCoreData : Identifiable {
    // stringUpdatedAtを呼び出すとString型のupdatedAtが返却される
    public var stringUpdatedAt: String { dateFomatter(date: updatedAt ?? Date()) }
    
    func dateFomatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        return dateFormatter.string(from: date)
    }
    
}
