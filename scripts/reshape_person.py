from PIL import Image


def resize_image(path):
    with Image.open(path) as im:
        im_resized = im.resize((128, 192))
        im_resized.save("result.png")


# 使用方法
resize_image(r"D:\github_repo\make_a_dream\assets\images\human5.png")
