search_words=("var_dump" "dump" "phpinfo" "var_export" "console.log" "dd") # 検索したい単語を配列で指定

# ディレクトリ内のファイルに対して検索を実行
find ../../ -type f \( -name "*.html" -o -name "*.php" -o -name "*.js" \) | while read file; do
    for word in "${search_words[@]}"
    do
        count=$(grep -cie "$word" "$file" 2>/dev/null)
        if [ "$count" -ne 0 ]
        then
            echo "ファイル '$file' には、検索対象の単語が含まれています。"
            echo " - $word ($count)"
        fi
    done
done
