# Define the database connection to be used for this model.
connection: "looker-private-demo"

# include all the views
include: "/views/products.view"

explore: product_explore {
  view_name: products
}
