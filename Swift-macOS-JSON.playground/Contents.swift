//
//
//: ### JSON format parse playground
//: Input file is a JSON file is imported from the contents.json of AppIcon from Assets of Xcode project
//:
//: Explain : JSON file --> Data object
//:
//: Method:   decode
//:
//: JSON Format:
//:

/*
 *
 *  {
 *      "idiom" : "iphone",
 *      "size" : "20x20",
 *      "scale" : "2x"
 *  }
 *
 */


import Cocoa

struct AppIcons : Decodable{
    let images: [image]
}

struct image: Decodable{
    var idiom : String
    var size : String
    var scale : String
}


let url_path = Bundle.main.url(forResource: "AppIcon-Contents", withExtension: "json")

do {
    let data_JSON = try Data.init(contentsOf: url_path!)
    
    let json_decoder = JSONDecoder()
    let json_Data = try json_decoder.decode(AppIcons.self, from: data_JSON)
    
    for image in json_Data.images {
        
        //for each image struct, we can get the values of it
        var x_letter_index =  image.size.firstIndex(of: "x") ?? image.size.endIndex
        let width = Double(image.size[..<x_letter_index])
        
        x_letter_index = image.scale.firstIndex(of: "x") ?? image.scale.endIndex
        let scale = Double(image.scale[..<x_letter_index])
        
        //let int_width : Int  = Int(width! * scale!)
       
        
        //import the other playground
        
        
        //call the NSImage Resize
        
        //compose the name of the file
        let str_fileName = "AppIcon-"+image.idiom+"-"+image.size+"@"+image.scale
        print("\(str_fileName)")
        
        //save all the icon file
    }
    
} catch {
    print("error:\(error)")
}

