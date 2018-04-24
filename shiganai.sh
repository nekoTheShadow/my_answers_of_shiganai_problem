#!/bin/bash

for n in $(seq 100); do
  title=$(echo "しくてがない" | grep -o . | shuf -n 4 | paste -sd'\0')
  [[ ${title} == "しがない" ]] || continue;

  echo "第${n}回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」"
  exit 0
done

echo "「${title}ラジオ」ちゃうやん"
