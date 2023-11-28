# TABLES design

## users table

|      column      | type  |    key    | not_null | unique |
|------------------|-------|-----------|:--------:|:------:|
|id                |integer|primary_key|    V     |   V    |
|nickname          |string |           |    V     |        |
|first_name        |string |           |    V     |        |
|last_name         |string |           |    V     |        |
|first_name_kana   |string |           |    V     |        |
|last_name_kana    |string |           |    V     |        |
|email             |string |           |    V     |   V    |
|encrypted_password|string |           |    V     |        |
|birthday          | date  |           |    V     |        |

### association
- has_many :items
- has_many :purchase


## items table

|       column        |   type   |    key    | not_null | unique |
|---------------------|----------|-----------|:--------:|:------:|
|id                   |integer   |primary_key|    V     |   V    |
|name                 |string    |           |    V     |        |
|description          |text      |           |    V     |        |
|category_id          |integer   |           |    V     |        |
|condition_id         |integer   |           |    V     |        |
|shipping_cost_on_id  |integer   |           |    V     |        |
|prefecture_id        |integer   |           |    V     |        |
|days_to_shipping_id  |integer   |           |    V     |        |
|price                |integer   |           |    V     |        |
|user                 |references|foreign_key|    V     |        |

### association
- belongs_to :user
- has_one :purchase
- has_one_attached :image


## purchases table
|      column      |   type   |    key    | not_null | unique |
|------------------|----------|-----------|:--------:|:------:|
|id                |integer   |primary_key|    V     |   V    |
|user              |references|foreign_key|    V     |        |
|item              |references|foreign_key|    V     |        |

### association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses table

|      column      |   type   |    key    | not_null | unique |
|------------------|----------|-----------|:--------:|:------:|
|id                |integer   |primary_key|    V     |   V    |
|postcode          |string    |           |    V     |        |
|prefecture_id     |integer   |           |    V     |        |
|municipality      |string    |           |    V     |        |
|street_address    |string    |           |    V     |        |
|building          |string    |           |          |        |
|phone_number      |string    |           |    V     |        |
|purchase          |references|foreign_key|    V     |        |

### association
- belongs_to :purchase
