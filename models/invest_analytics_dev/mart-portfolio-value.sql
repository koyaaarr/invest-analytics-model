select
  st.Date,
  cast(close_voo as integer) as close_voo,
  cast(close_btcusd as integer) as close_btcusd,
  cast(close_bnd as integer) as close_bnd,
  cast(close_total as integer) as close_total
from
  {{ ref('warehouse-stock') }} as st
  left outer join {{ ref('warehouse-portfolio') }} as pf on st.Date = pf.Date
order by
  st.Date