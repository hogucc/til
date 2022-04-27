# クエリ

## INSERT ... ON DUPLICATE KEY UPDATE 構文

cf. https://dev.mysql.com/doc/refman/5.6/ja/insert-on-duplicate.html

ON DUPLICATE KEY UPDATEを指定したとき、UNIQUEインデックスまたはPRIMARY KEYに重複した値を発生させる行が挿入された場合は、古い行のupdateが実行される

```
INSERT INTO table (a,b,c) VALUES (1,2,3)
  ON DUPLICATE KEY UPDATE c=c+1;

UPDATE table SET c=c+1 WHERE a=1;
```

ただし、aが自動インクリメントカラムであるInnoDBテーブルに対して同じではない

自動インクリメントカラムを使用した場合、INSERTステートメントは自動インクリメント値を増やすが、updateは増やさない
