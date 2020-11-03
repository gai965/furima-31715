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
- has_many :addresses
- has_many :orders


# productsテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| product_name            | string      | null: false                         |
| product_explanation     | text        | null: false                         |
| product_category_id     | integer     | null: false                         |
| product_condition_id    | integer     | null: false                         |
| delivery_fee_id         | integer     | null: false                         |
| delivery_destination_id | integer     | null: false                         |
| delivery_days_id        | integer     | null: false                         |
| price                   | integer     | null: false                         |
| user                    | references  | null: false, foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :address
- belongs_to :order


# addressesテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| postal_code             | string      | null: false                         |
| precture_id             | integer     | null: false                         |
| city                    | string      | null: false                         |
| house_number            | string      | null: false                         |
| buliding_name           | string      |                                     |
| phone_number            | integer     | null: false                         |
| user                    | references  | null: false, foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :product


# ordersテーブル

| Column                  | Type        | Options                             |
| ----------------------- | ----------- | ----------------------------------- |
| user                    | references  | null: false, foreign_key: true      |
| product                 | references  | null: false, foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :product