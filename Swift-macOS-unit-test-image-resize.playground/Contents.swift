import Cocoa

//
//  testNSImageResize.swift
//  I used it to check the performance and will choose #2 drawing way to resize the Image so far.
//
//  Created by Ting_SH on 6/25/19.
//
//Test Suite 'testNSImageResize' started at 2019-06-25 22:23:41.714
//Test Case '-[__lldb_expr_7.testNSImageResize testPerformanceExample]' started.
//<unknown>:0: Test Case '-[__lldb_expr_7.testNSImageResize testPerformanceExample]' measured [Time, seconds] average: 0.000, relative standard deviation: 100.352%, values: [0.000005, 0.000002, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001, 0.000001], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
//Test Case '-[__lldb_expr_7.testNSImageResize testPerformanceExample]' passed (0.515 seconds).
//Test Case '-[__lldb_expr_7.testNSImageResize testResize1function]' started.
//Test Case '-[__lldb_expr_7.testNSImageResize testResize1function]' passed (0.082 seconds).
//Test Case '-[__lldb_expr_7.testNSImageResize testResize2function]' started.
//Test Case '-[__lldb_expr_7.testNSImageResize testResize2function]' passed (0.036 seconds).
//Test Suite 'testNSImageResize' passed at 2019-06-25 22:23:42.348.
//Executed 3 tests, with 0 failures (0 unexpected) in 0.633 (0.634) seconds
//
//

import XCTest

//function to test
func resize1(image: NSImage, w: Int, h: Int) -> Data {
    
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
    initialbitmapRep.draw(in: NSMakeRect(0, 0, newSize.width, newSize.height), from:NSMakeRect(0,0,initialbitmapRep.size.width,initialbitmapRep.size.height), operation: .copy, fraction: CGFloat(1),respectFlipped: false,hints: nil)
    
    //done
    NSGraphicsContext.restoreGraphicsState()
    
    
    //covert to Data
    let pngData : Data = bitmapRep!.representation(using: .png, properties: [:])!
    return pngData
}

func resize2(image: NSImage, w: Int, h: Int) -> Data {
    
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

    //#2 drawing way
    initialbitmapRep.draw(in: NSMakeRect(0, 0, newSize.width, newSize.height))
    //done
    NSGraphicsContext.restoreGraphicsState()
    
    
    //covert to Data
    let pngData : Data = bitmapRep!.representation(using: .png, properties: [:])!
    return pngData
}
class testNSImageResize: XCTestCase {
    
    func testResize1function(){
        let testImage = NSImage.init(named: "example.png")
        let testWidth = 189
        let testHeight = 189
        let data = resize1(image: testImage!, w: testWidth, h: testHeight)
        do {
            try  data.write(to: URL.init(fileURLWithPath:"/put/your/Documents/path/resize1.png"))

        } catch {
            print(error)
        }
        
    }
    
    func testResize2function(){
        let testImage = NSImage.init(named: "example.png")
        let testWidth = 189
        let testHeight = 189
        let data = resize2(image: testImage!, w: testWidth, h: testHeight)
        do {
            try  data.write(to: URL.init(fileURLWithPath:"/put/your/Documents/path/resize2.png"))
            
        } catch {
            print(error)
        }
        
    }
    
}

testNSImageResize.defaultTestSuite.run()
