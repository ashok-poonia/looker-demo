view: products {
  sql_table_name: 'looker-private-demo.thelook.products' ;;
  drill_fields: [id]

dimension: id{
  primary_key: yes
  type: number
  sql: ${TABLE}.id ;;
}

dimension: cost{
  type: number
  sql: ROUND(${TABLE}.cost,2) ;;
}

dimension: category{
  type: string
  sql: ${TABLE}.category ;;
}

dimension: name{
  type: string
  sql: ${TABLE}.name ;;
}

dimension: brand{
  type: string
  sql: ${TABLE}.brand ;;
}

dimension: retail_price{
  type: number
  sql: ROUND(${TABLE}.retail_price,2) ;;
}

dimension: sku{
  type: string
  sql: ${TABLE}.sku ;;
}

dimension: distribution_center_id{
  description: "unique distribution center id"
  type: string
  sql: ${TABLE}.distribution_center_id ;;
}

measure: product_count{
  type: count_distinct
  sql: ${TABLE}.id ;;
}

measure: total_cost {
  type: sum
  sql: ${TABLE}.cost ;;
}

measure: average_cost {
  type: average
  sql: ${TABLE}.cost ;;
}

measure: total_revenue {
  type: sum
  sql: ${TABLE}.retail_price ;;
  value_format: "#,##0.00"
}

measure: average_selling_price {
  type: average
  sql: ${TABLE}.retail_price ;;
  value_format: "#,##0.00"
}

measure: gross_profit {
  type: sum
  sql: ${TABLE}.retail_price-${TABLE}.cost ;;
  value_format: "#,##0.00"
}
}
