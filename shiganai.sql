with
chars(char) as (
    select 'し' from sysibm.sysdummy1
  union
    select 'く' from sysibm.sysdummy1
  union 
    select 'て' from sysibm.sysdummy1
  union 
    select 'が' from sysibm.sysdummy1
  union 
    select 'な' from sysibm.sysdummy1
  union 
    select 'い' from sysibm.sysdummy1
),
titles(idx, title) as (
  select row_number() over (order by title), title
  from (
    select c1.char || c2.char || c3.char || c4.char as title
    from chars c1, chars c2, chars c3, chars c4  
    where c2.char not in (c1.char)
    and   c3.char not in (c1.char, c2.char)
    and   c4.char not in (c1.char, c2.char, c3.char)
  )
),
episodes(episode, idx) as (
    select 0, 0 from sysibm.sysdummy1
  union all
    select episode + 1, cast(rand() * (select count(*) from titles) as integer) + 1
    from episodes 
    where episode < 100
),
programs(episode, title) as (
  select episode, title 
  from titles t join episodes e on t.idx = e.idx
)
select case
  when (select count(*) from programs where title = 'しがない') <> 0 then
    '第' || (select min(episode) from programs where title = 'しがない') || '回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」'
  else
     '「' || (select title from programs where episode = 100) || 'ラジオ」ちゃうやん'
  end
from sysibm.sysdummy1
;

-- $ for _ in $(seq 20); do db2 -tf shiganai.sql; done > shiganai.log
-- $ cat shiganai.log | grep -v -e "^\s*$" -e "^1" -e "^-" -e "^\s"
-- 「がてしなラジオ」ちゃうやん                                                                                  
-- 「くながてラジオ」ちゃうやん                                                                                  
-- 「がてしなラジオ」ちゃうやん                                                                                  
-- 「くてしいラジオ」ちゃうやん                                                                                  
-- 「てくしなラジオ」ちゃうやん                                                                                  
-- 「てがいくラジオ」ちゃうやん                                                                                  
-- 「てなくがラジオ」ちゃうやん                                                                                  
-- 第57回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」  
-- 「いながてラジオ」ちゃうやん                                                                                  
-- 第23回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」  
-- 「てがくなラジオ」ちゃうやん                                                                                  
-- 第87回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」  
-- 第98回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」  
-- 「しがいなラジオ」ちゃうやん                                                                                  
-- 「がくなしラジオ」ちゃうやん                                                                                  
-- 第2回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」    
-- 第99回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」  
-- 「いがてなラジオ」ちゃうやん                                                                                  
-- 「いしくてラジオ」ちゃうやん                                                                                  
-- 第45回SIerのSEからWEB系のエンジニアに転職したが楽しくて仕方がないラジオ、略して「しがないラジオ」  
