//
//  Constants.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//

import UIKit

let ButtonColor = UIColor(hexString: "FFDA3A")
let userDefaults = UserDefaults.standard

let MATCH_DETAIL = ["Summary", "Details", "Fan Poll", "Comment"]

//UserDefaults Constants
let USER_UID = "USER_UID"
let IS_LOGGEDIN = "IS_LOGGEDIN"
let USER_NAME = "USER_NAME"

// Define your headers
let API_KEY = "96998eba-5b63-484a-9b41-26e3ef4ab6b9"
let offset = 0

// Create an instance of NetworkManager with headers
let networkManager = NetworkManager(apiKey: API_KEY, offset: offset)

