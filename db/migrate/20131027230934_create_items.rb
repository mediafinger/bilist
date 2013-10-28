class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer  :sorting
      t.string   :source
      t.string   :comment
      t.string   :url
      t.boolean  :done,    default: false
      t.timestamp
    end
  end
end
