## イマココSNSプロジェクトベース

### 環境構築
- （初回のみ）docker image build && db create

```
docker compose build --no-cache
docker compose run web rails db:create
```

- docker run

```
docker compose up -d
```

#### 以下URLにアクセスしサーバーが立ち上がればOK

- http://localhost:3000

### バージョン情報

name|version
--|--
Ruby | 3.1.4
Ruby on Rails | 7.0.4.2

### 導入済みgem

- [pry-rails](https://github.com/pry/pry-rails)
- [rspec-rails](https://github.com/rspec/rspec-rails)
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
- [devise](https://github.com/heartcombo/devise#getting-started)

## 開発ルール

### ブランチ運用ルール

GitFlowを採用する

| ブランチ名 | 用途 |
| ---- | ---- |
| main | リリース用ブランチ。開発作業は行わない。マージをするのはリリース時のみ |
| develop | 開発用ブランチ。開発作業は行わない。以下のfeatureブランチをマージする |
| feature | 作業用ブランチ。developからブランチを作成し開発作業を行う |

### 留意点

- 仕様が曖昧な部分は自分たちで判断せず顧客（メンター）に確認しましょう
- バリデーションも考慮して開発しましょう（どんなバリデーションが必要か、などチームで検討しましょう）
- 命名規則を考慮しチーム内で統一しましょう
- PRの提出時はコンソールにエラーがないか確認しましょう
- リンクホバー時の挙動なども意識しましょう

### css

[参考](https://qiita.com/oreo/items/33da466480b2653bd5af)

- 全ファイルにて共通のインデントをとる（スペース2個）
```
// NG例
.element {
   color: red;
 background-color: blue;
}

// OK例
.element {
  color: red;
  background-color: blue;
}
```

- ルールセット間にスペースを設ける
```
// NG例
.danger {
  color: #d9534f;
}
.success {
  color: #5cb85c;
}

// OK例
.danger {
  color: #d9534f;
}

.success {
  color: #5cb85c;
}
```

- ルールセットにコメント（タイトル）をつける
```
/* Text color Danger */
.danger {
  color: #d9534f;
}
```

- ルールセット内のスペース
```
// NG例
.element{
  color:red;
}

// OK例
.element { // elementと{の間に1つのスペース
  color: red; // プロパティ後の:とバリューの間に1つのスペース
}
```

- 複数のセレクタや宣言がある場合は改行する（1行にしない）
```
// NG例
.btn, .link {
  color: red; font-size: 1.5rem;
}

// OK例
.btn,
.link {
  color: red;
  font-size: 1.5rem;
}
```

- 宣言後にはセミコロンをつける
```
.element {
  color: red; // セミコロン
  font-size: 1.5rem; // セミコロン
}
```

- 命名
```
// informationを簡略化
.info {
  color: red;
}

// categoryをcatなどのように意味が分からない命名に簡略化してはいけない
.category {
  color: blue;
}

// 絶対値を表す命名は避ける（以下はNG例）
.red {
  color: red;
}
(以下はOK例)
.primaryColor {
  color: red;
}

// HTMLタグと同じ単語をセレクタ名にしない（以下はNG）
.article {
  color: red;
}

// 2語以上の場合はキャメルケース
.contentArea {
  background-color: #ccc;
}

// IDセレクタでの指定を避け、クラスセレクタで指定する（以下はNG）
#element {
  color: red;
}
```
