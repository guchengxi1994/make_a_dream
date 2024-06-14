from PIL import Image
import glob

def merge_images(images, direction='vertical', bg_color=(255,255,255)):
    # 计算合并后的图像宽度和高度
    if direction == 'vertical':
        widths = [img.width for img in images]
        max_width = max(widths)
        total_height = sum(img.height for img in images)
    elif direction == 'horizontal':
        heights = [img.height for img in images]
        max_height = max(heights)
        total_width = sum(img.width for img in images)
    
    # 创建一个空白图像用于存放合并后的图像
    if direction == 'vertical':
        new_image = Image.new('RGBA', (max_width, total_height), color=bg_color)
    elif direction == 'horizontal':
        new_image = Image.new('RGBA', (total_width, max_height), color=bg_color)

    # 粘贴原始图像到新图像中
    y_offset = 0
    x_offset = 0
    for img in images:
        if direction == 'vertical':
            new_image.paste(img, (0, y_offset))
            y_offset += img.height
        elif direction == 'horizontal':
            new_image.paste(img, (x_offset, 0))
            x_offset += img.width
    
    return new_image

# 修改路径
image_paths = glob.glob(r"D:\github_repo\resources\ground-grass-road-floor\48/*.png")

print(image_paths)

# 加载图像列表
images = [Image.open(i) for i in image_paths]

# 合并图像
merged_image = merge_images(images, direction='horizontal',bg_color=None)

merged_image = merged_image.resize((int(merged_image.size[0]/2),int(merged_image.size[1]/2)))

# 保存合并后的图像
merged_image.save('road.png', format='PNG')