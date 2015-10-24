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
  var currentIndex: Int = 0
  var timer: NSTimer = NSTimer()
  
  var timeRemaining: Bool = false
  
  @IBOutlet weak var songNameLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  @IBOutlet weak var musicSlider: UISlider!
  @IBOutlet weak var volumeSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadMusicFiles()
    
    songNameLabel.text = ""
    timeLabel.text = "00:00"
    
    playMusic()
    
    
  }

  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
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
    
    let filePath = NSString(string:NSBundle.mainBundle().pathForResource(musicFiles[currentIndex], ofType: "mp3")!)
    
    let fileURL = NSURL(fileURLWithPath: filePath as String)
    
    do {
      musicPlayer = try AVAudioPlayer(contentsOfURL: fileURL)
      
    } catch {
      print("error initiating the music player")
    }
    
    musicPlayer.delegate = self
    musicSlider.minimumValue = 0
    musicSlider.maximumValue = Float(musicPlayer.duration)
    
    musicSlider.value = Float(musicPlayer.currentTime)
    
    musicPlayer.volume = volumeSlider.value
    
    musicPlayer.play()
    songNameLabel.text = musicFiles[currentIndex]
    animateSongNameLabel()
  }
  
  
  @IBAction func timeButton(sender: AnyObject) {
    timeRemaining = !timeRemaining
  }
  
  func updateSlider() {
    
    musicSlider.value = Float(musicPlayer.currentTime)
    
    if timeRemaining == false {
      timeLabel.text = updateTime(musicPlayer.currentTime)
    } else {
      timeLabel.text = updateTime(musicPlayer.duration - musicPlayer.currentTime)
      
    }
  }
  
  func updateTime(currentTime: NSTimeInterval) -> String {
    
    return ""
  }
  
  func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
    
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
  
  @IBAction func musicSliderChanged(sender: AnyObject) {
  }
  
  @IBAction func volumeSliderChanged(sender: AnyObject) {
  }
}





























