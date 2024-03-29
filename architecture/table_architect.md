# [基本から学ぶ　テーブル設計　超入門！](https://modeling-how-to-learn.connpass.com/event/242944/?utm_campaign=event_message_to_selected_participant&utm_source=notifications&utm_medium=email&utm_content=title_link) のイベント内容まとめ

## テーブル設計

システムを設計するときは画面や帳票ではなくデータから考える

とはいえ画面や帳票からだととっかかりやすい

## 帳票から考える
複数行にまたがるものはテーブルでは表現できないので、1行ずつにばらす

が、ただばらすだけではだめ。データの変更操作が多数必要になるため

なので、データのかたまりを整理して考える（正規化） 。正規化によって変なデータが入るのを防ぐ

## RDRA

要件定義、要件分析手法

４つのレイヤーごとにダイアグラムを書くことで要件の内容をモデリングする手法

業務内容からデータに必要なものを想像する

とはいえ、データをなんでも増やすとテーブルが肥大化する。データ構造の分解が必要

## テーブルをどの単位で分けるか
- 発生時点が異なるデータは必ず別テーブルに分ける
- 発生時点が同じでも分けたほうがよいものもある
  - 受注時に発生する「出荷先」と「請求先」
- 同じデータでも意味が違えば別データ
  - 顧客の識別情報としての氏名
  - 注文の届け先の氏名
- キーが同じでも値の意味が異なれば別のテーブルで記録する
  - 顧客登録（顧客番号、氏名）
  - 連絡方法[必須]（顧客番号、メールアドレス）
  - 連絡方法[任意]（顧客番号、電話番号）
    - こうすべきとは限らないが、選択肢の一つとして考えておく

