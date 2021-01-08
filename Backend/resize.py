import cv2, os
import numpy as np
from PIL import Image
def resize_64x64(path: str):
    size = 64, 64
    im = Image.open(path)
    im.thumbnail(size, Image.ANTIALIAS)
    im.save(path, "PNG")
