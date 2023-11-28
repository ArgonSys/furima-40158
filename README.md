# TABLES design

## users table

|      column      | type  |  key  | not_null | unique |
|------------------|-------|-------|:--------:|:------:|
|id                |integer|primary|    V     |   V    |
|nickname          |string |       |    V     |        |
|first_name        |string |       |    V     |        |
|last_name         |string |       |    V     |        |
|first_name_kana   |string |       |    V     |        |
|last_name_kana    |string |       |    V     |        |
|email             |string |       |    V     |   V    |
|encrypted_password|string |       |    V     |        |
|birthday          | date  |       |    V     |        |


## items table

|      column      |   type   |  key  | not_null | unique |
|------------------|----------|-------|:--------:|:------:|
|id                |integer   |primary|    V     |   V    |
|name              |string    |       |    V     |        |
|description       |text      |       |    V     |        |
|category          |string    |       |    V     |        |
|condition         |string    |       |    V     |        |
|shipping_cost_on  |string    |       |    V     |        |
|prefecture        |string    |       |    V     |   V    |
|days_to_shipping  |string    |       |    V     |        |
|price             |integer   |       |    V     |        |
|user_id           |references|foreign|    V     |        |

- image must be attached by ActiveStorage.


## addresses table

|      column      |   type   |  key  | not_null | unique |
|------------------|----------|-------|:--------:|:------:|
|id                |integer   |primary|    V     |   V    |
|postcode          |string    |       |    V     |        |
|prefecture        |string    |       |    V     |        |
|municipality      |string    |       |    V     |        |
|street_address    |string    |       |    V     |        |
|building          |string    |       |          |        |
|phone_number      |integer   |       |    V     |        |
|user_id           |references|foreign|    V     |        |
|item_id           |references|foreign|    V     |        |
