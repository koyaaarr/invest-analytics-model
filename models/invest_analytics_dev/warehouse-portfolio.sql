select
  Date,
  (
    close_voo * num_voo + close_btcusd * num_btcusd + close_bnd * num_bnd
  ) as close_total
from
  {{ ref('warehouse-stock') }}
  left outer join {{ ref('warehouse-num-hold') }} on 1 = 1
order by
  Date