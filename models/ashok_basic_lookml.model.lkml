connection: "looker-private-demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
datagroup: basic_datagroup {
  max_cache_age: "4 hours"
}

explore: order_items {
  label: "Order Items"
  persist_with: basic_datagroup

  join: inventory_items {
    view_label: "Inventory"
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.inventory_item_id}=${inventory_items.inventory_id} ;;
  }

  join: users {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id}=${users.user_id} ;;
  }
}

explore: inventory_items {
  label: "Inventory Items"
  persist_with: basic_datagroup

  join: products {
    view_label: "Products"
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory_items.product_id}=${products.id} ;;
  }

  join: distribution_centers {
    view_label: "Distribution Centers"
    type: left_outer
    relationship: many_to_one
    sql_on: ${inventory_items.distribution_center_id}=${distribution_centers.center_id} ;;
  }
}
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
