//
//  SocketService.swift
//  Smack-chat-app
//
//  Created by Pravir Ahuja on 12/04/20.
//  Copyright © 2020 Priyank Ahuja. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    let manager: SocketManager
    let socket: SocketIOClient
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super .init()
    }
    
    //var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL))

    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDescription = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDescription, id: channelId)
            
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        
        let socketConnectionStatus = socket.status

        switch socketConnectionStatus {
        case SocketIOStatus.connected:
            print("socket connected")
        case SocketIOStatus.connecting:
            print("socket connecting")
        case SocketIOStatus.disconnected:
            print("socket disconnected")
        case SocketIOStatus.notConnected:
            print("socket not connected")
        }
        
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
}
