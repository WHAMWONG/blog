#!/usr/bin/env bash
# 把已下载的图片上传到 Cloudflare R2。
# 前提:npm i -g wrangler && wrangler login,并已创建 bucket(默认名 blog-images):
#   wrangler r2 bucket create blog-images
# 用法:bash migration/upload-to-r2.sh [bucket 名]
set -euo pipefail
BUCKET="${1:-blog-images}"
cd "$(dirname "$0")/.."
wrangler r2 object put "$BUCKET/zealer fix.jpeg" --file "migration/images/zealer fix.jpeg" --remote
wrangler r2 object put "$BUCKET/20170816忍者拉面/IMG_1666.JPG" --file "migration/images/20170816忍者拉面/IMG_1666.JPG" --remote
wrangler r2 object put "$BUCKET/20170816忍者拉面/IMG_1669.JPG" --file "migration/images/20170816忍者拉面/IMG_1669.JPG" --remote
wrangler r2 object put "$BUCKET/20170816忍者拉面/IMG_1672.JPG" --file "migration/images/20170816忍者拉面/IMG_1672.JPG" --remote
wrangler r2 object put "$BUCKET/iPhone8-2.jpg" --file "migration/images/iPhone8-2.jpg" --remote
wrangler r2 object put "$BUCKET/Apple-iPhone-8-Leather-Case-Review-TI.jpg" --file "migration/images/Apple-iPhone-8-Leather-Case-Review-TI.jpg" --remote
wrangler r2 object put "$BUCKET/ios 11 jietu.png" --file "migration/images/ios 11 jietu.png" --remote
wrangler r2 object put "$BUCKET/9a099b04gy1fl6xjeo9dpj20rs0m8djs.jpg" --file "migration/images/9a099b04gy1fl6xjeo9dpj20rs0m8djs.jpg" --remote
wrangler r2 object put "$BUCKET/IMG_0751 2.JPG" --file "migration/images/IMG_0751 2.JPG" --remote
wrangler r2 object put "$BUCKET/IMG_0721.JPG" --file "migration/images/IMG_0721.JPG" --remote
wrangler r2 object put "$BUCKET/IMG_2916.jpg" --file "migration/images/IMG_2916.jpg" --remote
wrangler r2 object put "$BUCKET/whamwong's 2017 best ablums.png" --file "migration/images/whamwong's 2017 best ablums.png" --remote
wrangler r2 object put "$BUCKET/IMG_3105.JPG" --file "migration/images/IMG_3105.JPG" --remote
wrangler r2 object put "$BUCKET/IMG_0885.jpg" --file "migration/images/IMG_0885.jpg" --remote
wrangler r2 object put "$BUCKET/jerry_krause_x_phil_jackson.jpg" --file "migration/images/jerry_krause_x_phil_jackson.jpg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_0852-min.jpeg" --file "migration/images/aus/IMG_0852-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/R0002402-min.jpeg" --file "migration/images/aus/R0002402-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/R0002345 (1)-min.jpeg" --file "migration/images/aus/R0002345 (1)-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1117-min.JPG" --file "migration/images/aus/IMG_1117-min.JPG" --remote
wrangler r2 object put "$BUCKET/aus/IMG_0919-min.jpeg" --file "migration/images/aus/IMG_0919-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_0926-min.jpeg" --file "migration/images/aus/IMG_0926-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_0956.jpeg" --file "migration/images/aus/IMG_0956.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1078-min-2.jpeg" --file "migration/images/aus/IMG_1078-min-2.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1003-min.jpeg" --file "migration/images/aus/IMG_1003-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1241-min.jpeg" --file "migration/images/aus/IMG_1241-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/R0002453-min.jpeg" --file "migration/images/aus/R0002453-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1235.JPG" --file "migration/images/aus/IMG_1235.JPG" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1325-min.jpeg" --file "migration/images/aus/IMG_1325-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1347-min.jpeg" --file "migration/images/aus/IMG_1347-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1432.JPG" --file "migration/images/aus/IMG_1432.JPG" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1451-min.jpeg" --file "migration/images/aus/IMG_1451-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1461-min.jpeg" --file "migration/images/aus/IMG_1461-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1471-min.JPG" --file "migration/images/aus/IMG_1471-min.JPG" --remote
wrangler r2 object put "$BUCKET/aus/R0002518-min.jpeg" --file "migration/images/aus/R0002518-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/R0002517-min.jpeg" --file "migration/images/aus/R0002517-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/R0002524-min.jpeg" --file "migration/images/aus/R0002524-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1548-min.jpeg" --file "migration/images/aus/IMG_1548-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1544-min.jpeg" --file "migration/images/aus/IMG_1544-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1536-min.jpeg" --file "migration/images/aus/IMG_1536-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/R0002604-min.jpeg" --file "migration/images/aus/R0002604-min.jpeg" --remote
wrangler r2 object put "$BUCKET/aus/IMG_1602-min.jpeg" --file "migration/images/aus/IMG_1602-min.jpeg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/R0002751.jpg" --file "migration/images/Setonaikai/R0002751.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_1980.jpg" --file "migration/images/Setonaikai/IMG_1980.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_1998.jpg" --file "migration/images/Setonaikai/IMG_1998.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2024.jpg" --file "migration/images/Setonaikai/IMG_2024.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/R0002832.jpg" --file "migration/images/Setonaikai/R0002832.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2072.jpg" --file "migration/images/Setonaikai/IMG_2072.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2085.jpg" --file "migration/images/Setonaikai/IMG_2085.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2116.jpg" --file "migration/images/Setonaikai/IMG_2116.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/R0002866.jpg" --file "migration/images/Setonaikai/R0002866.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2162.jpg" --file "migration/images/Setonaikai/IMG_2162.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/R0002888.jpg" --file "migration/images/Setonaikai/R0002888.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2166.jpg" --file "migration/images/Setonaikai/IMG_2166.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2178.jpg" --file "migration/images/Setonaikai/IMG_2178.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2193.jpg" --file "migration/images/Setonaikai/IMG_2193.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2205.jpg" --file "migration/images/Setonaikai/IMG_2205.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2223.jpg" --file "migration/images/Setonaikai/IMG_2223.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/R0002947.jpg" --file "migration/images/Setonaikai/R0002947.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2260.jpg" --file "migration/images/Setonaikai/IMG_2260.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/R0002956.jpg" --file "migration/images/Setonaikai/R0002956.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2320.jpg" --file "migration/images/Setonaikai/IMG_2320.jpg" --remote
wrangler r2 object put "$BUCKET/Setonaikai/IMG_2322.jpg" --file "migration/images/Setonaikai/IMG_2322.jpg" --remote
echo "全部上传完成。到 Cloudflare 控制台为 bucket 绑定自定义域名后,运行:"
echo "  npm run images:rewrite -- --base https://<你的图床域名>"
