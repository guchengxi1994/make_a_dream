from PIL import Image


def resize_image(path, size: tuple = (16, 16), filename: str = "result.png"):
    with Image.open(path) as im:
        im_resized = im.resize((int(size[0]), int(size[1])))
        im_resized.save(filename)


resize_image(r"D:\github_repo\make_a_dream\assets\images\tiled\maps\air_wall_48.png")