//
//  ViewController.swift
//  GSVideoPlayer
//
//  Created by DREAMWORLD on 01/04/22.
//

import UIKit
import GSPlayer

class ViewController: UIViewController {

    let playerView = VideoPlayerView()
  
    // Or in IB, specify the type of custom View as VideoPlayerView.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.frame = view.frame
        view.addSubview(playerView)
        
        playerView.play(for: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!)
        
        if playerView.state == .playing {
            playerView.pause(reason: .userInteraction)
        } else {
            playerView.resume()
        }
        
        playerView.stateDidChanged = { state in
            print(VideoCacheManager.calculateCachedSize())
            switch state {
            case .none:
                print("none")
            case .error(let error):
                print("error - \(error.localizedDescription)")
            case .loading:
                print("loading")
            case .paused(let playing, let buffering):
                print("paused - progress \(Int(playing * 100))% buffering \(Int(buffering * 100))%")
            case .playing:
                print("playing")
            }
        }
        
       
    }


}

