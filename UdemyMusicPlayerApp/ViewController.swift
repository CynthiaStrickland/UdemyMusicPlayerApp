//
//  ViewController.swift
//  UdemyMusicPlayerApp
//
//  Created by Cynthia Whitlatch on 10/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

  var musicFiles = [String]()
  
  var musicPlayer: AVAudioPlayer = AVAudioPlayer()
  var currentIndext: Int = 0
  var timer: NSTimer = NSTimer()
  
  var timeRemaining: Bool = false
  
  @IBOutlet weak var songName: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  @IBOutlet weak var musicSlider: UISlider!
  @IBOutlet weak var volumeSlider: UIBarButtonItem!
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadMusicFiles()
  }

  func loadMusicFiles() {
    
    let resourcePath : String = NSBundle.mainBundle().resourcePath!
    var directoryContents = [String]()
    do {
      directoryContents = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(resourcePath) as [String]
    } catch _ {
      print ("Error in Fetching Directory Contents")
    }
    
    for i in 0...directoryContents.count - 1 {
      let fileExtension: NSString = (directoryContents[i] as NSString).pathExtension
      
      if fileExtension == "mp3" {
        let fileName: NSString = (directoryContents[i] as NSString).stringByDeletingPathExtension
        self.musicFiles.append(String(fileName))
        
      }
    }
  }
  
  func playMusic() {
    
    
  }
  
  
  @IBAction func timeButton(sender: AnyObject) {
  }
  
  func updateSlider() {
    
  }
  
  func updateTime(currentTime: NSTimeInterval) -> String {
    
    return ""
  }
  
  func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
    <#code#>
  }
  
  func animateSongNameLabel() {
    
  }
  
//MARK: Buttons
  
  
  @IBAction func back(sender: AnyObject) {
  }
  
  @IBAction func next(sender: AnyObject) {
  }
  
  @IBAction func play(sender: AnyObject) {
  }
  
  @IBAction func pause(sender: AnyObject) {
  }
  
  @IBAction func stop(sender: AnyObject) {
  }
  
}





























