#!/bin/bash
input_file="$1"
output_file="${input_file%.*}.go"

echo "package main" > "$output_file"

# 去除每行的空格和\r，添加引号，拼接成常量字符串
content=$(cat $input_file | tr -d ' \r' | sed 's/.*/"&",/' | paste -s -d "" -)
# 去掉最后一个逗号
final_content=$(echo $content | sed 's/,$//')

echo "const SensitiveWords = $final_content" >> "$output_file"