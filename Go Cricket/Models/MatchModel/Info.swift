/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Info : Codable {
	let hitsToday : Int?
	let hitsUsed : Int?
	let hitsLimit : Int?
	let credits : Int?
	let server : Int?
	let offsetRows : Int?
	let totalRows : Int?
	let queryTime : Double?
	let s : Int?
	let cache : Int?

	enum CodingKeys: String, CodingKey {

		case hitsToday = "hitsToday"
		case hitsUsed = "hitsUsed"
		case hitsLimit = "hitsLimit"
		case credits = "credits"
		case server = "server"
		case offsetRows = "offsetRows"
		case totalRows = "totalRows"
		case queryTime = "queryTime"
		case s = "s"
		case cache = "cache"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		hitsToday = try values.decodeIfPresent(Int.self, forKey: .hitsToday)
		hitsUsed = try values.decodeIfPresent(Int.self, forKey: .hitsUsed)
		hitsLimit = try values.decodeIfPresent(Int.self, forKey: .hitsLimit)
		credits = try values.decodeIfPresent(Int.self, forKey: .credits)
		server = try values.decodeIfPresent(Int.self, forKey: .server)
		offsetRows = try values.decodeIfPresent(Int.self, forKey: .offsetRows)
		totalRows = try values.decodeIfPresent(Int.self, forKey: .totalRows)
		queryTime = try values.decodeIfPresent(Double.self, forKey: .queryTime)
		s = try values.decodeIfPresent(Int.self, forKey: .s)
		cache = try values.decodeIfPresent(Int.self, forKey: .cache)
	}

}