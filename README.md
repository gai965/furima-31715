# テーブル設計

## usersテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| nickname                | string      | null: false                         |
| email                   | string      | null: false                         |
| encrypted_password      | string      | null: false                         |
| lastname                | string      | null: false                         |
| firstname               | string      | null: false                         |
| lastname_kana           | string      | null: false                         |
| firstname_kana          | string      | null: false                         |
| birth_date              | date        | null: false                         |

### Association
- has_many :products
- has_many :orders


# productsテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| name                    | string      | null: false                         |
| explanation             | text        | null: false                         |
| category_id             | integer     | null: false                         |
| condition_id            | integer     | null: false                         |
| delivery_fee_id         | integer     | null: false                         |
| precture_id             | integer     | null: false                         |
| delivery_days_id        | integer     | null: false                         |
| price                   | integer     | null: false                         |
| soldout_flag            | boolean     | null: false                         |
| user                    | references  | null: false, foreign_key: true      |

### Association
- belongs_to :user
- has_one    :order


# addressesテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| postal_code             | string      | null: false                         |
| prefecture_id           | integer     | null: false                         |
| city                    | string      | null: false                         |
| house_number            | string      | null: false                         |
| buliding_name           | string      |                                     |
| phone_number            | string      | null: false                         |
| order                   | references  | null: false, foreign_key: true      |

### Association
- belongs_to :order


# ordersテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| user                    | references  | null: false, foreign_key: true      |
| product                 | references  | null: false, foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :product
- has_one    :address