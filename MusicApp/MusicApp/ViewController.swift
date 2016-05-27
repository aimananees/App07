//
//  ViewController.swift
//  MusicApp
//
//  Created by Aiman Abdullah Anees on 26/05/16.
//  Copyright © 2016 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    var AudioPlayer = AVAudioPlayer()
    var AudioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("aiman", ofType: "mp3")!)
    
    var PlayPauseButton = UIBarButtonItem()
    var MusicPaused: Bool = false
    
    

    @IBOutlet var ToolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        do{
            AudioPlayer = try AVAudioPlayer(contentsOfURL: AudioPath)
            
            
        }catch
        {
            print("File not found..")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PlayButton(sender: UIBarButtonItem) {
        
        var items = ToolBar.items!
        
        if(MusicPaused == false)
        {
            
            PlayPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "PlayButton:")
            
            items[0] = PlayPauseButton
            ToolBar.setItems(items, animated: true)
            
            AudioPlayer.play()
            MusicPaused = true
            
        }
        
        
        else
        {
            var items = ToolBar.items!
            PlayPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "PlayButton:")
            
            items[0] = PlayPauseButton
            ToolBar.setItems(items, animated: true)
            AudioPlayer.pause()
            MusicPaused = false
        }
        
        
    }
    
    @IBAction func StopButton(sender: AnyObject) {
        
        var items = ToolBar.items!
        AudioPlayer.stop()
        AudioPlayer.currentTime = 0
        PlayPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "PlayButton:")
        items[0] = PlayPauseButton
        ToolBar.setItems(items, animated: true)
        MusicPaused = false
    }
    

}

