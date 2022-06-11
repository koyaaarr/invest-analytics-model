with dates as (
  select
      Date
  from
    {{ source('invest_analytics_dev', 'source-voo') }}
  union all
  select
      Date
  from
    {{ source('invest_analytics_dev', 'source-btcusd') }}
  union all
  select
      Date
  from
    {{ source('invest_analytics_dev', 'source-bnd') }}
)
select
  distinct Date
from
  dates
order by
  Date