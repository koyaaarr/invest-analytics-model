select
    Date
  , cast(close_voo as integer) as close_voo
  , cast(close_btcusd as integer) as close_btcusd
  , cast(close_bnd as integer) as close_bnd
  , cast((close_voo * pf.num_voo + close_btcusd * pf.num_btcusd + close_bnd * pf.num_bnd) as integer) as close_total
from
  {{ ref('warehouse-stock') }} as st
  left outer join {{ ref('warehouse-portfolio') }} as pf
    on 1 = 1
order by
  Date