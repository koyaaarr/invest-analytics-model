with latest as (
  select
    close_voo,
    close_btcusd,
    close_bnd,
    close_total,
    num_voo,
    num_btcusd,
    num_bnd
  from
    {{ ref('warehouse-stock') }} as st
    left outer join {{ ref('warehouse-portfolio') }} as pf on st.Date = pf.Date
    left outer join {{ ref('warehouse-num-hold') }} on 1 = 1
  where
    close_total > 0
  order by
    st.Date desc
  limit
    1
)
select
  'voo' as ticker,
  cast(
    (close_voo * num_voo / close_total * 100) as integer
  ) as close_percent
from
  latest
union
all
select
  'btcusd' as ticker,
  cast(
    (close_btcusd * num_btcusd / close_total * 100) as integer
  ) as close_percent
from
  latest
union
all
select
  'bnd' as ticker,
  cast(
    (close_bnd * num_bnd / close_total * 100) as integer
  ) as close_percent
from
  latest