view: order_items {
  sql_table_name: `looker-private-demo.thelook.order_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key:  yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: creation_at {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: return_at {
    type: time
    timeframes:  [
      raw,
      date,
      week,
      month,
      year
    ]
    datatype: date
    sql: ${TABLE}.returned_at ;;
  }

  dimension_group: shiped_at {
    type: time
    timeframes:  [
      raw,
      date,
      week,
      month,
      year
    ]
    datatype: date
    sql: ${TABLE}.shipped_at ;;
  }

  dimension_group: delivered_at {
    type: time
    timeframes:  [
      raw,
      date,
      week,
      month,
      year
    ]
    datatype: date
    sql: ${TABLE}.delivered_at ;;
  }

  measure: total_revenue{
    type: sum
    sql: ${TABLE}.sale_price ;;
    value_format: "#,##0.00"
  }
  }
