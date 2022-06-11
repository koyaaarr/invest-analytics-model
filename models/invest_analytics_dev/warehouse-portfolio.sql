select
  max(case ticker when 'VOO' then num_of_hold else null end) as num_voo,
  max(case ticker when 'BTC-USD' then num_of_hold else null end) as num_btcusd,
  max(case ticker when 'BND' then num_of_hold else null end) as num_bnd,
from
  {{ source('invest_analytics_dev', 'source-portfolio') }}
