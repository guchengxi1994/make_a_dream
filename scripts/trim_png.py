from PIL import Image

def crop_transparent_image(image_path, output_path):
    # 打开图片
    image = Image.open(image_path)
    # 将图片转换为RGBA模式
    image = image.convert("RGBA")
    
    # 获取图片的尺寸
    width, height = image.size
    
    # 寻找非透明区域的边界
    bbox = None
    for x in range(width):
        for y in range(height):
            if image.getpixel((x, y))[3] != 0:  # 非透明像素
                if bbox is None:
                    bbox = (x, y, x, y)
                else:
                    bbox = (min(bbox[0], x), min(bbox[1], y), max(bbox[2], x), max(bbox[3], y))
    
    # 如果没有找到非透明区域，直接返回
    if bbox is None:
        print("No non-transparent area found.")
        return
    
    # 截取非透明区域
    cropped_image = image.crop(bbox)
    
    # 保存新的图片
    cropped_image.save(output_path)
    print(f"Cropped image saved to {output_path}")

# 使用示例
input_image_path = r'D:\github_repo\make_a_dream\assets\bg\info_base.png'  # 替换为你的图片路径
output_image_path = 'info_base.png'  # 替换为你希望保存的图片路径
crop_transparent_image(input_image_path, output_image_path)