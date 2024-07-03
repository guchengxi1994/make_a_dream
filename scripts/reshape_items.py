from PIL import Image


def resize_image(path, size: tuple = (128, 192), filename: str = "result.png"):
    with Image.open(path) as im:
        im_resized = im.resize((int(size[0]), int(size[1])))
        im_resized.save(filename)


resize_image(
    r"D:\github_repo\resources\703\resources/00005.png",
    size=(192 * 0.75, 256 * 0.75),
    filename="00005.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/25.png",
    size=(128 * 0.75, 128 * 0.75),
    filename="25.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/26.png",
    size=(96 * 0.75, 128 * 0.75),
    filename="26.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/00044.png",
    size=(192 * 0.75, 256 * 0.75),
    filename="00044.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/00046.png",
    size=(192 * 0.75, 192 * 0.75),
    filename="00046.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/570.png",
    size=(192 * 0.75, 192 * 0.75),
    filename="570.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/3648.png",
    size=(32, 32),
    filename="3648.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/5952-4.png",
    size=(48, 64),
    filename="5952-4.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/5952-6.png",
    size=(48, 64),
    filename="5952-6.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/7522.png",
    size=(48, 64),
    filename="7522.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/8945.png",
    size=(128, 128),
    filename="8945.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/9036.png",
    size=(128, 240),
    filename="9036.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/9037.png",
    size=(128, 240),
    filename="9037.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/9049.png",
    size=(192 * 0.75, 192 * 0.75),
    filename="9049.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/11629-1.png",
    size=(192 * 0.5, 192 * 0.5),
    filename="11629-1.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/11629-2.png",
    size=(192 * 0.5, 192 * 0.5),
    filename="11629-2.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/11752.png",
    size=(192 * 0.5, 192 * 0.5),
    filename="11752.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/13421.png",
    size=(48, 48),
    filename="13421.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/15451.png",
    size=(32, 64),
    filename="15451.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/16844.png",
    size=(64, 32),
    filename="16844.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/18094.png",
    size=(72, 96),
    filename="18094.png",
)

resize_image(
    r"D:\github_repo\resources\703\resources/19563.png",
    size=(96, 160),
    filename="19563.png",
)
