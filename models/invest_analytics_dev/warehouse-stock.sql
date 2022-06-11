with
voo as (
  select
      Date as date_voo
    , Open as open_voo
    , High as high_voo
    , Low as low_voo
    , Close as close_voo
  from
    {{ source('invest_analytics_dev', 'source-voo') }}
),
btcusd as (
  select
      Date as date_btcusd
    , Open as open_btcusd
    , High as high_btcusd
    , Low as low_btcusd
    , Close as close_btcusd
  from
    {{ source('invest_analytics_dev', 'source-btcusd') }}
),
bnd as (
  select
      Date as date_bnd
    , Open as open_bnd
    , High as high_bnd
    , Low as low_bnd
    , Close as close_bnd
  from
    {{ source('invest_analytics_dev', 'source-bnd') }}
)
select
    Date
  , open_voo
  , high_voo
  , low_voo
  , close_voo
  , open_btcusd
  , high_btcusd
  , low_btcusd
  , close_btcusd
  , open_bnd
  , high_bnd
  , low_bnd
  , close_bnd
from
  {{ ref('warehouse-date') }} as whd
  left join voo on whd.Date = voo.date_voo
  left join btcusd on whd.Date = btcusd.date_btcusd
  left join bnd on whd.Date = bnd.date_bnd