//
//  ViewController.swift
//  mus
//
//  Created by tyler sand on 6/13/19.
//  Copyright © 2019 tyler sand. All rights reserved.
//

import Cocoa
import AVFoundation

extension NSOpenPanel {
    var selectUrl: URL? {
        title = "Select Image"
        allowsMultipleSelection = false
        canChooseDirectories = false
        canChooseFiles = true
        canCreateDirectories = false
        allowedFileTypes = ["jpg","png","pdf","pct", "bmp", "tiff"]  // to allow only images, just comment out this line to allow any file type to be selected
        return runModal() == .OK ? urls.first : nil
    }
    var selectUrls: [URL]? {
        title = "Select Images"
        allowsMultipleSelection = true
        canChooseDirectories = false
        canChooseFiles = true
        canCreateDirectories = false
        allowedFileTypes = ["jpg","png","pdf","pct", "bmp", "tiff"]  // to allow only images, just comment out this line to allow any file type to be selected
        return runModal() == .OK ? urls : nil
    }
}


class ViewController: NSViewController {

    var player: AVPlayer?
   // var fileName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //test
    @IBAction func browseFile(sender: AnyObject) {
        
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a .txt file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
       // dialog.allowedFileTypes        = ["mp3"];
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result?.path
              
                //let fileName = String(path.dropFirst(82))
                
               //let url = Bundle.main.url(forResource: path, withExtension: "mp3")!
                let url = URL(fileURLWithPath: path!)
               let playerItem = AVPlayerItem(url: url)
                player = AVPlayer(playerItem: playerItem)
                player!.play()
                // path.dropFirst(8)
                print(path)
                //test
                
               
                //test
            }
               // filename_field.stringValue = path
           
            } else {
            // User clicked on "Cancel"
            return
        }
        
   // }
    }
    
    
    //test
   @IBAction func play(_ sender: NSButton){
       /* let url = Bundle.main.url(forResource: fileName, withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
            
        } catch let error as NSError {
            print(error.description)
        }*/
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

