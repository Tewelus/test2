import os
import sys
import subprocess
import pkg_resources
import platform

import requests
import pyotherside

here = os.path.abspath(os.path.dirname(__file__))

vendored = os.path.join(here, '..', 'vendored')
sys.path.insert(0, vendored)

#from pykeepass_rs import get_meta_and_entries

#import gizeh
#import moviepy as mpy

#import moviepy
from moviepy.editor import *
import pygame


WIDTH, HEIGHT = (128, 128)

def make_frame(t):
    surface = gizeh.Surface(WIDTH, HEIGHT)
    radius = WIDTH * (1 + (t * (2 - t)) ** 2) / 6  # radius varies over time
    circle = gizeh.circle(radius, xy=(64, 64), fill=(1, 0, 0))
    circle.draw(surface)
    return surface.get_npimage()  # returns a 8-bit RGB array



def playVideo():
    print("TEST")
    pygame.display.init()
    pygame.display.set_mode((300,100), 0, 32)


    #clip = mpy.VideoClip(make_frame, duration=2)  # 2 seconds
    #clip.write_gif("circle.gif", fps=15)


    #clip = VideoFileClip('/home/phablet/.cache/test2.test2/video2.mp4').resize((300,100))
    #clip = VideoFileClip('/home/clarchy/Programnieren/UbPorts/test2/src/video2.mp4').resize((1920,1080))
    #clip = VideoFileClip('/opt/click.ubuntu.com/test2.test2/210911103428/src/video2.mp4').resize((300,100))
    #clip.preview()
    #pygame.quit()
    return "played"
