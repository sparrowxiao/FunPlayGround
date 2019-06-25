import Cocoa

/*  Function for resizeing of the NSImage by using the NSGraphicContext
 *  and NSBitmapImageRep
 *  in parameter: 1. image: NSImage object to resize,
 *                2. w: the width of the new size,
 *                3. h:
 *  return value: 1. data format for saving as file later
 *
 *  Notes:
 *  1.Run on Xcode 10.2
 *  2.Provide two ways to draw, personally I like the shorter one
 *  3.? NSImage.lockFocus() and NSImage.unlockFocus() using way will have different samplesPerPixel and
 *  automatically with regular and retina image
 *  4.TO-DO: add test and error checking
 *
 */
func resize(image: NSImage, w: Int, h: Int) -> Data {
    
    //get the meta data from initial image
    let cgImage_data = image.cgImage(forProposedRect: nil, context: nil, hints: nil)
    let initialbitmapRep = NSBitmapImageRep.init(cgImage: cgImage_data!)
    //
    let info_bitmap_bitsperpixel = initialbitmapRep.bitsPerPixel
    let info_bitmap_samplesperpixel = initialbitmapRep.samplesPerPixel
    let info_bitmap_bitspersample = info_bitmap_bitsperpixel / info_bitmap_samplesperpixel
    
    //create new size for new image
    let newSize = NSMakeRect(0, 0,CGFloat(w),CGFloat(h))
    //create new bitmap representaion
    let bitmapRep = NSBitmapImageRep(
        bitmapDataPlanes: nil, pixelsWide: Int(newSize.width), pixelsHigh: Int(newSize.height),
        bitsPerSample: info_bitmap_bitspersample, samplesPerPixel: info_bitmap_samplesperpixel, hasAlpha: true, isPlanar: false,
        colorSpaceName: .calibratedRGB, bytesPerRow: 0, bitsPerPixel: 0)
    
    //start to draw
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: bitmapRep!)
    //#1 drawing way
    //initialbitmapRep.draw(in: NSMakeRect(0, 0, newSize.width, newSize.height), from:NSMakeRect(0,0,initialbitmapRep.size.width,initialbitmapRep.size.height), operation: .copy, fraction: CGFloat(1),respectFlipped: false,hints: nil)
    //#2 drawing way
    initialbitmapRep.draw(in: NSMakeRect(0, 0, newSize.width, newSize.height))
    //done
    NSGraphicsContext.restoreGraphicsState()
    

    //covert to Data
    let pngData : Data = bitmapRep!.representation(using: .png, properties: [:])!
    return pngData
}



//main() start here
var selectPath : String
let openPanel = NSOpenPanel()
openPanel.title = "select a PNG file to resize"
openPanel.allowsMultipleSelection = false
openPanel.canChooseDirectories = false
openPanel.canCreateDirectories = false
openPanel.canChooseFiles = true
openPanel.allowedFileTypes = ["png"]

openPanel.begin{ (result) -> Void in
    if result.rawValue == NSApplication.ModalResponse.OK.rawValue{
        print("\(openPanel.urls)")
        let image_path = openPanel.urls[0]
        let image_dir = image_path.deletingLastPathComponent()
        let image = NSImage.init(contentsOf: image_path)
        let width : Int = 200
        let height : Int  = 200
        
        //resize the image and get the PNG data
        let pngData = resize(image: image!, w: width, h: height)
    
        //sav the image to the page
        let newImage_path = image_dir.appendingPathComponent("new-create.png")
        
        do {
            try pngData.write(to: newImage_path, options: Data.WritingOptions.atomic)
             print("user success")
        } catch {
            print(error)
            //return false
        }
    }
    else if result.rawValue == NSApplication.ModalResponse.cancel.rawValue{
        print("user cancelled")
    }
    
}


