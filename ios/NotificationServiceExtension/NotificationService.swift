//
//  NotificationService.swift
//  NotificationServiceExtension
//
//  Created by Siddharth on 25/11/21.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        
        //Get the data of notification and make a mutable copy of it to change the data
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here...
            // We need to pass the data using UserDefaults' suitname initializer to make it accessible between targets
            if let bundleID: String = Bundle.main.bundleIdentifier {
                let pref = UserDefaults.init(suiteName: "group.\(bundleID)")
                
                guard let badgeCount = pref?.value(forKey: Constant.kBadgeCount) as? Int else {
                    bestAttemptContent.badge = 1
                    pref?.set(1, forKey: Constant.kBadgeCount)
                    contentHandler(bestAttemptContent)
                    return
                }
                //Uncomment below line to call API at this place
                //            self.callAPI(notificationContent: bestAttemptContent)
                //                bestAttemptContent.title = "\(1 ) [modified]"
                bestAttemptContent.badge = NSNumber(value: badgeCount + 1)
                pref?.set(badgeCount + 1, forKey: Constant.kBadgeCount)
                // Save notification data to UserDefaults
                let data = bestAttemptContent.userInfo as NSDictionary
                
                pref?.set(data, forKey: Constant.kNotificationData)
                pref?.synchronize()
            }
            // Below code is for downloading image or video passed in notification. It will download the image or video even in suspended or terminated state of application
            guard let attachmentURL = bestAttemptContent.userInfo[Constant.kAttachmentUrl] as? String else {
                contentHandler(bestAttemptContent)
                return
            }
            
            do {
                let imageData = try Data(contentsOf: URL(string: attachmentURL)!)
                let attachmentType = URL(string: attachmentURL)
                guard let lastPathComponent = attachmentType?.lastPathComponent, let attachment = UNNotificationAttachment.download(imageFileIdentifier: lastPathComponent, data: imageData, options: nil) else {
                    contentHandler(bestAttemptContent)
                    return
                }
                bestAttemptContent.attachments = [attachment]
                if let content = bestAttemptContent.copy() as? UNNotificationContent {
                    contentHandler(content)
                }
                
            } catch {
                contentHandler(bestAttemptContent)
                print("Unable to load data: \(error)")
            }
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
    
}

extension UNNotificationAttachment {
    static func download(imageFileIdentifier: String, data: Data, options: [NSObject : AnyObject]?)
    -> UNNotificationAttachment? {
        let fileManager = FileManager.default
        
        if let bundleID: String = Bundle.main.bundleIdentifier, let directory = fileManager.containerURL(forSecurityApplicationGroupIdentifier: "group.\(bundleID)") {
            do {
                let newDirectory = directory.appendingPathComponent(Constant.kImages)
                if !fileManager.fileExists(atPath: newDirectory.path) {
                    try? fileManager.createDirectory(at: newDirectory, withIntermediateDirectories: true, attributes: nil)
                }
                let fileURL = newDirectory.appendingPathComponent(imageFileIdentifier)
                do {
                    try data.write(to: fileURL, options: [])
                } catch {
                    print("Unable to load data: \(error)")
                }
                let pref = UserDefaults(suiteName: "group.\(bundleID)")
                pref?.set(data, forKey: Constant.kNotificationImage)
                pref?.synchronize()
                let imageAttachment = try UNNotificationAttachment.init(identifier: imageFileIdentifier, url: fileURL, options: options)
                return imageAttachment
            } catch let error {
                print("Error: \(error)")
            }
        }
        return nil
    }
}
