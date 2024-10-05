/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Data : Codable {
	let id : String?
	let name : String?
	let matchType : String?
	let status : String?
	let venue : String?
	let date : String?
	let dateTimeGMT : String?
	let teams : [String]?
	let teamInfo : [TeamInfo]?
	let score : [Score]?
	let series_id : String?
	let fantasyEnabled : Bool?
	let bbbEnabled : Bool?
	let hasSquad : Bool?
	let matchStarted : Bool?
	let matchEnded : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case matchType = "matchType"
		case status = "status"
		case venue = "venue"
		case date = "date"
		case dateTimeGMT = "dateTimeGMT"
		case teams = "teams"
		case teamInfo = "teamInfo"
		case score = "score"
		case series_id = "series_id"
		case fantasyEnabled = "fantasyEnabled"
		case bbbEnabled = "bbbEnabled"
		case hasSquad = "hasSquad"
		case matchStarted = "matchStarted"
		case matchEnded = "matchEnded"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		matchType = try values.decodeIfPresent(String.self, forKey: .matchType)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		venue = try values.decodeIfPresent(String.self, forKey: .venue)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		dateTimeGMT = try values.decodeIfPresent(String.self, forKey: .dateTimeGMT)
		teams = try values.decodeIfPresent([String].self, forKey: .teams)
		teamInfo = try values.decodeIfPresent([TeamInfo].self, forKey: .teamInfo)
		score = try values.decodeIfPresent([Score].self, forKey: .score)
		series_id = try values.decodeIfPresent(String.self, forKey: .series_id)
		fantasyEnabled = try values.decodeIfPresent(Bool.self, forKey: .fantasyEnabled)
		bbbEnabled = try values.decodeIfPresent(Bool.self, forKey: .bbbEnabled)
		hasSquad = try values.decodeIfPresent(Bool.self, forKey: .hasSquad)
		matchStarted = try values.decodeIfPresent(Bool.self, forKey: .matchStarted)
		matchEnded = try values.decodeIfPresent(Bool.self, forKey: .matchEnded)
	}

}