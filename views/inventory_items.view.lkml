view: inventory_items {
  sql_table_name: `looker-private-demo.thelook.inventory_items` ;;
  drill_fields: [inventory_id]

  dimension: inventory_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      week,
      month,
      year
    ]
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year
    ]
    datatype: date
    sql: ${TABLE}.sold_at ;;
  }

  measure: total_cost {
    type: sum
    sql: ${TABLE}.cost ;;
    value_format: "#,##0.00"
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.product_retail_price ;;
    value_format: "#,##0.00"
  }
}
