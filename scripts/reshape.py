from PIL import Image
import os

def resize_images(directory, output_dir, size=(48, 48)):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    for filename in os.listdir(directory):
        if filename.endswith(('.png', '.jpg', '.jpeg')):
            image_path = os.path.join(directory, filename)
            with Image.open(image_path) as im:
                im_resized = im.resize(size)
                new_image_path = os.path.join(output_dir, filename)
                im_resized.save(new_image_path)

# 使用方法
resize_images(r'D:\github_repo\resources\ground-grass-road-floor', r'D:\github_repo\resources\ground-grass-road-floor\48')