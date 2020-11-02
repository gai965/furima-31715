# テーブル設計

## usersテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| nickname                | string      | null: false                         |
| email                   | string      | null: false                         |
| password                | string      | null: false                         |
| lastname                | string      | null: false                         |
| firstname               | string      | null: false                         |
| lastname_kana           | string      | null: false                         |
| birth_date              | date        | null: false                         |

### Association
- has_many :products
- has_many :buys


# productsテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| image                   |             | null: false                         |
| product_name            | text        | null: false, lengh: {maximum: 40}   |
| product_explanation     | text        | null: false, lengh: {maximum: 1000} |
| product_details_id      | integer     | null: false                         |
| delivery_method_id      | integer     | null: false                         |
| price                   | integer     | null: false                         |
| user                    | references  | null: false, foreign_key: true      |

### Association
- belongs_to :users
- belongs_to :buys


# buysテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| card_number             | integer     | null: false                         |
| expiration_date_yaer    | integer     | null: false                         |
| expiration_date_months  | integer     | null: false                         |
| security_code           | integer     | null: false                         |
| postal_code             | string      | null: false                         |
| precture                | integer     | null: false                         |
| city                    | string      | null: false                         |
| house_number            | string      | null: false                         |
| buliding_name           | string      |                                     |
| phone_number            | integer     | null: false                         |
| user                    | references  | null: false, foreign_key: true      |

### Association
- belongs_to :users
- belongs_to :products