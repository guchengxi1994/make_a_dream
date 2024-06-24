from PIL import Image

# 创建一个48x48像素的RGBA图像，初始颜色为全透明
img = Image.new('RGBA', (48, 48), (0, 0, 0, 0))

# 或者保存图像到文件
img.save('air_wall_48.png')