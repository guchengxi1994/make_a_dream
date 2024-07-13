from PIL import Image


def split_image(image_path, cols=4, rows=2):
    # 打开图片
    img = Image.open(image_path)

    # 获取图片的宽度和高度
    width, height = img.size

    # 计算每一份的宽度和高度
    col_width = width // cols
    row_height = height // rows

    # 用于保存子图片的列表
    images = []

    # 遍历每一行和每一列，切割图片
    for i in range(rows):
        for j in range(cols):
            # 计算左上角和右下角的坐标
            left = j * col_width
            top = i * row_height
            right = (j + 1) * col_width
            bottom = (i + 1) * row_height

            # 使用crop方法切割图片
            cropped_img = img.crop((left, top, right, bottom))

            # 将切割后的图片添加到列表中
            images.append(cropped_img)

            # 保存切割后的图片
            cropped_img.save(f"output_{i}_{j}.png")

    return images


# 调用函数，传入图片路径
split_image(r"D:\github_repo\make_a_dream\assets\images\animal.png")
