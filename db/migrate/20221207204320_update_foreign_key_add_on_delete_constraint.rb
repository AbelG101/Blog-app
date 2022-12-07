class UpdateForeignKeyAddOnDeleteConstraint < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "comments", "posts"
    remove_foreign_key "comments", "users", column: "author_id"
    remove_foreign_key "likes", "posts"
    remove_foreign_key "likes", "users", column: "author_id"
    remove_foreign_key "posts", "users", column: "author_id"

    add_foreign_key "comments", "posts", on_delete: :cascade
    add_foreign_key "comments", "users", column: "author_id", on_delete: :cascade
    add_foreign_key "likes", "posts", on_delete: :cascade
    add_foreign_key "likes", "users", column: "author_id", on_delete: :cascade
    add_foreign_key "posts", "users", column: "author_id", on_delete: :cascade
  end
end
